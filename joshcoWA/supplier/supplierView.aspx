<%@ Page Title="" Language="C#" MasterPageFile="supplier.Master" AutoEventWireup="true" CodeBehind="supplierView.aspx.cs" Inherits="joshcoWA.supplier.supplierView" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register Src="frmSupplier1.ascx" TagPrefix="uc1" TagName="frmSupplier1" %>
<%@ Register Src="frmSupplier2.ascx" TagPrefix="uc1" TagName="frmSupplier2" %>
<%@ Register Src="frmSupplier3.ascx" TagPrefix="uc1" TagName="frmSupplier3" %>
<%@ Register Src="frmSupplier4.ascx" TagPrefix="uc1" TagName="frmSupplier4" %>
<%@ Register Src="frmSupplier5.ascx" TagPrefix="uc1" TagName="frmSupplier5" %>
<%@ Register Src="frmSupplier6.ascx" TagPrefix="uc1" TagName="frmSupplier6" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="../css/PopUp.css" />
        <style type="text/css">
.Initial
{
  display: block;
  padding: 4px 18px 4px 18px;
  float: left;
  background: url("../Images/InitialImage.png") no-repeat right top;
  color: Black;
   font-size:small;
  /*font-weight: bold;*/
}
.Initial:hover
{
  color: White;
  background: url("../Images/SelectedButton.png") no-repeat right top;
}
.Clicked
{
  float: left;
  display: block;
  background: url("../Images/SelectedButton.png") no-repeat right top;
  padding: 4px 18px 4px 18px;
  color: Black;
  font-size:small;
  /*font-weight: bold;*/
  color: White;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <script src="../js/vtab.js"></script>

   
        <section class="site-section">
        <div class="content-wrapper">
            <div class="row">
 
    
                   

 <div class="col-md-8 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">

   <h2>Company Profile - <asp:Label ID="lblCompanyName" runat="server" Text=""></asp:Label></h2>
       <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="supplierList.aspx" runat="server">Back</asp:HyperLink>
<div class="row">
    

    <div class="col">
 
    <div class="block-20 ">
        <div style="padding:15px">  
                   <div id="Home" class="tabcontent">
       <div>
                <table   >
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="formTextTD" colspan="3">
                                <strong>BUSINESS PARTICULARS  </strong></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Name of the Business 
                            </td>
                            <td>
                                <asp:Label ID="lblBusinessName" ForeColor="Black" runat="server"></asp:Label>
                               
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Physical Address 
                            </td>
                            <td>
                                   <asp:Label ID="lblPhysicalAddress1" ForeColor="Black" runat="server"></asp:Label>
                               
                            </td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> City 
                            </td>
                            <td>
                                   <asp:Label ID="lblCity" ForeColor="Black" runat="server"></asp:Label>
                                 
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td> Code
                              
                            </td>
                            <td>
                                 <asp:Label ID="lblPhysicalAddressCode" ForeColor="Black" runat="server"></asp:Label>
                              
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Province </td>
                            <td>
                                 <asp:Label ID="lblProvince" ForeColor="Black" runat="server"></asp:Label>
                                 
                                
                                
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Telephone Number
                               
                            </td>
                            <td>
                                 <asp:Label ID="lblTelephone" ForeColor="Black" runat="server"></asp:Label>
                               
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Fax Number</td>
                            <td>
                                  <asp:Label ID="lblFax1" ForeColor="Black" runat="server"></asp:Label>
                              
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Email Address  
                                
                            </td>
                            <td>
                                  <asp:Label ID="lblEmail" ForeColor="Black" runat="server"></asp:Label>
                               
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td > Web Page Address</td>
                            <td> <asp:Label ID="lblWebPageAddress" ForeColor="Black" runat="server"></asp:Label>
                          
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        
                        
                       
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        
                       
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"><strong> Contact Person for correspondence</strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                      
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Title
                            </td>
                            <td>
                                <asp:Label ID="lblContactPersonTitle" ForeColor="Black" runat="server"></asp:Label>
                             
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                     
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Name 
                            </td>
                            <td>
                                  <asp:Label ID="lblName" ForeColor="Black" runat="server"></asp:Label>
                               
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Surname 
                            </td>
                            <td>
                                <asp:Label ID="lblContactPersonSurname" ForeColor="Black" runat="server"></asp:Label>
                        
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                 
                        
                    </table>

           </div>
                       </div>     
  <div id="Application" class="tabcontent" style="display:none;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
       <div>
        <asp:Button Text="Page 1" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server"
              OnClick="Tab1_Click" />
          <asp:Button Text="Page 2" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server"
              OnClick="Tab2_Click" />
          <asp:Button Text="Page 3" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server"
              OnClick="Tab3_Click" />
                  <asp:Button Text="Page 4" BorderStyle="None" ID="Tab4" CssClass="Initial" runat="server"
              OnClick="Tab4_Click" />
                  <asp:Button Text="Page 5" BorderStyle="None" ID="Tab5" CssClass="Initial" runat="server"
              OnClick="Tab5_Click" />

         <asp:Button Text="Page 6" BorderStyle="None" ID="Tab6" CssClass="Initial" runat="server"
              OnClick="Tab6_Click" />

                    <asp:Button Text="Administration" BorderStyle="None" ID="Tab10" CssClass="Initial" runat="server"
              OnClick="Tab10_Click" />

 
           </div>
 <div class="home-tab">

                <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                  <uc1:frmSupplier1 runat="server" id="frmSupplier1" />
                      
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
           
                      <uc1:frmSupplier2 runat="server" id="frmSupplier2" />
                  
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
  <uc1:frmSupplier3 runat="server" id="frmSupplier3" />
            
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View4" runat="server">
            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
            <tr>
                <td>
       <uc1:frmSupplier4 runat="server" id="frmSupplier4" />
                 
                </td>
            </tr>
            </table>
        </asp:View>
            <asp:View ID="View5" runat="server">
            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
            <tr>
                <td>
                 
                 <uc1:frmSupplier5 runat="server" id="frmSupplier5" />
                  
                </td>
            </tr>
            </table>
                </asp:View>
                    <asp:View ID="View6" runat="server">
            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
            <tr>
                <td>
                 
                    <uc1:frmSupplier6 runat="server" id="frmSupplier6" />
                  
                </td>
            </tr>
            </table>
                </asp:View>
                     <asp:View ID="View7" runat="server">
            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
            <tr>
                <td>
                 
                  <asp:Panel ID="pnlAdmin" runat="server" CssClass="block-20" Width="100%"    >
                     <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                                        <table style="width:100%;">
                        <tr>
                            <td style="vertical-align: top;  padding:10px; ">
                                       <table class="w-100">
                                           <tr>
                                               <td><h3 class="heading">Administration</h3>
</td>
                                               <td>                                           
                                                   &nbsp;
                                              </td>
                                           </tr>
 <tr>
                                               <td>                                           
                                                   Service Provider Category
                                              </td>
       <td>                                           
                                                   <asp:DropDownList ID="ddlServiceProviderCategory" runat="server" CssClass="btn-outline-warning btn-fw" >
                                                       <asp:ListItem Value="1" Text="R0 – R29 999"></asp:ListItem>
                                                       <asp:ListItem Value="2" Text="R30 000 – R R199 999"></asp:ListItem>
                                                       <asp:ListItem Value="3" Text="R200 000 > Above"></asp:ListItem>
                                                       
                                                   </asp:DropDownList>
                                              </td>
                                           </tr> 
                                            <tr>
                                               <td>                                           
                                                  Supplier Panel
                                              </td>
       <td>                                           
                                                 <asp:DropDownList ID="ddlSupplierPanel" runat="server" CssClass="btn-outline-warning btn-fw"   DataSourceID="sdsSupplierPanel" DataTextField="SupplierPanel" DataValueField="SupplierPanelID">
                                                   </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsSupplierPanel" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT SupplierPanelID, SupplierPanel FROM SupplierPanel ORDER BY SupplierPanelID Asc" UpdateCommand="AdminUpdateServiceProvider" UpdateCommandType="StoredProcedure" >
                           
                                
                                      <UpdateParameters>
                                          <asp:Parameter Name="ServiceProviderID" Type="Int32" />
                                          <asp:Parameter Name="SupplierPanelID" Type="Int32" />
                                          <asp:Parameter Name="StatusID" Type="Int32" />
                                          <asp:Parameter Name="SupplierPanel_NA" Type="Boolean" />
                                          <asp:Parameter Name="ServiceProviderCategoryID" Type="Int32" />
                                      </UpdateParameters>
                           
                                
                                      </asp:SqlDataSource>
                                              </td>
                                           </tr> 
                                            <tr>
                                               <td>                                           
                                                   Tick box if N/A
                                              </td>
       <td>                                           
                                                  <asp:CheckBox ID="chkSupplierPanel_NA" runat="server" CssClass="btn btn-outline-warning btn-fw"  />
                                              </td>
                                           </tr> 
                                            <tr>
                                               <td>                                           
                                                  Status
                                              </td>
       <td>                                           
                                                     <asp:DropDownList ID="ddlStatus" runat="server" CssClass="btn-outline-warning btn-fw" >
                                                 
                                                       <asp:ListItem Value="1" Text="Pending"></asp:ListItem>
                                                       <asp:ListItem Value="2" Text="Reviewed"></asp:ListItem>
                                                       <asp:ListItem Value="3" Text="Declined"></asp:ListItem>
                                                         <asp:ListItem Value="4" Text="Approved"></asp:ListItem>
                                                   </asp:DropDownList>
                                              </td>
                                           </tr>   
                                             <tr>
                                               <td>                                           
                                                  
                                              </td>
       <td>                                           
                                                   &nbsp;
                                              </td>
                                           </tr>                                          
                                           <tr>
                                                 <td>                                           
                                                   &nbsp;
                                              </td>
                                               <td>
                                              <asp:Button ID="btnAdmin" runat="server" CssClass="btn btn-warning px-5 py-2" OnClick="btnAdmin_Click" Text="Submit" />
                                               </td>
                                           </tr>
                                         
                                       </table>
&nbsp;</td>
                        </tr>
                    </table>
                         </div>
                                   </asp:Panel>
                  
                </td>
            </tr>
            </table>
                </asp:View>
                    </asp:MultiView>
 </div>          
        
   </ContentTemplate>
            </asp:UpdatePanel>     
   

     
          


      <table style="width:100%; display:none;">
                              <tr>
                                  <td style="width: 165px">Service Provider</td>
                                  <td>
                                      <asp:Label ID="lblSPName" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                                
                               <tr>
                                  <td style="width: 165px">Reg Number</td>
                                  <td><asp:Label ID="lblRegistrationNumber" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 165px">Entity Type</td>
                                  <td><asp:Label ID="lblEntityType" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
         
                                 <tr>
                                  <td style="width: 165px">Vat Registered Number</td>
                                  <td><asp:Label ID="lblVatRegisteredNumber"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">BEE Certificate</td>
                                  <td><asp:Label ID="lblBEECertificate"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">BEE Level</td>
                                  <td><asp:Label ID="lblBEELevel"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">BEE Expiring Date</td>
                                  <td><asp:Label ID="lblBEEExpiringDate"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Tax Clearance</td>
                                  <td><asp:Label ID="lblTaxClearance"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Tax Clearance Expiring Date</td>
                                  <td><asp:Label ID="lblTaxClearanceExpiringDate"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 165px">Contact Person</td>
                                  <td><asp:Label ID="lblContactPersonName" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
           <tr>
                                  <td style="width: 165px">Email Address</td>
                                  <td><asp:Label ID="lblServiceProviderEmail"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
           <tr>
                                  <td style="width: 165px">Contact No.</td>
                                  <td><asp:Label ID="lblServiceProviderTel"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
           <tr>
                                  <td style="width: 165px">Fax No.</td>
                                  <td><asp:Label ID="lblFax"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>

                              <tr>
                                  <td style="width: 165px">Physical Address</td>
                                  <td><asp:Label ID="lblPhysicalAddress"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Postal Address</td>
                                  <td><asp:Label ID="lblPostalAddress"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>

                              <tr>
                                  <td style="width: 165px; vertical-align:top;">Sector</td>
                                  <td>                     <asp:CheckBoxList ID="cblServiceProviderSector" DataSourceID="sdsServiceProviderSector" DataValueField="ServiceProviderSectorID" DataTextField="ServiceProviderSector" runat="server" Enabled="False" Font-Bold="True" >

                      </asp:CheckBoxList>
                         <asp:SqlDataSource ID="sdsServiceProviderSector" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>"
                                                    SelectCommand="SELECT [ServiceProviderSectorID] ,[ServiceProviderSector]  FROM [dbo].[ServiceProviderSector] Order by [ServiceProviderSector] Asc"></asp:SqlDataSource></td>
                              </tr>

                              <tr>
                                  <td style="width: 155px">
                                      <asp:SqlDataSource ID="sdsServiceProviderProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectServiceProviderProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="ServiceProviderID" SessionField="ServiceProviderID" Type="Int32" />
                                          
                                      </SelectParameters>
                                      </asp:SqlDataSource>

                                      </td>
                                  <td> <asp:LinkButton ID="lnkEditProfile" Font-Size="Small" style="float:right;" OnClick="lnkEditProfile_Click" runat="server">edit property details</asp:LinkButton></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">&nbsp;</td>
                                  <td></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">&nbsp;</td>
                                  <td></td>
                              </tr>
                          </table>
                 <br />
          </div>

            <div id="WorkOrder" class="tabcontent" style="display:none;">
                  <asp:Panel ID="pnl" runat="server"  Style="width:100%" ScrollBars="Both" >
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sdsFacilityManagement" datakeynames="FacilityManagementID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="1200px" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                       <Columns>
                                <asp:BoundField DataField="RefNumber" HeaderText="Ref#" />
                                        <asp:BoundField DataField="PropertyName" HeaderText="Property Name" />
                                 <asp:BoundField DataField="PropertyUnit" HeaderText="Unit" />
                                <asp:BoundField DataField="FacilityManagementCategory"  HeaderText="Category" />
                                <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-Width="35%" />
                         
                                 <asp:BoundField DataField="StartDate" DataFormatString="{0:d}" HeaderText="Start Date" />
                                <asp:BoundField DataField="EndDate" DataFormatString="{0:d}"  HeaderText="EndDate" />
                       
                               
                                 <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Total Cost">
                                       <ItemTemplate>
                                          <%# Eval("TotalCost", "{0:C0}") %>
                                           <asp:HiddenField ID="hfTotalCost" Value=' <%# Eval("TotalCost") %>'  runat="server" />
                                       </ItemTemplate>
                                       <FooterTemplate >
                                           <asp:Label ID="lblTotal"  Font-Bold="True" runat="server" ></asp:Label>

                                       </FooterTemplate>
                                   </asp:TemplateField>

                                <asp:BoundField DataField="LatestStatus" HeaderText="Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hfBackColour" runat="server" Value='<%# Eval("BackColour") %>' />
                                            <asp:HiddenField ID="hfStatus" runat="server" Value='<%# Eval("LatestStatus") %>' />
                                              <asp:HiddenField ID="hfCategory" runat="server" Value='<%# Eval("FacilityManagementCategory") %>' />
                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="View" CommandArgument='<%# Eval("FacilityManagementID") %>' ToolTip="View details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                              <asp:SqlDataSource ID="sdsFacilityManagement" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectProviderWorkList" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                    <asp:SessionParameter Name="ServiceProviderID" SessionField="ServiceProviderID" Type="Int32" />
                                </SelectParameters>
                         </asp:SqlDataSource>
                      </asp:Panel>
            </div>

        <%--    <div id="Documents" class="tabcontent" style="display:none;">
                SharePoint documents coming soon...
            </div>    --%>      
        </div>

            </div>
        <br />  
     </div>

 </div>
 
     


</div>



    </div>
    </div>


                <div class="col-md-4 grid-margin stretch-card" style="height:200px">
   <div class="card">
                <div class="card-body">
<h3 class="heading">Service Provider Menu</h3>
<ul>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Home')">Home <span></span></a></li>
    <li><a href="#" class="tablinks" onclick="openCity(event, 'Application')">Application Form <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'WorkOrder')">Work Orders<span></span></a></li>
<%--<li><a href="#" class="tablinks" onclick="openCity(event, 'Documents')">Documents <span></span></a></li>--%>
 

</ul>
</div>
       </div>
     </div>


         
                  
          

    </div>
    </div>
 </section>
</asp:Content>
