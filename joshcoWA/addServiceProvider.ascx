<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addServiceProvider.ascx.cs" Inherits="joshcoWA.addServiceProvider" %>
 <table style="width:100%">
                                <tr>
                                    <td style="width:55%; vertical-align:top;">

                      <asp:SqlDataSource ID="sdsProvider" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectProviderList" SelectCommandType="StoredProcedure" InsertCommand="InsertServiceProvider" InsertCommandType="StoredProcedure" OnInserted="sdsProvider_Inserted">
                                <InsertParameters>
                                    <asp:Parameter Name="ServiceProviderName" Type="String" />
                                    <asp:Parameter Name="PhysicalAddress" Type="String" />
                                      <asp:Parameter Name="PhysicalAddressCode" Type="Int32" />
                                    <asp:Parameter Name="PostalAddress" Type="String" />
                                    <asp:Parameter Name="PostalAddressCode" Type="Int32" />
                                    <asp:Parameter Name="EntityTypeID" Type="Int32" />
                                    <asp:Parameter Name="RegistrationNumber" Type="String" />
                                    <asp:Parameter Name="Telephone" Type="String" />
                                    <asp:Parameter Name="Fax" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="BEECertificate" Type="Boolean" />
                                    <asp:Parameter Name="BEELevelID" Type="Int32" />
                                    <asp:Parameter DbType="Date" Name="BEEExpiringDate" />
                                    <asp:Parameter Name="TaxClearance" Type="Boolean" />
                                    <asp:Parameter DbType="Date" Name="TaxClearanceExpiringDate" />
                                    <asp:Parameter Name="BEE_Ownership" Type="String" />
                                    <asp:Parameter Name="NonVatRegistered" Type="Boolean" />
                                    <asp:Parameter Name="VatRegisteredNumber" Type="String" />
                                    <asp:Parameter Name="ContactPersonName" Type="String" />
                                    <asp:Parameter Direction="InputOutput" Name="ServiceProviderID" Type="Int32" />
                                    <asp:Parameter Name="BankName" Type="String" />
                                    <asp:Parameter Name="BranchCode" Type="String" />
                                    <asp:Parameter Name="AccountNumber" Type="String" />
                                    <asp:Parameter Name="ServiceProviderSectorID" Type="String" />
                                </InsertParameters>
                                
                         </asp:SqlDataSource>
                            <table style="width:100%">
                                <tr>
                                    <td style="width:180px;"> Service Provider </td><td style="width:300px;"><input runat="server" type="text" class="form-control" placeholder="Service Provider" id="txtServiceProvider" /></td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtServiceProvider" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td style="width:180px;"> Entity Type </td><td style="width:300px;">
                                    <asp:DropDownList ID="ddlEntityType" runat="server" AppendDataBoundItems="True" DataSourceID="sdsEntityType" CssClass="form-control" DataTextField="EntityType" DataValueField="EntityTypeID">
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsEntityType" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [EntityType] ORDER BY [EntityType]"></asp:SqlDataSource>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Reg. Number </td><td>
                                        <input runat="server" type="text" class="form-control" placeholder="Reg. Number" id="txtRegNumber" /></td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRegNumber" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         BEE Certificate </td><td>
                                        <asp:RadioButtonList ID="rblBeeCertificate" runat="server" CssClass="form-control" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="True">Yes</asp:ListItem>
                                            <asp:ListItem Value="False">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         BEE Level </td><td>
                                        <asp:DropDownList ID="ddlBeeLevel" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="sdsBeeLevel" DataTextField="BEELevel" DataValueField="BEELevelID">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="sdsBeeLevel" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [BEELevel] ORDER BY [BEELevel]"></asp:SqlDataSource>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         BEE Expiring Date </td><td>
                                             <asp:TextBox ID="rdpBeeDate" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                    
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Contact Person </td><td>
                                        <input runat="server" type="text" class="form-control" placeholder="Contact Person" id="txtContactPerson" /></td> 
                                   
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtContactPerson" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                  <tr>
                                    <td> Telephone </td><td><input runat="server" type="text" class="form-control" placeholder="Telephone" id="txtTelephone" /></td> 
                                   
                                      <td>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTelephone" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"> </asp:RequiredFieldValidator>
                                      </td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td> Fax Number </td><td><input runat="server" type="text" class="form-control" placeholder="Fax Number" id="txtFaxNumber" /></td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                  <tr>
                                    <td> Email Address </td><td><input runat="server" type="text" class="form-control" placeholder="Email Address" id="txtEmailAddress" /></td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>

                                <tr>
                                    <td> Physical Address </td><td><textarea runat="server" class="form-control" rows="4"  placeholder="Physical Address" id="txtPhysicalAddress"></textarea></td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td> Code </td><td> <input type="text" runat="server" class="form-control" placeholder="Address Code" id="txtPhysicalAddressCode" /></td> 
                                 
                                    <td> &nbsp;</td> 
                                 
                                    <td> &nbsp;</td> 
                                 
                                </tr>
                                <tr>
                                    <td> Postal Address </td><td><textarea runat="server"   class="form-control" rows="4"  placeholder="Address" id="txtPostalAddress"></textarea></td> 
                                  
                                    <td>&nbsp;</td> 
                                  
                                    <td>&nbsp;</td> 
                                  
                                </tr>
                                <tr>
                                    <td> Code </td><td><input type="text" runat="server" class="form-control" placeholder="Postal Code" id="txtPostalAddressCode" /></td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                </tr>
                                
                               
                                <tr>
                                    <td> </td><td>
                                         <asp:Button ID="btnSave" CssClass="btn btn-primary px-5 py-2" runat="server" Text="Submit" OnClick="btnSave_Click" ValidationGroup="AddP" />
                                         </td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                </tr>
                            </table>
                                           </td>
                                     <td>&nbsp;</td>
                                     <td style="width:45%; vertical-align:top;">
                                         <table class="nav-justified">
                                             <tr>
                                                 <td style="vertical-align:top;"><b>Sector</b></td>
                                                 <td>                         
                      <asp:CheckBoxList ID="cblServiceProviderSector" DataSourceID="sdsServiceProviderSector" DataValueField="ServiceProviderSectorID" DataTextField="ServiceProviderSector" runat="server" >

                      </asp:CheckBoxList>
                         <asp:SqlDataSource ID="sdsServiceProviderSector" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>"
                                                    SelectCommand="SELECT [ServiceProviderSectorID] ,[ServiceProviderSector]  FROM [dbo].[ServiceProviderSector] Order by [ServiceProviderSector] Asc"></asp:SqlDataSource> </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td><b>Bank Details</b></td>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td>Bank Name</td>
                                                 <td><input runat="server" type="text" class="form-control" placeholder="Bank Name" id="txtBankName" /></td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td>Branch Code</td>
                                                 <td><input runat="server" type="text" class="form-control" placeholder="Branch Code" id="txtBranchCode" /></td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td>Account No.</td>
                                                 <td><input runat="server" type="text" class="form-control" placeholder="Account No" id="txtAccountNo" /></td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                         </table>
                                    </td>
                                    </tr>
                                      </table>