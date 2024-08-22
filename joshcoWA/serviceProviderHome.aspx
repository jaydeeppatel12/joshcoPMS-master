<%@ Page Title="" Language="C#" MasterPageFile="ServiceProvider.Master" AutoEventWireup="true" CodeBehind="serviceProviderHome.aspx.cs" Inherits="joshcoWA.serviceProviderHome" %>
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
 
                         <table >
                             <tr>
                                 <td>
                                   
   <table class="nav-justified">
                                                 <tr>
                                                      <td style="width:20%; vertical-align:top;">
         <div  style="width:100%;" class="col-md-4 grid-margin stretch-card">
              <div class="card" id="tbTenant" runat="server" >
                <div class="card-body">
                  <h4 class="card-title">Work Orders</h4>
                  <div class="media">
                      <table>
                          <tr>
                              <td>  
                                  <asp:LinkButton ID="lblTotalWorkOrders" runat="server" Font-Bold="True" Font-Size="35pt" ForeColor="#005d63" Text="0" Width="100px" OnClick="lblTotalWorkOrders_Click"></asp:LinkButton>
                              </td>
                          </tr>
                          <tr>
                              <td>  
                                   <asp:Label ID="Label1" runat="server" Font-Size="9pt" Text="Total" ForeColor="#005D63" Visible="False" Width="100px"></asp:Label>
                              </td>
                          </tr>
                      </table>
                                         
                    <div class="media-body">
                     <table>
                          <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                   <asp:LinkButton ID="lblTotalInProgress" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblTotalInProgress_Click"></asp:LinkButton>
                                                                   
                                                                </td>
                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                     <asp:Label ID="Label10" runat="server" Font-Size="8pt" Text="In Progress"></asp:Label>
                                                                    
                                                                </td>
                                                            </tr>
                          <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                    <asp:LinkButton ID="lblTotalClosed" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblTotalClosed_Click"></asp:LinkButton>
                                                                  
                                                                   
                                                                </td>
                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                     <asp:Label ID="Label18" runat="server" Font-Size="8pt" Text="Closed" Width="80px"></asp:Label>
                                                                
                                                                </td>
                                                            </tr>
                          
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div> 
                                                        
                                                     </td>
                                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                     <td  style="width:20%; vertical-align:top;">
                                                               <div  style="width:100%;" class="col-md-4 grid-margin stretch-card">
              <div class="card" id="Div1" runat="server" >
                <div class="card-body">
                  <h4 class="card-title">Quotations</h4>
                  <div class="media">
                      <table>
                          <tr>
                              <td>  
                                  <asp:LinkButton ID="lblTotalQuotation" runat="server" Font-Bold="True" Font-Size="35pt" ForeColor="#005d63" Text="0" Width="100px" OnClick="lblTotalQuotation_Click"></asp:LinkButton>
                              </td>
                          </tr>
                          <tr>
                              <td>  
                                   <asp:Label ID="Label2" runat="server" Font-Size="9pt" Text="Total" ForeColor="#005D63" Visible="False" Width="100px"></asp:Label>
                              </td>
                          </tr>
                      </table>
                                         
                    <div class="media-body">
                     <table>
                          <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                   <asp:LinkButton ID="lblTotalNew" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblTotalNew_Click"></asp:LinkButton>
                                                                   
                                                                </td>
                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                     <asp:Label ID="Label3" runat="server" Font-Size="8pt" Text="New Invitation"></asp:Label>
                                                                    
                                                                </td>
                                                            </tr>
                          <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                    <asp:LinkButton ID="lblTotalAwarded" runat="server" Font-Size="15pt" Text="0" Width="50px" OnClick="lblTotalAwarded_Click"></asp:LinkButton>
                                                                  
                                                                   
                                                                </td>
                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                     <asp:Label ID="Label4" runat="server" Font-Size="8pt" Text="Awarded" Width="80px"></asp:Label>
                                                                
                                                                </td>
                                                            </tr>
                          
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div> 

 
                                                     </td>
                                                     <td>&nbsp;</td>
                                                     <td> 
                                                         &nbsp;</td>
                                                      <td>
                                                          &nbsp;</td>
                                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:SqlDataSource ID="sdsDashBoard" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectServiceProviderDashBoard" SelectCommandType="StoredProcedure">
                                                         <SelectParameters>
                                                             <asp:SessionParameter DefaultValue="0" Name="ServiceProviderID" SessionField="ServiceProviderID" Type="Int32" />
                                                         </SelectParameters>
                                                         </asp:SqlDataSource>
                                                                     </td>
                                                     <td>
                                                         &nbsp;</td>
                                                 </tr>
                                                 
                                             </table>

                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     &nbsp;</td>
                             </tr>
                             <tr>
                                 <td>
                                       
                                     <br />
                                 </td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td>&nbsp;</td>
                             </tr>
                         </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
