<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" ValidateRequest="false" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="propertyProfile.aspx.cs" Inherits="joshcoWA.propertyProfile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Src="PropProfilePic.ascx" TagPrefix="uc1" TagName="PropProfilePic" %>
<%@ Register Src="propertyForm.ascx" TagPrefix="uc1" TagName="propertyForm" %>
<%@ Register Src="unitForm.ascx" TagPrefix="uc1" TagName="unitForm" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--          <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC8D8FjE3idupYdEcMUZ8yasxbb3qnhIO0 &sensor=false"></script>
    <script type="text/javascript">
        var markers = [
        <asp:Repeater ID="rptMarkers" runat="server">
        <ItemTemplate>
                 {
                     "title": '<%# Eval("PropertyName") %>',
                 "lat": '<%# Eval("Lat") %>',
                 "lng": '<%# Eval("Long") %>',
                 "description": '<%# Eval("PropertyName")+": "+Eval("FullAddress") %>'
             }
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
    ];
    </script>
     <script type="text/javascript">

        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                zoom: 12,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            google.maps.event.addListener(map, 'click', function(event) {
                alert(event.latLng.lat() + ", " + event.latLng.lng());
            });

            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: data.title
                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(data.description);
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }
    </script>

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>--%>
   
    <style>
        .carousel-inner img {
            width: 100%;
            height: 350px;
        }
    </style>

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

    <h2>Property Profile <br /> <asp:Label ID="lblPropName"  Font-Size="15px" runat="server" Text=""></asp:Label></h2>
       <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="propertyList.aspx" runat="server">Back</asp:HyperLink>
<div class="row">
    

    <div class="col">
 
    <div class="block-20 ">
        <div style="padding:15px">  
                     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
                                                        <asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="0" Y="50"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         

 <div style="padding:15px; color:black;" class="alert alert-success mt-4 align-items-left">
    <h3 id="hdlLeaseHeader" class="heading"><asp:Label ID="lblLeaseDocHeader" runat="server" Text="Property Image"></asp:Label>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" ToolTip="Close" AlternateText="Close"  /></h3>
        <uc1:PropProfilePic runat="server" id="PropProfilePic" visible=" false" />
        <uc1:propertyForm runat="server" id="propertyForm" visible=" false" />
       
        <uc1:unitForm runat="server" id="unitForm"  visible=" false" /> <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate></ContentTemplate></asp:UpdatePanel>
<%--
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<uc1:AddLease ID="AddLease1" runat="server" /> 

</ContentTemplate>
</asp:UpdatePanel>--%>

        </div>
    
                                                   
</asp:Panel>
                                          
             <div id="Home" class="tabcontent">
                 <div style="align-items:center; align-content:center; text-align:center;">
                     <asp:Image ID="Image1" ImageUrl="~/images/img_2.jpg" runat="server" style="height: auto; width:70%; " /><br />
                     <asp:LinkButton ID="lnkeditProfilePic" Font-Size="Small" style="float:right;" OnClick="lnkeditProfilePic_Click" runat="server">edit property image</asp:LinkButton>
                 </div><br />
      <table style="width:100%">
                              <tr>
                                  <td style="width: 155px; vertical-align:top;">Property Name</td>
                                  <td>
                                      <asp:Label ID="lblPropertyName" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              
                               <tr>
                                  <td style="width: 155px">Erf No.</td>
                                  <td>
                                      <asp:Label ID="lblErf" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 155px">Portion No.</td>
                                  <td>
                                      <asp:Label ID="lblPortion" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
           <tr>
                                  <td style="width: 155px">Area or Extent</td>
                                  <td>
                                      <asp:Label ID="lblArea" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Contact Person</td>
                                  <td>
                                      <asp:Label ID="lblContactPerson" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Telephone</td>
                                  <td><asp:Label ID="lblTelephone" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Fax No.</td>
                                  <td><asp:Label ID="lblFaxNo" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Email Address</td>
                                  <td><asp:Label ID="lblEmailAddress" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Physical Address</td>
                                  <td><asp:Label ID="lblPhysicalAddress" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Postal Address</td>
                                  <td><asp:Label ID="lblPostalAddress" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Latitude</td>
                                  <td>
                                      <asp:Label ID="lblLat" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Longitude</td>
                                  <td>
                                      <asp:Label ID="lblLong" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px"><asp:SqlDataSource ID="sdsPropertyProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="PropertyID" SessionField="PropertyID" Type="Int32" />
                                      </SelectParameters>
                                      </asp:SqlDataSource></td>
                                  <td> <asp:LinkButton ID="lnkEditPropertyProfile" Font-Size="Small" style="float:right;" OnClick="lnkEditPropertyProfile_Click" runat="server">edit property details</asp:LinkButton></td>
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
<%--                  <div id="MapView" class="tab-pane fade in active">&nbsp;
                      <div class="chanel-item">
                           <div id="dvMap" style="width: 95%; height: 500px">&nbsp;
    </div>

                          </div>
                         </div>--%>




             </div>
            <div id="Units" class="tabcontent" style="display:none;">
                <asp:Label ID="lblTotalUnits" runat="server" Text=""></asp:Label><asp:Button ID="btnAddUnit" runat="server" style=" vertical-align:bottom; float:right; " Text="+ New Unit" CssClass="btn btn-warning" OnClick="btnAddUnit_Click" />
                 <asp:DataList ID="dlUnits" runat="server" RepeatColumns="1" Width="100%" DataSourceID="sdsUnits" OnItemCommand="dlUnits_ItemCommand" OnItemDataBound="dlUnits_ItemDataBound" >
                 
                            <ItemTemplate>
                             <div class="alert alert-success mt-4 d-flex align-items-left" role="alert" style="padding:0;">
                                               <table style="Width: 100%"  >
                  <tr>
                      <td style="align-items:center; align-content:center; text-align:center;">
  <figure>
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="align-items:center; align-content:center; text-align:center;">
                <div class="carousel-inner" role="listbox">
                    <asp:HiddenField ID="hfPropertyUnitID" runat="server" value='<%# Eval("PropertyUnitID") %>'  />
                    <asp:Repeater ID="Repeater1" runat="server" >
                        <ItemTemplate >
                            <div class="carousel-item <%#GetActiveClass(Container.ItemIndex) %>" >
                            
                                <img alt="<%#Eval("ImageName")%>" style="height: auto; width:50%; " src="<%# "..//propertunitypic//"+Eval("PropertyUnitID")+"//"+Eval("ImageName") %>" />

                            </div>
                            
                        </ItemTemplate>
                        
                    </asp:Repeater>
                    <img runat="server" id="NoImage" alt="NoImage" visible="false" style="height: auto; width:50%; " src="..//images//img_2.jpg" />
                </div>
                <a class="carousel-control-prev" href="#myCarousel" data-slide="prev" role="button">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#myCarousel" data-slide="next" role="button">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
                                <%--<a href="#"><img src="../images/img_2.jpg" alt="" class="img-fluid"></a>--%>
                                </figure>
                      </td>

                  </tr>
                               <tr>
                                  <td>
                                <asp:LinkButton ID="LinkButton1" style="float:right;" ToolTip="edit Photos" CausesValidation="false"  CommandName="editPhotos" CommandArgument='<%# Eval("PropertyUnitID") %>' runat="server">edit Photos</asp:LinkButton>
                                <div class="text">
                                    <asp:Label ID="lblPropertyUnit" runat="server" ForeColor="Black" Text='<%# Eval("PropertyUnit") %>'></asp:Label>
                                

                               <div><span class="ion-android-home"></span>  <asp:Label ID="Label2" runat="server" Text='<%#  "Unit Area: "+Eval("UnitArea") %>'></asp:Label> m<sup>2</sup></div>
                                <div><span class="ion-android-document"></span>  <asp:Label ID="Label3" runat="server" Text='<%#  "Status: "+ (Eval("LeaseStatus").ToString()==""?"Vacant":"Leased") %>'></asp:Label> <asp:LinkButton ID="lnkEditUnit" style="float:right;" ToolTip="edit unit details" CausesValidation="false" CommandName="editunit" CommandArgument='<%# Eval("PropertyUnitID") %>' runat="server">edit Details</asp:LinkButton></div>
                             

                                
                                </div>
                                      </td>
                                   </tr>
                                                   </table>
                                </div>
                            </ItemTemplate>
                     
                     <SeparatorTemplate>
                         &nbsp;
                     </SeparatorTemplate>
                        </asp:DataList>
            </div>
            <div id="Applications" class="tabcontent" style="display:none;">
                  <asp:GridView ID="gvApplication" runat="server" EmptyDataText="No applications received" AutoGenerateColumns="False" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvApplication_RowCommand"  OnRowDataBound="gvApplication_RowDataBound" DataSourceID="sdsApplication">
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                            <Columns>
                                <asp:BoundField DataField="FullName" HeaderText="Applicant Name" />
                                  
                                 
                                
                                <asp:BoundField DataField="ApplicationStatusDate" ItemStyle-BackColor="#ccffff" HeaderText="Status Date" />
                                <asp:BoundField DataField="ApplicationStatus"  ItemStyle-BackColor="#ccffff" HeaderText="Application Status" />
                                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                     
                                    <asp:HiddenField ID="hfPendingReview" runat="server" Value='<%# Eval("PendingReview") %>' />

                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewApplication" CommandArgument='<%# Eval("ApplicationID") %>' ToolTip="View Application details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsApplication" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyApplicationList" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="PropertyID" SessionField="PropertyID" Type="Int32" />
                                    <asp:Parameter DefaultValue="All" Name="Filter" Type="String" />
                                  
                                </SelectParameters>
                         </asp:SqlDataSource>
            </div>
            <div id="Leases" class="tabcontent" style="display:none;">
                        <asp:GridView ID="gvLeases" runat="server" AutoGenerateColumns="False" EmptyDataText="No lease captured for this property" Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" DataSourceID="sdsLease" OnRowCommand="gvLeases_RowCommand"  >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                         
                                 <asp:BoundField DataField="PropertyUnit" HeaderText="Unit" />
                               
                                <asp:BoundField DataField="LesseeName" HeaderText="Lessee Name" />
                         
                                <asp:BoundField DataField="Frequency" HeaderText="Lease Frequency" />
                                <asp:BoundField DataField="LeaseEndDate" DataFormatString="{0:d}"  HeaderText="Terminantion Date" />
                                <asp:BoundField DataField="LeaseStatus" HeaderText="Lease Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                               <asp:HiddenField ID="hfActive" runat="server" Value='<%# Eval("LeaseStatus") %>' />
                                    <asp:HiddenField ID="hfExpiring" runat="server" Value='<%# Eval("Expiring") %>' />


                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewLease" CommandArgument='<%# Eval("LeaseID") %>' ToolTip="View lease details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsLease" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyTenant" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="PropertyID" Type="Int32" />
           
                                </SelectParameters>
                         </asp:SqlDataSource>
            </div>               
        </div>

            </div>
        <br />  
     </div>
     <asp:SqlDataSource ID="sdsUnits" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyUnit" SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:SessionParameter Name="PropertyID" SessionField="PropertyID" Type="Int32" />
             <asp:Parameter DefaultValue="0" Name="PropertyUnitID" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>
 </div>
 
     


</div>



    </div>
    </div>
                <div class="col-md-4 grid-margin stretch-card" style="height:200px">
   <div class="card">
                <div class="card-body">
<h4 class="card-title">Property Menu</h4>
<ul>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Home')">Home <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Units')">Units <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Applications')">Applications <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Leases')">Leases <span></span></a></li>

</ul>
</div>
       </div>
     </div>

    </div>
    </div>
 </section>
</asp:Content>
