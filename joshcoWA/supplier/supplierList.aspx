<%@ Page Title="" Language="C#" MasterPageFile="supplier.Master" AutoEventWireup="true" CodeBehind="supplierList.aspx.cs" Inherits="joshcoWA.supplier.supplierList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">

    <h2 class="mb-5">Service Provider List<asp:Button ID="btnSupplier" runat="server" style=" vertical-align:bottom; float:right; " Text="+ New Service Provider" CssClass="btn btn-warning" PostBackUrl="supplierAdd.aspx" /></h2>
     <%--<form class="search-form" action="#" style="width:250px">
              
              <input type="search" class="form-control" placeholder="Search Here" title="Search here">
         <i class="icon-search"></i>
            </form>--%>
                                                                    <asp:Label ID="lblTotalProperties" runat="server" Text=""></asp:Label>
    <div style="float:right; width:250px">
                            <table><tr><td>
                            <input type="text" id="txtSearch" runat="server"  class="form-control py-2 " /></td><td><asp:Button ID="btnSearch" runat="server" style=" vertical-align:bottom; float:right;  " OnClick="SearchProperty" Text="Search" ToolTip="Search"  CssClass="btn btn-warning" /></td></tr></table> </div> 

     <asp:GridView ID="gvSupplier" runat="server" AutoGenerateColumns="False"  OnRowCommand="GridView1_RowCommand" datakeynames="ServiceProviderID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                      <Columns>
                          <asp:BoundField DataField="ReferenceNumber" HeaderText="Reference Number" />
                                <asp:BoundField DataField="BusinessName" HeaderText="Service Provider Name" />
                                 <asp:BoundField DataField="EntityType" HeaderText="Company Type" />
                                <asp:BoundField DataField="BEELevel" HeaderText="B-BEE Level" />
                                <asp:BoundField DataField="EconomicSector"  HeaderText="Economic Sector" />
                                <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" />
 
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewProvider" CommandArgument='<%# Eval("ServiceProviderID") %>' ToolTip="View Provider details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                           
  <asp:SqlDataSource ID="sdsProvider" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectProviderList" SelectCommandType="StoredProcedure" >
                 
                                
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
