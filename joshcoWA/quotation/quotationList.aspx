<%@ Page Title="" Language="C#" MasterPageFile="quotation.Master" AutoEventWireup="true" CodeBehind="quotationList.aspx.cs" Inherits="joshcoWA.quotation.quotationList" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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

    <h2 class="mb-5">Quotation List<asp:Button ID="btnSupplier" runat="server" style=" vertical-align:bottom; float:right; " Text="+ New invitation" CssClass="btn btn-warning" PostBackUrl="quotationAdd.aspx" /></h2>
     <%--<form class="search-form" action="#" style="width:250px">
              
              <input type="search" class="form-control" placeholder="Search Here" title="Search here">
         <i class="icon-search"></i>
            </form>--%>
                                             <div style="float:left; margin-top: -20px;  color:#66c0c2; width:100%;"> 
                                                 <asp:Label ID="lblTotalProperties" runat="server" Text=""></asp:Label>
                                                     <asp:HyperLink ID="hlkAdvancedSearch" runat="server" style="float:right;">+ Search</asp:HyperLink>
   </div>
                                                              
                     <asp:Panel ID="pnlAdvancedSearch"  runat="server">
                    <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                          <table style="width: 100%">
                        <tr>
                            <td style="width: 118px">
                                Reference No.</td>
                            <td>
                                <input  runat="server" id="txtAppName" type="text" width="250px" class="form-control"/>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">Due Date</td>
                            <td>
                                <table style="width: 108px">
                                    <tr>
                                        <td>From</td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpStartDate" Runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>To</td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpEndDate" Runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="vertical-align:top;"> <asp:Image ID="hlkCloseAdvancedSearch" runat="server" ImageUrl="../images/close.png" Width="10px" ToolTip="Close search"  style="float:right;  " />  </td>
                        </tr>
                        <tr>
                            <td style="width: 118px">Property </td>
                            <td>
                                <asp:DropDownList ID="ddlProperty" runat="server" AppendDataBoundItems="True" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID" CssClass="btn-outline-warning btn-fw">
                                    <asp:ListItem Value="0">-- All --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT Distinct p.PropertyID, p.PropertyName FROM [dbo].[InvitationToQuote] A
 
join [Property]p
on A.PropertyID = p.PropertyID
 ORDER BY p.PropertyName"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td style="width: 121px">&nbsp;</td>
                            <td>
                                <asp:Button ID="Button2" runat="server" CausesValidation="false" CssClass="btn btn-warning" OnClick="Button2_Click1" style="float:right;" Text="Search" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                       
                    </table>
                        </div>
                </asp:Panel>
     <asp:GridView ID="gvQuotation" runat="server" AutoGenerateColumns="False" OnRowCommand="gvQuotation_RowCommand" RowDataBound="gvQuotation_RowDataBound" datakeynames="InvitationToQuoteID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                      <Columns>
                               <asp:BoundField DataField="ReferenceNumber" HeaderText="Reference No." />
                                 <asp:BoundField DataField="PropertyName" HeaderText="Property" />
                                <asp:BoundField DataField="QuoteTitle" HeaderText="Title" />
                                
                                <asp:BoundField DataField="DueDate" HeaderText="DueDate" />
                                <asp:BoundField DataField="ContactPerson"  HeaderText="Contact Person" />
                                <asp:BoundField DataField="ContactEmail" HeaderText="Contact Email" />
      
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewQuotation" CommandArgument='<%# Eval("InvitationToQuoteID") %>' ToolTip="View Quotation details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 
                            </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                           
  <asp:SqlDataSource ID="sdsQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectInvitationToQuote" SelectCommandType="StoredProcedure" >
                              
                                
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="PropertyID" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="InvitationToQuoteID" Type="Int32" />
                                </SelectParameters>
                                
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
