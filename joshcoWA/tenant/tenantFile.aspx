<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="tenantFile.aspx.cs" Inherits="joshcoWA.tenantFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <section class="site-section">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">

                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">

                                        <div class="card-body" >
                                        <h2 class="mb-5">Documents List</h2>

                                       <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" OnRowCommand="GridView_RowCommand" ShowHeader="False" style="text-align: left; font-size: 10pt;" Width="100%"  OnRowDataBound="gvDoc_RowDataBound">
                                      <Columns>
                                          <asp:TemplateField>
                                              <ItemTemplate>
                                                   <asp:Panel visible="false" ID="pnlUpload" runat="server">
                                                      <asp:Panel ID="pnlDoc0" runat="server" Visible='<%# Convert.ToBoolean( Eval("DocumentName") == DBNull.Value ?"True":"False") %>'>
                                                             <table  cellpadding="0" cellspacing="0" style=" width:100%;">
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
                                                  </asp:Panel>   
                                                  <asp:HiddenField ID="hfDocumentCategoryID" Value='<%# Eval("DocumentCategoryID") %>' runat="server" />
                                                   <asp:Panel ID="pnlView" runat="server">
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
                                                </asp:Panel>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                      <EmptyDataTemplate>
                                        <div align="center">No records found.</div>
                                      </EmptyDataTemplate>
                                      <HeaderStyle BorderStyle="None" HorizontalAlign="Left" />
                                      <RowStyle HorizontalAlign="Left" />
                                      </asp:GridView>

                                        <script type="text/javascript">

                                            function GetSelectedRow(lnk) {
                                                //Reference the GridView Row.
                                                var row = lnk.parentNode.parentNode;

                                                var grid1= document.getElementById("<%= GridView.ClientID %>");

                                                //Determine the Row Index.
                                                var message = ""; //"Row Index: " + (row.rowIndex - 1);
                                                //var rindex = $(lnk).title;
                                                for (j = 0; j < grid1.rows.length - 1; j++) {
                                                    var total = "GridView_hfRowID_" + j;
                                                    alert(document.getElementById(total).textContent)

                                                 } 
                                             

                                                //Read values from Cells.
                                                //message += "\nName: " + row.cells[1].innerHTML;

                                                //Reference the TextBox and read value.
                                                //message += "\nCountry: " + row.cells[2].getElementsByTagName("input")[0].value;

                                                //Display the data using JavaScript Alert Message Box.

                                                //var fileUpload = $(".fLoad").get(1);
                                                //// var fileUpload = row.cells[1].getElementsByTagName("fLoad");

                                                //var files = fileUpload.files;
                                                //var test = new FormData();
                                                //for (var i = 0; i < files.length; i++) {
                                                //    test.append(files[i].name, files[i]);
                                                //}
                                                //$.ajax({
                                                //    url: "UploadHandler.ashx",
                                                //    type: "POST",
                                                //    contentType: false,
                                                //    processData: false,
                                                //    data: test,
                                                //    // dataType: "json",
                                                //    success: function (result) {
                                                //        alert(result);
                                                //    },
                                                //    error: function (err) {
                                                //        alert(err.statusText);
                                                //    }
                                                //});
                                                // alert(message);

                                                return false;
                                            };
                                            </script>                                         

                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationDocument" SelectCommandType="StoredProcedure" DeleteCommand="Delete [dbo].[ApplicationDocument] Where ApplicationDocumentID = @ApplicationDocumentID">
                                      <DeleteParameters>
                                          <asp:Parameter Name="ApplicationDocumentID" />
                                      </DeleteParameters>
                                      <SelectParameters>
                                          <asp:SessionParameter Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
                                      </SelectParameters>
                                      </asp:SqlDataSource>
                                    </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
