<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmStudentParent.ascx.cs" Inherits="joshcoWA.student.frmStudentParent" %>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
               <ContentTemplate>
                    <table>
                       <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD" colspan="3">
                                <strong>PARENT DETAILS - </strong>
                                 <asp:Label ID="lblParentDetails" runat="server" ForeColor="Red" Text="Incomplete"></asp:Label>
                            </td>
                        </tr>                      
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">
                                <asp:Label ID="lblRefNo" runat="server" Text="Reference No" ></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblParentReferenceNo" runat="server" Font-Bold="True" ></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Full Name <span style="color:red">*</span><asp:RequiredFieldValidator ID="rfvFullName" runat="server" BackColor="#FFFF99" ControlToValidate="txtFullName" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm"  Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            <td>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"  ValidationGroup="frmParent"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>                    
                         <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                ID/Passport Number
                                 <span style="color:red">*</span><asp:RequiredFieldValidator ID="rfvIdentificationNumber" runat="server" BackColor="#FFFF99" ControlToValidate="txtIdentificationNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm" Display="Dynamic"></asp:RequiredFieldValidator>
                               
                            </td>
                            <td>
                                <asp:TextBox id="txtIdentificationNumber" runat="server" CssClass="form-control" ValidationGroup="frmParent"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Home Address
                            </td>
                            <td>
                                <asp:TextBox id="txtResidentialAddress" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="StudentApplicationForm"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>   
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Email Address
                              <span style="color:red">*</span> <asp:RequiredFieldValidator ID="rfvEmailAddress" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmailAddress" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm" Display="Dynamic"></asp:RequiredFieldValidator>
                          
                            </td>
                            <td>
                                <asp:TextBox id="txtEmailAddress" runat="server"  CssClass="form-control" ValidationGroup="StudentApplicationForm"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                          <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Mobile Number
                                <span style="color:red">*</span> <asp:RequiredFieldValidator ID="rfvMobileNumber" runat="server" BackColor="#FFFF99" ControlToValidate="txtMobileNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm" Display="Dynamic"></asp:RequiredFieldValidator>
                         
                            </td>
                            <td>
                                <asp:TextBox id="txtMobileNumber" runat="server"  CssClass="form-control" ValidationGroup="StudentApplicationForm"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>                        
                     <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Employer </td>
                            <td>
                                <asp:TextBox ID="txtEmployer" runat="server" CssClass="form-control"  ValidationGroup="StudentApplicationForm"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Monthly Income
                              <span style="color:red">*</span>   
                                <asp:RequiredFieldValidator ID="rfvrevMonthlyIncome" runat="server" BackColor="#FFFF99" ControlToValidate="txtMonthlyIncome" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm" Display="Dynamic"></asp:RequiredFieldValidator>
                            
                            </td>
                            <td>
                                <asp:TextBox id="txtMonthlyIncome" runat="server"  CssClass="form-control" ValidationGroup="StudentApplicationForm"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                          <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                               Bank
                            </td>
                            <td>
                                    <asp:TextBox id="txtBank" runat="server"  CssClass="form-control" ValidationGroup="StudentApplicationForm"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>                       
                         <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                               Account Number
                            </td>
                            <td>
                                    <asp:TextBox id="txtAccountNumber" runat="server"  CssClass="form-control" ValidationGroup="StudentApplicationForm"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                               Account Type
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlAccountType" runat="server" CssClass="btn-outline-warning btn-fw" >
                                    <asp:ListItem>Cheque</asp:ListItem>
                                        <asp:ListItem>Saving</asp:ListItem>
                                </asp:DropDownList>
                             
                               </td>          
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                               Billing Day(Monthly)
                            </td>
                            <td>
                                <asp:TextBox id="txtBillingDay" runat="server"  CssClass="form-control" ValidationGroup="StudentApplicationForm"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>

                    </table>
               </ContentTemplate>
                </asp:UpdatePanel>
<asp:HiddenField ID="hfID" runat="server" Value="0" />
