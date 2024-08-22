<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmApplicantIncome.ascx.cs" Inherits="joshcoWA.applicant.ApplicantIncome" %>

<%--<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>--%>
<script src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
  window.onload = function () { calculateSum(); calculateSumSpouse(); };
 
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
            $("#txtTotalIncome").val(0);
            //add only if the value is number
            if (!isNaN(this.value) && this.value.length != 0) {
                sum += parseFloat(this.value);
            }
        });
        //Assign the total value to Textbox  
        $('#<%=txtTotalIncome.ClientID %>').val(sum.toFixed(2));
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
        $('#<%=txtTotalIncomeSpouse.ClientID %>').val(sum.toFixed(2));
    }
</script>


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table id="tblEditApplicantIncome" class="ui-widget-content">
            <tr>
                <td>&nbsp;</td>
                <td class="formTextTD">
                    <strong>INCOME</strong></td>
                <td>
                    <strong>Applicant</strong></td>
                <td><strong>Spouse</strong></td>
            </tr>
            <tr>
                <td>&nbsp; </td>
                <td class="formTextTD">Basic Monthly Gross Income<span style="color: red">*</span> <span style="color: red">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="#FFFF99" ControlToValidate="txtGrossIncome" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantIncome" Display="Dynamic"></asp:RequiredFieldValidator>
                  
                        <asp:RegularExpressionValidator ID="revNumber" runat="server" BackColor="#FFFF99" ControlToValidate="txtGrossIncome" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantIncome" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="revNumber3" runat="server" BackColor="#FFFF99" ControlToValidate="txtGrossIncomeSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantIncome" Display="Dynamic"></asp:RegularExpressionValidator>
               
                </span></td>
                <td>
                    <input ID="txtGrossIncome" runat="server" class="applicant form-control py-2"  type="text"  />
                </td>
                <td>
                    <input ID="txtGrossIncomeSpouse" runat="server" class="spouse form-control py-2"  type="text"  />
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                            </td>
                <td class="formTextTD">Regular Periodic Allowances <span style="color: red">*
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="txtPeriodicAllowance" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantIncome" Display="Dynamic"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="revNumber0" runat="server" BackColor="#FFFF99" ControlToValidate="txtPeriodicAllowance" Display="Dynamic" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantIncome"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="revNumber4" runat="server" BackColor="#FFFF99" ControlToValidate="txtPeriodicAllowanceSpouse" Display="Dynamic" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantIncome"></asp:RegularExpressionValidator>
                    </span>
                </td>
                <td>
                    <input ID="txtPeriodicAllowance" runat="server" class="applicant form-control py-2"  type="text"  />
                </td>
                <td>
                    <input ID="txtPeriodicAllowanceSpouse" runat="server" class="spouse form-control py-2"  type="text"  />
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                            </td>
                <td class="formTextTD">Regular financial obligations met by employer on behalf of Applicant/s<span style="color: red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="txtFinancialObligationByEmployer" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantIncome" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNumber1" runat="server" BackColor="#FFFF99" ControlToValidate="txtFinancialObligationByEmployer" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantIncome" Display="Dynamic"></asp:RegularExpressionValidator>
                  
                        <asp:RegularExpressionValidator ID="revNumber5" runat="server" BackColor="#FFFF99" ControlToValidate="txtFinancialObligationByEmployerSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantIncome" Display="Dynamic"></asp:RegularExpressionValidator>
                   
                </span>
                </td>
                <td>
                    <input ID="txtFinancialObligationByEmployer" runat="server" class="applicant form-control py-2"  type="text"  />
                </td>
                <td>
                    <input ID="txtFinancialObligationByEmployerSpouse" runat="server" class="spouse form-control py-2"  type="text"  />
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                            </td>
                <td class="formTextTD">Housing Allowance Payable (Loan Interest Subsidy)<span style="color: red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BackColor="#FFFF99" ControlToValidate="txtHousingAllowancePayable" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantIncome" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNumber2" runat="server" BackColor="#FFFF99" ControlToValidate="txtHousingAllowancePayable" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantIncome" Display="Dynamic"></asp:RegularExpressionValidator>
                  
                        <asp:RegularExpressionValidator ID="revNumber6" runat="server" BackColor="#FFFF99" ControlToValidate="txtHousingAllowancePayableSpouse" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="frmApplicantIncome" Display="Dynamic"></asp:RegularExpressionValidator>
                  
                </span>
                </td>
                <td>
                    <input ID="txtHousingAllowancePayable" runat="server" class="applicant form-control py-2"  type="text"  />
                </td>
                <td>
                    <input ID="txtHousingAllowancePayableSpouse" runat="server" class="spouse form-control py-2"  type="text"  />
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td class="formTextTD">Total Income 
                
                <asp:HiddenField ID="hfID" runat="server" Value="0" />
                </td>
                <td>
                    <input ID="txtTotalIncome" runat="server" class="total form-control py-2" readonly="readonly"   type="text" />                  
                </td>
                <td>                      
                    <input ID="txtTotalIncomeSpouse" runat="server" class="Total form-control py-2" readonly="readonly"  type="text" />
                </td>
            </tr>

        </table>

        <asp:Panel ID="pnlIncomeAdmin" runat="server" Visible="False">
            <table style="background-color: #def0ed;">
                <tr>
                    <td>&nbsp;</td>
                    <td class="formTextTD">
                        <strong>ADMIN SECTION</strong>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp; </td>
                    <td class="formTextTD">Commissions Received <span style="color: red"><span style="color: red">
                        <asp:RegularExpressionValidator ID="revNumber9" runat="server" BackColor="#FFFF99" ControlToValidate="txtCommissionsReceived" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="^\d+(\.\d\d)?$" ValidationGroup="frmApplicantIncome"></asp:RegularExpressionValidator>
                    </span></span></td>
                    <td>
                        <input ID="txtCommissionsReceived" runat="server" class="form-control py-2"  type="text" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;
                            </td>
                    <td class="formTextTD">Pension/ Disability Grant/ Maintenance Grant
                           
                        <span style="color: red"><span style="color: red">
                            <asp:RegularExpressionValidator ID="revNumber10" runat="server" BackColor="#FFFF99" ControlToValidate="txtPensionDisabilityMaintenanceGrant" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="^\d+(\.\d\d)?$" ValidationGroup="frmApplicantIncome"></asp:RegularExpressionValidator>
                        </span></span>
                    </td>
                    <td>
                        <input ID="txtPensionDisabilityMaintenanceGrant" runat="server" class="form-control py-2"  type="text" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;
                            </td>
                    <td class="formTextTD">Other (12 months average)
                           
                        <span style="color: red"><span style="color: red">
                            <asp:RegularExpressionValidator ID="revNumber11" runat="server" BackColor="#FFFF99" ControlToValidate="txtOther" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="^\d+(\.\d\d)?$" ValidationGroup="frmApplicantIncome"></asp:RegularExpressionValidator>
                        </span></span>
                    </td>
                    <td>
                        <input ID="txtOther" runat="server" class="form-control py-2"  type="text" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;
                            </td>
                    <td class="formTextTD">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnIncomeAdmin" runat="server" class="btn btn-primary px-5 py-2"  type="text" OnClick="btnIncomeAdmin_Click" Text="Update" Visible="False" Width="250px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="formTextTD">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>

    </ContentTemplate>
    <%--  <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
</asp:UpdatePanel>
