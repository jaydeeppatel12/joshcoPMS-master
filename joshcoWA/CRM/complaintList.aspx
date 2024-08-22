<%@ Page Title="" Language="C#" MasterPageFile="CRM.Master" AutoEventWireup="true" CodeBehind="complaintList.aspx.cs" Inherits="joshcoWA.CRM.complaintList" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="addComplaint.ascx" TagPrefix="uc1" TagName="addComplaint" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <link rel="stylesheet" href="../css/PopUp.css" /><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        
                                                        <asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="500" Y="0"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         
<div class="form-wrap"  style="width:800px; padding:15px; margin-top:50px; "  >
 
    <div class="block-20;">
    <h3 id="hdlLeaseHeader" class="heading"><asp:Label ID="lblLeaseDocHeader" runat="server" Text="Complaint Details"></asp:Label>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="../images/close.png" AlternateText="Close"  /></h3>
<uc1:addComplaint runat="server" id="addComplaint" />
        </div>
    </div>
                                                   
</asp:Panel>

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

    <h2 class="mb-5">Complaint List<asp:Button ID="btnAddComplaint" runat="server" style=" vertical-align:bottom; float:right; " Text="+ New complaint" CssClass="btn btn-warning" PostBackUrl="../CRM/ComplaintAdd.aspx"/></h2>
     
                                                <div style="float:left; margin-top: -20px;  color:#66c0c2; width:100%;"> 
                                                        <asp:Label ID="lblTotalProperties" runat="server" Text=""></asp:Label>
                                                     <asp:HyperLink ID="hlkAdvancedSearch" runat="server" style="float:right;">+ Search</asp:HyperLink>
   </div>
                                                              
                     <asp:Panel ID="pnlAdvancedSearch"  runat="server">
                    <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                          <table style="width: 100%">
                        <tr>
                            <td style="width: 118px">
                                Tenant Name</td>
                            <td>
                                <input  runat="server" id="txtAppName" type="text" width="250px" class="form-control"/>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Date logged</td>
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
                            <td style="vertical-align:top;"> <asp:Image ID="hlkCloseAdvancedSearch" runat="server" ImageUrl="../images/close.png" Width="10px" ToolTip="Close search"  style="float:right;  " />  </td>
                        </tr>
                        <tr>
                            <td style="width: 118px">Property </td>
                            <td>
                                <asp:DropDownList ID="ddlProperty" runat="server" AppendDataBoundItems="True" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID" CssClass="btn-outline-warning btn-fw">
                                    <asp:ListItem Value="0">-- All --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT Distinct p.PropertyID, p.PropertyName FROM [dbo].[Lease] A
join [dbo].[PropertyUnit]PU
on A.PropertyUnitID = PU.PropertyUnitID
join [Property]p
on PU.PropertyID = p.PropertyID
 ORDER BY p.PropertyName"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Category</td>
                            <td>
                                <asp:DropDownList ID="ddlAppStatus0" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" datasourceid="sdsCompaintCategory" DataTextField="ComplaintCategory" DataValueField="ComplaintCategory">
                                    <asp:ListItem Value="0">-- All --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsCompaintCategory" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand=" Select Distinct QC.ComplaintCategory  From [dbo].[Complaint]Q join [dbo].[ComplaintCategory]QC on QC.ComplaintCategoryID = Q.ComplaintCategoryID"></asp:SqlDataSource>
                                <asp:Button ID="Button2" runat="server" CausesValidation="false" CssClass="btn btn-warning" OnClick="Button2_Click1" style="float:right;" Text="Search" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                       
                    </table>
                        </div>
                </asp:Panel>
     <asp:GridView ID="gvQuery" runat="server" AutoGenerateColumns="False" datakeynames="ComplaintID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                       <Columns>
                              
                    <asp:BoundField DataField="DateAdded" DataFormatString="{0:ddd, dd MMM yy}"
                        SortExpression="DateAdded" HeaderText="Date logged" />
                                <asp:BoundField DataField="Tenant"
                        SortExpression="Tenant" HeaderText="Tenant" />

                             <asp:BoundField DataField="PropertyName"
                        SortExpression="PropertyName" HeaderText="Project" />
                        

                     <asp:BoundField DataField="ComplaintCategory"
                        SortExpression="ComplaintCategory" HeaderText="Category" />
                        <asp:BoundField DataField="ComplaintSubCategory"
                        SortExpression="ComplaintSubCategory" HeaderText="Sub Category" />
                    <asp:BoundField DataField="Severity"
                        SortExpression="Severity" HeaderText="Severity" ItemStyle-BackColor="AntiqueWhite" />
                              <asp:BoundField DataField="Status"
                        SortExpression="Status" HeaderText="Status" ItemStyle-BackColor="AntiqueWhite" />
                    <asp:BoundField DataField="StatusDate"
                        SortExpression="StatusDate" HeaderText="Status Date" DataFormatString="{0:ddd, dd MMM yy}" ItemStyle-BackColor="AntiqueWhite"/>
                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>      
                            <asp:HyperLink ID="hlEdit" runat="server" NavigateUrl='<%# Eval("ComplaintID","complaintView.aspx?ID={0}") %>'>
                               View
                            </asp:HyperLink>         
                        </ItemTemplate>

 
                    </asp:TemplateField>
 
                </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                           
 
    
    
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
