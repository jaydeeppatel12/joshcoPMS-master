<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmApplicantExpenditure.ascx.cs" Inherits="joshcoWA.applicant.ApplicantExpenditure" %>
<%--<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>--%>
<script src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    window.onload = function () { calculateSum(); calculateSumSpouse();  };
   
    $(document).ready(function () {
        //iterate through each textboxes and add keyup
        //handler to trigger sum event
        $(".applicant").each(function () {
            $(this).keyup(function () {
                calculateSum();
            });  
        });



        //iterate through each textboxes and add keyup
        //handler to trigger sum event
        $(".spouse").each(function () {
            $(this).keyup(function () {
                calculateSumSpouse();
            });
        });       
    });
    
    function calculateSum() {
        var sum = 0;
        //iterate through each textboxes and add the values
        $(".applicant").each(function () {
            $("#txtTotalExpenditure").val(0);
            //add only if the value is number
           if (!isNaN(this.value) && this.value.length != 0) {
               sum += parseFloat(this.value);
              // alert(sum);
           }
        });
      
        //Assign the total value to Textbox  
        $('#<%=txtTotalExpenditure.ClientID %>').val(sum.toFixed(2));
        
    }

   

    function calculateSumSpouse() {
        var sum = 0;
        //iterate through each textboxes and add the values
        $(".spouse").each(function () {
            //add only if the value is number
            if (!isNaN(this.value) && this.value.length != 0) {
                sum += parseFloat(this.value);
            }
        });
        //Assign the total value to Textbox  
        $('#<%=txtTotalExpenditureSpouse.ClientID %>').val(sum.toFixed(2));
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditApplicantExpenditure" class="ui-widget-content">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="formTextTD">
                               <strong>EXPENDITURE</strong></td>
                            <td>
                                <strong>Applicant</strong></td>
                            <td><strong>Spouse</strong></td>
                        </tr>
                        <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Cell phone account/airtime/Wifi<span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCellphoneAccount" ErrorMessage="*Required" Font-Size="8pt" BackColor="#FFFF99" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revNumber" runat="server" ControlToValidate="txtCellphoneAccount"
           ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" BackColor="#FFFF99" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" ValidationExpression="[0-9]*\.?[0-9]*" Display="Dynamic"></asp:RegularExpressionValidator>
   
                              
                                <asp:RegularExpressionValidator ID="revNumber15" runat="server" BackColor="#FFFF99" ControlToValidate="txtCellphoneAccountSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                              
   
                                </span> </td>
                            <td>
                                <input  ID="txtCellphoneAccount" class="applicant form-control py-2" type="text" runat="server" />
                            </td>
                            <td>
                                <input  ID="txtCellphoneAccountSpouse" type="text" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Clothing Account<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="#FFFF99" ControlToValidate="txtClothingAccount" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                               
                                <asp:RegularExpressionValidator ID="revNumber0" runat="server" BackColor="#FFFF99" ControlToValidate="txtClothingAccount" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber16" runat="server" BackColor="#FFFF99" ControlToValidate="txtClothingAccountSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                 </span>


                            </td>
                            <td>
                                <input  type="text" ID="txtClothingAccount" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtClothingAccountSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                DSTV Account<span style="color:red">*</span><span style="color:red"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="txtDSTVAccount" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                            
                                <asp:RegularExpressionValidator ID="revNumber1" runat="server" BackColor="#FFFF99" ControlToValidate="txtDSTVAccount" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber17" runat="server" BackColor="#FFFF99" ControlToValidate="txtDSTVAccountSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                               
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtDSTVAccount" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtDSTVAccountSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Furniture Account<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BackColor="#FFFF99" ControlToValidate="txtFurnitureAccount" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                                 
                               
                                <asp:RegularExpressionValidator ID="revNumber2" runat="server" BackColor="#FFFF99" ControlToValidate="txtFurnitureAccount" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber18" runat="server" BackColor="#FFFF99" ControlToValidate="txtFurnitureAccountSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>

                            </td>
                            <td>
                                <input  type="text" ID="txtFurnitureAccount" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtFurnitureAccountSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Groceries<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" BackColor="#FFFF99" ControlToValidate="txtGroceries" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                            
                                <asp:RegularExpressionValidator ID="revNumber3" runat="server" BackColor="#FFFF99" ControlToValidate="txtGroceries" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber19" runat="server" BackColor="#FFFF99" ControlToValidate="txtGroceriesSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtGroceries" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtGroceriesSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Insurance Policies<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" BackColor="#FFFF99" ControlToValidate="txtInsurancePolicies" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                                
                                <asp:RegularExpressionValidator ID="revNumber4" runat="server" BackColor="#FFFF99" ControlToValidate="txtInsurancePolicies" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber20" runat="server" BackColor="#FFFF99" ControlToValidate="txtInsurancePoliciesSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtInsurancePolicies" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtInsurancePoliciesSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Loans (All types)<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" BackColor="#FFFF99" ControlToValidate="txtLoans" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                               
                                <asp:RegularExpressionValidator ID="revNumber5" runat="server" BackColor="#FFFF99" ControlToValidate="txtLoans" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber21" runat="server" BackColor="#FFFF99" ControlToValidate="txtLoansSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtLoans" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtLoansSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Child Maintenance<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" BackColor="#FFFF99" ControlToValidate="txtChildMaintenance" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                                
                                <asp:RegularExpressionValidator ID="revNumber6" runat="server" BackColor="#FFFF99" ControlToValidate="txtChildMaintenance" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber22" runat="server" BackColor="#FFFF99" ControlToValidate="txtChildMaintenanceSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtChildMaintenance" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtChildMaintenanceSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Medical Aid<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" BackColor="#FFFF99" ControlToValidate="txtMedicalAid" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                              
                                <asp:RegularExpressionValidator ID="revNumber7" runat="server" BackColor="#FFFF99" ControlToValidate="txtMedicalAid" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber23" runat="server" BackColor="#FFFF99" ControlToValidate="txtMedicalAidSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtMedicalAid" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtMedicalAidSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Motor Vehicle Insurance<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" BackColor="#FFFF99" ControlToValidate="txtMotorVehicleInsurance" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                                
                                <asp:RegularExpressionValidator ID="revNumber8" runat="server" BackColor="#FFFF99" ControlToValidate="txtMotorVehicleInsurance" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber24" runat="server" BackColor="#FFFF99" ControlToValidate="txtMotorVehicleInsuranceSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtMotorVehicleInsurance" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtMotorVehicleInsuranceSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Motor Vehicle Instalment<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" BackColor="#FFFF99" ControlToValidate="txtMotorVehicleInstalment" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                              
                                <asp:RegularExpressionValidator ID="revNumber9" runat="server" BackColor="#FFFF99" ControlToValidate="txtMotorVehicleInstalment" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber25" runat="server" BackColor="#FFFF99" ControlToValidate="txtMotorVehicleInstalmentSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtMotorVehicleInstalment" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtMotorVehicleInstalmentSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Rent (You are applying for)<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" BackColor="#FFFF99" ControlToValidate="txtRent" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="revNumber26" runat="server" BackColor="#FFFF99" ControlToValidate="txtRentSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>                                
                                <input  type="text" ID="txtRent" runat="server"  disabled="disabled"  class="applicant form-control py-2" value="0.00" />
                            </td>
                            <td>
                                <input  type="text" ID="txtRentSpouse" runat="server" disabled="disabled" class="spouse form-control py-2" value="0.00"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Savings<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" BackColor="#FFFF99" ControlToValidate="txtSavings" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                              
                                <asp:RegularExpressionValidator ID="revNumber11" runat="server" BackColor="#FFFF99" ControlToValidate="txtSavings" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber27" runat="server" BackColor="#FFFF99" ControlToValidate="txtSavingsSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtSavings" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtSavingsSpouse" runat="server" class="spouse form-control py-2" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                School Fees<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" BackColor="#FFFF99" ControlToValidate="txtSchoolFees" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                                
                                <asp:RegularExpressionValidator ID="revNumber12" runat="server" BackColor="#FFFF99" ControlToValidate="txtSchoolFees" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber28" runat="server" BackColor="#FFFF99" ControlToValidate="txtSchoolFeesSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtSchoolFees" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>

                                <input  type="text" ID="txtSchoolFeesSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Transport Costs<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" BackColor="#FFFF99" ControlToValidate="txtTransportCosts" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                                
                                <asp:RegularExpressionValidator ID="revNumber13" runat="server" BackColor="#FFFF99" ControlToValidate="txtTransportCosts" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber29" runat="server" BackColor="#FFFF99" ControlToValidate="txtTransportCostsSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtTransportCosts" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtTransportCostsSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Water And Electricity<span style="color:red">* <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" BackColor="#FFFF99" ControlToValidate="txtWaterAndElectricity" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RequiredFieldValidator>
                                
                                <asp:RegularExpressionValidator ID="revNumber14" runat="server" BackColor="#FFFF99" ControlToValidate="txtWaterAndElectricity" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber30" runat="server" BackColor="#FFFF99" ControlToValidate="txtWaterAndElectricitySpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input  type="text" ID="txtWaterAndElectricity" runat="server" class="applicant form-control py-2" value="0" />
                            </td>
                            <td>
                                <input  type="text" ID="txtWaterAndElectricitySpouse" runat="server" class="spouse form-control py-2" value="0" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Other: (Optional if applicable) <asp:RegularExpressionValidator ID="revNumber31" runat="server" BackColor="#FFFF99" ControlToValidate="txtOther" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="revNumber33" runat="server" BackColor="#FFFF99" ControlToValidate="txtOtherSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantExpenditure" Display="Dynamic"></asp:RegularExpressionValidator>
                              
                            </td>
                            <td>
                                <input  type="text" ID="txtOther" runat="server" class="applicant form-control py-2" />
                            </td>
                            <td>
                                <input  type="text" ID="txtOtherSpouse" runat="server" class="spouse form-control py-2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Total Expenditure 
                                <asp:HiddenField ID="hfID" runat="server"  Value="0"/>
                            </td>
                            <td>
                                   
                                <input ID="txtTotalExpenditure" runat="server" readonly="readonly" class="form-control py-2"   type="text" />
                            </td>
                            <td>
                               <input ID="txtTotalExpenditureSpouse" runat="server" readonly="readonly" class="form-control py-2"   type="text"/>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
              <%--  <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>