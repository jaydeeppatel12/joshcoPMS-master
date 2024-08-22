<%@ Page Title="" Language="C#" MasterPageFile="ServiceProvider.Master" AutoEventWireup="true" CodeBehind="serviceProviderWorkOrder.aspx.cs" Inherits="joshcoWA.serviceProviderWorkOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

    <h2 class="mb-5">Work Order List</h2>
      <div style="float:left; margin-top: -20px;  color:#66c0c2;"> 
    <asp:LinkButton ID="lblNew" runat="server" Font-Bold="true" style="margin-top: -20px; color:#66c0c2;" OnClick="lblNew_Click">New - </asp:LinkButton>
    <asp:LinkButton ID="lblInProgress" runat="server"  style="margin-top: -20px; color:#66c0c2;" OnClick="lblInProgress_Click">In Progress - </asp:LinkButton>
    <asp:LinkButton ID="lblCompleted" runat="server"  style="margin-top: -20px; color:#66c0c2;" OnClick="lblCompleted_Click"> Completed</asp:LinkButton>
   </div>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                         <Columns>
                                <asp:BoundField DataField="RefNumber" HeaderText="Ref#" />
                                        <asp:BoundField DataField="PropertyName" HeaderText="Property Name" />
                                 <asp:BoundField DataField="PropertyUnit" HeaderText="Unit" />
                                <asp:BoundField DataField="FacilityManagementCategory"  HeaderText="Category" />
                                <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-Width="35%" />
                         
                                 <asp:BoundField DataField="StartDate" DataFormatString="{0:d}" HeaderText="Start Date" />
                                <asp:BoundField DataField="EndDate" DataFormatString="{0:d}"  HeaderText="EndDate" />
                       
                               
                                 <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Total Cost">
                                       <ItemTemplate>
                                          <%# Eval("TotalCost", "{0:C0}") %>
                                           <asp:HiddenField ID="hfTotalCost" Value=' <%# Eval("TotalCost") %>'  runat="server" />
                                       </ItemTemplate>
                                       <FooterTemplate >
                                           <asp:Label ID="lblTotal"  Font-Bold="True" runat="server" ></asp:Label>

                                       </FooterTemplate>
                                   </asp:TemplateField>

                                <asp:BoundField DataField="LatestStatus" HeaderText="Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hfBackColour" runat="server" Value='<%# Eval("BackColour") %>' />
                                            <asp:HiddenField ID="hfStatus" runat="server" Value='<%# Eval("LatestStatus") %>' />
                                              <asp:HiddenField ID="hfCategory" runat="server" Value='<%# Eval("FacilityManagementCategory") %>' />
                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="View" CommandArgument='<%# Eval("FacilityManagementID") %>' ToolTip="View details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />                        
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
     <asp:SqlDataSource ID="sdsFacilityManagement" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectServiceProviderWorkOrderList" SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:SessionParameter DefaultValue="0" Name="ServiceProviderID" SessionField="ServiceProviderID" Type="Int32" />
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
