<%@ Page Title="" Language="C#" MasterPageFile="../application/admin.Master" AutoEventWireup="true" CodeBehind="tenantList.aspx.cs" Inherits="joshcoWA.tenant.tenantList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager runat="server"></asp:ScriptManager>   <section class="site-section">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">

                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
 
    <h2 class="mb-5">Tenant List</h2>
                        <asp:Label ID="lblTotalTenant" runat="server" Text=""></asp:Label>
                                            <div style="float:right; width:250px">
                            <table><tr><td>
                            <input type="text" id="txtSearch" runat="server"  class="form-control py-2 " /></td><td><asp:Button ID="btnSearch" runat="server" style=" vertical-align:bottom; float:right;  " OnClick="SearchTenant" Text="Search" ToolTip="Search"  CssClass="btn btn-warning" /></td></tr></table> </div>
 

 
                                            <asp:SqlDataSource ID="sdsTenant" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectTenantList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <br />
 <asp:GridView ID="gvTenant" runat="server" AutoGenerateColumns="False" DataSourceID="sdsTenant"  Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvTenant_RowCommand" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                               <asp:BoundField DataField="FullName" HeaderText="Name" />
                              
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile No." />
                             <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" />
                         
                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                              

                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewTenant" CommandArgument='<%# Eval("TenantID") %>' ToolTip="View tenant details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>                         
 
     </div>
                                         
           </div>
    <br />
   
 
                                    </div>                                

                                    </div>




                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</asp:Content>