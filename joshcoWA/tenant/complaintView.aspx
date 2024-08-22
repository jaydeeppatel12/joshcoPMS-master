<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="complaintView.aspx.cs" Inherits="joshcoWA.tenant.complaintView" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .rbl input[type="radio"] {
            margin-left: 20px;            
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="site-section">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
        <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">
                            <table style="width:100%">
                                <tr>
                                    <td style="vertical-align:top; width:75%">
                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
<h2>Complaint Details</h2> 
      <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="tenantComplaintList.aspx" Font-Underline="false" runat="server">&nbsp;Back</asp:HyperLink>
    <div class="block-20 ">
        <div style="padding:15px">
            <%--WHERE (([EndDate] &gt;= GetDate()) AND ([FacilityManagementStatusID] &lt;&gt; 3))--%> 

             <table style="padding-bottom:10px; width100%: ;"><tr> <td style="width: 20%"> Reference No</td><td style="padding-bottom:8px">
                  <asp:Label ID="lblReferenceNo" runat="server" ForeColor="#333333"></asp:Label>
                                         </td><td style="padding-bottom:8px" class="auto-style1">&nbsp;</td></tr>
                      <tr> <td style="width: 20%"> Category</td><td style="padding-bottom:8px">
                  <asp:Label ID="lblQueryItem" runat="server" ForeColor="#333333"></asp:Label>
                                         </td><td style="padding-bottom:8px" class="auto-style1">&nbsp;</td></tr>
                      <tr> <td style="width: 20%"> Sub Category</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblComplaintSubCategory" runat="server" ForeColor="#333333"></asp:Label>
                                         </td><td style="padding-bottom:8px" class="auto-style1">&nbsp;</td></tr>
                      <tr> <td style="width: 20%;"> Tenant</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblTenant" runat="server" ForeColor="#333333"></asp:Label>
                          </td><td style="padding-bottom:8px" class="auto-style1">&nbsp;</td></tr>
                      <tr> <td style="width: 20%;"> Project</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblProperty" runat="server" ForeColor="#333333"></asp:Label>
                          </td><td style="padding-bottom:8px" class="auto-style1">&nbsp;</td></tr>
                      <tr> <td style="width: 20%;"> Unit Number</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblPropertyUnit" runat="server" ForeColor="#333333"></asp:Label>
                          </td><td style="padding-bottom:8px" class="auto-style1">&nbsp;</td></tr>
                      <tr> <td style="width: 20%;"> Complaint Description</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblQueryDescription" runat="server" ForeColor="#333333"></asp:Label>
                          </td><td style="padding-bottom:8px" class="auto-style1">&nbsp;</td></tr>
                      <tr> <td style="width:20%"> Severity</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblSeverity" runat="server" ForeColor="#333333"></asp:Label>
                          </td><td style="padding-bottom:8px">&nbsp;</td></tr>
                      

                      <tr> <td style="width:20%; "> Images</td><td style="padding-bottom:8px; vertical-align:top">
                                  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" EmptyDataText="No documents uploaded" DataSourceID="sdsDocument" GridLines="None" OnRowCommand="GridView2_RowCommand" ShowHeader="False" style="text-align: left; font-size: 10pt;" Width="100%">
                                      <Columns>
                                          <asp:TemplateField>
                                              <ItemTemplate>
 
                                                  <table cellpadding="0" cellspacing="0" style=" width:100%;">
                                                      <tr>
                                                          <td style="width: 77px; text-align: center" valign="top">
                                                              <asp:Image ID="Image1" Height="27px" runat="server" ImageUrl='~/images/doc/jpg.png' />
                                                            
                                                          </td>
                                                          <td style="border-bottom: 1px dotted #808080; width: 369px; height: 1px;" valign="Top">
                                                              <asp:LinkButton ID="lnkDocument" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ComplaintDocumentID") %>' CommandName="Download" Font-Underline="False" Text='<%# Eval("DocumentName") %>'></asp:LinkButton>
                                                          </td>
                                                          <td align="left" style="border-bottom: 1px dotted #808080;  height: 1px;" valign="Top">
                                                              <asp:Label ID="Label13" runat="server" Text='<%# Eval("DocumentName") %>' ></asp:Label>
                                                          </td>
                                                        <%--  <td align="left" style="border-bottom: 1px dotted #808080; width: 151px; height: 1px;" valign="Top">
                                                              <asp:Label ID="Label14" runat="server" Text='<%# "Doc type: "+ Eval("ContentType")+" - Size: "+(Convert.ToInt32(Eval("Size"))/1024).ToString()+"KB" %>' Visible="False"></asp:Label>
                                                          </td>--%>
                                                          <td align="right" style="border-bottom: 1px dotted #808080; height: 1px;" valign="Top" width="20">
                                                             <%-- <a id="remove" runat="server" title="Click to remove record"  onclick="return confirm('Remove record?');" onserverclick="HtmlAnchorDeleteDoc_Click"><i class="fa fa-trash"></i></a> --%>
                                        <asp:HiddenField ID="hfApplicationDocumentID" Value='<%# Eval("ComplaintDocumentID") %>' runat="server" />

                                                              <asp:ImageButton ID="ImageButton1" runat="server" Visible="false" CommandArgument='<%# Eval("ComplaintDocumentID") %>' CommandName="Remove" ImageUrl="~/img/Delete.gif" onclientclick="return confirm('Remove Document?');" ToolTip="Remove document" />
                                                          </td>
                                                      </tr>
                                                  </table>
                                                
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                      <HeaderStyle BorderStyle="None" HorizontalAlign="Left" />
                                      <RowStyle HorizontalAlign="Left" />
                                      </asp:GridView>
        <asp:SqlDataSource ID="sdsDocument" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectComplaintDocument" SelectCommandType="StoredProcedure" >
                                    
                                      <SelectParameters>
                                          <asp:QueryStringParameter Name="ComplaintID" QueryStringField="ID" Type="Int32" />
 
                                      </SelectParameters>
                                      </asp:SqlDataSource>

                                                             </td><td style="padding-bottom:8px">&nbsp;</td></tr>
                      

                      <tr> <td style="width:20%; "> &nbsp;</td><td style="padding-bottom:8px; vertical-align:top">
                            &nbsp;</td><td style="padding-bottom:8px">&nbsp;</td></tr>
                      

                      </table> 
               <div style="padding:15px;" class="alert alert-success mt-4 d-flex align-items-center">
            <table style="Width: 100%">
                <tr><td>
            <h3 class="heading">Comment</h3>
                    </td></tr>
                 <tr><td>

            <div style="padding: 15px">
                                            <div class="form-row">
                                                <div class="col-10">
                                                    <textarea runat="server" id="txtComment" rows="2" class="form-control"> </textarea>
                                                </div>
                                                <div class="col">
                                                    <asp:Button ID="btnSave" CssClass="btn btn-warning" runat="server" Text="Add Comment" OnClick="btnSave_Click" ValidationGroup="AddP" />

                                                </div>
                                            </div>
                                           
                                        </div>
                                        <br />
                                               <asp:GridView ID="gvComments" runat="server" AutoGenerateColumns="False" DataKeyNames="ComplaintID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left">
                                                <AlternatingRowStyle BackColor="#f0f0f0" />
                                                <Columns>
                                                    <asp:BoundField DataField="CommentFrom"
                                                        SortExpression="CommentFrom" HeaderText="From" />
                                                    <asp:BoundField DataField="Comment"
                                                        SortExpression="Comment" HeaderText="Comment(s)" />
                                                    <asp:BoundField DataField="DateAdded"
                                                        SortExpression="DateAdded" HeaderText="Date logged" />

                                                </Columns>
                                                <HeaderStyle CssClass="gvHeader" ForeColor="#005d63" />

                                                <RowStyle HorizontalAlign="Left" BackColor="White" />

                                            </asp:GridView>
                     </td>
                     </tr>
                </table>
                        </div>

</div>

</div>
         <br />
        </div>

   </div>
                                </div>

                            </div>
                      </td>
                                        <td style="vertical-align:top;">&nbsp;</td>
                                    <td style="vertical-align:top;">
                                  <div class="col-lg-12 grid-margin stretch-card" style="width:200px; float:right;">
                                    <div class="card">
                                        <div class="card-body">
                                          <table style="width:100%;">
                        <tr>
                            <td style="vertical-align: top;  padding:5px;">
                                      <h4 class="heading"> Complaint Status</h4>
                                      
                                   </td></tr> 
                                 <tr>
                            <td style="vertical-align: top;  padding:5px;">
                                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                      
                                   </td>

                        </tr>
                                 <tr><td style="vertical-align: top;  padding:5px;">&nbsp;</td></tr>

                                       <tr><td style="vertical-align: top;">
                                               <asp:Panel ID="pnlRating" runat="server" Visible="false" Width="200px">                   
                                        <table style="width:100%;">
                        <tr>
                            <td style="vertical-align: top;  padding:5px;">
                                       <h4 class="heading">Rate Service</h4>
                                      
                                   </td>
                        </tr>
                                             <tr>
                            <td style="vertical-align: top;  padding:5px;">
                                <asp:RadioButtonList ID="rblRating" runat="server" OnSelectedIndexChanged="rblRating_SelectedIndexChanged" CssClass="rbl"  AutoPostBack="True">
                                    <asp:ListItem>Excellent</asp:ListItem>
                                    <asp:ListItem>Very Good</asp:ListItem>
                                    <asp:ListItem>Good</asp:ListItem>
                                    <asp:ListItem>Weak</asp:ListItem>
                                    <asp:ListItem>Unacceptable</asp:ListItem>
                                </asp:RadioButtonList>
                                      
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT ''" UpdateCommand="Update [dbo].[Complaint]
Set Rating= @Rating
Where ComplaintID= @ComplaintID">
                                       <UpdateParameters>
                                           <asp:Parameter Name="Rating" />
                                           <asp:Parameter Name="ComplaintID" />
                                       </UpdateParameters>
                                </asp:SqlDataSource>
                                      
                                   </td>
                        </tr>
                    </table>
</asp:Panel>

                                           </td></tr>
                             </table>

                           </div></div>
                                   
                                        </div>
                           </td>
                                </tr>
                            </table>
                                
                                
                                
                                  </div>
                    </div>
                </div>
            </div>
        </div>
            </div>
    </section>
</asp:Content>