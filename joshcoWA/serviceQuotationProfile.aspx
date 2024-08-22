<%@ Page Title="" Language="C#" MasterPageFile="application/admin.Master" AutoEventWireup="true" CodeBehind="serviceQuotationProfile.aspx.cs" Inherits="joshcoWA.serviceQuotationProfile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
.divWaiting{
   
position: absolute;
background-color: #FAFAFA;
z-index: 2147483647 !important;
opacity: 0.8;
overflow: hidden;
text-align: center; top: 0; left: 0;
height: 100%;
width: 100%;
padding-top:20%;
} 
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="js/vtab.js"></script> 
    <link rel="stylesheet" href="css/PopUp.css" />
   
         <section class="site-section"  >
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px"  >

    <h2>Invitation to Quote <asp:Label ID="lblCompanyName" runat="server" Text=""></asp:Label></h2>
       <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="~/quotationList.aspx" runat="server">Back</asp:HyperLink>
<div class="row">
     <div class="col-md-6 col-lg-4 order-md-1">
<div class="block-24 mb-5">
<h3 class="heading">Quotation Menu</h3>
<ul>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Home')">Home <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'ServiceProvider')">Invitations<span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Documents')">Documents <span></span></a></li>
 

</ul>
</div>
     </div>

    <div class="col">
 
    <div class="block-20 ">
        <div style="padding:15px">  
                     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
                                                         
                                          
            <div id="Home" class="tabcontent">
                 
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
                 <br />
          </div>

            <div id="ServiceProvider" class="tabcontent" style="display:none;">
                    <asp:UpdateProgress runat="server" id="PageUpdateProgress" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
               <div class="divWaiting">            
	<asp:Label ID="lblWait" runat="server" Text=" Please wait... " />
	<asp:Image ID="imgWait" runat="server"  ImageAlign="Middle" ImageUrl="~/images/loading.gif" />
  </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate> 
                          <table style="Width: 100%"  >
                               <tr>
                                  <td>
                                     <table >
                                          <tr>
                                              <td style="vertical-align:middle; ">
                                                  Add 
                                                     <asp:SqlDataSource ID="sdsServiceProvider" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [ServiceProvider] 
Where ServiceProviderID not in (Select ServiceProviderID from [dbo].[Quotation] Where InvitationToQuoteID = @InvitationToQuoteID)
ORDER BY [ServiceProviderName]">
                                                         <SelectParameters>
                                                             <asp:SessionParameter Name="InvitationToQuoteID" SessionField="InvitationToQuoteID" />
                                                         </SelectParameters>
                                                  </asp:SqlDataSource>
                                                  Service Provider
                                              </td>
                                               <td style="vertical-align:middle; ">
                                      
                                                   <asp:DropDownList ID="ddlServiceProvider" CssClass="btn-outline-warning btn-fw" runat="server" DataSourceID="sdsServiceProvider" DataTextField="ServiceProviderName" DataValueField="ServiceProviderID">
                                                   </asp:DropDownList><asp:SqlDataSource ID="sdsSP" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectServiceProviderProfile" SelectCommandType="StoredProcedure">
                                          <SelectParameters>
                                              <asp:ControlParameter ControlID="ddlServiceProvider" Name="ServiceProviderID" PropertyName="SelectedValue" Type="Int32" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                     
                                              </td>
                                              <td>
                                                  <asp:Button ID="Button2" CssClass="btn btn-primary" OnClick="lnkAddServiceProvider_Click" style=" vertical-align:bottom; float:right; padding:3px; font-size:12px;" runat="server" Text="Send Invitation" />
                                                  
                                      
                                              </td>
                                          </tr>
                                      </table>
                                   </td>
 
                              </tr>
                              <tr>
                                  <td style="  font-size: 12px; "">
                                      Please note an invitation to quote email will be sent to a service provider 
                                  </td>
                              </tr>
                              <tr>
                                  <td>&nbsp;
                                      <asp:SqlDataSource ID="sdsQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectQuotation" SelectCommandType="StoredProcedure" InsertCommand="InsertQuotation" InsertCommandType="StoredProcedure"  UpdateCommand="Update [dbo].[Quotation]
Set Awarded = @Awarded
, Note  = @Note
Where QuotationID = @QuotationID" >
                           
                                          
                           
                                          <InsertParameters>
                                              <asp:Parameter Name="InvitationToQuoteID" Type="Int32" />
                                              <asp:Parameter Name="ServiceProviderID" Type="Int32" />
                                          </InsertParameters>
                             <UpdateParameters>
                                    <asp:Parameter Name="Awarded" />
                                    <asp:Parameter Name="Note" />
                                    <asp:Parameter Name="QuotationID" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="InvitationToQuoteID" SessionField="InvitationToQuoteID" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource>
                     
                                      </td>
                                  </tr>
                              <tr>
                                  <td> 
   <asp:Panel ID="pnl" runat="server" Width="600px" ScrollBars="Horizontal">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt"  DataSourceID="sdsQuotation" CellPadding="2" CellSpacing="2" GridLines="None" Width="1200px" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                <asp:BoundField DataField="ServiceProviderName" HeaderText="Service Provider" />
                                <asp:TemplateField HeaderText="Quoted Amount (R)" ItemStyle-Width="130px">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtAmountQuoted" runat="server" Text ='<%# Eval("QuotedAmount") %>' CssClass="form-control py-2 " AutoPostBack="True" OnTextChanged="txtAmountQuoted_TextChanged"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Date Quote Received">
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
                         <asp:LinkButton ID="lnkStatus" runat="server" Text='<%# Eval("QuoteStatus") %>'></asp:LinkButton>
                                        <telerik:RadToolTip ID="rtpStatus" runat="server" HideEvent="ManualClose" TargetControlID="lnkStatus" Width="300px" ShowEvent="OnClick"  > 
                                       

                                    

                                      <asp:Panel ID="pnlStatus" runat="server" CssClass="modalPopup" Style="z-index:10; Width:300px " >
                                         

                                            
    <div id="hdlHeader" class="header">
        <asp:Label ID="lblLeaseDocHeader" runat="server" Text=""></asp:Label>Quote Review
    </div>
    <div class="body" style="padding:10px"> <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                              <ContentTemplate>
                                        <table class="nav-justified">
                                            <tr>
                                                <td>
                                                    <asp:DropDownList ID="ddlStatus" CssClass="btn-outline-warning btn-fw" runat="server" SelectedValue='<%# Eval("Awarded") %>'>
                                                        <asp:ListItem Value="">-- Select --</asp:ListItem>
                                                        <asp:ListItem Value="True">Awarded</asp:ListItem>
                                                        <asp:ListItem Value="False">Not Awarded</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtNote" runat="server" Height="60px" Text='<%# Eval("Note") %>' TextMode="MultiLine" Width="250px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnSave" runat="server" CommandArgument='<%# Eval("QuotationID") %>' CommandName="Save" Text="Save" />
                                                </td>
                                            </tr>
                                        </table>
                                                  </ContentTemplate>
                                        </asp:UpdatePanel>
    </div>
    <div class="footer" style="width:100%; align-content:center">
          
    </div>
                                                   
</asp:Panel>

                                            </telerik:RadToolTip>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                         <a id="remove" runat="server" title="Click to remove item"  onclick="return confirm('Remove item?');" onserverclick="HtmlAnchor_Click"><i class="fa fa-trash"></i></a> 
                                        <asp:HiddenField ID="hfQuotationID" Value='<%# Eval("QuotationID") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#66C0C2" ForeColor="White" />
                         
                            <RowStyle HorizontalAlign="Left" />
                         
                            </asp:GridView>
       </asp:Panel>

                            <asp:SqlDataSource ID="sdsQuotationStatusUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="Select ''" DeleteCommand="DELETE FROM Quotation WHERE (QuotationID = @QuotationID)" UpdateCommand="Update [dbo].[Quotation]
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
                                      </asp:SqlDataSource>
                     
                                      </td>
 
                              </tr>
                              </table>

                                            </ContentTemplate>
                                </asp:UpdatePanel>  
          
            </div>

            <div id="Documents" class="tabcontent" style="display:none;">
                SharePoint documents coming soon...
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

