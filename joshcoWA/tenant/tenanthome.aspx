<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="tenanthome.aspx.cs" Inherits="joshcoWA.tenanthome" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="site-section">
        <%--asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
        <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div id="divErrorMessage" runat="server" visible="false" class="alert alert-danger"> 
          <asp:Label ID="lblErrorMessage" runat="server" visible="false" ></asp:Label>
      </div>
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">

                                <table style="width:100%">
                                    <tr>
                                        <td style="width:20%; vertical-align:top;">
              <div  style="width:100%;" class="col-md-4 grid-margin stretch-card">
              <div class="card" id="tbMaintenanceQueries" runat="server" >
                <div class="card-body">
                  <h4 class="card-title">Queries </h4>
                  <div class="media">
                                              
                    <div class="media-body">
                                                              <table>
                                                                <tr>
                                                                <td style="width: 11px; text-align:right;">                                                              
                                                                    <asp:LinkButton ID="lnkQueriesInProgress" runat="server" Font-Size="10pt" Text="0" Width="50px" OnClick="lnkQueriesInProgress_Click"></asp:LinkButton>
                                                                </td>
                                                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="lblQueriesInProgress" runat="server" Font-Size="8pt" Text="In progress" Width="75px"></asp:Label>
                                                                </td>
                                                            </tr>
                                                             <tr>
                                                                <td style="width: 11px; text-align:right;"> 
                                                                      <asp:LinkButton ID="lnkQueriesClosed" runat="server" Font-Size="10pt" Text="0" Width="50px" OnClick="lnkQueriesClosed_Click"></asp:LinkButton>                                                                   
                                                                </td>
                                                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="lblQueriesClosed" runat="server" Font-Size="8pt" Text="Completed" Width="65px"></asp:Label>
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
                                             <div  style="width:100%;" class="col-md-4 grid-margin stretch-card">
              <div class="card" id="tbGeneralQueries" runat="server" >
                <div class="card-body">
                  <h4 class="card-title">Complaints </h4>
                  <div class="media">                    
                                         
                    <div class="media-body">
                     <table>
                                                             <tr>
                                                                <td style="width: 11px; text-align:right;">
                                                                   <asp:LinkButton ID="lnkComplaintsInProgress" runat="server" Font-Size="10pt" Text="0" Width="50px" OnClick="lnkComplaintsInProgress_Click"></asp:LinkButton>
                                                                   
                                                                </td>
                                                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                     <asp:Label ID="lblComplaintsInProgress" runat="server" Font-Size="8pt" Text="In progress"></asp:Label>
                                                                    
                                                                </td>
                                                            </tr>
                                                                <tr>
                                                                <td style="width: 11px; text-align:right;">  
                                                                    <asp:LinkButton ID="lnkComplaintsClosed" runat="server" Font-Size="10pt" Text="0" Width="50px" OnClick="lnkComplaintsClosed_Click"></asp:LinkButton>                                                                  
                                                                   
                                                                </td>
                                                                <td style="width: 5px;">&nbsp;</td>
                                                                <td style="text-align: left">
                                                                     <asp:Label ID="lblComplaintsClosed" runat="server" Font-Size="8pt" Text="Completed" Width="80px"></asp:Label>                                                                
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
   <div  style="width:100%;" class="col-md-4 grid-margin stretch-card">
              <div class="card" id="tbPaymentsDue" runat="server" >
                <div class="card-body">
                  <h4 class="card-title">Rental</h4>
                  <div class="media">
                   <div class="media-body">
                     <table> 
                                                           
                                                            <tr>
                                                                <td style="width: 11px; text-align:right";>
                                                                    <asp:LinkButton ID="lnkNiteyDays" runat="server" Font-Size="10pt" Text="0"  ></asp:LinkButton>
                                                                </td>
                                                                 <td>&nbsp;</td>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="lblNiteyDays" runat="server" Font-Size="8pt" Text="90 days"></asp:Label>
                                                                </td>
                                                                 <td>&nbsp;</td>
                                                                 <td>&nbsp;</td>
                                                            </tr>    
                                                            <tr>
                                                                <td style="width: 11px; text-align:right";>
                                                                    <asp:LinkButton ID="lnkSixtyDays" runat="server" Font-Size="10pt" Text="0"  ></asp:LinkButton>
                                                                </td>
                                                                 <td>&nbsp;</td>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="lblSixtyDays" runat="server" Font-Size="8pt" Text="60 days"></asp:Label>
                                                                </td>
                                                                 <td>&nbsp;</td>
                                                                 <td>&nbsp;</td>
                                                            </tr>      
                                                            <tr>
                                                                <td style="width: 11px; text-align:right";>
                                                                    <asp:LinkButton ID="lnkThirtyDays" runat="server" Font-Size="10pt" Text="0"  ></asp:LinkButton>
                                                                </td>
                                                                 <td>&nbsp;</td>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="lblThirtyDays" runat="server" Font-Size="8pt" Text="30 days"></asp:Label>
                                                                </td>
                                                                 <td>&nbsp;</td>
                                                                 <td>&nbsp;</td>
                                                            </tr>                       
                                                            <tr>
                                                                <td style="width: 11px; text-align:right";>
                                                                    <asp:LinkButton ID="lnkRentalDue" runat="server" Font-Size="10pt" Text="0" OnClick="lnkRentalDue_Click" ></asp:LinkButton>
                                                                </td>
                                                                 <td>&nbsp;</td>
                                                                <td style="text-align: left">
                                                                    <asp:Label ID="lblRentalDue" runat="server" Font-Size="8pt" Text="Current rental due"></asp:Label>
                                                                </td>
                                                                 <td>&nbsp;</td>
                                                                 <td>&nbsp;</td>
                                                             </tr>
                                                             <tr>
                                                                <td  style="width: 11px; text-align:right;">
                                                                    <asp:LinkButton ID="lnkTotalAmountDue" runat="server" Font-Size="10pt" Text="0" OnClick="lnkTotalAmountDue_Click"></asp:LinkButton>
                                                                </td>
                                                                  <td>&nbsp;</td>
                                                                <td style="text-align: left"> 
                                                                    <asp:Label ID="lblTotalAmountDue" runat="server" Font-Size="8pt"  Text="Total amount due" ></asp:Label>
                                                                </td>
                                                                  <td>&nbsp;</td>
                                                                <td>                                                                   
                                                                  <asp:LinkButton ID="lnkPay"   style="font-size: small" CausesValidation="false"  runat="server" OnClick="lnkPay_Click">Pay Now...</asp:LinkButton>                     
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