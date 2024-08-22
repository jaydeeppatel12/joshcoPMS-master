<%@ Page Title="" Language="C#" MasterPageFile="application/admin.Master" AutoEventWireup="true" CodeBehind="appFile.aspx.cs" Inherits="joshcoWA.appFile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <form id="form1" runat="server">
             <section class="site-section"  >
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px"  >

    <h2 class="mb-5">Application File Upload</h2>
      
                                      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="sdsDocument" GridLines="None" OnRowCommand="GridView2_RowCommand" ShowHeader="False" style="text-align: left; font-size: 10pt;" Width="100%"  OnRowDataBound="gvDoc_RowDataBound">
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
                                                                      <%# "Upload a copy of "+Eval("DocumentCategory") %>
                                                                  </td>
                                                                  <td align="left" style="border-bottom: 1px dotted #808080; width: 94px; height: 1px;" valign="Top">&nbsp;</td>
                                                                  <td align="left" style="border-bottom: 1px dotted #808080; width: 151px; height: 1px;" valign="Top">
                                                                      <asp:FileUpload ID="fuAppUpload"  runat="server" CssClass="price text-right" accept=".pdf" />
                                                                  </td>
                                                                  <td align="right" style="border-bottom: 1px dotted #808080; height: 1px;" valign="Top" width="20">
                                                                      <asp:Button ID="btnAppUpload" runat="server" CommandName="Upload" CommandArgument='<%# Eval("DocumentCategoryID") %>' CssClass="btn btn-primary" Font-Size="Medium"   Text="+ Upload" />
                                                                  </td>
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
                                                          <td style="border-bottom: 1px dotted #808080; width: 369px; height: 1px;" valign="Top">
                                                              <asp:LinkButton ID="lnkDocument" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ApplicationDocumentID") %>' CommandName="Download" Font-Underline="False" Text='<%# Eval("DocumentName") %>'></asp:LinkButton>
                                                          </td>
                                                          <td align="left" style="border-bottom: 1px dotted #808080; width: 94px; height: 1px;" valign="Top">
                                                              <asp:Label ID="Label13" runat="server" Text='<%# "Size: "+(Convert.ToInt32(Eval("Size"))/1024).ToString()+"KB" %>' Width="150px"></asp:Label>
                                                          </td>
                                                          <td align="left" style="border-bottom: 1px dotted #808080; width: 151px; height: 1px;" valign="Top">
                                                              <asp:Label ID="Label14" runat="server" Text='<%# "Doc type: "+ Eval("ContentType") %>' Visible="False"></asp:Label>
                                                          </td>
                                                          <td align="right" style="border-bottom: 1px dotted #808080; height: 1px;" valign="Top" width="20">
                                                              <a id="remove" runat="server" title="Click to remove record"  onclick="return confirm('Remove record?');" onserverclick="HtmlAnchorDeleteDoc_Click"><i class="fa fa-trash"></i></a> 
                                        <asp:HiddenField ID="hfApplicationDocumentID" Value='<%# Eval("ApplicationDocumentID") %>' runat="server" />

                                                              <asp:ImageButton ID="ImageButton1" runat="server"  CommandArgument='<%# Eval("ApplicationDocumentID") %>' Visible="false" CommandName="Remove" ImageUrl="~/images/Delete.gif" onclientclick="return confirm('Remove Document?');" ToolTip="Remove document" />
                                                          </td>
                                                      </tr>
                                                  </table>
                                                               </asp:Panel>

                                           
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                      <HeaderStyle BorderStyle="None" HorizontalAlign="Left" />
                                      <RowStyle HorizontalAlign="Left" />
                                      </asp:GridView>
                               
                            
        <br />
   <asp:SqlDataSource ID="sdsDocument" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationDocument" SelectCommandType="StoredProcedure" DeleteCommand="Delete [dbo].[ApplicationDocument] Where ApplicationDocumentID = @ApplicationDocumentID">
                                      <DeleteParameters>
                                          <asp:Parameter Name="ApplicationDocumentID" />
                                      </DeleteParameters>
                                      <SelectParameters>
                                          <asp:SessionParameter Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
                                      </SelectParameters>
                                      </asp:SqlDataSource>


                                 <asp:HiddenField ID="hfApplicationSuccessful" runat="server" />
                           <asp:SqlDataSource ID="sdsApplicationProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
                                           
                                      </SelectParameters>
                                      </asp:SqlDataSource>
     </div>
     </div>
     </div>
     </div>
             </section>
          </form>
</asp:Content>
