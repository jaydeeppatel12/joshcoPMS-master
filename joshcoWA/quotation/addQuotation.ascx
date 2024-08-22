<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addQuotation.ascx.cs" Inherits="joshcoWA.quotation.addQuotation" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

   <style type="text/css">
       .auto-style1 {
           width: 173px;
       }
   </style>

   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate> 
                                          <table style="width:100%">
                                <tr>
                                    <td class="auto-style1"> REFERENCE No.</td><td>
                                    <asp:Label ID="lblReferenceNo" runat="server" Font-Bold="True"></asp:Label>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1"> Quote Title </td><td><input runat="server" type="text" class="form-control" placeholder="Quote Title" id="txtQuoteTitle" /></td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtQuoteTitle" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1"> Property </td><td>
                                    <asp:DropDownList ID="ddlProperty" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID">
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         Due Date </td><td>
                                             <asp:TextBox ID="rdpDueDate" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                        
                                    </td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rdpDueDate" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         Work Description </td><td>
                                        <textarea runat="server" class="form-control" rows="4"  placeholder="Work Description" id="txtWorkDescription" cols="20" name="S1"></textarea></td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtWorkDescription" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         Briefing Meeting Require? </td><td>
                                        <asp:RadioButtonList ID="rblMeeting" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblMeeting_SelectedIndexChanged">
                                            <asp:ListItem Value="true">Yes</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="false">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         <asp:Label ID="lblMeeting1" runat="server" Text="Meeting Date" Visible="False"></asp:Label>
                                    </td><td>
                                        <telerik:RadDateTimePicker ID="rdpMeetingDate" Visible="false" Runat="server">
                                        </telerik:RadDateTimePicker>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         <asp:Label ID="lblMeeting2" runat="server" Text="Meeting Venue" Visible="False"></asp:Label>
                                    </td><td>
                                        <input type="text" runat="server" class="form-control" placeholder="Meeting Venue" id="txtMeetingVenue" visible="False" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         Contact Person </td><td>
                                        <input runat="server" type="text" class="form-control" placeholder="Contact Person" id="txtContactPerson" /></td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtContactPerson" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         Contact Email</td><td>
                                        <input runat="server" type="text" class="form-control" placeholder="Contact Email" id="txtContactEmail" />
                                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtContactEmail" Display="Dynamic" 
                                ErrorMessage="Invalid email address" Font-Size="7pt" ForeColor="Red" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="AddP" Width="120px"></asp:RegularExpressionValidator>

                                                           </td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtContactEmail" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                  <tr>
                                    <td class="auto-style1"> Telephone </td><td><input runat="server" type="text" class="form-control" placeholder="Telephone" id="txtTelephone" /></td> 
                                   
                                      <td>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTelephone" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"> </asp:RequiredFieldValidator>
                                      </td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1"> &nbsp;</td><td>
                                           <asp:SqlDataSource ID="sdsSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="Select ''" InsertCommand="InsertQuotation" InsertCommandType="StoredProcedure">
                                <InsertParameters>
                                    <asp:Parameter Name="InvitationToQuoteID" Type="Int32" />
                                    <asp:Parameter Name="ServiceProviderID" Type="Int32" />
                                </InsertParameters>
                                
                         </asp:SqlDataSource>
                     
                                    </td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                </tr>
                                
                               
                                <tr>
                                    <td class="auto-style1"> 
                                        <asp:Label ID="lblQueryID" runat="server" Text="0" Visible="False"></asp:Label>
                                    </td><td>
                                         <asp:Button ID="btnSave" CssClass="btn btn-warning" runat="server" Text="Submit" OnClick="btnSave_Click" ValidationGroup="AddP" />
                                         </td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                </tr>
                            </table>
<asp:SqlDataSource ID="sdsQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectInvitationToQuote" SelectCommandType="StoredProcedure" InsertCommand="InsertInvitationToQuote" InsertCommandType="StoredProcedure" OnInserted="sdsQuotation_Inserted">
                                <InsertParameters>
                                    <asp:Parameter Name="QuoteTitle" Type="String" />
                                    <asp:Parameter Name="WorkDescription" Type="String" />
                                      <asp:Parameter Name="PropertyID" Type="Int32" />
                                    <asp:Parameter Name="DueDate" Type="DateTime" />
                                    <asp:Parameter Name="MeetingRequired" Type="Boolean" />
                                    <asp:Parameter Name="MeetingDate" Type="DateTime" />
                                    <asp:Parameter Name="MeetingVenue" Type="String" />
                                    <asp:Parameter Name="ContactPerson" Type="String" />
                                    <asp:Parameter Name="ContactEmail" Type="String" />
                                    <asp:Parameter Name="InvitationToQuoteID" Type="Int32" Direction="InputOutput" />
                                    <asp:Parameter Name="ReferenceNumber" Type="String" />
                                    <asp:Parameter Name="ContactTelephone" Type="String" />
                                    <asp:Parameter Name="QueryID" Type="Int32" />
                                </InsertParameters>
                                
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="PropertyID" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="InvitationToQuoteID" Type="Int32" />
                                </SelectParameters>
                                
                         </asp:SqlDataSource>
                     

                                    </ContentTemplate>
                                </asp:UpdatePanel>