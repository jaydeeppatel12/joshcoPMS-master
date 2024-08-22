<%@ Page Title="" Language="C#" MasterPageFile="workorder.Master" AutoEventWireup="true" CodeBehind="workorderList.aspx.cs" Inherits="joshcoWA.workorder.workorderList" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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

    <h2 class="mb-5">Work Order List<asp:Button ID="btnAddServiceProvider" runat="server" style=" vertical-align:bottom; float:right; " Text="+ New work order" CssClass="btn btn-warning" PostBackUrl="workorderAdd.aspx" /></h2>
     <%--<form class="search-form" action="#" style="width:250px">
              
              <input type="search" class="form-control" placeholder="Search Here" title="Search here">
         <i class="icon-search"></i>
            </form>--%>
 <div style="float:left; margin-top: -20px;  color:#66c0c2;"> 
    <asp:LinkButton ID="lblNew" runat="server" Font-Bold="true" style="margin-top: -20px; color:#66c0c2;" OnClick="lblNew_Click">New - </asp:LinkButton>
    <asp:LinkButton ID="lblInProgress" runat="server"  style="margin-top: -20px; color:#66c0c2;" OnClick="lblInProgress_Click">In Progress - </asp:LinkButton>
    <asp:LinkButton ID="lblCompleted" runat="server"  style="margin-top: -20px; color:#66c0c2;" OnClick="lblCompleted_Click"> Completed</asp:LinkButton>
   </div><br />
                                               <div style="float:left; margin-top: -20px;  color:#66c0c2; width:100%;"> 
                                             
                                                     <asp:HyperLink ID="hlkAdvancedSearch" runat="server" style="float:right;">+ Search</asp:HyperLink>
   </div>
                                                              
                     <asp:Panel ID="pnlAdvancedSearch"  runat="server">
                    <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                          <table style="width: 100%">
                        <tr>
                            <td style="width: 118px">
                                Reference No.</td>
                            <td>
                                <input  runat="server" id="txtAppName" type="text" width="250px" class="form-control"/>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Start Date</td>
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
                                <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT Distinct p.PropertyID, p.PropertyName FROM [dbo].[FacilityManagement] A
join [dbo].[PropertyUnit]PU
on A.PropertyUnitID = PU.PropertyUnitID
join [Property]p
on PU.PropertyID = p.PropertyID
 ORDER BY p.PropertyName"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Category</td>
                            <td>
                                <asp:DropDownList ID="ddlAppStatus0" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" datasourceid="sdsCategory" DataTextField="FacilityManagementCategory" DataValueField="FacilityManagementCategory">
                                    <asp:ListItem Value="0">-- All --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand=" SELECT Distinct A.[FacilityManagementCategoryID]
      ,[FacilityManagementCategory]
  FROM [dbo].[FacilityManagementCategory]A join [dbo].[FacilityManagement]B on A.[FacilityManagementCategoryID] = B.[FacilityManagementCategoryID]"></asp:SqlDataSource>
                                <asp:Button ID="Button2" runat="server" CausesValidation="false" CssClass="btn btn-warning" OnClick="Button2_Click1" style="float:right;" Text="Search" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                       
                    </table>
                        </div>
                </asp:Panel>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" datakeynames="FacilityManagementID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                       <Columns>
                                <asp:BoundField DataField="RefNumber" HeaderText="Ref#" />
                                        <asp:BoundField DataField="PropertyName" HeaderText="Property Name" />
                                 <asp:BoundField DataField="PropertyUnit" HeaderText="Unit" />
                                <asp:BoundField DataField="FacilityManagementCategory"  HeaderText="Category" />
                                <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-Width="35%" />
                         
                                 <asp:BoundField DataField="StartDate" DataFormatString="{0:d}" HeaderText="Start Date" />
                                <asp:BoundField DataField="EndDate" DataFormatString="{0:d}"  HeaderText="EndDate" />
                       
                               
                                 <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Total Cost">
                                       <ItemTemplate>
                                          <%# Eval("TotalCost", "{0:C0}") %>
                                           <asp:HiddenField ID="hfTotalCost" Value=' <%# Eval("TotalCost") %>'  runat="server" />
                                       </ItemTemplate>
                                       <FooterTemplate >
                                           <asp:Label ID="lblTotal"  Font-Bold="True" runat="server" ></asp:Label>

                                       </FooterTemplate>
                                   </asp:TemplateField>

                                <asp:BoundField DataField="LatestStatus" HeaderText="Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hfBackColour" runat="server" Value='<%# Eval("BackColour") %>' />
                                            <asp:HiddenField ID="hfStatus" runat="server" Value='<%# Eval("LatestStatus") %>' />
                                              <asp:HiddenField ID="hfCategory" runat="server" Value='<%# Eval("FacilityManagementCategory") %>' />
                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="View" CommandArgument='<%# Eval("FacilityManagementID") %>' ToolTip="View details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                              <asp:SqlDataSource ID="sdsFacilityManagement" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectFacilityManagementList" SelectCommandType="StoredProcedure">

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
