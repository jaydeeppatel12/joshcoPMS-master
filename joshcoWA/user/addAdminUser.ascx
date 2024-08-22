<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addAdminUser.ascx.cs" Inherits="joshcoWA.user.addAdminUser" %>
   <table style="width:100%">
                                <tr>
                                    <td style="width:180px;"> &nbsp;</td><td style="width:300px;">
                                    &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td style="width:180px;"> Name<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP" BackColor="#FFFF99"></asp:RequiredFieldValidator>
                                    </td><td style="width:300px;"><input runat="server" type="text" class="form-control py-2" placeholder="Name" id="txtName" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Surname<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSurname" Display="Dynamic" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP" BackColor="#FFFF99"></asp:RequiredFieldValidator>
                                    </td><td>
                                        <input runat="server" type="text" class="form-control py-2 " placeholder="Surname" id="txtSurname" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                       Email Address<span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmailAddress" Display="Dynamic" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP" BackColor="#FFFF99"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmailAddress" Display="Dynamic" ErrorMessage="*Invalid email address" Font-Size="8pt" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AddP" Width="120px"></asp:RegularExpressionValidator>
                                </span> </td><td>
                                        <input runat="server" type="text" class="form-control py-2 " placeholder="EmailAddress" id="txtEmailAddress" enableviewstate="False" /><asp:HiddenField ID="hfEmailAddress" runat="server" />
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Contact Number<span style="color:red">*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContactNumber" Display="Dynamic" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP" BackColor="#FFFF99"></asp:RequiredFieldValidator>
                            <span style="color:red">
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  
ControlToValidate="txtContactNumber" ErrorMessage="Enter a 10-digit number" BackColor="#FFFF99" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP" 
ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </span>
                                    </td><td><input runat="server" type="text" class="form-control py-2 " placeholder="Contact Number" id="txtContactNumber" /></td> 
                                   
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
                                        User Group</td><td>
                                       <asp:DropDownList ID="ddlUserGroup" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" DataSourceID="sdsUserGroup" DataTextField="UserGroup" DataValueField="UserGroupID">
                                       
                                    </asp:DropDownList>
                                                <asp:SqlDataSource ID="sdsUserGroup" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectUserGroup" SelectCommandType="StoredProcedure" >
                                     
                                      <SelectParameters>
                         
                                          <asp:Parameter DefaultValue="0" Name="UserGroupID" Type="Int32" />
                                           
                                      </SelectParameters>
                                      </asp:SqlDataSource>

                                                       </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                        <span style="color:red">
                                        <asp:Label ID="lblPassword0" runat="server" Text="*"></asp:Label>
                                        </span><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP" BackColor="#FFFF99"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidators2" runat="server" ErrorMessage="Password must have: At least one lower case letter,
At least one upper case letter,
At least special character,
At least one number,
At least 8 characters length"  
        ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$"  
        BackColor="#FFFF99" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP" ControlToValidate="txtPassword"></asp:RegularExpressionValidator>
                                    </td><td style="vertical-align:top">
                                         <input runat="server"  type="password" class="form-control py-2 " pattern=".{8,12}" placeholder="Password" id="txtPassword" enableviewstate="False" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblRePassword" runat="server" Text="Re-Password"></asp:Label>
                                        <span style="color:red">
                                        <asp:Label ID="lblRePassword0" runat="server" Text="*"></asp:Label>
                                        </span><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRePassword" ErrorMessage="*password not matching" Font-Size="8pt" ForeColor="Red" BackColor="#FFFF99"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtRePassword" Display="Dynamic" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="AddP" BackColor="#FFFF99"></asp:RequiredFieldValidator>
                                    </td><td>
                                         <input runat="server"  type="password" class="form-control py-2 " placeholder="Password" id="txtRePassword" />
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
                                    </td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                </tr>
                                
                               
                                </table>