<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="appList.aspx.cs" Inherits="joshcoWA.appList" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="../ApplicationForm.ascx" TagPrefix="uc1" TagName="ApplicationForm" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="../css/PopUp.css" />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
   <%--                                                       <asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="500" Y="0"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         
<div class="form-wrap"  style="width:800px; padding:15px; margin-top:50px; "  >
 
    <div class="block-20;">
    <h3 id="hdlLeaseHeader" class="heading"><asp:Label ID="lblLeaseDocHeader" runat="server" Text="Application Details"></asp:Label>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
     <uc1:ApplicationForm runat="server" id="ApplicationForm" />
        </div>
    </div>
                                                   
</asp:Panel>--%>

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

    <h2 class="mb-5">Applications
        <asp:HyperLink ID="HyperLink1" Target="_blank" style=" vertical-align:bottom; float:right; "   CssClass="btn btn-warning" NavigateUrl="../applicant/appForm.aspx?admin=admin" runat="server">+ New application</asp:HyperLink>
        <asp:Button ID="btnAddApplication" runat="server" Visible="false"  />

    </h2>
      <div style="float:left; margin-top: -20px;  color:#66c0c2; width:100%;"> 
          
    <asp:LinkButton ID="lnkAppNew" runat="server" style="margin-top: -20px; " OnClick="lnkAppNew_Click">>New - </asp:LinkButton>
    <asp:LinkButton ID="lnkAppReviewed" runat="server"  style="margin-top: -20px; color:#66c0c2;" OnClick="lnkAppReviewed_Click">Reviewed - </asp:LinkButton>
    <asp:LinkButton ID="lnkSuccessfull" runat="server" Font-Bold="true"  style="margin-top: -20px; color:#66c0c2;" OnClick="lnkSuccessfull_Click"> Successful</asp:LinkButton>
<asp:LinkButton ID="lnkDeclined" runat="server"  style="margin-top: -20px; color:red;" OnClick="lnkDeclined_Click" > Declined - </asp:LinkButton>
         <asp:HyperLink ID="hlkAdvancedSearch" runat="server" style="float:right;">+ Search</asp:HyperLink> 
   </div>
                                              
                     <asp:Panel ID="pnlAdvancedSearch"  runat="server">
                    <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 118px">
                                Applicant Name</td>
                            <td>
                                <input  runat="server" id="txtAppName" type="text" width="250px" class="form-control"/>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Date Received</td>
                            <td>
                                <table style="width: 108px">
                                    <tr>
                                        <td>From</td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpStartDate" Runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>To</td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpEndDate" Runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="vertical-align:top;"> <asp:Image ID="hlkCloseAdvancedSearch" runat="server" ImageUrl="../images/close.png" Width="10px" ToolTip="Close search"  style="float:right;  " /> </td>
                        </tr>
                        <tr>
                            <td style="width: 118px">Property </td>
                            <td>
                                <asp:DropDownList ID="ddlProperty" runat="server" AppendDataBoundItems="True" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID" CssClass="btn-outline-warning btn-fw">
                                    <asp:ListItem Value="0">-- All --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT Distinct Property.PropertyID, Property.PropertyName FROM Application INNER JOIN Property ON Application.PropertyID = Property.PropertyID ORDER BY Property.PropertyName"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Status</td>
                            <td>
                                <table class="w-100">
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="ddlAppStatus0" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" datasourceid="sdsAppStatus0" DataTextField="ApplicationStatus" DataValueField="ApplicationStatusID">
                                                <asp:ListItem Value="0">-- All --</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Button ID="Button2" runat="server" CausesValidation="false" CssClass="btn btn-warning" OnClick="Button2_Click1" style="float:right;" Text="Search" />
                                            <asp:SqlDataSource ID="sdsAppStatus0" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT DISTINCT ApplicationStatus.ApplicationStatus, ApplicationStatus.ApplicationStatusID FROM Application INNER JOIN ApplicationStatusUpdate ON Application.ApplicationID = ApplicationStatusUpdate.ApplicationID INNER JOIN ApplicationStatus ON ApplicationStatusUpdate.ApplicationStatusID = ApplicationStatus.ApplicationStatusID ORDER BY ApplicationStatus.ApplicationStatus"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                         
                    </table>
                        </div>
                </asp:Panel>
                                            <br /><br />
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                            <Columns>
                                <asp:BoundField DataField="ApplicationDate"  HeaderText="Date Received" />   <%--DataFormatString="{0:ddd, dd MMM yy}"--%>
                                  <asp:BoundField DataField="FullName"   HeaderText="Applicant" />
                                 
                                <asp:BoundField DataField="PropertyName"   HeaderText="Property Name " />
                                <%--<asp:BoundField DataField="ApplicationStatusDate" ItemStyle-BackColor="#ccffff" HeaderText="Status Date" />--%>
                                <asp:BoundField DataField="ApplicationStatus"  ItemStyle-BackColor="#def0ed" HeaderText="Application Status" />
                                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                     
                                    <asp:HiddenField ID="hfPendingReview" runat="server" Value='<%# Eval("PendingReview") %>' />

                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewApplication" CommandArgument='<%# Eval("ApplicationID") %>' ToolTip="View Application details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />                        
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsApplication" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationList" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="ApplicationID" Type="Int32" />
                                    <asp:Parameter DefaultValue="All" Name="Filter" Type="String" />
                                  
                                </SelectParameters>
                         </asp:SqlDataSource>
    
    
    <br />
    <br />
   
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
