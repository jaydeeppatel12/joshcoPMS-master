<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addUser.ascx.cs" Inherits="joshcoWA.addUser" %>


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
   <table style="width:100%">
                                <tr>
                                    <td style="width:180px;"> &nbsp;</td><td style="width:300px;">
                                    &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td style="width:180px;"> Select Tenant</td><td style="width:300px;">
                                    <asp:DropDownList ID="ddlTenant" runat="server" AppendDataBoundItems="true" AutoPostBack="True"  CssClass="btn-outline-warning btn-fw" DataSourceID="sdsTenant" DataTextField="Tenant" DataValueField="LeaseID" OnSelectedIndexChanged="ddlTenant_SelectedIndexChanged">
                                    <asp:ListItem Value="0">-- Select tenant --</asp:ListItem>
                                    </asp:DropDownList>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td style="width:180px;"> Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td><td style="width:300px;"><input runat="server" type="text" class="form-control py-2" placeholder="Name" id="txtName" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Surname 
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="txtSurname" Display="Dynamic" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td><td>
                                        <input runat="server" type="text" class="form-control py-2 " placeholder="Surname" id="txtSurname" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
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
                                         Contact Number 
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="#FFFF99" ControlToValidate="txtContactNumber" Display="Dynamic" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                         <span style="color:red">
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" BackColor="#FFFF99" ControlToValidate="txtContactNumber" ErrorMessage="Enter a 10-digit number" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]{10}" ValidationGroup="AddP"></asp:RegularExpressionValidator>
                                         </span>
                                    </td><td><input runat="server" type="text" class="form-control py-2" placeholder="Contact Number" id="txtContactNumber" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
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
                                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BackColor="#FFFF99" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password must have: At least one lower case letter,
At least one upper case letter,
At least special character,
At least one number,
At least 8 characters length"  
        ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$"  
        BackColor="#FFFF99" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP" ControlToValidate="txtPassword"></asp:RegularExpressionValidator> 
                                    </td>
                                    <td style="vertical-align:top">
                                        <input runat="server"  class="form-control py-2 " type="password" pattern=".{8,12}"  placeholder="Password" id="txtPassword" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblRePassword" runat="server" Text="Re-Password"></asp:Label>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" BackColor="#FFFF99" ControlToCompare="txtPassword" ControlToValidate="txtRePassword" ErrorMessage="*password not matching" Font-Size="8pt" ForeColor="Red"></asp:CompareValidator>
                                    </td><td>
                                         <input runat="server"  type="password" class="form-control py-2 " pattern=".{8,12}" placeholder="Password" id="txtRePassword" />
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
                                        <asp:HiddenField ID="hfEmailAddress" runat="server" />
                                    </td><td>
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
                                         <asp:Button ID="btnSave" CssClass="btn btn-warning px-5 py-2" runat="server" Text="Submit" OnClick="btnSave_Click" ValidationGroup="AddP" />
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
                                         <asp:SqlDataSource ID="sdsTenant" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectTenantUser" SelectCommandType="StoredProcedure">
                                             <SelectParameters>
                                                 <asp:Parameter DefaultValue="0" Name="LeaseID" Type="Int32" />
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                    </td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                </tr>
                                
                               
                                </table>

    </ContentTemplate>

</asp:UpdatePanel>       
