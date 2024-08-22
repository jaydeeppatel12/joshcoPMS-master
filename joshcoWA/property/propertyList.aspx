<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="propertyList.aspx.cs" Inherits="joshcoWA.propertyList" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="propertyForm.ascx" TagPrefix="uc1" TagName="propertyForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <link rel="stylesheet" href="../css/PopUp.css" />

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
                                                        <asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="500" Y="0"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         
<div class="form-wrap"  style="width:800px; padding:15px; margin-top:50px; "  >
 
    <div class="block-20;">
    <h3 id="hdlLeaseHeader" class="heading"><asp:Label ID="lblLeaseDocHeader" runat="server" Text="Property Details"></asp:Label>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
        <uc1:propertyForm runat="server" id="propertyForm" />
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
 
    <h2 class="mb-5">Properties<asp:Button ID="btnAddProperty" runat="server" style=" vertical-align:bottom; float:right;  " Text="+ New property" CssClass="btn btn-warning" OnClick="btnAddProperty_Click" /></h2>
                        <asp:Label ID="lblTotalProperties" runat="server" Text=""></asp:Label>
    <div style="float:right; width:250px">
                            <table><tr><td>
                            <input type="text" id="txtSearch" runat="server"  class="form-control py-2 " /></td><td><asp:Button ID="btnSearch" runat="server" style=" vertical-align:bottom; float:right;  " OnClick="SearchProperty" Text="Search" ToolTip="Search"  CssClass="btn btn-warning" /></td></tr></table> </div> 

 <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyList" SelectCommandType="StoredProcedure"   >
                                
                        </asp:SqlDataSource>
                        <br />
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
