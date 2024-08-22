<%@ Page Title="" Language="C#" MasterPageFile="ServiceProvider.Master" AutoEventWireup="true" CodeBehind="serviceProviderQuotationView.aspx.cs" Inherits="joshcoWA.serviceProviderQuotationView" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
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
                                        <div class="card-body">
<h2>Invitation To Quote Details</h2>   
      <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="serviceProviderQuotation.aspx" runat="server">Back</asp:HyperLink>
    <div class="block-20 ">
        <div style="padding:15px">
    
          <table  >
                               <tr>
                                  <td style="width: 171px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">
                                      Reference No.</td>
                                  <td>
                                      <asp:Label ID="lblReferenceNo" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">
                                      Title</td>
                                  <td>
                                      <asp:Label ID="lblTitle" Font-Bold="true" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">
                                      Property</td>
                                  <td>
                                      <asp:Label ID="lblProperty" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">
                                      Due Date</td>
                                  <td><asp:Label ID="lblDueDate" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td >
                                      Work Description</td>
                                  <td  ><asp:Label ID="lblWorkDescription"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 200px"  >
                                      Briefing Meeting Required</td>
                                  <td ><asp:Label ID="lblBriefingMeeting"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td  >
                                      <asp:Label ID="lblMeetingDateH" runat="server" Visible="False">Meeting Date</asp:Label>
                                  </td>
                                  <td ><asp:Label ID="lblMeetingDate"  Font-Bold="True" runat="server" Visible="False"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td  >
                                      <asp:Label ID="lblMeetingVenueH" runat="server" Visible="False">Meeting Venue</asp:Label>
                                  </td>
                                  <td ><asp:Label ID="lblMeetingVenue"  Font-Bold="True" runat="server" Visible="False"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td >
                                      Contact Person</td>
                                  <td  ><asp:Label ID="lblContactPerson"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td  >
                                      Contact Email</td>
                                  <td ><asp:Label ID="lblContactEmail"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td >
                                      Telephone</td>
                                  <td  ><asp:Label ID="lblTelephone"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 171px"><asp:SqlDataSource ID="sdsQuotationProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectInvitationToQuote" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:Parameter DefaultValue="0" Name="PropertyID" Type="Int32" />
                                          <asp:SessionParameter Name="InvitationToQuoteID" SessionField="InvitationToQuoteID" Type="Int32" DefaultValue="" />
                                           
                                      </SelectParameters>
                                      </asp:SqlDataSource>
                                       <asp:HiddenField ID="hfWorkOrderID" runat="server" />

                                  </td>
                                  <td>
                                      
                                  </td>
                              </tr>
                              </table>
        

</div>
         <br />
        </div>
    
               <div class="block-20 ">
                 <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
             
              <table style="Width: 100%"  >
                  <tr>
                      <td>
<h3 class="heading">Quotation</h3>
                      </td>

                  </tr>
                               <tr>
                                  <td>
            
          
 
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt"  DataSourceID="sdsQuotationStatusUpdate" CellPadding="2" CellSpacing="2" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                <asp:BoundField DataField="ServiceProviderName" HeaderText="Service Provider" />
                                <asp:TemplateField HeaderText="Quoted Amount (R)" ItemStyle-Width="130px">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtAmountQuoted" runat="server" Text ='<%# Eval("QuotedAmount") %>' CssClass="form-control py-2 " AutoPostBack="True" OnTextChanged="txtAmountQuoted_TextChanged"></asp:TextBox>
                                          <asp:HiddenField ID="hfQuotationID" Value='<%# Eval("QuotationID") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField Visible="false" HeaderText="Date Quote Received">
                                    <ItemTemplate>
                                        <telerik:RadDateTimePicker ID="rdpDateQuoteSubmitted" AutoPostBackControl="Both" OnSelectedDateChanged="rdpDateQuoteSubmitted_SelectedDateChanged"  Runat="server" >
                                        </telerik:RadDateTimePicker>
                                         <asp:HiddenField ID="hfDateQuoteSubmitted"  Value='<%# Eval("DateQuoteSubmitted") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Quotation">
                                    <ItemTemplate>
                                        <asp:Panel ID="pnlDownload" Visible='<%# Convert.ToBoolean(Eval("QuoteDownload")) %>' runat="server">
                                            <table>
                                                <tr>
                                                    <td style="vertical-align:top"><asp:LinkButton ID="lnkDownloadQuote" CausesValidation="false" CommandName="Download" CommandArgument='<%# Eval("QuotationID") %>'  runat="server">Download</asp:LinkButton></td>
                                                       <td style="vertical-align:top"><asp:ImageButton ID="ImageButton2" ToolTip="Delete document" OnClientClick="return confirm('Delete quotation document?');"   runat="server" CausesValidation="false" CommandName="RemoveQuote" CommandArgument='<%# Eval("QuotationID") %>' ImageUrl="~/images/delete.png" /></td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlUpload" Visible='<%# Convert.ToBoolean(Eval("QuoteUpload")) %>' runat="server">
                                            
                                            <table style="width: 100px">
                                                <tr>
                                                    <td>
                                                        <asp:FileUpload ID="flQuotation" runat="server" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="flQuotation" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="Upload"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnUpload" CausesValidation="false"  CommandName="Upload" CommandArgument='<%# Eval("QuotationID") %>' runat="server" Text="Upload" />
                                                    </td>
                                                </tr>
                                            </table>
                                            
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>

                         <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("QuoteStatus") %>'></asp:Label>
                                
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                      <%--   <a id="remove" runat="server" title="Click to remove item"  onclick="return confirm('Remove item?');" onserverclick="HtmlAnchor_Click"><i class="fa fa-trash"></i></a> --%>
                                      
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />                        
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                            </asp:GridView>
                          

   

                            <asp:SqlDataSource ID="sdsQuotationStatusUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectServiceProviderQuotation" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM Quotation WHERE (QuotationID = @QuotationID)" UpdateCommand="Update [dbo].[Quotation]
Set QuotedAmount = @QuotedAmount
, DateQuoteSubmitted  = @DateQuoteSubmitted
Where QuotationID = @QuotationID" >
                           
                                <DeleteParameters>
                                    <asp:Parameter Name="QuotationID" />
                                </DeleteParameters>
                           
                                <UpdateParameters>
                                    <asp:Parameter Name="QuotedAmount" />
                                    <asp:Parameter Name="DateQuoteSubmitted" />
                                    <asp:Parameter Name="QuotationID" />
                                </UpdateParameters>
                                   <SelectParameters>
                                    <asp:SessionParameter Name="ServiceProviderID" SessionField="ServiceProviderID" Type="Int32" />
                                        <asp:SessionParameter Name="InvitationToQuoteID" SessionField="InvitationToQuoteID" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource>

                                      </td>
                                   </tr>
                  </table>
              
             </div>
        <br />
   
     </div>

                                <br /><br /><br />

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
