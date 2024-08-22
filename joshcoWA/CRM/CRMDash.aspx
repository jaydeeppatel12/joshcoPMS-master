<%@ Page Title="" Language="C#" MasterPageFile="CRM.Master" AutoEventWireup="true" CodeBehind="CRMDash.aspx.cs" Inherits="joshcoWA.CRM.CRMDash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="site-section"><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         
        <div class="container">
            <div class="row justify-content-left">
                <div class="col-md-7">
                    <div class="form-wrap" style="width: 1100px; height: 1500px">

                        <h2 class="mb-5">Dashboard</h2>
                        <table class="nav-justified">
                            <tr>
                                <td>
                                    <table style="height: 200px; border: 2px solid #339966; width: 200px; text-align: center;">
                                        <tr>
                                            <td colspan="2" style="height: 100%; vertical-align: bottom; background-color: #66c0c2;">
                                                <asp:LinkButton ID="lblQueryTotal" runat="server" Font-Bold="true" Font-Size="80pt" ForeColor="#FFFFFF" Text="0" OnClick="lblQueryTotal_Click"></asp:LinkButton>
                                                <br />
                                                <asp:Label ID="Label6" runat="server" Font-Size="12pt" Text="Queries" ForeColor="#FFFFFF"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 11px; height: 13px;"></td>
                                            <td style="height: 13px"></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 11px">
                                                <asp:SqlDataSource ID="sdsDashBoard" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectHomeCRMDashboard" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                <asp:LinkButton ID="lblNewTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblNewTotal_Click" ></asp:LinkButton>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label4" runat="server" Font-Size="8pt" Text="New"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 11px">
                                                <asp:LinkButton ID="lblInprogressTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblInprogressTotal_Click"></asp:LinkButton>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label5" runat="server" Font-Size="8pt" Text="In Progress"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 11px">
                                                <asp:LinkButton ID="lblWorkOrderAssignedTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblWorkOrderAssignedTotal_Click"></asp:LinkButton>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label1" runat="server" Font-Size="8pt" Text="Work Order Assigned"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 11px">
                                                <asp:LinkButton ID="lblCompletedTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblCompletedTotal_Click"></asp:LinkButton>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label2" runat="server" Font-Size="8pt" Text="Completed"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                <td>
                                    <table style="height: 200px; border: 2px solid #339966; width: 200px; text-align: center;">
                                        <tr>
                                            <td colspan="2" style="height: 100%; vertical-align: bottom; background-color: #66c0c2;">
                                                <asp:LinkButton ID="lblComplaintTotal" runat="server" Font-Bold="true" Font-Size="80pt" ForeColor="#FFFFFF" Text="0" OnClick="lblComplaintTotal_Click"></asp:LinkButton>
                                                <br />
                                                <asp:Label ID="Label8" runat="server" Font-Size="12pt" Text="Complaints" ForeColor="#FFFFFF"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 11px; height: 13px;"></td>
                                            <td style="height: 13px"></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 11px">
                                                <asp:LinkButton ID="lblNewComplaintTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblNewComplaintTotal_Click"></asp:LinkButton>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label10" runat="server" Font-Size="8pt" Text="New"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 11px">
                                                <asp:LinkButton ID="lblInprogressComplaintTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblInprogressComplaintTotal_Click"></asp:LinkButton>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label18" runat="server" Font-Size="8pt" Text="In Progress"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 11px">
                                                <asp:LinkButton ID="lblWorkOrderAssignedComplaintTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblWorkOrderAssignedComplaintTotal_Click"></asp:LinkButton>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label3" runat="server" Font-Size="8pt" Text="Work Order Assigned"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 11px">
                                                <asp:LinkButton ID="lblCompletedComplaintTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblCompletedComplaintTotal_Click"></asp:LinkButton>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label7" runat="server" Font-Size="8pt" Text="Completed"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                        </table>


                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>