<%@ Page Title="" Language="C#" MasterPageFile="inspection.Master" AutoEventWireup="true" CodeBehind="inspectionList.aspx.cs" Inherits="joshcoWA.inspection.inspectionList" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
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

    <h2 class="mb-5">Inspection List<asp:Button ID="btnInspection" runat="server" style=" vertical-align:bottom; float:right; " Text="+ New Inspection" CssClass="btn btn-warning" PostBackUrl="InspectionAdd.aspx" /></h2>
                                            <%-- <asp:BoundField DataField="Notes"  HeaderText="Notes" />--%>
                                             <div style="float:left; margin-top: -20px;  color:#66c0c2; width:100%;"> 
                                                        <asp:Label ID="lblTotalProperties" runat="server" Text=""></asp:Label>
                                                     <asp:HyperLink ID="hlkAdvancedSearch" runat="server" style="float:right;">+ Search</asp:HyperLink>
   </div>
                                                              
                     <asp:Panel ID="pnlAdvancedSearch"  runat="server">
                    <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                          <table style="width: 100%">
                        <tr>
                            <td style="width: 118px">
                                Service Provider</td>
                            <td>
                                <input  runat="server" id="txtAppName" type="text" width="250px" class="form-control"/>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Inspection Date</td>
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
                                <asp:DropDownList ID="ddlProperty" runat="server" AppendDataBoundItems="True" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID" CssClass="btn-outline-warning btn-fw" AutoPostBack="True" OnSelectedIndexChanged="ddlProperty_SelectedIndexChanged">
                                    <asp:ListItem Value="0">-- All --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT Distinct p.PropertyID, p.PropertyName FROM [dbo].[PropertyInspection] A
join [dbo].[PropertyUnit]PU
on A.PropertyUnitID = PU.PropertyUnitID
join [Property]p
on PU.PropertyID = p.PropertyID
 ORDER BY p.PropertyName"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Property Unit</td>
                            <td>
                                <asp:DropDownList ID="ddlPropertyUnit" runat="server" CssClass="btn-outline-warning btn-fw" datasourceid="sdsPropertyUnit" DataTextField="PropertyUnit" DataValueField="PropertyUnitID">
                                    <asp:ListItem Value="0">-- All --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsPropertyUnit" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT DISTINCT A.PropertyUnitID, PU.PropertyUnit FROM PropertyInspection AS A INNER JOIN PropertyUnit AS PU ON A.PropertyUnitID = PU.PropertyUnitID INNER JOIN Property AS p ON PU.PropertyID = p.PropertyID WHERE (A.PropertyID = @PropertyID) ORDER BY PU.PropertyUnit">
                                    <SelectParameters>
                                        <asp:Parameter Name="PropertyID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Button ID="Button2" runat="server" CausesValidation="false" CssClass="btn btn-warning" OnClick="Button2_Click1" style="float:right;" Text="Search" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                       
                    </table>
                        </div>
                </asp:Panel>
     <asp:GridView ID="gvInspection" runat="server" AutoGenerateColumns="False"  OnRowCommand="gvInspection_RowCommand" datakeynames="PropertyInspectionID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                  <Columns>
                                <asp:BoundField DataField="PropertyName" HeaderText="Property Name" />
                                 <asp:BoundField DataField="InspectionDate" HeaderText="Inspection Date" DataFormatString="{0: dd MMM yyyy}" />
                                <asp:BoundField DataField="HoursSpent" HeaderText="Hours Spent" />
                                 <asp:BoundField DataField="TotalInspectionCost" DataFormatString="{0:c}" HeaderText="Total Inspection Cost" />
                                 <asp:BoundField DataField="InspectionCostPaid"   HeaderText="Inspection Cost Paid" />
                                <asp:BoundField DataField="ServiceProvider"  HeaderText="Service Provider" />
                              <%--  <asp:BoundField DataField="NextInspectionDate"  ItemStyle-BackColor="#ccffff" DataFormatString="{0: dd MMM yyyy}"  HeaderText="Next Inspection Date" />--%>
                               <%-- <asp:BoundField DataField="Notes"  HeaderText="Notes" />--%>
                                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewInspection" CommandArgument='<%# Eval("PropertyInspectionID") %>' ToolTip="View Inspection details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                           
   <asp:SqlDataSource ID="sdsInspection" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyInspectionList" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="PropertyID" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="PropertyInspectionID" Type="Int32" />
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
