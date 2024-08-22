<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSupplier4.ascx.cs" Inherits="joshcoWA.supplier.frmSupplier4" %>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditApplicant" >
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="formTextTD" colspan="3">
                                <strong>BUSINESS PARTICULARS  </strong></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Name of the Business<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" BackColor="#FFFF99" ControlToValidate="txtBusinessName" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier4"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtBusinessName" />
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Physical Address<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" BackColor="#FFFF99" ControlToValidate="txtPhysicalAddress" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier4"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtPhysicalAddress" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> City<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" BackColor="#FFFF99" ControlToValidate="txtCity" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier4"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtCity" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td> Code<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" BackColor="#FFFF99" ControlToValidate="txtPhysicalAddressCode" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier4"></asp:RequiredFieldValidator>
                                <span style="color:red">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="txtPhysicalAddressCode" ErrorMessage="Enter a 4-digit code" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]{4}" ValidationGroup="frmSupplier4"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtPhysicalAddressCode" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Province<span style="color:red">*</span></td>
                            <td>
                                
                                &nbsp;<asp:DropDownList ID="ddlProvince" runat="server" CssClass="btn-outline-warning btn-fw" DataSourceID="sdsProvince" DataTextField="Province" DataValueField="ProvinceID">
                                </asp:DropDownList>
                                
                                <asp:SqlDataSource ID="sdsProvince" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [Province] ORDER BY [Province]"></asp:SqlDataSource>
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Telephone Number<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" BackColor="#FFFF99" ControlToValidate="txtTelephone" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier4"></asp:RequiredFieldValidator>
                                <span style="color:red">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" BackColor="#FFFF99" ControlToValidate="txtTelephone" ErrorMessage="Enter a 10-digit Cellphone number" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]{10}" ValidationGroup="frmSupplier4"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtTelephone" />
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Fax Number</td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtFax" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Email Address<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmail" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier4"></asp:RequiredFieldValidator>
                                <span style="color:red">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="*Invalid email address" Font-Size="8pt" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="frmSupplier4" Width="120px"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtEmail" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td > Web Page Address</td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtWebPageAddress" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> How would you like to receive our correspondence? </td>
                            <td>
                                
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
                            <td class="formTextTD"><strong> Contact Person for correspondence</strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                      
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Title<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" BackColor="#FFFF99" ControlToValidate="txtContactPersonTitle" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier4"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtContactPersonTitle" />
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                     
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Name<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" BackColor="#FFFF99" ControlToValidate="txtContactPersonName" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier4"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtContactPersonName" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Surname<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" BackColor="#FFFF99" ControlToValidate="txtContactPersonSurname" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier4"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtContactPersonSurname" />
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
