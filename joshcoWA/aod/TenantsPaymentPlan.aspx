<%@ Page Title="" Language="C#" MasterPageFile="../application/admin.Master" AutoEventWireup="true" CodeBehind="TenantsPaymentPlan.aspx.cs" Inherits="joshcoWA.aod.TenantsPaymentPlan" %>

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

                                            <h2 class="mb-5">Tenants Payment Plans</h2>


                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left">
                                                <AlternatingRowStyle BackColor="#EFEFEF" />
                                                <Columns>
                                                    <asp:BoundField DataField="FullNames" HeaderText="Tenant Name" />
                                                    <asp:BoundField DataField="FullAddress" HeaderText="Address" />
                                                    <asp:BoundField DataField="TotalArrearsAmount" HeaderText="Total Arrears" />
                                                    <asp:BoundField DataField="MonthlyAffordablePayment" HeaderText="Monthly Affordable" />
                                                    <asp:BoundField DataField="DurationInMonths" HeaderText="Month(s) Period" />
                                                    <asp:BoundField DataField="IsConfirmed" HeaderText="Confirmed" />

                                                    <asp:BoundField DataField="ConfirmedDateTime" HeaderText=" Date Confirmed" />


                                                </Columns>
                                                <HeaderStyle CssClass="gvHeader" ForeColor="#005d63" />

                                                <RowStyle HorizontalAlign="Left" BackColor="White" />

                                            </asp:GridView>
                                            <asp:SqlDataSource ID="sdsTenantPaymentPlan" runat="server" ConnectionString="<%$ ConnectionStrings:JoshcoCS %>" SelectCommand="GetTenantsPaymentPlan" SelectCommandType="StoredProcedure"></asp:SqlDataSource>



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
