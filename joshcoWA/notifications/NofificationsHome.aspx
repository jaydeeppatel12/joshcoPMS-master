<%@ Page Title="" Language="C#" MasterPageFile="../application/admin.Master" AutoEventWireup="true" CodeBehind="NofificationsHome.aspx.cs" Inherits="joshcoWA.notifications.NofificationsHome" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


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

                                            <h2 class="mb-5">Notification List</h2>
                                            <div style="float: left; margin-top: -20px; color: #66c0c2; width: 100%;">
                                                <asp:Label ID="lblTotalProperties" runat="server" Text=""></asp:Label>
                                            </div>


                                            <asp:GridView ID="gvQuery" runat="server" AutoGenerateColumns="False" DataKeyNames="QueryID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left">
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
                                                        SortExpression="StatusDate" HeaderText="Status Date" DataFormatString="{0:ddd, dd MMM yy}" ItemStyle-BackColor="AntiqueWhite" />
                                                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="hlEdit" runat="server" NavigateUrl='<%# Eval("QueryID","QueryView.aspx?ID={0}") %>'>
                               View
                                                            </asp:HyperLink>
                                                        </ItemTemplate>


                                                    </asp:TemplateField>

                                                </Columns>
                                                <HeaderStyle CssClass="gvHeader" ForeColor="#005d63" />

                                                <RowStyle HorizontalAlign="Left" BackColor="White" />

                                            </asp:GridView>

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