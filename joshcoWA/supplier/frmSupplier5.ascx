<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSupplier5.ascx.cs" Inherits="joshcoWA.supplier.frmSupplier5" %>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditApplicant" >
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="formTextTD" colspan="3">
                                <strong>SALES AND ACCOUNTS DEPARTMENT </strong></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> <strong>Sales Department</strong></td>
                            <td>
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Contact Name<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" BackColor="#FFFF99" ControlToValidate="txtSalesContactName" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtSalesContactName" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Designation<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" BackColor="#FFFF99" ControlToValidate="txtSalesContactDesignation" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtSalesContactDesignation" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                       
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Cell Number<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" BackColor="#FFFF99" ControlToValidate="txtSalesContactCellNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                                <span style="color:red">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" BackColor="#FFFF99" ControlToValidate="txtSalesContactCellNumber" ErrorMessage="Enter a 10-digit Cellphone number" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]{10}" ValidationGroup="frmSupplier5"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtSalesContactCellNumber" />
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Email Address<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" BackColor="#FFFF99" ControlToValidate="txtSalesContactEmailAddress" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                                <span style="color:red">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="txtSalesContactEmailAddress" Display="Dynamic" ErrorMessage="*Invalid email address" Font-Size="8pt" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="frmSupplier5" Width="120px"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtSalesContactEmailAddress" />
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Telephone<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" BackColor="#FFFF99" ControlToValidate="txtSalesContactTelephone" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                                <span style="color:red">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="txtSalesContactTelephone" ErrorMessage="Enter a 10-digit telephone number" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]{10}" ValidationGroup="frmSupplier5"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtSalesContactTelephone" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Fax Number</td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtSalesContactFaxNumber" />
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
                            <td class="formTextTD"><strong> Accounts Department</strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                       <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Contact Name<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" BackColor="#FFFF99" ControlToValidate="txtAccountsContactName" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtAccountsContactName" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Designation<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" BackColor="#FFFF99" ControlToValidate="txtAccountsContactDesignation" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtAccountsContactDesignation" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                       
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Cell Number<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" BackColor="#FFFF99" ControlToValidate="txtAccountsContactCellNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                                <span style="color:red">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" BackColor="#FFFF99" ControlToValidate="txtAccountsContactCellNumber" ErrorMessage="Enter a 10-digit Cellphone number" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]{10}" ValidationGroup="frmSupplier5"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtAccountsContactCellNumber" />
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Email Address<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" BackColor="#FFFF99" ControlToValidate="txtAccountsContactEmailAddress" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                                <span style="color:red">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" BackColor="#FFFF99" ControlToValidate="txtAccountsContactEmailAddress" Display="Dynamic" ErrorMessage="*Invalid email address" Font-Size="8pt" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="frmSupplier5" Width="120px"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtAccountsContactEmailAddress" />
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Telephone<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" BackColor="#FFFF99" ControlToValidate="txtAccountsContactTelephone" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                                <span style="color:red">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" BackColor="#FFFF99" ControlToValidate="txtAccountsContactTelephone" ErrorMessage="Enter a 10-digit telephone number" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]{10}" ValidationGroup="frmSupplier5"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtAccountsContactTelephone" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Fax Number</td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtAccountsContactFaxNumber" />
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
                            <td class="formTextTD"><strong>FINANCIAL DETAILS (BANKING)</strong>  </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Banking Institutions Name<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" BackColor="#FFFF99" ControlToValidate="txtBankName" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtBankName" />
                             </td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Branch Name<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" BackColor="#FFFF99" ControlToValidate="txtBranchName" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtBranchName" />
                             </td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Branch Code<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" BackColor="#FFFF99" ControlToValidate="txtBranchCode" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtBranchCode" />
                             </td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Account Number<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" BackColor="#FFFF99" ControlToValidate="txtAccountNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtAccountNumber" />
                             </td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Account Type<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" BackColor="#FFFF99" ControlToValidate="txtAccountType" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtAccountType" />
                             </td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Account Holders Name<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" BackColor="#FFFF99" ControlToValidate="txtAccountHolderName" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtAccountHolderName" />
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
                            <td class="formTextTD"><strong> PREVIOUS BUSINESS INFORMATION </strong> </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Did your business previously exist under a previous name? </td>
                            <td>
                                <asp:RadioButtonList ID="chkPropertyOwner" runat="server" CssClass="btn btn-outline-warning btn-fw" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="chkPropertyOwner_SelectedIndexChanged">
                                    <asp:ListItem Value="True">Yes</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="False">No</asp:ListItem>
                                </asp:RadioButtonList>
                             </td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> If Yes, what name did it trade under?<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" BackColor="#FFFF99" ControlToValidate="txtPreviousBusinessName" Enabled="False" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtPreviousBusinessName" />
                             </td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Previous business registration number<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" BackColor="#FFFF99" ControlToValidate="txtPreviousBusinessRegistration" Enabled="False" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier5"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtPreviousBusinessRegistration" />
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
                </ContentTemplate>
             <%--   <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>
<asp:HiddenField ID="hfID" runat="server" Value="0" />
