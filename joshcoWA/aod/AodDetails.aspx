<%@ Page Title="" Language="C#" MasterPageFile="../application/admin.Master" AutoEventWireup="true" CodeBehind="AodDetails.aspx.cs" Inherits="joshcoWA.aod.AodDetails" %>

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

                                            <h2 class="mb-5">Acknowledge of debts</h2>



                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand">
                                                <AlternatingRowStyle BackColor="#EFEFEF" />
                                                <Columns>
                                                    <asp:BoundField DataField="FullNames" HeaderText="Name" />
                                                    <asp:BoundField DataField="IDNumber" HeaderText="ID Number" />
                                                    <asp:BoundField DataField="Installment" HeaderText="Amount" />
                                                    <asp:BoundField DataField="ContactNumber" HeaderText="Contact No." />
                                                    <asp:BoundField DataField="FullAddress" HeaderText="Address" />
                                                    <asp:BoundField DataField="ConfirmedDate" HeaderText="Acknowladged Date" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButtson2" runat="server" CausesValidation="false" CommandName="AddTenantPaymentPlan" CommandArgument='<%# Eval("Id") %>' ToolTip="Payment Plan" ForeColor="#75C5CA">view</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="gvHeader" ForeColor="#005d63" />

                                                <RowStyle HorizontalAlign="Left" BackColor="White" />

                                            </asp:GridView>
                                            <asp:SqlDataSource ID="sdsAcknowladgedTenants" runat="server" ConnectionString="<%$ ConnectionStrings:JoshcoCS %>" SelectCommand="GetAcknowladgedTenants" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


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
