<%@ Page Title="" Language="C#" MasterPageFile="../application/admin.Master" AutoEventWireup="true" CodeBehind="TenantFormReport.aspx.cs" Inherits="joshcoWA.aod.TenantFormReport" %>

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

                                            <h2 class="mb-5">Tenants Details</h2>

                                            <asp:DropDownList ID="ddlProjectName" runat="server" AppendDataBoundItems="True" DataSourceID="sdsProject" AutoPostBack="True" OnSelectedIndexChanged="ddlProperty_SelectedIndexChanged" DataTextField="ProjectName" DataValueField="ProjectName" CssClass="btn-outline-warning btn-fw">
                                                <asp:ListItem Value="0">-- All Building Name --</asp:ListItem>
                                            </asp:DropDownList>
                                                <asp:Button ID="btnExport" Text="Export to Csv" runat="server" UseSubmitBehavior="false"  OnClick="ExportToPdf" />
                                              
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left">
                                                <AlternatingRowStyle BackColor="#EFEFEF" />
                                                <Columns>
                                                    <asp:BoundField DataField="ProjectName" HeaderText="Project Name" />
                                                    <asp:BoundField DataField="TenantCount" HeaderText="Tenant Count" />
                                                </Columns>
                                                <HeaderStyle CssClass="gvHeader" ForeColor="#005d63" />

                                                <RowStyle HorizontalAlign="Left" BackColor="White" />

                                            </asp:GridView>
                                            <asp:SqlDataSource ID="sdsProject" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT  DISTINCT [ProjectName] FROM [joshco_pms].[dbo].[AOD_TenantForm]"></asp:SqlDataSource>

                                            <asp:SqlDataSource ID="sdsTenantFormReport" runat="server" ConnectionString="<%$ ConnectionStrings:JoshcoCS %>" SelectCommand="GetTenantFormReportDetails" SelectCommandType="StoredProcedure">
                                              <%--  <SelectParameters>
                                                    <asp:ControlParameter DefaultValue="" ControlID="ddlProjectName" Name="ProjectName" PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>--%>
                                            </asp:SqlDataSource>



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
