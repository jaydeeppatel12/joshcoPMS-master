<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="unitForm.ascx.cs" Inherits="joshcoWA.unitForm" %>
<asp:Panel ID="Panel1" runat="server">
<table style="width:95%">
                                <tr>
                                    <td style="width:180px;"> <strong>Property Unit Info</strong></td><td style="width:300px;">&nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td style="width:180px;"> Unit Name <span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUnitName" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td><td style="width:300px;"><input runat="server" type="text" class="form-control py-2" placeholder="Unit Name" id="txtUnitName" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Area or Extent </td><td>
                                        <input runat="server" type="text" class="form-control py-2" placeholder="Area or Extent" id="txtArea" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Rental Amount</td><td>
                                        <input runat="server" type="text" class="form-control py-2" placeholder="Rental Amount" id="txtRate" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         Escalation</td><td>
                                        <input runat="server" type="text" class="form-control py-2" placeholder="Escalation e.g 10" id="txtEscalation" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                         &nbsp;</td><td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                
                               
                                <tr>
                                    <td> 
                                        <asp:HiddenField ID="hfPropertyUnitID" runat="server" />
                                    </td><td>
                                         <asp:Button ID="btnSave" CssClass="btn btn-warning px-5 py-2" runat="server" Text="Submit &amp; Upload Images &gt;&gt;" OnClick="btnSave_Click" ValidationGroup="AddP" />
                                         <asp:SqlDataSource ID="sdsPropertyUnit" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" InsertCommand="InsertPropertyUnit" InsertCommandType="StoredProcedure" SelectCommand="SelectPropertyUnit" UpdateCommand="UpdatePropertyUnit" UpdateCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                                             <InsertParameters>
                                                 <asp:Parameter Name="PropertyUnit" Type="String" />
                                                 <asp:Parameter Name="PropertyID" Type="Int32" />
                                                 <asp:Parameter Name="UnitArea" Type="Int32" />
                                                 <asp:Parameter Name="EstRatePerSQM" Type="Decimal" />
                                                 <asp:Parameter Name="EstEscalation" Type="Decimal" />
                                             </InsertParameters>
                                             <SelectParameters>
                                                 <asp:Parameter DefaultValue="0" Name="PropertyID" Type="Int32" />
                                                 <asp:ControlParameter ControlID="hfPropertyUnitID" Name="PropertyUnitID" PropertyName="Value" Type="Int32" />
                                             </SelectParameters>
                                             <UpdateParameters>
                                                 <asp:Parameter Name="PropertyUnit" Type="String" />
                                                 <asp:Parameter Name="PropertyUnitID" Type="Int32" />
                                                 <asp:Parameter Name="UnitArea" Type="Int32" />
                                                 <asp:Parameter Name="EstRatePerSQM" Type="Decimal" />
                                                 <asp:Parameter Name="EstEscalation" Type="Decimal" />
                                             </UpdateParameters>
                                         </asp:SqlDataSource>
                                         </td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                </tr>
                            </table>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Visible="false">
<table style="width:95%">
                                <tr>
                                   
                                    <td><strong>Property Unit Images</strong></td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                   
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-primary px-5 py-2"  />
                                    </td> 
                                   
                                    <td>
                                        <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-primary px-5 py-2" OnClick="UploadFile" Text="Upload" />
                                    </td> 
                                   
                                </tr>
                                <tr>
                                   
                                    <td>
                                        <asp:DataList ID="dlImages" runat="server" RepeatColumns="4" Width="100%" OnItemCommand="dlImages_ItemCommand">
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="vertical-align:top;"><img class="img-thumbnail" height="60"  width="100" alt="<%#Eval("ImageName")%>" src="<%# "../propertunitypic/"+Eval("PropertyUnitID")+"/"+Eval("ImageName") %>" /></td>
                                                        <td style="vertical-align:top;"> <asp:ImageButton ID="ImageButton1" ToolTip="Delete image" style="float:right" ImageUrl="~/images/delete.png" runat="server" CommandArgument='<%# "../propertunitypic/"+Eval("PropertyUnitID")+"/"+Eval("ImageName") %>' CommandName="RemoveImage" /></td>
                                                    </tr>
                                                </table>
   
                                                
                                            </ItemTemplate>
                                            <ItemStyle Width="120px" VerticalAlign="Top" />
                                        </asp:DataList>

                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnSave0" runat="server" CssClass="btn btn-warning px-5 py-2" OnClick="btnSave0_Click" Text="&lt;&lt;Back" ValidationGroup="AddP" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
</asp:Panel>

