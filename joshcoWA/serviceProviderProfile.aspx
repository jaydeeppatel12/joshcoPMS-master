<%@ Page Title="" Language="C#" MasterPageFile="application/admin.Master" AutoEventWireup="true" CodeBehind="serviceProviderProfile.aspx.cs" Inherits="joshcoWA.serviceProviderProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="js/vtab.js"></script> 
    <link rel="stylesheet" href="css/PopUp.css" />
   
         <section class="site-section"  >
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px"  >

    <h2>Company Profile - <asp:Label ID="lblCompanyName" runat="server" Text=""></asp:Label></h2>
       <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="~/serviceproviderList.aspx" runat="server">Back</asp:HyperLink>
<div class="row">
     <div class="col-md-6 col-lg-4 order-md-1">
<div class="block-24 mb-5">
<h3 class="heading">Service Provider Menu</h3>
<ul>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Home')">Home <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'WorkOrder')">Work Orders<span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Documents')">Documents <span></span></a></li>
 

</ul>
</div>
     </div>

    <div class="col">
 
    <div class="block-20 ">
        <div style="padding:15px">  
                     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
                                                         
                                          
            <div id="Home" class="tabcontent">
                 
      <table style="width:100%">
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
                 
          Service provider work orders coming soon...
            </div>

            <div id="Documents" class="tabcontent" style="display:none;">
                SharePoint documents coming soon...
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
