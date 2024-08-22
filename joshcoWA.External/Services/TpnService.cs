using Dapper;
using joshcoWA.External.Models;
using joshcoWA.External.TpnConsumerService;
using joshcoWA.External.TpnSecurityService;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace joshcoWA.External.Services
{
    public class TpnService
    {
        const string _outputType = "links";
        private readonly SecuritySoapClient _securitySoapClient = new SecuritySoapClient();
        private readonly ConsumerSoapClient _consumerSoapClient = new ConsumerSoapClient();
        private readonly string _conn = ConfigurationManager.ConnectionStrings["joshcoCS"].ConnectionString;
        public bool ExecuteTenantTpnCheck(TpnRequest tpnRequest)
        {
            var statusUpdated = false;
            try
            {
                var token = GetTpnToken(new AuthTokenRequest
                {
                    LoginCode = tpnRequest.LoginCode,
                    Password = tpnRequest.Password,
                    SecurityCode = tpnRequest.SecurityCode,
                    Token = tpnRequest.Token,
                });

                var modules = GetConsumerModules(new AuthTokenRequest
                {
                    SecurityCode = tpnRequest.SecurityCode,
                    Token = token
                }, tpnRequest.NationalID);

                IDValidation(new IdVerifyRequest
                {
                    Token = token,
                    SecurityCode = tpnRequest.SecurityCode,
                    IdNumber = tpnRequest.NationalID,
                    FirstName = tpnRequest.FirstName,
                    Surname = tpnRequest.SurName
                }, tpnRequest.ApplicationID);

                statusUpdated = GetCreditReport(new EnquiryRequest
                {
                    Token = token,
                    SecurityCode = tpnRequest.SecurityCode,
                    ContactNumber = tpnRequest.ContactNumber,
                    AddressLine = tpnRequest.AddressLine,
                    Suburb = tpnRequest.Suburb,
                    Province = tpnRequest.Province,
                    FirstName = tpnRequest.FirstName,
                    SurName = tpnRequest.SurName,
                    NationalID = tpnRequest.NationalID,
                    Bank = tpnRequest.Bank,
                    BranchCode = tpnRequest.BranchCode,
                    AccountHolder = tpnRequest.AccountHolder,
                    AccountType = tpnRequest.AccountType,
                    AccountNumber = tpnRequest.AccountNumber,
                    ModuleList = modules
                }, tpnRequest.ApplicationID);


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return statusUpdated;
        }

        #region TPN Token
        private string GetTpnToken(AuthTokenRequest authTokenRequest)
        {
            try
            {
                var response = _securitySoapClient.GenerateAuthTokenAsync(new TpnSecurityService.SecurityInfo
                {
                    LoginCode = authTokenRequest.LoginCode,
                    Password = authTokenRequest.Password,
                    SecurityCode = authTokenRequest.SecurityCode,
                    AuthToken = authTokenRequest.Token,
                    OutputFormat = _outputType
                }).Result;

                if (!response.Body.GenerateAuthTokenResult.Name.ToString().Equals("error"))
                {
                    return response.Body.GenerateAuthTokenResult.Value;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return null;
        }
        #endregion

        #region ID Verification
        private void IDValidation(IdVerifyRequest idVerifyRequest, int applicationId)
        {
            try
            {
                var response = _consumerSoapClient.ConsumerIDVerificationAsync(new TpnConsumerService.SecurityInfo
                {
                    AuthToken = idVerifyRequest.Token,
                    OutputFormat = _outputType,
                    SecurityCode = idVerifyRequest.SecurityCode
                },
                idVerifyRequest.IdNumber,
                idVerifyRequest.FirstName,
                idVerifyRequest.Surname).Result;

                var elements = response.Body.ConsumerIDVerificationResult.Descendants();
                var errorElement = elements.Where(s => s.Name == "errors" || s.Name == "description");

                if (errorElement.Count() > 0)
                {
                    var insertIDVerification = "insert into [dbo].[ApplicantIDVerification] values(" + applicationId + ",'" + 0 + "','" + JsonConvert.SerializeObject(elements) + "')";
                    InsertTpnReport(insertIDVerification);
                }
                else
                {
                    //verify id logic
                    bool idVerified = true;
                    var insertIDVerification = "insert into [dbo].[ApplicantIDVerification] values(" + applicationId + ",'" + idVerified + "','" + JsonConvert.SerializeObject(elements) + "')";
                    InsertTpnReport(insertIDVerification);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        #endregion

        #region Credex Report
        private bool GetCreditReport(EnquiryRequest enquiryRequest, int applicationId)
        {
            bool statusUpdated = false;
            try
            {
                ArrayOfString moduleList = new ArrayOfString();
                moduleList.AddRange(enquiryRequest.ModuleList);
                Province province;
                Enum.TryParse(enquiryRequest.Province, out province);

                ConsumerInfo consumerBlock = new ConsumerInfo
                {
                    CellNumber = enquiryRequest.ContactNumber,
                    CredexDetails = new CredexInfo
                    {
                        ScoreVersion = "credex"
                    },
                    CreditAmount = 0,
                    CurrentAddress = new AddressInfo
                    {
                        Line1 = enquiryRequest.AddressLine,
                        Suburb = enquiryRequest.Suburb,
                        Province = province
                    },
                    EnquiryReason = 40,
                    FirstName = enquiryRequest.FirstName,
                    Surname = enquiryRequest.SurName,
                    NationalID = enquiryRequest.NationalID,
                    BankCodeDetails = new BankInfo
                    {
                        Bank = enquiryRequest.Bank,
                        BranchCode = enquiryRequest.BranchCode,
                        AccountHolder = enquiryRequest.AccountHolder,
                        AccountType = enquiryRequest.AccountType,
                        AccountNumber = enquiryRequest.AccountNumber,
                        CreditAmount = 0,
                        Terms = "No terms"
                    }
                };

                EnquiryInfo enquiryBlock = new EnquiryInfo
                {
                    ContactName = enquiryRequest.FirstName,
                    ContactNumber = enquiryRequest.ContactNumber
                };

                ConsumerEnquiryResponse response = _consumerSoapClient.ConsumerEnquiryAsync(new TpnConsumerService.SecurityInfo
                {
                    AuthToken = enquiryRequest.Token,
                    OutputFormat = _outputType,
                    SecurityCode = enquiryRequest.SecurityCode
                }, moduleList, consumerBlock, enquiryBlock).Result;

                var elements = response.Body.ConsumerEnquiryResult.Descendants();
                var pdfElement = elements.Where(s => s.Name == "ReportURL");
                statusUpdated = GetCredexSummary(elements, applicationId);

                if (pdfElement.Count() > 0)
                {
                    var insertCreditReport = "insert into  [dbo].[ApplicantCreditReport] values(" + applicationId + ",'" + pdfElement.FirstOrDefault().Value + "','" + JsonConvert.SerializeObject(elements) + "')";
                    InsertTpnReport(insertCreditReport);
                }
                else
                {
                    var insertCreditReport = "insert into  [dbo].[ApplicantCreditReport] values(" + applicationId + ",'" + null + "','" + JsonConvert.SerializeObject(elements) + "')";
                    InsertTpnReport(insertCreditReport);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            return statusUpdated;
        }
        #endregion

        #region Credex Summary
        private bool GetCredexSummary(IEnumerable<XElement> elements, int applicationId)
        {
            try
            {
                var credexElement = elements.Where(s => s.Name == "summary").FirstOrDefault();
                foreach (var node in credexElement.Elements())
                {
                    if (node.ToString().Contains("Credex"))
                    {
                        var score = Convert.ToInt32(node.Value);
                        var insertCredexSummary = "insert into [dbo].[ApplicantCreditScore] values(" + applicationId + ",'" + Convert.ToInt32(node.Value) + "','" + JsonConvert.SerializeObject(credexElement) + "')";
                        InsertTpnReport(insertCredexSummary);
                        return UpdateApplicationStatusByCredexScore(score, applicationId);
                        
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            return false;
        }
        #endregion

        #region Get Consumer Module

        private List<string> GetConsumerModules(AuthTokenRequest authTokenRequest, string nationalId)
        {
            var modules = new List<string>();
            try
            {
                var securityInfo = new TpnConsumerService.SecurityInfo
                {
                    AuthToken = authTokenRequest.Token,
                    SecurityCode = authTokenRequest.SecurityCode,
                    OutputFormat = _outputType
                };

                TpnConsumerService.YesNo rsaId = TpnConsumerService.YesNo.Yes;
                var result = _consumerSoapClient.GetConsumerModules(securityInfo, nationalId, rsaId);

                foreach (var element in result.Elements())
                {
                    foreach (var node in element.Elements().Where(s => s.Name == "id"))
                    {
                        if (node != null && !string.IsNullOrWhiteSpace(node.Value))
                        {
                            modules.Add(node.Value);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return modules;
        }

        #endregion
        private void InsertTpnReport(string sqlCommand)
        {
            var conn = new SqlConnection(_conn);
            conn.Open();
            var comm = new SqlCommand(sqlCommand, conn);
            try
            {
                comm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        public CreditReport GetCreditReport(int applicationId)
        {
            try
            {
                using (var con = new SqlConnection(_conn))
                {
                    con.Open();
                    var response = con.Query<CreditReport>("[dbo].[SelectApplicantCreditReport]", new
                    {
                        @ApplicationId = applicationId
                    }, commandType: CommandType.StoredProcedure);
                    return response.FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                return new CreditReport();
            }
        }
        public IDVerifyReport GetIDVerificationReport(int applicationId)
        {
            try
            {
                using (var con = new SqlConnection(_conn))
                {
                    con.Open();
                    var response = con.Query<IDVerifyReport>("[dbo].[SelectApplicantIDVerificationReport]", new
                    {
                        @ApplicationId = applicationId
                    }, commandType: CommandType.StoredProcedure);
                    return response.FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                return new IDVerifyReport();
            }

        }
        public bool UpdateApplicationStatusByCredexScore(int score, int applicationId)
        {
            bool statusUpdated = false;
            if (score != 0 && applicationId != 0)
            {
                //TODO make the status id a enums
                statusUpdated = true;
                int applicationStatus = score <= 3 && score != 0 ? 4 : 3;
                var insert = "INSERT INTO [dbo].[ApplicationStatusUpdate] VALUES('Updated by system based on tpn credit score', " + applicationStatus + ", '" + DateTime.Now + "' ," + applicationId + ", 0, '" + DateTime.Now + "')";
                InsertTpnReport(insert);
            }
            return statusUpdated;
        }
    }
}
