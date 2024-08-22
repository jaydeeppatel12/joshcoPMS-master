<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmApplicantSpouseEmployment.ascx.cs" Inherits="joshcoWA.applicant.frmApplicantSpouseEmployment" %>
<style type="text/css">
       .auto-style1 {
           width: 100%;
       }
   </style>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditApplicantSpouseEmployment" class="ui-widget-content">
                         <tr>
                            <td>
                                &nbsp;</td>
                            <td class="formTextTD" colspan="3">
                                <strong>EMPLOYMENT DETAILS OF SPOUSE/PARTNER</strong></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Self Employed
                            <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="chkSelfEmployed" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantSpouseEmployment"></asp:RequiredFieldValidator>
                                </span></td>
                            <td>
                     
                                <asp:RadioButtonList ID="chkSelfEmployed" runat="server" CssClass="btn btn-outline-warning btn-fw" RepeatDirection="Horizontal" ValidationGroup="frmApplicantSpouseEmployment" OnSelectedIndexChanged="chkSelfEmployed_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="True">Yes</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="False">No</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Occupation<span style="color: red">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="#FFFF99" ControlToValidate="txtOccupation" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantSpouseEmployment"></asp:RequiredFieldValidator>
                               </td>
                            <td>
                                <asp:TextBox id="txtOccupation" runat="server" MaxLength="50" CssClass="form-control py-2" ValidationGroup="frmApplicantSpouseEmployment"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Current Employer
                                <span id="sCurrentEmployer"  runat="server" style="color: red">*
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" BackColor="#FFFF99" ControlToValidate="txtCurrentEmployer" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantEmployment"></asp:RequiredFieldValidator>                 
                                     </span>
                            </td>
                            <td>
                                <asp:TextBox id="txtCurrentEmployer" runat="server" MaxLength="50" CssClass="form-control py-2" ValidationGroup="frmApplicantSpouseEmployment"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Employer email address <span  id="sEmployerEmailAddress" runat="server" style="color: red">*
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmployerAddress" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantEmployment"></asp:RequiredFieldValidator>                     
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmployerAddress" Display="Dynamic" ErrorMessage="*Invalid email address" Font-Size="8pt" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="frmApplicantSpouseEmployment" Width="120px"></asp:RegularExpressionValidator>
                                     </span>
                            </td>
                            <td>
                                <asp:TextBox id="txtEmployerAddress" runat="server" MaxLength="150" CssClass="form-control py-2" ValidationGroup="frmApplicantSpouseEmployment"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Employment Period<span id="sEmploymentPeriod" runat="server" style="color: red">*
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmploymentPeriod" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantSpouseEmployment" Visible="False"></asp:RequiredFieldValidator></span>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmploymentPeriod" ErrorMessage="Enter numbers only" Font-Size="8pt" ForeColor="Red" MaximumValue="999999" MinimumValue="0" Type="Integer" ValidationGroup="frmApplicantSpouseEmployment"></asp:RangeValidator>
                               </td>
                            <td>
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtEmploymentPeriod" runat="server"  CssClass="form-control"  TextMode="Number" min="0" max="100" ValidationGroup="frmApplicantSpouseEmployment"></asp:TextBox>
                                        </td>
                                        <td>
    <asp:DropDownList ID="ddlYearMonth"   CssClass="btn-outline-warning btn-fw"  runat="server">
        <asp:ListItem>Year(s)</asp:ListItem>
        <asp:ListItem>Month(s)</asp:ListItem>
    </asp:DropDownList></td>
                                    </tr>
                                </table>
                          
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Gross Salary<span style="color: red">*</span>
                                <asp:RequiredFieldValidator ID="rfvGrossSalary" runat="server" BackColor="#FFFF99" ControlToValidate="txtGrossSalary" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantSpouseEmployment"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="revGrossSalary" runat="server" BackColor="#FFFF99" ControlToValidate="txtGrossSalary" ErrorMessage="Please enter valid integer or decimal number with 2 decimal places." Font-Size="8pt" ForeColor="Red" ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="frmApplicantSpouseEmployment" Display="Dynamic"></asp:RegularExpressionValidator>
                         
                             </td>
                            <td>
                                <asp:TextBox id="txtGrossSalary" runat="server" MaxLength="50" CssClass="form-control py-2" ValidationGroup="frmApplicantSpouseEmployment"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Salary Payment Day<span style="color: red">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BackColor="#FFFF99" ControlToValidate="txtDay" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantSpouseEmployment"></asp:RequiredFieldValidator>
                               </td>
                            <td>
                                <table class="auto-style1">
                                    <tr>                                  
                                        <td>   
                                            <asp:TextBox ID="txtDay" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmApplicantSpouseEmployment"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
              <%--  <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>
<asp:HiddenField ID="hfID" runat="server" Value="0" />