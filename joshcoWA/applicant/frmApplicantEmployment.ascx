<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmApplicantEmployment.ascx.cs" Inherits="joshcoWA.applicant.frmApplicantEmployment" %>
   <style type="text/css">
       .auto-style1 {
           width: 100%;
       }
   </style>
   <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditApplicantEmployment" class="ui-widget-content">
                         <tr>
                            <td>
                                &nbsp;</td>
                            <td class="formTextTD" colspan="3">
                                <strong>EMPLOYMENT DETAILS OF APPLICANT</strong></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Self Employed
                            <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="chkSelfEmployed" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantEmployment"></asp:RequiredFieldValidator>
                                </span></td>
                            <td>  
                                 <asp:RadioButtonList ID="chkSelfEmployed"  CssClass="btn btn-outline-warning btn-fw" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="chkSelfEmployed_SelectedIndexChanged">
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="#FFFF99" ControlToValidate="txtOccupation" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantEmployment"></asp:RequiredFieldValidator>
                                </td>
                            <td>
                                <asp:TextBox id="txtOccupation" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmApplicantEmployment"></asp:TextBox>
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
                                <asp:TextBox id="txtCurrentEmployer" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmApplicantEmployment"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">                                
                                Employer Email Address<span  id="sEmployerEmailAddress" runat="server" style="color: red">*
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmployerAddress" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantEmployment"></asp:RequiredFieldValidator>                     
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmployerAddress" Display="Dynamic" ErrorMessage="*Invalid email address" Font-Size="8pt" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="frmApplicantEmployment" Width="120px"></asp:RegularExpressionValidator>
                                     </span>
                            </td>
                            <td>
                                <asp:TextBox id="txtEmployerAddress" runat="server" MaxLength="150" CssClass="form-control" ValidationGroup="frmApplicantEmployment"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Employment Period<span id="sEmploymentPeriod" runat="server" style="color: red">*
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmploymentPeriod" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantEmployment"></asp:RequiredFieldValidator></span>
                               <asp:RangeValidator ID="RangeValidator1"  runat="server" ControlToValidate="txtEmploymentPeriod" ErrorMessage="Enter numbers only" ValidationGroup="frmApplicantEmployment"
                                Type="Integer" MinimumValue="0" MaximumValue="999999" Font-Size="8pt" BackColor="#FFFF99" ForeColor="Red"></asp:RangeValidator>  
                                    </td>
                            <td>
                                <table class="auto-style1">
                                    <tr>
                                        <td><%--CssClass=" form-control btn btn-outline-info btn-fw"--%>
                                            <asp:TextBox ID="txtEmploymentPeriod" runat="server" CssClass="form-control"  TextMode="Number" min="0" max="100" ValidationGroup="frmApplicantEmployment"></asp:TextBox>
                                        </td>
                                        <td>
    <asp:DropDownList ID="ddlYearMonth" CssClass="btn-outline-warning btn-fw" runat="server">
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
                            <asp:RequiredFieldValidator ID="rfvGrossSalary" runat="server" BackColor="#FFFF99" ControlToValidate="txtGrossSalary" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantEmployment"></asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator ID="revGrossSalary" runat="server" BackColor="#FFFF99" ControlToValidate="txtGrossSalary" ErrorMessage="Please enter valid integer or decimal number with 2 decimal places." Font-Size="8pt" ForeColor="Red" ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="frmApplicantEmployment" Display="Dynamic"></asp:RegularExpressionValidator>
                                                                     </td>
                            <td>
                                <asp:TextBox id="txtGrossSalary"  runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmApplicantEmployment"></asp:TextBox>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BackColor="#FFFF99" ControlToValidate="txtDay" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantEmployment"></asp:RequiredFieldValidator>
                               </td>
                            <td>
                                <table class="auto-style1">
                                    <tr>
                                        <%--<td>
                                            <asp:DropDownList ID="ddlMonth" runat="server" Enabled="false" CssClass="btn btn-outline-warning dropdown-toggle">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>January</asp:ListItem>
                                                <asp:ListItem>February</asp:ListItem> 
                                                <asp:ListItem>March</asp:ListItem>
                                                <asp:ListItem>April</asp:ListItem>
                                                <asp:ListItem>May</asp:ListItem>
                                                <asp:ListItem>June</asp:ListItem>
                                                <asp:ListItem>July</asp:ListItem>
                                                <asp:ListItem>August</asp:ListItem>
                                                <asp:ListItem>September</asp:ListItem>
                                                <asp:ListItem>October</asp:ListItem>
                                                <asp:ListItem>November</asp:ListItem>
                                                <asp:ListItem>December</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>--%>
                                        <td><%--min="1" max="31" MaxLength="2" TextMode="Number"--%>
                                            <asp:TextBox ID="txtDay" runat="server"   MaxLength="50" CssClass="form-control" ValidationGroup="frmApplicantEmployment"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
               <%-- <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>
<asp:HiddenField ID="hfID" runat="server" Value="0" />