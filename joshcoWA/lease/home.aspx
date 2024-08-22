<%@ Page Title="" Language="C#" MasterPageFile="lease.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="joshcoWA.lease.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 75px;
        }
 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="site-section"  >
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px;height:1500px"  >

    <h2 class="mb-5">Dashboard</h2>
   <table class="nav-justified" style="width: 100%">
                                                 <tr>
                                                     <td style="vertical-align: top" class="auto-style1">
                                                         <table style="height: 200px; border: 2px solid #fcaf17; width: 200px; text-align: center;">
                                                             <tr>
                                                                 <td colspan="2" style="height: 100%; vertical-align: bottom;background-color:#def0ed;">
                                                                     <asp:LinkButton ID="lblLeaseTotal" runat="server" Font-Bold="True" Font-Size="35pt" ForeColor="#005d63" Text="0" OnClick="lblLeaseTotal_Click"></asp:LinkButton>
                                                                     <br />
                                                                     <asp:Label ID="Label14" runat="server" Font-Size="12pt" Text="Total Leases" ForeColor="#005d63"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px; height: 13px;">
                                                                 </td>
                                                                 <td style="height: 13px">
                                                                     <asp:SqlDataSource ID="sdsDashBoard" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectHomeDashboard" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px">
                                                                     <asp:LinkButton ID="lblActiveTotal" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblActiveTotal_Click"></asp:LinkButton>
                                                                 </td>
                                                                 <td style="text-align: left">
                                                                     <asp:Label ID="Label16" runat="server" Font-Size="8pt" Text="Active"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px">
                                                                     <asp:LinkButton ID="lblExpiringTotal" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblExpiringTotal_Click"></asp:LinkButton>
                                                                 </td>
                                                                 <td style="text-align: left">
                                                                     <asp:Label ID="Label12" runat="server" Font-Size="8pt" Text="Expiring"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </td>
                                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                     <td style="vertical-align: top; width:100%">
                           
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel1" Height="350px" ScrollBars="Auto" runat="server" Width="100%">
    <asp:LinkButton ID="lnkActive" runat="server" Font-Bold="true" style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lnkActive_Click">Active - </asp:LinkButton>
    <asp:LinkButton ID="lnkExpiring" runat="server"  style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lnkExpiring_Click">Expiring - </asp:LinkButton>
    <asp:LinkButton ID="lnkExpired" runat="server"  style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lnkExpired_Click">Expired</asp:LinkButton>
     
           
 
                     <asp:SqlDataSource ID="sdsLease" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseList" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="LeaseID" Type="Int32" />
                                    <asp:Parameter DefaultValue=" " Name="Filter" Type="String" />
                                    <asp:Parameter DefaultValue=" " Name="Search" Type="String" />
                                </SelectParameters>
                         </asp:SqlDataSource>

 <asp:GridView ID="gvLease" runat="server" AutoGenerateColumns="False" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvLease_RowCommand" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
  <Columns>
   <asp:BoundField DataField="PropertyName" HeaderText="Property Name" HeaderStyle-Wrap="false" />
                                 <asp:BoundField DataField="PropertyUnit" HeaderText="Unit" HeaderStyle-Wrap="false" />
                                <asp:BoundField DataField="UnitArea"  DataFormatString="{0: 0sqm}" HeaderStyle-Wrap="false" HeaderText="Area" />
                                <asp:BoundField DataField="LesseeName" HeaderText="Lessee Name" HeaderStyle-Wrap="false" />
                         
                                <asp:BoundField DataField="Frequency" HeaderText="Lease Frequency" HeaderStyle-Wrap="false" />
                              <%--  <asp:BoundField DataField="AmountDueThisMonth" DataFormatString="{0:c}" HeaderText="Amount Due This Month" />--%>
                             <%--   <asp:BoundField DataField="LeaseStartDate" DataFormatString="{0:d}" HeaderText="Commencement Date" />--%>
                                <asp:BoundField DataField="LeaseEndDate" DataFormatString="{0:d}" HeaderStyle-Wrap="false"  HeaderText="Terminantion Date" />
                                <asp:BoundField DataField="LeaseStatus" HeaderStyle-Wrap="false" ItemStyle-BackColor="#def0ed" HeaderText="Status" />
         
                                <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:HiddenField ID="hfActive" runat="server" Value='<%# Eval("LeaseStatus") %>' />
                                    <asp:HiddenField ID="hfExpiring" runat="server" Value='<%# Eval("Expiring") %>' />
                             <asp:LinkButton ID="LinkButton2"  runat="server" CausesValidation="false"  CommandName="ViewLease" CommandArgument='<%# Eval("LeaseID") %>' ToolTip="View lease details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                            </asp:GridView>
                    </asp:Panel>
 </ContentTemplate>
        </asp:UpdatePanel>


                                                     </td>
                                                 </tr>
                                                 
                                             </table>

    <br />
    <br />  <asp:SqlDataSource ID="sdsLatestNews" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectHomeTimeLine" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<div class="row">
<div class="col-md-12">

</div>
</div> 

     </div>
     </div>
     </div>
             </section>
</asp:Content>
