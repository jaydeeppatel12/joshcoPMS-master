<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="joshcoWA.applicationHome.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 75px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="site-section">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">
                                <table border="1"  style="width:100%; overflow-x:scroll">
                                    <tr>
                                        <td  style="vertical-align:top;">   <%-- width:20%; --%>
                                         <div  style="width:100%;" class="col-md-3 grid-margin stretch-card">
                                            <div class="card" id="tbProperty" runat="server" >
                                                 <div class="card-body">
                                                    <h4 class="card-title">Properties</h4>
                                                     <div class="media">
                                                     <table  border="1">
                          <tr>
                              <td> <asp:LinkButton ID="lblPropertyTotal" runat="server" Font-Bold="True" Font-Size="35pt" ForeColor="#005d63" Text="0" OnClick="lblPropertyTotal_Click" Width="100px"></asp:LinkButton></td>
                          </tr>
                          <tr>
                              <td>  <asp:Label ID="Label6" runat="server" Font-Size="9pt" Text="Total" ForeColor="#005D63" Visible="False" Width="100px"></asp:Label></td>
                          </tr>
                      </table>
                                         
                    <div class="media-body">
                     <table>
                          <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                  
                                                                    <asp:LinkButton ID="lblUnitOcuppiedTotal" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblUnitOcuppiedTotal_Click"></asp:LinkButton>
                                                                </td>
                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="Label2" runat="server" Font-Size="8pt" Text="Units Occupied" Width="75px"></asp:Label>
                                                                </td>
                                                            </tr>
                          <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                      <asp:LinkButton ID="lblVacantUnitTotal" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblVacantUnitTotal_Click"></asp:LinkButton>
                                                                   
                                                                </td>
                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="Label5" runat="server" Font-Size="8pt" Text="Vacant Units" Width="65px"></asp:Label>
                                                                </td>
                                                            </tr>
                          
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>  
                                             </td>
                                            <td style="width:2%; vertical-align:top;">&nbsp;</td>
                                        <td style="width:20%; vertical-align:top;">
                                             <div  style="width:100%;" class="col-md-3 grid-margin stretch-card">
              <div class="card" id="tbTenant" runat="server" >
                <div class="card-body">
                  <h4 class="card-title">Tenants</h4>
                  <div class="media">
                      <table>
                          <tr>
                              <td>  
                                  <asp:LinkButton ID="lblTenantTotal" runat="server" Font-Bold="True" Font-Size="35pt" ForeColor="#005d63" Text="0" Width="100px" OnClick="lblTenantTotal_Click"></asp:LinkButton>
                              </td>
                          </tr>
                          <tr>
                              <td>  
                                   <asp:Label ID="Label8" runat="server" Font-Size="9pt" Text="Total" ForeColor="#005D63" Visible="False" Width="100px"></asp:Label>
                              </td>
                          </tr>
                      </table>
                                         
                    <div class="media-body">
                     <table>
                          <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                   <asp:LinkButton ID="f" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="f_Click"></asp:LinkButton>
                                                                   
                                                                </td>
                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                     <asp:Label ID="Label10" runat="server" Font-Size="8pt" Text="Moving In"></asp:Label>
                                                                    
                                                                </td>
                                                            </tr>
                          <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                    <asp:LinkButton ID="Label11" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="Label11_Click"></asp:LinkButton>
                                                                  
                                                                   
                                                                </td>
                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                     <asp:Label ID="Label18" runat="server" Font-Size="8pt" Text="Moving Out" Width="80px"></asp:Label>
                                                                
                                                                </td>
                                                            </tr>
                          
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div> 
                                        </td>
                                            <td style="width:2%; vertical-align:top;">&nbsp;</td>
                                        <td style="width:20%; vertical-align:top;">
   <div  style="width:100%;" class="col-md-3 grid-margin stretch-card">
              <div class="card" id="tbApplication" runat="server" >
                <div class="card-body">
                  <h4 class="card-title">Applications</h4>
                  <div class="media">
                      <table>
                          <tr>
                              <td><asp:LinkButton ID="lblApplicationTotal" runat="server" Font-Bold="True" Font-Size="35pt" ForeColor="#005d63" Text="0" OnClick="lblApplicationTotal_Click" Width="100px"></asp:LinkButton></td>
                          </tr>
                          <tr>
                              <td>  <asp:Label ID="Label14" runat="server" Font-Size="9pt" Text="Total" ForeColor="#005D63" Visible="False" Width="100px"></asp:Label></td>
                          </tr>
                      </table>
                                         
                    <div class="media-body">
                     <table>
                          <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                    <asp:LinkButton ID="lblPaidDepositTotal" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblPaidDepositTotal_Click"></asp:LinkButton>
                                                                </td>
                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="Label16" runat="server" Font-Size="8pt" Text="Paid Deposit"></asp:Label>
                                                                </td>
                                                            </tr>
                          <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                    <asp:LinkButton ID="lblPendingReviewTotal" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblPendingReviewTotal_Click"></asp:LinkButton>
                                                                </td>
                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="Label12" runat="server" Font-Size="8pt" Text="Pending Review" Width="80px"></asp:Label>
                                                                </td>
                                                            </tr>
                          
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>                            
</td>
                                          <td style="width:2%; vertical-align:top;">&nbsp;</td>
                                        
                                        <td style="width:20%; vertical-align:top;">
   <div style="width:100%;" class="col-md-3 grid-margin stretch-card">
              <div class="card" id="tbLease" runat="server" >
                <div class="card-body">
                  <h4 class="card-title">Leases</h4>
                  <div class="media">
                      <table>
                          <tr>
                              <td><asp:LinkButton ID="lblLeaseTotal" runat="server" Font-Bold="True" Font-Size="35pt" ForeColor="#005d63" Text="0" OnClick="lblLeaseTotal_Click" Width="100px"></asp:LinkButton></td>
                          </tr>
                          <tr>
                              <td>  <asp:Label ID="Label20" runat="server" Font-Size="9pt" Text="Total" ForeColor="#005D63" Visible="False" Width="100px"></asp:Label></td>
                          </tr>
                      </table>
                       <div class="media-body">   
                                   <table>
 <tr>
                                                                <td style="width: 11px; text-align:right;">      <asp:SqlDataSource ID="sdsDashBoard" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectHomeDashboard" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                                    <asp:LinkButton ID="lblActiveTotal" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblActiveTotal_Click"></asp:LinkButton>
                                                                </td>
     <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="Label21" runat="server" Font-Size="8pt" Text="Active"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                    <asp:LinkButton ID="lblExpiringTotal" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblExpiringTotal_Click"></asp:LinkButton>
                                                                </td>
                                                                  <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">   <asp:SqlDataSource ID="sdsDashBoard0" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectHomeDashboard" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                                    <asp:Label ID="Label22" runat="server" Font-Size="8pt" Text="Expiring" Width="80px"></asp:Label>
                                                                </td>
                                                            </tr>
                          
                      </table>

                                         </div>
                  </div>
                </div>
              </div>
            </div>                            
    
</td>
                                        
                                    

                                    </tr>
                                </table>


                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            

                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:Panel ID="pnlTenant" Height="350px" ScrollBars="Auto" runat="server" Width="100%">
                                                         <asp:SqlDataSource ID="sdsTenant" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectTenantList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="20pt" ForeColor="#005d63" Text="Tenants"></asp:Label>
                                                        <br />  <br />
 <asp:GridView ID="gvTenant" runat="server" AutoGenerateColumns="False" DataSourceID="sdsTenant"  Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvTenant_RowCommand" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                               <asp:BoundField DataField="FullName" HeaderText="Name" />
                              
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile No." />
                             <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" />
                         
                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                              

                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewTenant" CommandArgument='<%# Eval("TenantID") %>' ToolTip="View tenant details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                                                        </asp:Panel>
                                                     <asp:Panel ID="pnlProperties" Height="350px" ScrollBars="Auto" runat="server" Width="100%">
                                                          <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyList" SelectCommandType="StoredProcedure"   >
                                
                        </asp:SqlDataSource>
                         <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="20pt" ForeColor="#005d63" Text="Properties"></asp:Label>
                                                        <br />  <br />
 <asp:GridView ID="gvProperties" runat="server" AutoGenerateColumns="False" DataSourceID="sdsProperty"  Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvProperties_RowCommand" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                               <asp:BoundField DataField="PropertyName" HeaderText="Property Name" />
                              
                                <asp:BoundField DataField="UnitOccupied" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Units Occupied" />
                                <asp:BoundField DataField="UnitVacant" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Units Vacant" />
                         
                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                              

                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewProperty" CommandArgument='<%# Eval("PropertyID") %>' ToolTip="View property details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                          
                                                         </asp:Panel>
                                                    <asp:Panel ID="pnlApplication" Height="350px" ScrollBars="Auto" runat="server" Width="100%">
                                                        <asp:Label ID="LinkButton1" runat="server" Font-Bold="True" Font-Size="20pt" ForeColor="#005d63" Text="Applications"></asp:Label>
                                                        <br />
                                                        <asp:LinkButton ID="lnkAppNew" runat="server" Style="margin-top: -20px; font-size: 12px; color: #66c0c2;" OnClick="lnkAppNew_Click">New - </asp:LinkButton>
                                                        <asp:LinkButton ID="lnkAppReviewed" runat="server" Style="margin-top: -20px; font-size: 12px; color: #66c0c2;" OnClick="lnkAppReviewed_Click">Reviewed - </asp:LinkButton>
                                                        <asp:LinkButton ID="lnkSuccessfull" runat="server" Font-Bold="true" Style="margin-top: -20px; font-size: 12px; color: #66c0c2;" OnClick="lnkSuccessfull_Click"> Successful</asp:LinkButton>

                                                        <br /><br />
                                                        <asp:SqlDataSource ID="sdsApplication" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationList" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="0" Name="ApplicationID" Type="Int32" />
                                                                <asp:Parameter DefaultValue="All" Name="Filter" Type="String" />

                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <asp:GridView ID="gvApplication" runat="server" AutoGenerateColumns="False" CellPadding="3" Font-Size="12pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvApplication_RowCommand">
                                                            <AlternatingRowStyle BackColor="#f0f0f0" />
                                                            <Columns>
                                                                <asp:BoundField DataField="ApplicationDate" DataFormatString="{0:ddd, dd MMM yy}" HeaderStyle-Wrap="false" HeaderText="Date Received" >
                                                                <HeaderStyle Wrap="False" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="FullName" ItemStyle-Width="55%" HeaderStyle-Wrap="false" HeaderText="Applicant Name" >


                                                                <HeaderStyle Wrap="False" />
                                                                <ItemStyle Width="55%" />
                                                                </asp:BoundField>


                                                                <%--   <asp:BoundField DataField="PropertyName" HeaderStyle-Wrap="false"   HeaderText="Property Name " />--%>
                                                                <asp:BoundField DataField="ApplicationStatus" HeaderStyle-Wrap="false" ItemStyle-BackColor="#def0ed" HeaderText="Status" >
                                                                <HeaderStyle Wrap="False" />
                                                                <ItemStyle BackColor="#DEF0ED" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>

                                                                        <asp:HiddenField ID="hfPendingReview" runat="server" Value='<%# Eval("PendingReview") %>' />

                                                                        <asp:LinkButton ID="LinkButtson2" runat="server" CausesValidation="false" CommandName="ViewApplication" CommandArgument='<%# Eval("ApplicationID") %>' ToolTip="View Application details" ForeColor="#75C5CA">view</asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="gvHeader" ForeColor="#005d63" HorizontalAlign="Left" />

                                                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                                                        </asp:GridView>
                                                    </asp:Panel>

                                                    <asp:Panel ID="pnlLease" Height="350px" ScrollBars="Auto" runat="server" Width="100%">
                                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" ForeColor="#005d63" Text="Leases"></asp:Label>
                                                        <br />
                                                        <asp:LinkButton ID="lnkActive" runat="server" Font-Bold="true" Style="margin-top: -20px; font-size: 12px; color: #66c0c2;" OnClick="lnkActive_Click">Active - </asp:LinkButton>
                                                        <asp:LinkButton ID="lnkExpiring" runat="server" Style="margin-top: -20px; font-size: 12px; color: #66c0c2;" OnClick="lnkExpiring_Click">Expiring - </asp:LinkButton>
                                                        <asp:LinkButton ID="lnkExpired" runat="server" Style="margin-top: -20px; font-size: 12px; color: #66c0c2;" OnClick="lnkExpired_Click">Expired</asp:LinkButton>

                                                        <br /><br />

                                                        <asp:SqlDataSource ID="sdsLease" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseList" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="0" Name="LeaseID" Type="Int32" />
                                                                <asp:Parameter DefaultValue=" " Name="Filter" Type="String" />
                                                                <asp:Parameter DefaultValue=" " Name="Search" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>

                                                        <asp:GridView ID="gvLease" runat="server" AutoGenerateColumns="False" CellPadding="3" Font-Size="12pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvLease_RowCommand">
                                                            <AlternatingRowStyle BackColor="#f0f0f0" />
                                                            <Columns>
                                                                <asp:BoundField DataField="PropertyName" HeaderText="Property Name" HeaderStyle-Wrap="false" >
                                                                <HeaderStyle Wrap="False" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PropertyUnit" HeaderText="Unit" HeaderStyle-Wrap="false" >
                                                                <HeaderStyle Wrap="False" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="UnitArea" DataFormatString="{0: 0sqm}" HeaderStyle-Wrap="false" HeaderText="Area" >
                                                                <HeaderStyle Wrap="False" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="LesseeName" HeaderText="Lessee Name" HeaderStyle-Wrap="false" >

                                                                <HeaderStyle Wrap="False" />
                                                                </asp:BoundField>

                                                                <asp:BoundField DataField="Frequency" HeaderText="Lease Frequency" HeaderStyle-Wrap="false" >
                                                                <HeaderStyle Wrap="False" />
                                                                </asp:BoundField>
                                                                <%--  <asp:BoundField DataField="AmountDueThisMonth" DataFormatString="{0:c}" HeaderText="Amount Due This Month" />--%>
                                                                <%--   <asp:BoundField DataField="LeaseStartDate" DataFormatString="{0:d}" HeaderText="Commencement Date" />--%>
                                                                <asp:BoundField DataField="LeaseEndDate" DataFormatString="{0:ddd, dd MMM yy}" HeaderStyle-Wrap="false" HeaderText="Terminantion Date" >
                                                                <HeaderStyle Wrap="False" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="LeaseStatus" HeaderStyle-Wrap="false" ItemStyle-BackColor="#def0ed" HeaderText="Status" >

                                                                <HeaderStyle Wrap="False" />
                                                                <ItemStyle BackColor="#DEF0ED" />
                                                                </asp:BoundField>

                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:HiddenField ID="hfActive" runat="server" Value='<%# Eval("LeaseStatus") %>' />
                                                                        <asp:HiddenField ID="hfExpiring" runat="server" Value='<%# Eval("Expiring") %>' />
                                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="ViewLease" CommandArgument='<%# Eval("LeaseID") %>' ToolTip="View lease details" ForeColor="#75C5CA">view</asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="gvHeader" ForeColor="#005d63" HorizontalAlign="Left" />

                                                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                                                        </asp:GridView>
                                                    </asp:Panel>

                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <br />
                                            <br />
                                            <asp:SqlDataSource ID="sdsLatestNews" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectHomeTimeLine" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                            <div class="row">
                                                <div class="col-md-12">
                                                </div>
                                            </div>

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
