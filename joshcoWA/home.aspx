<%@ Page Title="" Language="C#" MasterPageFile="application/admin.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="joshcoWA.home1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="site-section"  >
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px;height:1500px"  >

    <h2 class="mb-5">Dashboard</h2>
   <table class="nav-justified">
                                                 <tr>
                                                     <td>
                                                         <table style="height: 200px; border: 2px solid #339966; width: 200px; text-align: center;">
                                                             <tr>
                                                                 <td colspan="2" style="height: 100%; vertical-align: bottom;background-color:#66c0c2;">
                                                                     <asp:LinkButton ID="lblPropertyTotal" runat="server" Font-Bold="true" Font-Size="80pt" ForeColor="#FFFFFF" Text="0" OnClick="lblPropertyTotal_Click"></asp:LinkButton>
                                                                     <br />
                                                                     <asp:Label ID="Label6" runat="server" Font-Size="12pt" Text="Properties" ForeColor="#FFFFFF"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px; height: 13px;">
                                                                 </td>
                                                                 <td style="height: 13px">
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px">   <asp:SqlDataSource ID="sdsDashBoard" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectHomeDashboard" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                                     <asp:LinkButton ID="lblUnitOcuppiedTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblUnitOcuppiedTotal_Click"></asp:LinkButton>
                                                                 </td>
                                                                 <td style="text-align: left">
                                                                     <asp:Label ID="Label4" runat="server" Font-Size="8pt" Text="Units Occupied"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px">
                                                                     <asp:LinkButton ID="lblVacantUnitTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblVacantUnitTotal_Click"></asp:LinkButton>
                                                                 </td>
                                                                 <td style="text-align: left">
                                                                     <asp:Label ID="Label5" runat="server" Font-Size="8pt" Text="Vacant Units"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </td>
                                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                     <td>
                                                         <table style="height: 200px; border: 2px solid #339966; width: 200px; text-align: center;">
                                                             <tr>
                                                                 <td colspan="2" style="height: 100%; vertical-align: bottom;background-color:#66c0c2;">
                                                                     <asp:LinkButton ID="lblTenantTotal" runat="server" Font-Bold="true" Font-Size="80pt" ForeColor="#FFFFFF" Text="0"></asp:LinkButton>
                                                                     <br />
                                                                     <asp:Label ID="Label8" runat="server" Font-Size="12pt" Text="Tenants" ForeColor="#FFFFFF"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px; height: 13px;">
                                                                 </td>
                                                                 <td style="height: 13px">
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px">
                                                                     <asp:LinkButton ID="f" runat="server" Font-Size="20pt" Text="0" Width="50px"></asp:LinkButton>
                                                                 </td>
                                                                 <td style="text-align: left">
                                                                     <asp:Label ID="Label10" runat="server" Font-Size="8pt" Text="Moving In"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px">
                                                                     <asp:LinkButton ID="Label11" runat="server" Font-Size="20pt" Text="0" Width="50px"></asp:LinkButton>
                                                                 </td>
                                                                 <td style="text-align: left">
                                                                     <asp:Label ID="Label18" runat="server" Font-Size="8pt" Text="Moving Out"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </td>
                                                     <td>&nbsp;</td>
                                                     <td> 
                                                         &nbsp;</td>
                                                      <td>
                                                         <table style="height: 200px; border: 2px solid #339966; width: 200px; text-align: center;">
                                                             <tr>
                                                                 <td colspan="2" style="height: 100%; vertical-align: bottom;background-color:#66c0c2;">
                                                                     <asp:LinkButton ID="lblApplicationTotal" runat="server" Font-Bold="true" Font-Size="80pt" ForeColor="#FFFFFF" Text="0" OnClick="lblApplicationTotal_Click"></asp:LinkButton>
                                                                     <br />
                                                                     <asp:Label ID="Label14" runat="server" Font-Size="12pt" Text="Applications" ForeColor="#FFFFFF"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px; height: 13px;">
                                                                 </td>
                                                                 <td style="height: 13px">
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px">
                                                                     <asp:LinkButton ID="lblPaidDepositTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblPaidDepositTotal_Click"></asp:LinkButton>
                                                                 </td>
                                                                 <td style="text-align: left">
                                                                     <asp:Label ID="Label16" runat="server" Font-Size="8pt" Text="Paid Deposit"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px">
                                                                     <asp:LinkButton ID="lblPendingReviewTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblPendingReviewTotal_Click"></asp:LinkButton>
                                                                 </td>
                                                                 <td style="text-align: left">
                                                                     <asp:Label ID="Label12" runat="server" Font-Size="8pt" Text="Pending Review"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </td>
                                                     <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                     <td>
                                                         <table style="height: 200px; border: 2px solid #339966; width: 200px; text-align: center;">
                                                             <tr>
                                                                 <td colspan="2" style="height: 100%; vertical-align: bottom;background-color:#66c0c2;">
                                                                     <asp:LinkButton ID="lblLeaseTotal" runat="server" Font-Bold="true" Font-Size="80pt" ForeColor="#FFFFFF" Text="0" OnClick="lblLeaseTotal_Click"></asp:LinkButton>
                                                                     <br />
                                                                     <asp:Label ID="Label20" runat="server" Font-Size="12pt" Text="Leases" ForeColor="#FFFFFF"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px; height: 13px;">
                                                                 </td>
                                                                 <td style="height: 13px">
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px">
                                                                     <asp:LinkButton ID="lblActiveTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblActiveTotal_Click"></asp:LinkButton>
                                                                 </td>
                                                                 <td style="text-align: left">
                                                                     <asp:Label ID="Label22" runat="server" Font-Size="8pt" Text="Active"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                             <tr>
                                                                 <td style="width: 11px">
                                                                     <asp:LinkButton ID="lblExpiringTotal" runat="server" Font-Size="20pt" Text="0" Width="50px" OnClick="lblExpiringTotal_Click"></asp:LinkButton>
                                                                 </td>
                                                                 <td style="text-align: left">
                                                                     <asp:Label ID="Label24" runat="server" Font-Size="8pt" Text="Expiring"></asp:Label>
                                                                 </td>
                                                             </tr>
                                                         </table>
                                                     </td>
                                                 </tr>
                                                 
                                             </table>

    <br />
    <br />  <asp:SqlDataSource ID="sdsLatestNews" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectHomeTimeLine" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<div class="row">
<div class="col-md-12">
<div class="accordion block-8" id="accordion">
  
<div class="accordion-item">
<h3 class="mb-0 heading">
<a class="btn-block" data-toggle="collapse" href="#collapseTwo" role="button" aria-expanded="false" aria-controls="collapseTwo">Latest applications received<span class="icon"></span>
   <div style="float:right;">
    <asp:Label ID="lblAppNew" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblAppReviewed" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblSuccessfull" runat="server" Text=""></asp:Label>

    </div>
</a></h3> 

<div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
<div class="body-text" style="height:350px; padding-bottom:15px;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel1" Height="350px" ScrollBars="Auto" runat="server">
    <asp:LinkButton ID="lnkAppNew" runat="server" Font-Bold="true" style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lnkAppNew_Click">New - </asp:LinkButton>
    <asp:LinkButton ID="lnkAppReviewed" runat="server"  style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lnkAppReviewed_Click">Reviewed - </asp:LinkButton>
    <asp:LinkButton ID="lnkSuccessfull" runat="server"  style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lnkSuccessfull_Click"> Successful</asp:LinkButton>
     
           
     <asp:SqlDataSource ID="sdsApplication" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationList" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="ApplicationID" Type="Int32" />
                                    <asp:Parameter DefaultValue="All" Name="Filter" Type="String" />
                                  
                                </SelectParameters>
                         </asp:SqlDataSource>
 <asp:GridView ID="gvApplication" runat="server" AutoGenerateColumns="False" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvApplication_RowCommand" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
  <Columns>
       <asp:BoundField DataField="ApplicationDate" HeaderStyle-Wrap="false" HeaderText="Date Received" />   
                                <asp:BoundField DataField="ApplicantName" HeaderStyle-Wrap="false" HeaderText="Applicant Name" />
                                  
                                 
                                <asp:BoundField DataField="PropertyName" HeaderStyle-Wrap="false"   HeaderText="Property Name " />
                                                  <asp:BoundField DataField="ApplicationStatus" HeaderStyle-Wrap="false"  ItemStyle-BackColor="#ccffff" HeaderText="Status" />         
                                <asp:TemplateField>
                                    <ItemTemplate>
                                     
                                    <asp:HiddenField ID="hfPendingReview" runat="server" Value='<%# Eval("PendingReview") %>' />

                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewApplication" CommandArgument='<%# Eval("ApplicationID") %>' ToolTip="View Application details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#66C0C2" ForeColor="White" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                            </asp:GridView>
                    </asp:Panel>
 </ContentTemplate>
        </asp:UpdatePanel>
</div>
</div>
</div> 

<div class="accordion-item">
<h3 class="mb-0 heading">
<a class="btn-block" data-toggle="collapse" href="#collapseThree" role="button" aria-expanded="false" aria-controls="collapseThree">Latest work orders <span class="icon"></span>
     <div style="float:right;">
    <asp:Label ID="lblNew" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblInProgress" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblCompleted" runat="server" Text=""></asp:Label>

    </div> 
    </a>
 
</h3>
<div id="collapseThree" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
<div class="body-text" style="height:350px; padding-bottom:15px;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                   <asp:Panel ID="Panel2" Height="350px" ScrollBars="Auto" runat="server">
     <asp:LinkButton ID="lnkNew" runat="server" Font-Bold="true" style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lblNew_Click">New - </asp:LinkButton>
    <asp:LinkButton ID="lnkInProgress" runat="server"  style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lblInProgress_Click">In Progress - </asp:LinkButton>
    <asp:LinkButton ID="lnkCompleted" runat="server"  style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lblCompleted_Click"> Completed</asp:LinkButton>
 
        <asp:GridView ID="gvWorkOrder" runat="server" AutoGenerateColumns="False"  Font-Size="10.2pt" CellPadding="2" CellSpacing="3" ShowFooter="true" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvWorkOrder_RowCommand" OnRowDataBound="gvWorkOrder_RowDataBound">
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                <asp:BoundField DataField="RefNumber" HeaderStyle-Wrap="false" HeaderText="Ref#" />
                                        <asp:BoundField DataField="PropertyName" HeaderStyle-Wrap="false" HeaderText="Property Name" />
                                 <asp:BoundField DataField="PropertyUnit" HeaderStyle-Wrap="false" HeaderText="Unit" />
                                <asp:BoundField DataField="FacilityManagementCategory" HeaderStyle-Wrap="false" HeaderText="Category" />
                                <asp:BoundField DataField="Description" HeaderText="Description" HeaderStyle-Wrap="false" ItemStyle-Width="35%" />
                         
                                 <asp:BoundField DataField="StartDate" DataFormatString="{0:d}" HeaderStyle-Wrap="false" HeaderText="Start Date" />
                                <asp:BoundField DataField="EndDate" DataFormatString="{0:d}" HeaderStyle-Wrap="false"  HeaderText="EndDate" />
                       
                               
                                 <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Total Cost">
                                       <ItemTemplate>
                                          <%# Eval("TotalCost", "{0:C0}") %>
                                           <asp:HiddenField ID="hfTotalCost" Value=' <%# Eval("TotalCost") %>'  runat="server" />
                                       </ItemTemplate>
                                       <FooterTemplate >
                                           <asp:Label ID="lblTotal"  Font-Bold="True" runat="server" ></asp:Label>

                                       </FooterTemplate>
                                   </asp:TemplateField>

                                <asp:BoundField DataField="LatestStatus"  ItemStyle-BackColor="#ccffff" HeaderStyle-Wrap="false" HeaderText="Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hfBackColour" runat="server" Value='<%# Eval("BackColour") %>' />
                                            <asp:HiddenField ID="hfStatus" runat="server" Value='<%# Eval("LatestStatus") %>' />
                                              <asp:HiddenField ID="hfCategory" runat="server" Value='<%# Eval("FacilityManagementCategory") %>' />
                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="View" CommandArgument='<%# Eval("FacilityManagementID") %>' ToolTip="View details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#66C0C2" ForeColor="White" />
                         <FooterStyle  BackColor="#66C0C2" ForeColor="White" />
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
    <asp:SqlDataSource ID="sdsFacilityManagement" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectFacilityManagementList" SelectCommandType="StoredProcedure">
                         </asp:SqlDataSource>
                            </asp:Panel>
                 </ContentTemplate>
        </asp:UpdatePanel>

</div>
</div>
</div> 

<div class="accordion-item">
<h3 class="mb-0 heading">
<a class="btn-block" data-toggle="collapse" href="#collapseFour" role="button" aria-expanded="false" aria-controls="collapseFour">Latest leases<span class="icon"></span>
     <div style="float:right;">
    <asp:Label ID="lblActive" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblExpiring" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblExpired" runat="server" Text=""></asp:Label>

    </div> 
</a>
</h3>
<div id="collapseFour" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
<div class="body-text" style="height:350px; padding-bottom:15px;">
         <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                    <asp:LinkButton ID="lnkActive" runat="server" Font-Bold="true" style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lnkActive_Click">Active - </asp:LinkButton>
    <asp:LinkButton ID="lnkExpiring" runat="server"  style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lnkExpiring_Click">Expiring - </asp:LinkButton>
    <asp:LinkButton ID="lnkExpired" runat="server"  style="margin-top: -20px; font-size:12px; color:#66c0c2;" OnClick="lnkExpired_Click"> Expired</asp:LinkButton>
                  <asp:Panel ID="Panel3" Height="350px" ScrollBars="Auto" runat="server">
            <asp:GridView ID="gvLease" runat="server" AutoGenerateColumns="False"  Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvLease_RowCommand" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                        <asp:BoundField DataField="PropertyName" HeaderText="Property Name" HeaderStyle-Wrap="false" />
                                 <asp:BoundField DataField="PropertyUnit" HeaderText="Unit" HeaderStyle-Wrap="false" />
                                <asp:BoundField DataField="UnitArea"  DataFormatString="{0: 0sqm}" HeaderStyle-Wrap="false" HeaderText="Area" />
                                <asp:BoundField DataField="LesseeName" HeaderText="Lessee Name" HeaderStyle-Wrap="false" />
                         
                                <asp:BoundField DataField="Frequency" HeaderText="Lease Frequency" HeaderStyle-Wrap="false" />
                              <%--  <asp:BoundField DataField="AmountDueThisMonth" DataFormatString="{0:c}" HeaderText="Amount Due This Month" />--%>
                             <%--   <asp:BoundField DataField="LeaseStartDate" DataFormatString="{0:d}" HeaderText="Commencement Date" />--%>
                                <asp:BoundField DataField="LeaseEndDate" DataFormatString="{0:d}" HeaderStyle-Wrap="false"  HeaderText="Terminantion Date" />
                                <asp:BoundField DataField="LeaseStatus"  ItemStyle-BackColor="#ccffff" HeaderStyle-Wrap="false" HeaderText="Lease Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                               <asp:HiddenField ID="hfActive" runat="server" Value='<%# Eval("LeaseStatus") %>' />
                                    <asp:HiddenField ID="hfExpiring" runat="server" Value='<%# Eval("Expiring") %>' />


                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewLease" CommandArgument='<%# Eval("LeaseID") %>' ToolTip="View lease details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#66C0C2" ForeColor="White" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsLease" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseList" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="LeaseID" Type="Int32" />
                                    <asp:Parameter DefaultValue=" " Name="Filter" Type="String" />
                                    <asp:Parameter DefaultValue=" " Name="Search" Type="String" />
                                </SelectParameters>
                         </asp:SqlDataSource>
                      </asp:Panel>
                   </ContentTemplate>
        </asp:UpdatePanel>
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
