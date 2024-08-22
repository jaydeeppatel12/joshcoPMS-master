<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="propertyForm.ascx.cs" Inherits="joshcoWA.propertyForm" %>
<style type="text/css">
    .auto-style1 {
        font-size: 14px;
    }
</style>
<table style="width:60%">
                                <tr>
                                    <td style="width:180px;"> <strong>Property Info</strong></td><td style="width:300px;">&nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td style="width:180px;"> Property Name <span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPropertyName" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP" BackColor="#FFFF99"></asp:RequiredFieldValidator>
                                    </td><td style="width:300px;"><input runat="server" type="text" class="form-control py-2" placeholder="Property Name" id="txtPropertyName" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Area or Extent </td><td>
                                        <input runat="server" type="text" class="form-control py-2" placeholder="Area or Extent" id="txtArea" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Erf No</td><td>
                                        <input runat="server" type="text" class="form-control py-2" placeholder="Erf No" id="txtErf" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Portion No</td><td>
                                        <input runat="server" type="text" class="form-control py-2" placeholder="Portion No" id="txtPortion" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         &nbsp;</td><td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         <strong>Contact Details</strong></td><td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Contact Person <span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContactPerson" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP" BackColor="#FFFF99"></asp:RequiredFieldValidator>
                                    </td><td><input runat="server" type="text" class="form-control py-2" placeholder="Contact Person" id="txtContactPerson" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                  <tr>
                                    <td> Telephone <span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTelephone" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP" BackColor="#FFFF99"></asp:RequiredFieldValidator>
                                      </td><td><input runat="server" type="text" class="form-control py-2" placeholder="Telephone" id="txtTelephone" /></td> 
                                   
                                      <td>
                                          &nbsp;</td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td> Fax Number </td><td><input runat="server" type="text" class="form-control py-2" placeholder="Fax Number" id="txtFaxNumber" /></td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                  <tr>
                                    <td> Email Address </td><td><input runat="server" type="text" class="form-control py-2" placeholder="Email Address" id="txtEmailAddress" /></td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>

                                <tr>
                                    <td> Physical Address </td><td><textarea runat="server" class="form-control py-2" rows="4"  placeholder="Physical Address" id="txtPhysicalAddress"></textarea></td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td> Code </td><td> <input type="text" runat="server" class="form-control py-2" placeholder="Address Code" id="txtPhysicalAddressCode" /></td> 
                                 
                                    <td> &nbsp;</td> 
                                 
                                    <td> &nbsp;</td> 
                                 
                                </tr>
                                <tr>
                                    <td> Postal Address </td><td><textarea runat="server"   class="form-control py-2" rows="4"  placeholder="Address" id="txtPostalAddress"></textarea></td> 
                                  
                                    <td>&nbsp;</td> 
                                  
                                    <td>&nbsp;</td> 
                                  
                                </tr>
                                <tr>
                                    <td> Code </td><td><input type="text" runat="server" class="form-control py-2" placeholder="Postal Code" id="txtPostalAddressCode" /></td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                </tr>
                                
                               
                                <tr>
                                    <td> &nbsp;</td><td>&nbsp;</td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                </tr>
                                
                               
                                <tr>
                                    <td> 
                                         <strong>Coordinates</strong></td><td>&nbsp;</td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                </tr>
                                
                               
                                <tr>
                                    <td> Latitude</td><td>
                                    <input id="txtLat" runat="server" class="auto-style1" placeholder="Lat" type="text" /></td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                </tr>
                                
                               
                                <tr>
                                    <td> Longitude</td><td>
                                    <input id="txtLong" runat="server" class="auto-style1" placeholder="Long" type="text" /></td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                    <td>&nbsp;</td> 
                                    
                                </tr>
                                
                               
                                <tr>
                                    <td> 
                                        <asp:HiddenField ID="hfPropertyID" runat="server" />
                                    </td><td>
                                         <asp:Button ID="btnSave" CssClass="btn btn-warning px-5 py-2" runat="server" Text="Submit" OnClick="btnSave_Click" ValidationGroup="AddP" />
                                         <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" InsertCommand="InsertProperty" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [Property] WHERE ([PropertyID] = @PropertyID)" UpdateCommand="UpdateProperty" UpdateCommandType="StoredProcedure" OnInserted="sdsProperty_Inserted">
                                             <InsertParameters>
                                                 <asp:Parameter Name="PropertyName" Type="String" />
                                                 <asp:Parameter Name="Address" Type="String" />
                                                 <asp:Parameter Name="AddressCode" Type="Int32" />
                                                 <asp:Parameter Name="PostalAddress" Type="String" />
                                                 <asp:Parameter Name="PostalAddressCode" Type="Int32" />
                                                 <asp:Parameter Name="Telephone" Type="String" />
                                                 <asp:Parameter Name="Fax" Type="String" />
                                                 <asp:Parameter Name="EmailAddress" Type="String" />
                                                 <asp:Parameter Name="ContactPerson" Type="String" />
                                                 <asp:Parameter Name="Long" Type="String" />
                                                 <asp:Parameter Name="Lat" Type="String" />
                   
                                                 <asp:Parameter Name="PropertyArea" Type="Decimal" />
         
                            
                                                 <asp:Parameter Direction="InputOutput" Name="PropertyID" Type="Int32" />
                                                 <asp:Parameter Name="ErfNo" Type="String" />
                                                 <asp:Parameter Name="PortionNo" Type="String" />
                                             </InsertParameters>
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="hfPropertyID" Name="PropertyID" PropertyName="Value" Type="Int32" />
                                             </SelectParameters>
                                             <UpdateParameters>
                                                 <asp:Parameter Name="PropertyName" Type="String" />
                                                 <asp:Parameter Name="Address" Type="String" />
                                                 <asp:Parameter Name="AddressCode" Type="Int32" />
                                                 <asp:Parameter Name="PostalAddress" Type="String" />
                                                 <asp:Parameter Name="PostalAddressCode" Type="Int32" />
                                                 <asp:Parameter Name="Telephone" Type="String" />
                                                 <asp:Parameter Name="Fax" Type="String" />
                                                 <asp:Parameter Name="EmailAddress" Type="String" />
                                                 <asp:Parameter Name="ContactPerson" Type="String" />
                                                 <asp:Parameter Name="Long" Type="String" />
                                                 <asp:Parameter Name="Lat" Type="String" />
               
                                                 <asp:Parameter Name="PropertyArea" Type="Decimal" />
                           
                                                 <asp:Parameter Name="PropertyID" Type="Int32" />
                                                 <asp:Parameter Name="ErfNo" Type="String" />
                                                 <asp:Parameter Name="PortionNo" Type="String" />
                                             </UpdateParameters>
                                         </asp:SqlDataSource>
                                         </td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                </tr>
                            </table>