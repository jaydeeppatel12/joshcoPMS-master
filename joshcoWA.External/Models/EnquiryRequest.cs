using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace joshcoWA.External.Models
{
  public class EnquiryRequest
  {
    public string SecurityCode { get; set; }
    public string Token { get; set; }
    public List<string> ModuleList { get; set; }
    public string NationalID { get; set; }
    public string SurName { get; set; }
    public string FirstName { get; set; }
    public string AddressLine { get; set; }
    public string Suburb { get; set; }
    public string City { get; set; }
    public string Province { get; set; }
    public int PostalCode { get; set; }
    public string EnquiryReason { get; set; }
    public int CellNumber { get; set; }
    public int CreditAmount { get; set; }
    public string AccountNumber { get; set; }
    public string Bank { get; set; }
    public string Branch { get; set; }
    public string BranchCode { get; set; }
    public string AccountHolder { get; set; }
    public string AccountType { get; set; }
    public string SpecialInstructions { get; set; }
    public string Terms { get; set; }
    public string ContactName { get; set; }
    public string ContactNumber { get; set; }
  }
}
