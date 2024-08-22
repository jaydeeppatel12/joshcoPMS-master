<%@ Page Title="" Language="C#" MasterPageFile="lease.Master" AutoEventWireup="true" CodeBehind="leaseProfile.aspx.cs" Inherits="joshcoWA.lease.leaseProfile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <script src="../js/vtab.js"></script> 
         <link rel="stylesheet" href="../css/PopUp.css" />
    <section class="site-section">
        <div class="content-wrapper">
            <div class="row">
 
 <div class="col-md-8 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">

    <h2>Lease Profile <br /> <asp:Label ID="lblPropName" runat="server" Font-Size="15px" Text=""></asp:Label></h2>
             <asp:Label ID="lblUnitName" runat="server" Font-Bold="true" Text="" Font-Size="15px" ></asp:Label><br /><br />
             <asp:Image ID="imgback" ImageUrl="../images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="leaseList.aspx" runat="server">Back</asp:HyperLink>
 
        <div style="padding:15px">  
                     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>                                
                                          
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlRenew" TargetControlID="hlnkRenewLease"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="0" Y="50"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlRenew" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         

<div class="form-wrap"  style="width:800px; padding:15px; margin-top:50px; "  >
 
    <div class="block-20;">
        <asp:Label ID="lblLeaseDocHeader" runat="server" Text=""></asp:Label><h3 id="hdlLeaseHeader" class="heading">Lease Information</h3>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="images/close.png" AlternateText="Close" />
       
     
     <table style="width:100%;">
                        <tr>
                            <td style="vertical-align: top;  padding:5px;">
                                       Lease Expired plase click 
                                 <asp:HyperLink ID="hlnkRenewLease" NavigateUrl="#" runat="server">here</asp:HyperLink>  
                                        
                                       &nbsp;to renew this lease.
                                   </td>
                        </tr>
                    </table>

        </div>
    </div>
                                                   
</asp:Panel>

            <div class="row">


    <div class="col">
 
    <div class="block-20 ">
        <div style="padding:15px">  
 <div id="Home" class="tabcontent">
     <table  >
                           
                              <tr>
                                  <td style="width: 165px">Property</td>
                                  <td><asp:Label ID="Label1" runat="server" Visible="false" Text=""></asp:Label>
                                      <asp:Label ID="lblProperty" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Unit</td>
                                  <td>
                                      <asp:Label ID="lblUnit" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Area</td>
                                  <td>
                                      <asp:Label ID="lblArea" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Rate/SQM</td>
                                  <td>
                                      <asp:Label ID="lblRate" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Tenant</td>
                                  <td><asp:Label ID="lblTenant" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Initial Value</td>
                                  <td><asp:Label ID="lblInitialValue"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Vatable</td>
                                  <td><asp:Label ID="lblVatable"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Escalation</td>
                                  <td><asp:Label ID="lblEscalation"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Commencement Date</td>
                                  <td><asp:Label ID="lblCommencement"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Termination Date</td>
                                  <td><asp:Label ID="lblTermination"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Interest</td>
                                  <td><asp:Label ID="lblInterest"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Interest %</td>
                                  <td><asp:Label ID="lblInterestPercentage"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Type of lease</td>
                                  <td><asp:Label ID="lblTypeOfLease"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Lease Status</td>
                                  <td><asp:Label ID="lblLeaseStatus"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Comment</td>
                                  <td><asp:Label ID="lblComment"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px"><asp:SqlDataSource ID="sdsLeaseProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseList" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="LeaseID" SessionField="LeaseID" Type="Int32" />
                                          <asp:Parameter Name="Filter" Type="String" DefaultValue=" " />
                                          <asp:Parameter Name="Search" Type="String" DefaultValue=" "  />
                                      </SelectParameters>
                                      </asp:SqlDataSource></td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>
     </div>

<div id="Rent" class="tabcontent" style="display:none;">
    <asp:Panel ID="pnlRent" runat="server" Width="100%" ScrollBars="Horizontal">
         <asp:GridView ID="gvLeaseRent" runat="server" AutoGenerateColumns="False" 
                               CellPadding="2" CellSpacing="2" DataKeyNames="LeaseRentID"  Font-Size="12px"
                               DataSourceID="sdsRentalHistory" EmptyDataText="No rental details" GridLines="None" 
                               
                               Width="1200px" Enabled="False" >
                                            <HeaderStyle BackColor="#66C0C2" ForeColor="White" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                               <AlternatingRowStyle BackColor="#EFEFEF" />
                               <Columns>
                               <asp:TemplateField HeaderText="FinYear">
                                   
                                   <FooterTemplate>
                                             &nbsp;
                                   </FooterTemplate>
                               <ItemTemplate>
                              <%# Convert.ToInt32(Eval("FinYear"))-1%>/<%# Eval("FinYear")%>(March <%# Eval("FinYear")%>)
                               <asp:Label ID="lblFinYear" runat="server" Text='<%# Eval("FinYear")%>' Visible ="false"></asp:Label>
                                
                              
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>

                                <asp:TemplateField HeaderText="Apr">
                                    
                                    <FooterTemplate>
                                       &nbsp;
                                    </FooterTemplate>
                               <ItemTemplate>
                                <asp:Label ID="lblApr" BackColor='<%# System.Drawing.Color.FromName( Eval("AprBC").ToString() ) %>' runat="server" Text='<%# Eval("Apr", "{0:c}")%>' ToolTip='<%# Eval("AprCount")%>' ></asp:Label>
                                                       
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>
                                 <asp:TemplateField HeaderText="May">
                                     
                                     <FooterTemplate>
                                          &nbsp;
                                     </FooterTemplate>
                               <ItemTemplate>
             
                                 <asp:Label ID="lblMay" runat="server" BackColor='<%# System.Drawing.Color.FromName( Eval("MayBC").ToString() ) %>' Text='<%# Eval("May", "{0:c}")%>' ToolTip='<%# Eval("MayCount")%>' ></asp:Label>
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Jun">
                                      
                                        <FooterTemplate>
                                                &nbsp;
                                        </FooterTemplate>
                               <ItemTemplate>
                           
                                 <asp:Label ID="lblJun" runat="server" BackColor='<%# System.Drawing.Color.FromName( Eval("JunBC").ToString() ) %>' Text='<%# Eval("Jun", "{0:c}")%>' ToolTip='<%# Eval("JunCount")%>' ></asp:Label>
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>
                              
                                  <asp:TemplateField HeaderText="Jul">
                                  
                                      <FooterTemplate>
                                          &nbsp;
                                      </FooterTemplate>
                               <ItemTemplate>
                           
                                              <asp:Label ID="lblJul" runat="server" BackColor='<%# System.Drawing.Color.FromName( Eval("JulBC").ToString() ) %>' Text='<%# Eval("Jul", "{0:c}")%>' ToolTip='<%# Eval("JulCount")%>' ></asp:Label>
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Aug">
                                  
                                      <FooterTemplate>
                                               &nbsp;
                                      </FooterTemplate>
                               <ItemTemplate>
                             
                                     <asp:Label ID="lblAug" runat="server" BackColor='<%# System.Drawing.Color.FromName( Eval("AugBC").ToString() ) %>' Text='<%# Eval("Aug", "{0:c}")%>' ToolTip='<%# Eval("AugCount")%>' ></asp:Label>
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sep">
                                      
                                        <FooterTemplate>
                                                  &nbsp;
                                        </FooterTemplate>
                               <ItemTemplate>
                              
                                    <asp:Label ID="lblSep" runat="server" BackColor='<%# System.Drawing.Color.FromName( Eval("SepBC").ToString() ) %>' Text='<%# Eval("Sep", "{0:c}")%>' ToolTip='<%# Eval("SepCount")%>' ></asp:Label>
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Oct">
                                      
                                       <FooterTemplate>
                                                  &nbsp;
                                       </FooterTemplate>
                               <ItemTemplate>
                                        
                               <asp:Label ID="lblOct" runat="server" BackColor='<%# System.Drawing.Color.FromName( Eval("OctBC").ToString() ) %>' Text='<%# Eval("Oct", "{0:c}")%>' ToolTip='<%# Eval("OctCount")%>' ></asp:Label>
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nov">
                                       
                                        <FooterTemplate>
                                                  &nbsp;
                                        </FooterTemplate>
                               <ItemTemplate>
                                 
                                 <asp:Label ID="lblNov" runat="server" BackColor='<%# System.Drawing.Color.FromName( Eval("NovBC").ToString() ) %>' Text='<%# Eval("Nov", "{0:c}")%>' ToolTip='<%# Eval("NovCount")%>' ></asp:Label>
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Dec">
                                  
                                     <FooterTemplate>
                                               &nbsp;
                                     </FooterTemplate>
                               <ItemTemplate>
                      
                                <asp:Label ID="lblDec" runat="server" BackColor='<%# System.Drawing.Color.FromName( Eval("DecBC").ToString() ) %>' Text='<%# Eval("Dec", "{0:c}")%>' ToolTip='<%# Eval("DecCount")%>' ></asp:Label>
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Jan">
                                      
                                       <FooterTemplate>
                                                 &nbsp;
                                       </FooterTemplate>
                               <ItemTemplate>
                             
                                <asp:Label ID="lblJan" runat="server" BackColor='<%# System.Drawing.Color.FromName( Eval("JanBC").ToString() ) %>' Text='<%# Eval("Jan", "{0:c}")%>' ToolTip='<%# Eval("JanCount")%>' ></asp:Label>
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Feb">
                                      
                                        <FooterTemplate>
                                                    &nbsp;
                                        </FooterTemplate>
                               <ItemTemplate>
                       
                                <asp:Label ID="lblFeb" runat="server" BackColor='<%# System.Drawing.Color.FromName( Eval("FebBC").ToString() ) %>' Text='<%# Eval("Feb", "{0:c}")%>' ToolTip='<%# Eval("FebCount")%>' ></asp:Label>
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                               </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mar">
                                  
                                        <FooterTemplate>
                                          Total
                                        </FooterTemplate>
                               <ItemTemplate>
                        
                                <asp:Label ID="lblMar" runat="server" BackColor='<%# System.Drawing.Color.FromName( Eval("MarBC").ToString() ) %>' Text='<%# Eval("Mar", "{0:c}")%>' ToolTip='<%# Eval("MarCount")%>' ></asp:Label>
                               

                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    <FooterStyle  HorizontalAlign="Right" VerticalAlign="Top" Font-Bold="True" 
                                            Font-Italic="True"/>
                               </asp:TemplateField>
                               
                                  <asp:TemplateField HeaderText="Total Accumulated Per Annum">
                                        
                                        <FooterTemplate>
                                       <%# Eval("TotalTurnover")%>
                                        </FooterTemplate>
                               <ItemTemplate>
                               <asp:Label ID="lblTotalTurnover" runat="server" Text='<%# Eval("TotalTurnover")%>' Visible="false"></asp:Label>
                               <%# Eval("Expected", "{0:C}")%>
                               </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                   <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                   <FooterStyle  HorizontalAlign="Right" VerticalAlign="Top" Font-Bold="True"  
                                            Font-Italic="True"/>
                               </asp:TemplateField>

                                


                               </Columns>
                              
                           </asp:GridView>
 
                            <asp:SqlDataSource ID="sdsRentalHistory" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseRent" SelectCommandType="StoredProcedure" >
                           
                                <SelectParameters>
                                    <asp:SessionParameter Name="LeaseID" SessionField="LeaseID" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource>

    </asp:Panel>
    </div>

<div id="LeaseStatus" class="tabcontent" style="display:none;">
       <table style="width: 100%"  >
                              <tr>
                               
                                  <td style="vertical-align:top;">Lease Status</td>
                                  <td style="vertical-align:top;">
                                      <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Vertical" ValidationGroup="Dep">
                                          <asp:ListItem Value="Active">Active</asp:ListItem>
                                          <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                                           <asp:ListItem Value="Expired">Expired</asp:ListItem>
                                      </asp:RadioButtonList>
                                      
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="**" ForeColor="Red" ValidationGroup="Dep"></asp:RequiredFieldValidator>
                                  </td>
                         
                                  <td> </td>
                         
                              </tr>
                              <tr>
                               
                                  <td>
                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="Select ''" UpdateCommand="Update [dbo].[Lease]
Set LeaseStatus = @LeaseStatus
Where LeaseID = @LeaseID ">
                                          <UpdateParameters>
                                              <asp:Parameter Name="LeaseStatus" />
                                              <asp:Parameter Name="LeaseID" />
                                          </UpdateParameters>
                                      </asp:SqlDataSource>
                                  </td>
                                  <td>
                                     <asp:Button ID="btnUpdateStatus" runat="server" CssClass="btn btn-warning px-5 py-2" OnClick="btnUpdateStatus_Click" Text="Submit" ValidationGroup="Dep" /></td>
                             
                                  <td>&nbsp;</td>
                             
                              </tr>
                              </table>
    </div>

<div id="Documents" class="tabcontent" style="display:none;">
    SharePoint documents coming soon.....
    </div>

            </div>
        </div>
        </div>
 </div>

            </div>
 </div>
                                    </div>
                                </div>
                                  <div class="col-md-4 grid-margin stretch-card" style="height:200px">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Lease Menu</h4>
<%--     <div class="col-md-6 col-lg-4 order-md-1">
<div class="block-24 mb-5">--%>
 
<ul>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Home')">Home <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Rent')">Rent <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'LeaseStatus')">Lease Status <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Documents')">Documents <span></span></a></li>

</ul>
<%--</div>
     </div>--%>
                </div>
              </div>
            </div>
            </div>
        </div>


  
    </section>


</asp:Content>