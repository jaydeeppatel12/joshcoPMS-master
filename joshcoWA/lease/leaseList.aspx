<%@ Page Title="" Language="C#" MasterPageFile="lease.Master" AutoEventWireup="true" CodeBehind="leaseList.aspx.cs" Inherits="joshcoWA.lease.leaseList" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  <section class="site-section">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">

                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
    <h2 class="mb-5">Leases</h2>
                                     
     <asp:SqlDataSource ID="sdsLeaseProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="LeaseID" SessionField="LeaseID" Type="Int32" />
                                           
                                      </SelectParameters>
                                      </asp:SqlDataSource>
     <div style="float:left; margin-top: -20px;  color:#66c0c2; width:100%;"> 
    <asp:LinkButton ID="lnkActive" runat="server" Font-Bold="true" style="margin-top: -20px; color:#66c0c2;" OnClick="lnkActive_Click">Active - </asp:LinkButton>
    <asp:LinkButton ID="lnkExpiring" runat="server" ToolTip="Expiring this year"  style="margin-top: -20px; color:#66c0c2;" OnClick="lnkExpiring_Click">Expiring - </asp:LinkButton>
    <asp:LinkButton ID="lnkExpired" runat="server"  style="margin-top: -20px; color:#66c0c2;" OnClick="lnkExpired_Click"> Expired</asp:LinkButton>
         <asp:HyperLink ID="hlkAdvancedSearch" runat="server" style="float:right;">+ Search</asp:HyperLink>
   </div>
                                                              
                     <asp:Panel ID="pnlAdvancedSearch"  runat="server">
                    <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                          <table style="width: 100%">
                        <tr>
                            <td style="width: 118px">
                                Lessee Name</td>
                            <td>
                                <input  runat="server" id="txtAppName" type="text" width="250px" class="form-control"/>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Commencement</td>
                            <td>
                                <table style="width: 108px">
                                    <tr>
                                        <td>From</td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpStartDate" Runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>To</td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpEndDate" Runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="vertical-align:top;"> <asp:Image ID="hlkCloseAdvancedSearch" runat="server" ImageUrl="../images/close.png" Width="10px" ToolTip="Close search"  style="float:right;  " />  </td>
                        </tr>
                        <tr>
                            <td style="width: 118px">Property </td>
                            <td>
                                <asp:DropDownList ID="ddlProperty" runat="server" AppendDataBoundItems="True" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID" CssClass="btn-outline-warning btn-fw">
                                    <asp:ListItem Value="0">-- All --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT Distinct p.PropertyID, p.PropertyName FROM [dbo].[Lease] A
join [dbo].[PropertyUnit]PU
on A.PropertyUnitID = PU.PropertyUnitID
join [Property]p
on PU.PropertyID = p.PropertyID
 ORDER BY p.PropertyName"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Termination</td>
                            <td>
                               <table style="width: 108px">
                                    <tr>
                                        <td>From</td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpTermStart" Runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>To</td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpTermEnd" Runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                </table></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 118px">Lease Status</td>
                            <td>
                                <asp:DropDownList ID="ddlAppStatus0" runat="server" AppendDataBoundItems="True" datasourceid="sdsAppStatus0" DataTextField="LeaseStatus" DataValueField="LeaseStatus" CssClass="btn-outline-warning btn-fw">
                                    <asp:ListItem Value="0">-- All --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsAppStatus0" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT DISTINCT [LeaseStatus] FROM [Lease] ORDER BY [LeaseStatus]"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">&nbsp;</td>
                            <td>   
                                <asp:Button ID="Button2" CausesValidation="false" style="float:right;" runat="server" OnClick="Button2_Click1" Text="Search" CssClass="btn btn-warning" />
                               
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                        </div>
                </asp:Panel>
  <br /><br />
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
                                <asp:BoundField DataField="LeaseEndDate"  HeaderText="Terminantion Date" />  <%--DataFormatString="{0:ddd, dd MMM yy}"--%>
                                <asp:BoundField DataField="LeaseStatus" HeaderText="Lease Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                               <asp:HiddenField ID="hfActive" runat="server" Value='<%# Eval("LeaseStatus") %>' />
                                    <asp:HiddenField ID="hfExpiring" runat="server" Value='<%# Eval("Expiring") %>' />


                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewLease" CommandArgument='<%# Eval("LeaseID") %>' ToolTip="View lease details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                             <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
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
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
