<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmApplicantDocument.ascx.cs" Inherits="joshcoWA.applicant.frmApplicantDocument" %>
 
 <table id="tblEditDialogfrmApplicantFinish" class="ui-widget-content" style="width:95%">
                         <tr>
                            <td class="formTextTD">
                                <strong>SUPPORTING DOCUMENTS (PDF)</strong></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            
                        </tr>
                       
                        <tr>
                            <td>       
                                 <asp:GridView ID="gvDocument" runat="server" ShowFooter="true" AutoGenerateColumns="False" DataSourceID="sdsDocument" GridLines="None" OnRowCommand="GridView2_RowCommand" ShowHeader="False" style="text-align: left; font-size: 10pt;" Width="100%"  OnRowDataBound="gvDoc_RowDataBound">
                                      <Columns>
                                          <asp:TemplateField>
                                              <ItemTemplate> 
                                              
                                                  <asp:Panel ID="pnlUpload" runat="server">
                                                      <asp:Panel ID="pnlDoc0" runat="server" Visible='<%# Convert.ToBoolean( Eval("DocumentName") == DBNull.Value ?"True":"False") %>'>
                                                             <table cellpadding="0" cellspacing="0" style=" width:100%;">
                                                              <tr>
                                                                  <td style="width: 50px; text-align: center" valign="top">
                                                                      <asp:Image ID="Image2" runat="server" Height="35px" ImageUrl='<%# Eval("IconUrl") %>' />
                                                                  </td>
                                                                  <td style="border-bottom: 1px dotted #808080; width: 369px; height: 1px;" valign="Top">
                                                                      <%# "Upload a copy of "+Eval("DocumentCategory") %> <asp:Label ID="lblRequired" runat="server" Visible='<%# Convert.ToBoolean(Eval("Required")) %>' BackColor="#FFFF99" Font-Size="8pt"  ForeColor="Red" Text="*Required"></asp:Label>
                                                                  </td>
                                                                  <td align="left" style="border-bottom: 1px dotted #808080; width: 94px; height: 1px;" valign="Top">&nbsp;</td>
                                                                  <td align="left" style="border-bottom: 1px dotted #808080; width: 151px; height: 1px;" valign="Top">
                                                                      <asp:LinkButton ID="lnkDocumentName" runat="server"  Visible="false" CommandName="Download" Width="350px" ></asp:LinkButton>
                                                                      <asp:FileUpload ID="fuAppUpload"  runat="server" CssClass="btn btn-warning" accept=".pdf" />
                                                                      <asp:HiddenField ID="hfUploadDocumentCategoryID" runat="server" />
                                                                      <asp:HiddenField ID="hfUploadname" runat="server" />
                                                                      <asp:HiddenField ID="hfUploadcontentType" runat="server" />
                                                                      <asp:HiddenField ID="hfUploadsize" runat="server" />
                                                                       <asp:HiddenField ID="hfUploadfileData" runat="server" />
                                                                    
                                                                  </td>
                                                                  <td align="right" style="border-bottom: 1px dotted #808080; height: 1px;" valign="Top" width="20">
                                                                       <asp:LinkButton ID="lnkDeleteDoc"  runat="server" Visible="false" CommandName="Remove" ><i class="fa fa-trash"></i>&nbsp;Remove</asp:LinkButton>
                                                                       
                                                                     <asp:Button ID="btnAppUpload" Visible="false"  runat="server" CommandName="Upload" style="font-size:small;" CommandArgument='<%# Eval("DocumentCategoryID") %>' CssClass="btn btn-warning"    Text="+ Upload" /></td>
                                                                <td>
                                                                    <%--<input type="file" id="FileUpload1" class="price text-right" />
                                                                <input type="button" id="btnUpload" value="Upload Files" class="price text-right" title='<%# Eval("DocumentCategoryID") %>'/>--%>
                                                                </td>

                                                                  
                                                              </tr>
                                                          </table>
                                                      </asp:Panel>
                                                  </asp:Panel>   <asp:HiddenField ID="hfDocumentCategoryID" Value='<%# Eval("DocumentCategoryID") %>' runat="server" />
                                                   <asp:Panel ID="pnlDoc" runat="server" Visible='<%# Convert.ToBoolean( Eval("DocumentName") == DBNull.Value?"False":"True") %>'>

                                          
                                                  <table cellpadding="0" cellspacing="0" style=" width:100%;">
                                                      <tr>
                                                          <td style="width: 50px; text-align: center" valign="top">
                                                              <asp:Image ID="Image1" Height="35px" runat="server" ImageUrl='<%# Eval("IconUrl") %>' />
                                                            
                                                          </td>
                                                          <td style="border-bottom: 1px dotted #808080; width: 300px; height: 1px;" valign="Top">
                                                              <asp:LinkButton ID="lnkDocument" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ApplicantDocumentID") %>' CommandName="Download" Font-Underline="False" Text='<%# Eval("DocumentName") %>'></asp:LinkButton>
                                                          </td>
                                                           <td align="left" style="border-bottom: 1px dotted #808080; width: 300px; height: 1px;" valign="Top">
                                                              <asp:Label ID="Label14" runat="server" Text='<%#  Eval("DocumentCategory") %>' ></asp:Label>
                                                          </td>
                                                          <td align="left" style="border-bottom: 1px dotted #808080; width: 94px; height: 1px;" valign="Top">
                                                              <asp:Label ID="Label13" runat="server" Text='<%# "Size: "+(Convert.ToInt32(Eval("Size"))/1024).ToString()+"KB" %>' Width="150px"></asp:Label>
                                                          </td>
                                                         
                                                          <td align="right" style="border-bottom: 1px dotted #808080; height: 1px;" valign="Top" width="20">
                                                              <a id="remove" runat="server" title="Click to remove record"  onclick="return confirm('Remove record?');" onserverclick="HtmlAnchorDeleteDoc_Click"><i class="fa fa-trash"></i></a> 
                                                          <asp:HiddenField ID="hfApplicantDocumentID" Value='<%# Eval("ApplicantDocumentID") %>' runat="server" />

                                                          <asp:ImageButton ID="ImageButton1" runat="server"  CommandArgument='<%# Eval("ApplicantDocumentID") %>' Visible="false" CommandName="Remove" ImageUrl="~/images/Delete.gif" onclientclick="return confirm('Remove Document?');" ToolTip="Remove document" />
                                                          </td>
                                                      </tr>
                                                  </table>
                                                               </asp:Panel>

                                           
                                              </ItemTemplate>
                                              <FooterTemplate>
                                                  <div style="width:100%; text-align:center;"> <asp:Button ID="btnAppUploadAll"  runat="server" CommandName="UploadAll" style="font-size:small;"   CssClass="btn btn-warning"    Text="+ Upload" /></div>
                                              </FooterTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                      <HeaderStyle BorderStyle="None" HorizontalAlign="Left" />
                                      <RowStyle HorizontalAlign="Left" />
                                      </asp:GridView>
                                 <asp:HiddenField ID="hfApplicantID" runat="server" Value="0" />

                                   <asp:SqlDataSource ID="sdsDocument" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicantDocument" SelectCommandType="StoredProcedure" DeleteCommand="Delete [dbo].[ApplicantDocument] Where ApplicantDocumentID = @ApplicantDocumentID">
                                      <DeleteParameters>
                                          <asp:Parameter Name="ApplicantDocumentID" />
                                      </DeleteParameters>
                                      <SelectParameters>
                                          <asp:ControlParameter ControlID="hfApplicantID" DefaultValue="0" Name="ApplicantID" PropertyName="Value" Type="Int32" />
                                      </SelectParameters>
                                      </asp:SqlDataSource>

                                                                 <asp:HiddenField ID="hfApplicantSuccessful" runat="server" />
                           <asp:SqlDataSource ID="sdsApplicantProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicantProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="ApplicantID" SessionField="ApplicantID" Type="Int32" />
                                           
                                      </SelectParameters>
                                      </asp:SqlDataSource>


                            </td>
                        </tr>
                        <tr>
                            <td> 
                               
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                       
                    </table>


                 
