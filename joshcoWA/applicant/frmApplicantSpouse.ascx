<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmApplicantSpouse.ascx.cs" Inherits="joshcoWA.applicant.frmApplicantSpouse" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditApplicantSpouse" class="ui-widget-content">
                          <tr>
                            <td>
                                &nbsp;</td>
                            <td class="formTextTD" colspan="3">
                                <strong>DETAILS OF SECOND PERSON APPLYING TO RENT THE PREMISES</strong></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Spouse/Partner&#39;s Full Name
                            <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="txtFullName" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantSpouse"></asp:RequiredFieldValidator>
                                   
                                </span></td>
                            <td>
                                <asp:TextBox id="txtFullName" runat="server" MaxLength="50" CssClass="form-control py-2" ValidationGroup="frmApplicantSpouse"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Spouse/Partner&#39;s Surname Name
                            </td>
                            <td>
                                <asp:TextBox id="txtMaidenName" runat="server" MaxLength="50" CssClass="form-control py-2" ValidationGroup="frmApplicantSpouse"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Spouse/Partner&#39;s Identity Number
                            <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="#FFFF99" ControlToValidate="txtIdentityNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantSpouse"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  
ControlToValidate="txtIdentityNumber" ErrorMessage="Enter a 13-digit ID number" BackColor="#FFFF99" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantSpouse" 
ValidationExpression="[0-9]{13}"></asp:RegularExpressionValidator>
                                </span></td>
                            <td>
                                <asp:TextBox id="txtIdentityNumber" runat="server" MaxLength="13" onkeypress="return event.charCode >= 48 && event.charCode <= 57" CssClass="form-control py-2" ValidationGroup="frmApplicantSpouse"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Spouse/Partner&#39;s Nationality
                            <span style="color:red">*</span></td>
                            <td>
                                 
                                <asp:DropDownList ID="ddlNationality" runat="server" CssClass="btn-outline-warning btn-fw" >
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                          <tr>
                              <td>&nbsp;</td>
                              <td class="formTextTD">&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                          </tr>
                          <tr>
                              <td>&nbsp;</td>
                              <td class="formTextTD"><strong>CONTACT DETAILS</strong></td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                          </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Work Number
                            </td>
                            <td>
                                <asp:TextBox id="txtWorkNumber" runat="server" CssClass="form-control py-2" ValidationGroup="frmApplicantSpouse"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Mobile Number
                            <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="#FFFF99" ControlToValidate="txtMobileNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantSpouse"></asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  
ControlToValidate="txtMobileNumber" ErrorMessage="Enter a 10-digit Cellphone number" BackColor="#FFFF99" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantSpouse" 
ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                                </span></td>
                            <td>
                                <asp:TextBox id="txtMobileNumber" runat="server" MaxLength="10" onkeypress="return event.charCode >= 48 && event.charCode <= 57" CssClass="form-control py-2" ValidationGroup="frmApplicantSpouse"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Email Address
                               
                            </td>
                            <td>
                                <asp:TextBox id="txtEmailAddress" runat="server" MaxLength="50" CssClass="form-control py-2" ValidationGroup="frmApplicantSpouse"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Does the spouse reside at the same address?
                            </td>
                            <td>
                 
                                <asp:RadioButtonList ID="chkSameAddress" runat="server" CssClass="btn btn-outline-warning btn-fw" RepeatDirection="Horizontal" OnSelectedIndexChanged="chkSameAddress_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="True">Yes</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="False">No</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                          <tr>
                              <td>&nbsp;</td>
                              <td class="formTextTD">
                                  <asp:Label ID="lblAddress" runat="server" Text="Residential Address "></asp:Label>
                                  <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="txtResidentialAddress" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantSpouse"></asp:RequiredFieldValidator>
                                  </span></td>
                              <td>
                                  <asp:TextBox ID="txtResidentialAddress" runat="server" CssClass="form-control py-2" MaxLength="50" ValidationGroup="frmApplicantSpouse"></asp:TextBox>
                              </td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                    </table>
                </ContentTemplate>
             <%--   <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>
<asp:HiddenField ID="hfID" runat="server" Value="0" />
