<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="PaymentReturn.aspx.cs" Inherits="joshcoWA.tenant.PaymentReturn" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<%--<link rel="stylesheet" href="../css/PopUp.css" />

 <asp:LinkButton ID="lnkPaymentStatus" runat="server"></asp:LinkButton>
 <asp:ModalPopupExtender ID="mpePaymentStatus" runat="server" PopupControlID="pnlPaymentStatus" TargetControlID="lnkPaymentStatus"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="500" Y="0"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>

<asp:Panel ID="pnlPaymentStatus" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         
<div class="form-wrap"  style="width:800px; padding:15px; margin-top:50px; "  > 
    <div class="block-20;">
    <h3 id="hdlLeaseHeader" class="heading"><asp:Label ID="lblLeaseDocHeader" runat="server" Text="Online Payment"></asp:Label>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
    <table style="width:100%">
            <tr>
                <td>                    
                     Congratulations, your payament was successfull!
                </td>
            </tr>                       
        </table>
        </div>
    </div>                                                
</asp:Panel>--%>
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

    <h2 class="mb-5">Rental Payment List</h2>    
                                            
   <asp:GridView ID="gvPaymentHistory" runat="server" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" datakeynames="LeaseRentPaidID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" >
                 <AlternatingRowStyle BackColor="#f0f0f0" />
                 <Columns>
                    <asp:BoundField DataField="FinYear"
                        SortExpression="FinYear" HeaderText="FinYear" /> 
                        <asp:BoundField DataField="LeaseRentID"
                        SortExpression="LeaseRentID" HeaderText="LeaseRentID"/> 
                    <asp:BoundField DataField="AmountPaid"
                        SortExpression="AmountPaid" HeaderText="Amount Paid" /> 
                     <asp:BoundField DataField="PaymentSource"
                        SortExpression="PaymentSource" HeaderText="Payment Source" />   
                     <asp:BoundField DataField="ReferenceNo"
                        SortExpression="ReferenceNo" HeaderText="Reference Number" />   
                      <asp:BoundField DataField="PayFastPaymentId"
                        SortExpression="PayFastPaymentId" HeaderText="PayFastPaymentID" />   
                    <asp:BoundField DataField="DatePaid"
                        SortExpression="DatePaid" HeaderText="Date Paid" />
                </Columns>          
                <EmptyDataTemplate>
                    <div align="center">No records found.</div>
                </EmptyDataTemplate>
                <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />                         
                <RowStyle HorizontalAlign="Left" BackColor="White" />                         
    </asp:GridView>                   
      
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