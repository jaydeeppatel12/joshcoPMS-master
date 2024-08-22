<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="queryView.aspx.cs" Inherits="joshcoWA.queryView" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="../quotation/addQuotation.ascx" TagPrefix="uc1" TagName="addQuotation" %>
<%@ Register Src="../workorder/addWorkOrder.ascx" TagPrefix="uc1" TagName="addWorkOrder" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../css/PopUp.css" />

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
    <section class="site-section">
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
<h2>Query Details</h2><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
      <asp:Image ID="imgback" ImageUrl="../images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="queryList.aspx" runat="server">Back</asp:HyperLink>
    <div class="block-20 ">
        <div style="padding:15px; width:100%;">
            <%--WHERE (([EndDate] &gt;= GetDate()) AND ([FacilityManagementStatusID] &lt;&gt; 3))--%> 
           
                         <table style="padding-bottom:10px; width:100%;"><tr> <td style="width: 20%"> Reference No</td><td style="padding-bottom:8px">
                  <asp:Label ID="lblReferenceNo" runat="server" ForeColor="#333333"></asp:Label>
                                         </td><td style="padding-bottom:8px; vertical-align:top;" class="auto-style1" rowspan="8">
                                             


                                              </td></tr>
                      <tr> <td style="width: 20%"> Category</td><td style="padding-bottom:8px">
                  <asp:Label ID="lblQueryItem" runat="server" ForeColor="#333333"></asp:Label>
                                         </td></tr>
                      <tr> <td style="width: 20%;"> Tenant</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblTenant" runat="server" ForeColor="#333333"></asp:Label>
                          </td></tr>
                      <tr> <td style="width: 20%;"> Project</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblProperty" runat="server" ForeColor="#333333"></asp:Label>
                          </td></tr>
                      <tr> <td style="width: 20%;"> Unit Number</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblPropertyUnit" runat="server" ForeColor="#333333"></asp:Label>
                          </td></tr>
                      <tr> <td style="width: 20%;"> Query Description</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblQueryDescription" runat="server" ForeColor="#333333"></asp:Label>
                          </td></tr>
                      <tr> <td style="width:20%"> Severity</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblSeverity" runat="server" ForeColor="#333333"></asp:Label>
                          </td></tr>
<tr> <td style="width:20%"> Status</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblStatus" runat="server" ForeColor="#333333"></asp:Label>
                          </td></tr>                      

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
                                                              <asp:LinkButton ID="lnkDocument" runat="server" CausesValidation="False" CommandArgument='<%# Eval("QueryDocumentID") %>' CommandName="Download" Font-Underline="False" Text='<%# Eval("DocumentName") %>'></asp:LinkButton>
                                                          </td>
                                                          <td align="left" style="border-bottom: 1px dotted #808080;  height: 1px;" valign="Top">
                                                              <asp:Label ID="Label13" runat="server" Text='<%# Eval("DocumentName") %>' ></asp:Label>
                                                          </td>
                                                        <%--  <td align="left" style="border-bottom: 1px dotted #808080; width: 151px; height: 1px;" valign="Top">
                                                              <asp:Label ID="Label14" runat="server" Text='<%# "Doc type: "+ Eval("ContentType")+" - Size: "+(Convert.ToInt32(Eval("Size"))/1024).ToString()+"KB" %>' Visible="False"></asp:Label>
                                                          </td>--%>
                                                          <td align="right" style="border-bottom: 1px dotted #808080; height: 1px;" valign="Top" width="20">
                                                             <%-- <a id="remove" runat="server" title="Click to remove record"  onclick="return confirm('Remove record?');" onserverclick="HtmlAnchorDeleteDoc_Click"><i class="fa fa-trash"></i></a> --%>
                                        <asp:HiddenField ID="hfApplicationDocumentID" Value='<%# Eval("QueryDocumentID") %>' runat="server" />

                                                              <asp:ImageButton ID="ImageButton1" runat="server" Visible="false" CommandArgument='<%# Eval("QueryDocumentID") %>' CommandName="Remove" ImageUrl="~/img/Delete.gif" onclientclick="return confirm('Remove Document?');" ToolTip="Remove document" />
                                                          </td>
                                                      </tr>
                                                  </table>
                                                
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                      <HeaderStyle BorderStyle="None" HorizontalAlign="Left" />
                                      <RowStyle HorizontalAlign="Left" />
                                      </asp:GridView>
        <asp:SqlDataSource ID="sdsDocument" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectQueryDocument" SelectCommandType="StoredProcedure" >
                                    
                                      <SelectParameters>
                                          <asp:QueryStringParameter Name="QueryID" QueryStringField="ID" Type="Int32" />
 
                                      </SelectParameters>
                                      </asp:SqlDataSource>

                                    <asp:SqlDataSource ID="sdsWorkOrder" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT FacilityManagementID, [RefNumber], [StartDate], [EndDate] 
, isnull([RefNumber],'')+' --- ('+convert(varchar, [StartDate], 106)+' - '+convert(varchar, [EndDate] , 106)+')' as WorkOrder
FROM [FacilityManagement] ">
                                    </asp:SqlDataSource>
                                    <asp:HiddenField ID="hfFacilityManagementID" runat="server" />

                                                             </td><td style="padding-bottom:8px">&nbsp;</td></tr>
                      

                      <tr> <td style="width:20%; "> &nbsp;</td><td style="padding-bottom:8px; vertical-align:top">
                            &nbsp;</td><td style="padding-bottom:8px">&nbsp;</td></tr>
                      

                      </table> 
                    
 
         <br />
        </div>
    
               <div class="block-20 ">
                        <asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="0" Y="0"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         
<div class="form-wrap"  style="width:800px; padding:15px; margin-top:50px; "  >
 
    <div class="block-20;">
    <h3 id="hdlLeaseHeader" class="heading"><asp:Label ID="lblPopHeader" runat="server" Text=""></asp:Label>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
   <uc1:addQuotation runat="server" id="addQuotation" Visible="false" />
        <uc1:addWorkOrder runat="server" id="addWorkOrder" Visible="false" />
        </div>
    </div>
                                                   
</asp:Panel>
        <div style="padding:15px;" class="alert alert-success mt-4 d-flex align-items-center">
            <table style="Width: 100%">
                <tr><td>
            <h3 class="heading">Quotation</h3>
                    </td></tr>
                 <tr><td>
       

                       <asp:UpdateProgress runat="server" id="PageUpdateProgress" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
               <div class="divWaiting">            
	<asp:Label ID="lblWait" runat="server" Text=" Please wait... " />
	<asp:Image ID="imgWait" runat="server"  ImageAlign="Middle" ImageUrl="~/images/loading.gif" />
  </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
                             <asp:Panel ID="pnlInvitationToQuote" runat="server">
                                            <asp:Button ID="btnInvitation" CssClass="btn btn-warning" OnClick="btnInvitation_Click" style=" vertical-align:bottom; float:right; " runat="server" Text="Add Invitation" />
                                            </asp:Panel> 
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">                                    
                                    <ContentTemplate>
                                        

                                        <asp:Panel ID="pnlQuotation" runat="server" Visible="false" style="Width: 100%">
                          <table style="Width: 100%"  >
                               <tr>
                                  <td>
                                     <table style="Width: 100%">
                                          <tr>
                                              <td style="vertical-align:middle; ">
                                                  Add 
                                                     <asp:SqlDataSource ID="sdsServiceProvider" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [ServiceProvider] 
Where ServiceProviderID not in (Select ServiceProviderID from [dbo].[Quotation] Where InvitationToQuoteID = @InvitationToQuoteID)
ORDER BY [BusinessName]">
                                                         <SelectParameters>
                                                             <asp:ControlParameter ControlID="hfInvitationToQuoteID" DefaultValue="" Name="InvitationToQuoteID" PropertyName="Value" />
                                                         </SelectParameters>
                                                  </asp:SqlDataSource>
                                                  Service Provider
                                              </td>
                                               <td style="vertical-align:middle; ">
                                      
                                                   <asp:DropDownList ID="ddlServiceProvider" CssClass="btn-outline-warning btn-fw" runat="server" DataSourceID="sdsServiceProvider" DataTextField="BusinessName" DataValueField="ServiceProviderID">
                                                   </asp:DropDownList><asp:SqlDataSource ID="sdsSP" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectServiceProviderProfile" SelectCommandType="StoredProcedure">
                                          <SelectParameters>
                                              <asp:ControlParameter ControlID="ddlServiceProvider" Name="ServiceProviderID" PropertyName="SelectedValue" Type="Int32" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                     
                                              </td>
                                              <td>
                                                  <asp:Button ID="Button2" CssClass="btn btn-warning" OnClick="lnkAddServiceProvider_Click" style=" vertical-align:bottom; float:right; " runat="server" Text="Send Invitation" />
                                                  
                                      
                                                  <asp:HiddenField ID="hfInvitationToQuoteID" runat="server" />
                                                  <asp:HiddenField ID="hfQuoteTitle" runat="server" />
                                                  <asp:HiddenField ID="hfQuoteDueDate" runat="server" />
                                                  <asp:HiddenField ID="hfQuoteWorkDescription" runat="server" />
                                                  <asp:HiddenField ID="hfQuoteMeetingDate" runat="server" />
                                                  <asp:HiddenField ID="hfQuoteMeetingVenue" runat="server" />
                                                  <asp:HiddenField ID="hfQuoteContactPerson" runat="server" />
                                                  <asp:HiddenField ID="hfQuoteContactEmail" runat="server" />
                                                  <asp:HiddenField ID="hfQuoteContactTelephone" runat="server" />
                                                  <asp:HiddenField ID="hfQuoteReferenceNumber" runat="server" />
                                                  
                                      
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
                                    <asp:ControlParameter ControlID="hfInvitationToQuoteID" Name="InvitationToQuoteID" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource>
                     
                                      </td>
                                  </tr>
                              <tr>
                                  <td> 
 
                        <asp:GridView ID="gvQuotation" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt"  DataSourceID="sdsQuotation" CellPadding="2" CellSpacing="2" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                <asp:BoundField DataField="ServiceProviderName" HeaderText="Service Provider" />
                                <asp:TemplateField HeaderText="Quoted Amount (R)" ItemStyle-Width="130px">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtAmountQuoted" runat="server" Text ='<%# Eval("QuotedAmount") %>' CssClass="form-control py-2 " AutoPostBack="True" OnTextChanged="txtAmountQuoted_TextChanged"></asp:TextBox>
                                    </ItemTemplate>
                                    <ItemStyle Width="130px" />
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
                                                       <td style="vertical-align:top"><asp:ImageButton ID="ImageButton2" ToolTip="Delete document" OnClientClick="return confirm('Delete quotation document?');"   runat="server" CausesValidation="false" CommandName="RemoveQuote" CommandArgument='<%# Eval("QuotationID") %>' ImageUrl="~/img/delete.png" /></td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlUpload" Visible='<%# Convert.ToBoolean(Eval("QuoteUpload")) %>' runat="server">
                                            
                                            <table style="width: 100px">
                                                <tr>
                                                    <td>
                                                        <asp:FileUpload ID="flQuotation" runat="server" Width="90px" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="flQuotation" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="Upload"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnUpload" CausesValidation="false" CssClass="btn btn-warning" Style="vertical-align:bottom; float:right;" CommandName="Upload" CommandArgument='<%# Eval("QuotationID") %>' runat="server" Text="Upload" />
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
                                                    <asp:DropDownList ID="ddlStatus1"  CssClass="btn-outline-warning btn-fw" runat="server" SelectedValue='<%# Eval("Awarded") %>'>
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
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
      

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
                                        </asp:Panel>
                                            </ContentTemplate>
                                </asp:UpdatePanel>    
           </td></tr>
            </table>
                       </div>
       
   
     </div>

              <div class="block-20 " >
        <div style="padding:15px;" class="alert alert-success mt-4 d-flex align-items-center">
            <table>
                <tr><td>
            <h3 class="heading">Work Order</h3>
                    </td></tr>
                  <tr><td>
            <asp:LinkButton ID="lblWorkOrder" runat="server" Font-Italic="True" OnClick="lblWorkOrder_Click1" ></asp:LinkButton>
               <asp:Button ID="btnWorkOrder" CssClass="btn btn-warning" OnClick="btnWorkOrder_Click" style=" vertical-align:bottom; float:right; " runat="server" Text="Add Work Order" />
</td></tr>
            </table>
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
                                      <h4 class="heading">  Status</h4>
                                      
                                   </td>
                        </tr>
                                             <tr>
                            <td style="vertical-align: top;  padding:5px;">
                                <asp:DropDownList ID="ddlStatus" runat="server"  DataSourceID="SqlDataSource1" CssClass="btn-outline-warning btn-fw" DataTextField="FacilityManagementStatus" AutoPostBack="true" AppendDataBoundItems="true" DataValueField="FacilityManagementStatusID" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                    <asp:ListItem Value="0" Text="-- Select --"></asp:ListItem>
                                </asp:DropDownList>
                                      
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [FacilityManagementStatus] ORDER BY [FacilityManagementStatus]" UpdateCommand="Update [dbo].[FacilityManagement]
Set FacilityManagementStatusID = @FacilityManagementStatusID
Where FacilityManagementID = @FacilityManagementID">
                                       <UpdateParameters>
                                           <asp:Parameter Name="FacilityManagementStatusID" />
                                           <asp:Parameter Name="FacilityManagementID" />
                                       </UpdateParameters>
                                </asp:SqlDataSource>
                                      
                                   </td>
                        </tr>
                                             <tr><td style="vertical-align: top;">
                                               <asp:Panel ID="pnlRating" runat="server" Visible="false" Width="200px">                   
                                        <table style="width:100%;">
                        <tr>
                            <td style="vertical-align: top;  padding:5px;">
                                       <h4 class="heading">Service Rating</h4>
                                      
                                   </td>
                        </tr>
                                             <tr>
                            <td style="vertical-align: top;  padding:5px;">
                                <asp:RadioButtonList ID="rblRating" runat="server" >
                                     <asp:ListItem>Excellent</asp:ListItem>
                                    <asp:ListItem>Very Good</asp:ListItem>
                                    <asp:ListItem>Good</asp:ListItem>
                                    <asp:ListItem>Weak</asp:ListItem>
                                    <asp:ListItem>Unacceptable</asp:ListItem>
                                </asp:RadioButtonList>
                                      
                                    
                                      
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