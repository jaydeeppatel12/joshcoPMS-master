<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="queryList.aspx.cs" Inherits="joshcoWA.queryList" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
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

    <h2 class="mb-5">Query List<asp:Button ID="btnAddServiceProvider" runat="server" style=" vertical-align:bottom; float:right; " Text="+ New query" CssClass="btn btn-warning" PostBackUrl="queryAdd.aspx" /></h2>
     <%--<form class="search-form" action="#" style="width:250px">
              
              <input type="search" class="form-control" placeholder="Search Here" title="Search here">
         <i class="icon-search"></i>
            </form>--%>
                                              <div style="float:left; margin-top: -20px;  color:#66c0c2; width:100%;"> 
                                                     <asp:Label ID="lblTotalProperties" runat="server" Text=""></asp:Label>
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
                                <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT Distinct p.PropertyID, p.PropertyName FROM [dbo].[FM_Query] A
join [dbo].[PropertyUnit]PU
on A.PropertyUnitID = PU.PropertyUnitID
join [Property]p
on PU.PropertyID = p.PropertyID
 ORDER BY p.PropertyName"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Category</td>
                            <td>
                                <asp:DropDownList ID="ddlAppStatus0" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" datasourceid="sdsCategory" DataTextField="QueryCategory" DataValueField="QueryCategory">
                                    <asp:ListItem Value="0">-- All --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="  Select Distinct QueryCategory FROM [dbo].[FM_Query]A join [dbo].[FM_QueryCategory]B on A.QueryCategoryID = B.QueryCategoryID"></asp:SqlDataSource>
                                <asp:Button ID="Button2" runat="server" CausesValidation="false" CssClass="btn btn-warning" OnClick="Button2_Click1" style="float:right;" Text="Search" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                       
                    </table>
                        </div>
                </asp:Panel>

     <asp:GridView ID="gvQuery" runat="server" AutoGenerateColumns="False" datakeynames="QueryID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                       <Columns>
                            <asp:BoundField DataField="ReferenceNo"
                        SortExpression="ReferenceNo" HeaderText="#Ref No." />  
                    <asp:BoundField DataField="DateAdded" DataFormatString="{0:ddd, dd MMM yy}"
                        SortExpression="DateAdded" HeaderText="Date logged" />
                     <asp:BoundField DataField="QueryCategory"
                        SortExpression="QueryCategory" HeaderText="Category (Maintenance or General)" />
                        <asp:BoundField DataField="QueryDescription"
                        SortExpression="QueryDescription" HeaderText="Query Item" />
                    <asp:BoundField DataField="Status"
                        SortExpression="Status" HeaderText="Status" ItemStyle-BackColor="AntiqueWhite" />
                    <asp:BoundField DataField="StatusDate"
                        SortExpression="StatusDate" HeaderText="Status Date" DataFormatString="{0:ddd, dd MMM yy}" ItemStyle-BackColor="AntiqueWhite"/>
                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>      
                            <asp:HyperLink ID="hlEdit" runat="server" NavigateUrl='<%# Eval("QueryID","QueryView.aspx?ID={0}") %>'>
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
