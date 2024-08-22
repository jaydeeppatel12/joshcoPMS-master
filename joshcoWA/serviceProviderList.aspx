<%@ Page Title="" Language="C#" MasterPageFile="application/admin.Master" AutoEventWireup="true" CodeBehind="serviceProviderList.aspx.cs" Inherits="joshcoWA.serviceProviderList" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="addServiceProvider.ascx" TagPrefix="uc1" TagName="addServiceProvider" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <link rel="stylesheet" href="css/PopUp.css" />

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
                                                        <asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="500" Y="0"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         
<div class="form-wrap"  style="width:800px; padding:15px; margin-top:50px; "  >
 
    <div class="block-20;">
    <h3 id="hdlLeaseHeader" class="heading"><asp:Label ID="lblLeaseDocHeader" runat="server" Text="Service Provider Details"></asp:Label>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
       <uc1:addServiceProvider runat="server" id="addServiceProvider" />
        </div>
    </div>
                                                   
</asp:Panel>

            <section class="site-section"  >
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px;height:1500px"  >

    <h2 class="mb-5">Service Provider List<asp:Button ID="btnAddServiceProvider" runat="server" style=" vertical-align:bottom; float:right; padding:0; font-size:small;" Text="+ New service provider" CssClass="btn btn-primary" OnClick="btnAddServiceProvider_Click" /></h2>
     
     <asp:GridView ID="gvServiceProvider" runat="server" AutoGenerateColumns="False" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                            <Columns>
                                <asp:BoundField DataField="ServiceProviderName" HeaderText="Provider Name" />
                                 <asp:BoundField DataField="EntityType" HeaderText="Entity Type" />
                                <asp:BoundField DataField="RegistrationNumber" HeaderText="Reg Number" />
                                <asp:BoundField DataField="Telephone"  HeaderText="Telephone" />
                                <asp:BoundField DataField="Fax" HeaderText="Fax" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="PhysicalAddress" HeaderText="Physical Address" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewProvider" CommandArgument='<%# Eval("ServiceProviderID") %>' ToolTip="View Provider details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#66C0C2" ForeColor="White" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                           
    <asp:SqlDataSource ID="sdsProvider" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectProviderList" SelectCommandType="StoredProcedure" InsertCommand="InsertServiceProvider" InsertCommandType="StoredProcedure" OnInserted="sdsProvider_Inserted">
                                <InsertParameters>
                                    <asp:Parameter Name="ServiceProviderName" Type="String" />
                                    <asp:Parameter Name="PhysicalAddress" Type="String" />
                                      <asp:Parameter Name="PhysicalAddressCode" Type="Int32" />
                                    <asp:Parameter Name="PostalAddress" Type="String" />
                                    <asp:Parameter Name="PostalAddressCode" Type="Int32" />
                                    <asp:Parameter Name="EntityTypeID" Type="Int32" />
                                    <asp:Parameter Name="RegistrationNumber" Type="String" />
                                    <asp:Parameter Name="Telephone" Type="String" />
                                    <asp:Parameter Name="Fax" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="BEECertificate" Type="Boolean" />
                                    <asp:Parameter Name="BEELevelID" Type="Int32" />
                                    <asp:Parameter DbType="Date" Name="BEEExpiringDate" />
                                    <asp:Parameter Name="TaxClearance" Type="Boolean" />
                                    <asp:Parameter DbType="Date" Name="TaxClearanceExpiringDate" />
                                    <asp:Parameter Name="BEE_Ownership" Type="String" />
                                    <asp:Parameter Name="NonVatRegistered" Type="Boolean" />
                                    <asp:Parameter Name="VatRegisteredNumber" Type="String" />
                                    <asp:Parameter Name="ContactPersonName" Type="String" />
                                    <asp:Parameter Direction="InputOutput" Name="ServiceProviderID" Type="Int32" />
                                    <asp:Parameter Name="BankName" Type="String" />
                                    <asp:Parameter Name="BranchCode" Type="String" />
                                    <asp:Parameter Name="AccountNumber" Type="String" />
                                </InsertParameters>
                                
                         </asp:SqlDataSource>
    
    
    <br />
    <br />
   
     </div>
     </div>
     </div>
     </div>
             </section>
</asp:Content>
