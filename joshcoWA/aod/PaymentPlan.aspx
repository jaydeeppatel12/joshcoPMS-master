<%@ Page Title="" Language="C#" MasterPageFile="../application/admin.Master" AutoEventWireup="true" CodeBehind="PaymentPlan.aspx.cs" Inherits="joshcoWA.aod.PaymentPlan" %>

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

                                            <h2 class="mb-5">Tenant Payment Plan</h2>

                                            <table style="width: 60%">
                                                <tr>
                                                    <td style="width: 180px;"><strong>Arrears</strong></td>
                                                    <td style="width: 300px;">&nbsp;</td>

                                                    <td>&nbsp;</td>

                                                    <td>&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="width: 180px;">Amount </td>
                                                    <td style="width: 300px;">
                                                        <input runat="server" type="text" class="form-control py-2" placeholder="Arrears Amount" id="txtArrearsAmount" /></td>

                                                    <td>&nbsp;</td>

                                                    <td>&nbsp;&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>

                                                    <td>&nbsp;</td>

                                                    <td>&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <strong>Tenant Affordability</strong></td>
                                                    <td>&nbsp;</td>

                                                    <td>&nbsp;</td>

                                                    <td>&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td>Amount Affordable  
                                                    </td>
                                                    <td>
                                                        <input runat="server" type="text" class="form-control py-2" placeholder="Tenant Preferred Amount" id="txtAmountAffordable" oninput="calc();" /></td>

                                                    <td>&nbsp;</td>

                                                    <td>&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td>Duration in Month(s) 
                                                    </td>
                                                    <td>
                                                        <input runat="server" type="text" class="form-control py-2" placeholder="Number of months" id="txtNumberOfMonths" /></td>

                                                    <td>&nbsp;</td>

                                                    <td>&nbsp;</td>

                                                </tr>





                                                <tr>
                                                    <td>Due Date</td>
                                                    <td>
                                                        <asp:TextBox ID="txtDueDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                                    </td>

                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>

                                                <tr>


                                                    <td>
                                                        <br />
                                                        <br />
                                                        <asp:Button ID="btnSave" CssClass="btn btn-warning px-5 py-2" runat="server" Text="Submit" OnClick="btnSave_Click" ValidationGroup="AddP" />

                                                    </td>

                                                    <td>&nbsp;</td>

                                                    <td>&nbsp;</td>

                                                </tr>
                                            </table>

                                            <asp:SqlDataSource ID="sdsTenant" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="GetTenantDetailsById" SelectCommandType="StoredProcedure" InsertCommand="InsertPaymentPlan" InsertCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter DefaultValue="" Name="TenantId" SessionField="TenantId" Type="String" />
                                                </SelectParameters>

                                                <InsertParameters>
                                                    <asp:Parameter Name="PaymentPlanId" Type="String" />
                                                    <asp:Parameter Name="TenantId" Type="String" />
                                                    <asp:Parameter Name="TotalArrearsAmount" Type="String" />
                                                    <asp:Parameter Name="MonthlyAffordablePayment" Type="String" />
                                                    <asp:Parameter Name="DurationInMonths" Type="String" /> 
                                                    <asp:Parameter Name="CurrentPlan_DueDate" Type="DateTime" />
                                                    <asp:Parameter Name="CreatedBy" Type="String" />
                                                </InsertParameters>

                                            </asp:SqlDataSource>

                                            <asp:SqlDataSource ID="sdsTenantPaymentPlan" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" InsertCommand="InsertTenantPaymentPlan" InsertCommandType="StoredProcedure">

                                                <InsertParameters>
                                                    <asp:Parameter Name="PaymentPlanId" Type="String" />
                                                </InsertParameters>

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

    <script>
        function calc() {
            var totalAmountInArrears = document.getElementById("ContentPlaceHolder1_txtArrearsAmount").value;
            var totalAmountInArrears = parseInt(totalAmountInArrears, 10);
            var amountAffordable = document.getElementById("ContentPlaceHolder1_txtAmountAffordable").value;
            var amountAffordable = parseInt(amountAffordable, 10);
            var total = totalAmountInArrears / amountAffordable;
            document.getElementById("ContentPlaceHolder1_txtNumberOfMonths").value = Math.ceil(total);
        }
    </script>

</asp:Content>


