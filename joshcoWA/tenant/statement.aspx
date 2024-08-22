<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="statement.aspx.cs" Inherits="joshcoWA.statement" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
    <link rel="stylesheet" href="../css/PopUp.css" />
 <asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton> 
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="500" Y="0"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         
<div class="form-wrap"  style="width:800px; padding:15px; margin-top:50px; "  >
 
    <div class="block-20;">
    <h3 id="hdlLeaseHeader" class="heading"><asp:Label ID="lblLeaseDocHeader" runat="server" Text="Online Payment"></asp:Label>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
    <table style="width:100%">
            <tr>
                <td>
                Online payment feature coming soon...</td>
            </tr>
                       
        </table>
        </div>
    </div>
                                                   
</asp:Panel>
             
 

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
 
    <h2 class="mb-5">My Statement</h2>
                      
                        <br />
          <asp:GridView ID="gvInvoice" runat="server" AutoGenerateColumns="False" DataSourceID="sdsInvoice" CellPadding="2" CellSpacing="2" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvInvoice_RowCommand" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                <asp:BoundField DataField="FinYear" HeaderText="Year" />
                                <asp:BoundField DataField="Mon" HeaderText="Month" />
                                <asp:BoundField DataField="Rent" DataFormatString="{0:C}"  HeaderText="Rental Amount"/>
 <asp:BoundField DataField="AddCost" DataFormatString="{0:C}"  HeaderText="Additional Amount"/>
                       <asp:BoundField DataField="Paid" DataFormatString="{0:C}"  HeaderText="Amount Paid"/>  
                                 <asp:BoundField DataField="AmountDue" DataFormatString="{0:C}"  HeaderText="Amount Due"/>            
                                <%--<asp:TemplateField HeaderText="Print Invoice">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkInvoice" CausesValidation="false" CommandName="Print" CommandArgument='<%# Eval("MonNo") %>' runat="server">Print Invoice</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>     --%>                          
                            </Columns>
                              <EmptyDataTemplate>
                                    <div align="center">No records found.</div>
                              </EmptyDataTemplate>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                             <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:SqlDataSource ID="sdsInvoice" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectTenantInvoiceList" SelectCommandType="StoredProcedure" >
                           
                                <SelectParameters>
                                    <asp:SessionParameter Name="LeaseID" SessionField="AppLeaseID" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="Mon" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="Year" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource>
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
