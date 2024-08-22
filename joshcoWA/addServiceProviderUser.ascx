<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addServiceProviderUser.ascx.cs" Inherits="joshcoWA.addServiceProviderUser" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate> </ContentTemplate>

</asp:UpdatePanel>       

   <table style="width:60%">
                                <tr>
                                    <td style="width:180px;"> &nbsp;</td><td style="width:300px;">
                                    &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td style="width:180px;"> Select Service Provider</td><td style="width:300px;">
                                    <asp:DropDownList ID="ddlServiceProvider" runat="server" AppendDataBoundItems="True" AutoPostBack="True" class="form-control py-2" DataSourceID="sdsServiceProvider" DataTextField="ServiceProvider" DataValueField="ServiceProviderID" OnSelectedIndexChanged="ddlTenant_SelectedIndexChanged">
                                    <asp:ListItem Value="0">-- Select supplier --</asp:ListItem>
                                    </asp:DropDownList>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td style="width:180px;"> Name</td><td style="width:300px;"><input runat="server" type="text" class="form-control py-2" placeholder="Name" id="txtName" /></td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>&nbsp;&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Surname </td><td>
                                        <input runat="server" type="text" class="form-control py-2 " placeholder="Surname" id="txtSurname" /></td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSurname" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                       Email Address </td><td>
                                        <input runat="server" type="text" class="form-control py-2 " placeholder="EmailAddress" id="txtEmailAddress" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Contact Number </td><td><input runat="server" type="text" class="form-control py-2 " placeholder="Contact Number" id="txtContactNumber" /></td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContactNumber" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td><td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                        Password</td><td>
                                         <input runat="server"  class="form-control py-2 " type="password"  placeholder="Password" id="txtPassword" /></td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                        Re-Password</td><td>
                                         <input runat="server"  type="password" class="form-control py-2 " placeholder="Password" id="txtRePassword" />
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRePassword" ErrorMessage="password not matching" Font-Size="8pt" ForeColor="Red"></asp:CompareValidator>
                                                        </td> 
                                   
                                    <td>
                                        
                                    </td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                        Account Active </td><td>
                                        <asp:RadioButtonList ID="rblAcive" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="True">Yes</asp:ListItem>
                                            <asp:ListItem Value="False">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                
                               
                                <tr>
                                    <td> 
                                        &nbsp;</td><td>
                                         <asp:HiddenField ID="hfUserGroupID" runat="server" />
                                    </td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                </tr>
                                
                               
                                <tr>
                                    <td> 
                                        <asp:HiddenField ID="hfUserID" runat="server" />
                                    </td><td>
                                         <asp:Button ID="btnSave" CssClass="btn btn-primary px-5 py-2" runat="server" Text="Submit" OnClick="btnSave_Click" ValidationGroup="AddP" />
                                     <asp:SqlDataSource ID="sdsUser" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectUser" InsertCommand="InsertUser" InsertCommandType="StoredProcedure" OnInserted="sdsUser_Inserted" UpdateCommand="UpdateUser" UpdateCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                                         <InsertParameters>
                                             <asp:Parameter Name="UserFirstName" Type="String" />
                                             <asp:Parameter Name="UserSurname" Type="String" />
                                             <asp:Parameter Name="UserEmailAddress" Type="String" />
                                             <asp:Parameter Name="UserContactNo" Type="String" />
                                             <asp:Parameter Name="UserGroupID" Type="Int32" />
                                             <asp:Parameter Name="UserActive" Type="Boolean" />
                                             <asp:Parameter Name="UserUserName" Type="String" />
                                             <asp:Parameter Name="UserPassword" Type="String" />
                                             <asp:Parameter Name="LeaseID" Type="Int32" />
                                             <asp:Parameter Direction="InputOutput" Name="UserID" Type="Int32" />
                                         </InsertParameters>
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="hfUserID" Name="UserID" PropertyName="Value" Type="Int32" />
                                         </SelectParameters>
                                         <UpdateParameters>
                                             <asp:Parameter Name="UserFirstName" Type="String" />
                                             <asp:Parameter Name="UserSurname" Type="String" />
                                             <asp:Parameter Name="UserEmailAddress" Type="String" />
                                             <asp:Parameter Name="UserContactNo" Type="String" />
                                             <asp:Parameter Name="UserGroupID" Type="Int32" />
                                             <asp:Parameter Name="UserActive" Type="Boolean" />
                                             <asp:Parameter Name="UserID" Type="Int32" />
                                         </UpdateParameters>
                        </asp:SqlDataSource>     
                                         <asp:SqlDataSource ID="sdsServiceProvider" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectServiceProviderUser" SelectCommandType="StoredProcedure">
                                         </asp:SqlDataSource>
                                    </td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                </tr>
                                
                               
                                </table>

   