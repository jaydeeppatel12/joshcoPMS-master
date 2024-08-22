<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="tenantQueryList.aspx.cs" Inherits="joshcoWA.tenantQueryList" %>
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

    <h2 class="mb-5">Query List<asp:Button ID="btnAddServiceProvider" runat="server" style=" vertical-align:bottom; float:right;" Text="+ New query" CssClass="btn btn-warning" PostBackUrl="tenantQueryAdd.aspx" /></h2>
    <asp:GridView ID="gvQuery" runat="server" AutoGenerateColumns="False" datakeynames="QueryID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                       <Columns>
                    <asp:BoundField DataField="DateAdded"
                        SortExpression="DateAdded" HeaderText="Date logged" />
                     <asp:BoundField DataField="QueryCategory"
                        SortExpression="QueryCategory" HeaderText="Category (Maintenance or General)" />
                        <asp:BoundField DataField="QueryDescription"
                        SortExpression="QueryDescription" HeaderText="Query Description" />
                    <asp:BoundField DataField="QueryStatus"
                        SortExpression="Status" HeaderText="Status" ItemStyle-BackColor="AntiqueWhite" />
                    <asp:BoundField DataField="StatusDate"
                        SortExpression="StatusDate" HeaderText="Last Updated Date"  ItemStyle-BackColor="AntiqueWhite"/>
                    <asp:TemplateField ItemStyle-VerticalAlign="Middle"  ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>      
                            <asp:HyperLink ID="hlEdit" runat="server"  NavigateUrl='<%# Eval("QueryID","tenantQueryProfile.aspx?ID={0}") %>'>
                                View
                            </asp:HyperLink>         
                    </ItemTemplate> 
                    </asp:TemplateField> 
                </Columns>
                <EmptyDataTemplate>
                    <div align="center">No records found.</div>
                </EmptyDataTemplate>
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