<%@ Page Title="" Language="C#" MasterPageFile="application/admin.Master" AutoEventWireup="true" CodeBehind="serviceProviderUserList.aspx.cs" Inherits="joshcoWA.serviceProviderUserList" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="addServiceProviderUser.ascx" TagPrefix="uc1" TagName="addServiceProviderUser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <link rel="stylesheet" href="css/PopUp.css" />

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
                                                        <asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="500" Y="0"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         
<div class="form-wrap"  style="width:800px; padding:15px; margin-top:50px; "  >
 
    <div class="block-20;">
    <h3 id="hdlLeaseHeader" class="heading"><asp:Label ID="lblLeaseDocHeader" runat="server" Text="Service Provider User Account"></asp:Label>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
       <uc1:addServiceProviderUser runat="server" id="addUser" />
        </div>
    </div>
                                                   
</asp:Panel>


                    <section class="site-section"  >
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px; height:1500px; "  >
 
    <h2 class="mb-5">Service Provider User Accounts<asp:Button ID="btnAddUserAccount" runat="server" style=" vertical-align:bottom; float:right; padding:0; font-size:small;" Text="+ New account" CssClass="btn btn-primary" OnClick="btnAddUserAccount_Click" /></h2>
                        <asp:Label ID="lblTotalAccounts" runat="server" Text=""></asp:Label>
  
                        <br />
 
                          
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" DataSourceID="sdsUser"   >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                        <asp:BoundField DataField="UserFirstName" HeaderText="Name" />
                                 <asp:BoundField DataField="UserSurname" HeaderText="Surname" />
                                <asp:BoundField DataField="UserEmailAddress" HeaderText="Email Address" />
                                <asp:BoundField DataField="UserContactNo" HeaderText="Contact No." />
                         <asp:BoundField DataField="UserGroup" HeaderText="User Group" />
<asp:BoundField DataField="UserActive" HeaderText="Active/Deactive" />
 
                                <asp:TemplateField>
                                    <ItemTemplate>
                                               <asp:HiddenField ID="hfUserActive" runat="server" Value='<%# Eval("UserActive") %>' />
                             


                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewUser" CommandArgument='<%# Eval("UserID") %>' ToolTip="View user details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#66C0C2" ForeColor="White" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsUser" runat="server" ConnectionString="<%$ ConnectionStrings:JoshcoCS %>" SelectCommand="SelectServiceProviderUserList" SelectCommandType="StoredProcedure">
                         </asp:SqlDataSource>


        <br />
    <br />
   
     </div>

    
     </div>
     </div>
     </div>
             </section>
           </ContentTemplate>

</asp:UpdatePanel>    
</asp:Content>
