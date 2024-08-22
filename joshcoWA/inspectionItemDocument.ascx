<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="inspectionItemDocument.ascx.cs" Inherits="joshcoWA.inspectionItemDocument" %>
        <table style="width: 100%">
                               <tr>
                                  <td >
                                      <asp:Panel ID="pnlDocumentAdd" runat="server">
                                      <table style="width: 100px">
                                          <tr>
                                              <td style="vertical-align:middle;">
                                      <asp:FileUpload ID="flUpload" runat="server" Multiple="Multiple" ToolTip="Upload images here"  />
                                              </td>
                                              <td>
                                                  <asp:Button ID="Button1"   OnClick="lnkUpload_Click" CssClass="btn btn-primary px-5 py-2" runat="server" Text="Upload" />
                                                  
                                      
                                              </td>
                                          </tr>
                                      </table></asp:Panel>
                                  </td>
                                  <td>
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td>  </td>
                                  <td></td>
                              </tr>
                              <tr>
                                  <td >
                   <asp:GridView ID="gvDocument" runat="server" AutoGenerateColumns="False" CellPadding="2" CellSpacing="3" GridLines="None" OnRowCommand="GridView2_RowCommand" style="text-align: left; font-size: 10pt;" Width="80%" DataSourceID="sdsDocument">
                                      <Columns>
                                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                           <asp:Image ID="Image1" Height="35px" runat="server" ImageUrl='<%# Eval("IconUrl") %>' />   
                        </ItemTemplate>
                       
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                                           
                                             
                                          

                   <asp:TemplateField HeaderText="Document" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                     <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="Download" CommandArgument='<%# Eval("InspectionDocumentID") %>' ToolTip="Download document" ForeColor="#75C5CA" Text='<%# Eval("DocumentName") %>' >Documents</asp:LinkButton> 
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Doc Size" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                   <asp:Label ID="Label13" runat="server" Text='<%#  (Convert.ToInt32(Eval("Size"))/1024).ToString()+"KB" %>'  ></asp:Label>
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                                           <asp:TemplateField HeaderText=" " ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                                                         <a id="remove" runat="server" title="Click to remove record"  onclick="return confirm('Remove record?');" onserverclick="HtmlAnchor_Click"><i class="fa fa-trash"></i></a> 
                                        <asp:HiddenField ID="hfPropertyDocumentID" Value='<%# Eval("InspectionDocumentID") %>' runat="server" />

                  <asp:ImageButton ID="ImageButton1" runat="server" Visible="false" CommandArgument='<%# Eval("InspectionDocumentID") %>' CommandName="Remove" ImageUrl="~/img/Delete.gif" onclientclick="return confirm('Remove Document?');" ToolTip="Remove document" />
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                                      </Columns>
                                       <AlternatingRowStyle BackColor="#EFEFEF" />
                                          <HeaderStyle BackColor="#66C0C2" ForeColor="White" HorizontalAlign="Left" />
                 
                <RowStyle BackColor="White" HorizontalAlign="Left" />
                                      </asp:GridView>
                                  </td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td ><asp:SqlDataSource ID="sdsDocument" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="Select *
                                      , case when  [ContentType] like '%word%' or  [ContentType] like '%doc%' or [ContentType] like '%docx%'  then '~/images/doc/doc.png'
  when  [ContentType] like '%jpg%' or [ContentType] like '%jpeg%'   then '~/images/doc/jpg.png'
   when  [ContentType] like '%png%' then '~/images/doc/png.png'
  when  [ContentType] like '%pdf%'  then '~/images/doc/pdf.png'
  when  [ContentType] like '%zip%'  then '~/images/doc/zip.png'
  else '~/images/doc/unknown.png'
end as IconUrl
                                       from InspectionDocument
Where DocumentCategoryID = 2
and PropertyInspectionID = @InspectionID" DeleteCommand="Delete [dbo].[InspectionDocument] Where InspectionDocumentID = @InspectionDocumentID">
                                      <DeleteParameters>
                                          <asp:Parameter Name="InspectionDocumentID" />
                                      </DeleteParameters>
                                      <SelectParameters>
                                          <asp:SessionParameter Name="InspectionID" SessionField="InspectionID" />
                                      </SelectParameters>
                                      </asp:SqlDataSource></td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td >&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td >&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>