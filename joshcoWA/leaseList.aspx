<%@ Page Title="" Language="C#" MasterPageFile="application/admin.Master" AutoEventWireup="true" CodeBehind="leaseList.aspx.cs" Inherits="joshcoWA.leaseList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <section class="site-section"  >
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px;height:400px"  >

    <h2 class="mb-5">Leases</h2>
     <asp:SqlDataSource ID="sdsLeaseProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="LeaseID" SessionField="LeaseID" Type="Int32" />
                                           
                                      </SelectParameters>
                                      </asp:SqlDataSource>
     <div style="float:left; margin-top: -20px;  color:#66c0c2;"> 
    <asp:LinkButton ID="lnkActive" runat="server" Font-Bold="true" style="margin-top: -20px; color:#66c0c2;" OnClick="lnkActive_Click">Active - </asp:LinkButton>
    <asp:LinkButton ID="lnkExpiring" runat="server" ToolTip="Expiring this year"  style="margin-top: -20px; color:#66c0c2;" OnClick="lnkExpiring_Click">Expiring - </asp:LinkButton>
    <asp:LinkButton ID="lnkExpired" runat="server"  style="margin-top: -20px; color:#66c0c2;" OnClick="lnkExpired_Click"> Expired</asp:LinkButton>
   </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                 <asp:BoundField DataField="LesseeName" HeaderText="Lessee Name" />

                                        <asp:BoundField DataField="PropertyName" HeaderText="Property Name" />
                                 <asp:BoundField DataField="PropertyUnit" HeaderText="Unit" />
                                <asp:BoundField DataField="UnitArea"  DataFormatString="{0: 0sqm}" HeaderText="Area" />
                               
                         
                                <asp:BoundField DataField="Frequency" HeaderText="Lease Frequency" />
                              <%--  <asp:BoundField DataField="AmountDueThisMonth" DataFormatString="{0:c}" HeaderText="Amount Due This Month" />--%>
                             <%--   <asp:BoundField DataField="LeaseStartDate" DataFormatString="{0:d}" HeaderText="Commencement Date" />--%>
                                <asp:BoundField DataField="LeaseEndDate" DataFormatString="{0:d}"  HeaderText="Terminantion Date" />
                                <asp:BoundField DataField="LeaseStatus" HeaderText="Lease Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                               <asp:HiddenField ID="hfActive" runat="server" Value='<%# Eval("LeaseStatus") %>' />
                                    <asp:HiddenField ID="hfExpiring" runat="server" Value='<%# Eval("Expiring") %>' />


                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewLease" CommandArgument='<%# Eval("LeaseID") %>' ToolTip="View lease details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#66C0C2" ForeColor="White" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsLease" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseList" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="LeaseID" Type="Int32" />
                                    <asp:Parameter DefaultValue=" " Name="Filter" Type="String" />
                                    <asp:Parameter DefaultValue=" " Name="Search" Type="String" />
                                </SelectParameters>
                         </asp:SqlDataSource>



        <br />
    <br />
   
     </div>
     </div>
     </div>
     </div>
             </section>
</asp:Content>
