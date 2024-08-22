<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="adminUserList.aspx.cs" Inherits="joshcoWA.adminUserList" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
 
<%@ Register Src="addAdminUser.ascx" TagPrefix="uc1" TagName="addAdminUser" %>
 


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
       <%-- <link rel="stylesheet" href="../css/PopUp.css" />    
                                                        <asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="500" Y="0"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>--%>

 <%--<asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         
 <div style="padding:15px; color:black;" class="alert alert-success mt-4 align-items-left">
    <h3 id="hdlLeaseHeader" class="heading"><asp:Label ID="lblLeaseDocHeader" runat="server" Text="Admin User Account"></asp:Label>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
<uc1:addAdminUser runat="server" id="addAdminUser" />
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
 
    <h2 class="mb-5">Joshco User Accounts<asp:Button ID="btnAddUserAccount" runat="server" style=" vertical-align:bottom; float:right;"  Text="+ New account" CssClass="btn btn-warning" PostBackUrl="adminUserAccountAdd.aspx" /></h2>
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
                             <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsUser" runat="server" ConnectionString="<%$ ConnectionStrings:JoshcoCS %>" SelectCommand="SelectAdminUserList" SelectCommandType="StoredProcedure">
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