<%@ Page Title="" Language="C#" MasterPageFile="applicant.Master" AutoEventWireup="true" CodeBehind="paymentDepositReturn.aspx.cs" Inherits="joshcoWA.applicant.paymentDepositReturn" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<%--<link rel="stylesheet" href="../css/PopUp.css" />

 <asp:LinkButton ID="lnkPaymentStatus" runat="server"></asp:LinkButton>
 <asp:ModalPopupExtender ID="mpeApplicationDeposit" runat="server" PopupControlID="pnlApplicationDeposit" TargetControlID="lnkPaymentStatus"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="500" Y="0"  PopupDragHandleControlID="hdlApplicationDepositHeader" >
</asp:ModalPopupExtender>--%>

<%--<asp:Panel ID="pnlApplicationDeposit" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         
<div class="form-wrap"  style="width:800px; padding:15px; margin-top:50px; "  > 
    <div class="block-20;">
    <h3 id="hdlApplicationDepositHeader" class="heading">
        <asp:Label ID="lblApplicationDepositDocHeader" runat="server" Text="Online Payment"></asp:Label>
     <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"/></h3>
    <table style="width:100%">
            <tr>
                <td>                    
                     Congratulations, your deposit payment was successfull!
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

    <h2 class="mb-5">Application Deposit</h2>    
                 <asp:GridView ID="gvApplicationDeposit" runat="server" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" datakeynames="ApplicationDepositID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left">
                 <AlternatingRowStyle BackColor="#f0f0f0" />
                 <Columns>
                    <asp:BoundField DataField="ApplicationID"
                        SortExpression="ApplicationID" HeaderText="ApplicationID" />                 
                    <asp:BoundField DataField="DepositAmount"
                        SortExpression="DepositAmount" HeaderText="Deposit Amount" />                        
                    <asp:BoundField DataField="DepositSource"
                        SortExpression="DepositSource" HeaderText="Deposit Source" />
                      <asp:BoundField DataField="ReferenceNo"
                        SortExpression="ReferenceNo" HeaderText="Reference Number" />
                      <asp:BoundField DataField="PayFastPaymentID"
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