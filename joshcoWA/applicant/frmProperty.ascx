<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmProperty.ascx.cs" Inherits="joshcoWA.applicant.frmProperty" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
        height:100%;
        
    }
   
</style>
<%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<%--    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />--%>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
   
    <style>
        .carousel-inner img {
            width: 100%;
            height: 350px;
        }
    </style>
<asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        <img src="../images/load.gif" width="10" />
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

<table class="auto-style1">
    <tr>
        <td>              <%--btn btn-danger dropdown-toggle--%>
            <asp:DropDownList ID="ddlProperty" runat="server" CssClass="btn-outline-warning btn-fw" AppendDataBoundItems="True" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID" AutoPostBack="True" OnSelectedIndexChanged="ddlProperty_SelectedIndexChanged" Width="100%">
            <asp:ListItem Value="0">-- Select a property --</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationPropertyList" SelectCommandType="StoredProcedure" onselected="sdsProperty_Selected">               
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <br />              
                 <asp:DropDownList ID="ddlPropertyUnit" runat="server" DataSourceID="sdsPropertyUnit" CssClass="btn-outline-warning btn-fw" DataTextField="PropertyUnit" DataValueField="PropertyUnitID" AppendDataBoundItems="True" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="ddlPropertyUnit_SelectedIndexChanged">
                 </asp:DropDownList>
                       <asp:SqlDataSource ID="sdsPropertyUnit" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationPropertyUnitList" SelectCommandType="StoredProcedure" onselected="sdsPropertyUnit_Selected">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlProperty" Name="PropertyID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                      </asp:SqlDataSource>
        </td>
    </tr>    <tr>
        <td>
            <div class="col" >

<div id="PropertyProfile" runat="server" visible="false" class="tabcontent">
                
                 <table class="auto-style1">
                     <tr>
                        <%-- <td style="vertical-align:top; width:40%"> <div style="padding-top:10px;">
                     
                      
                 </div>  </td>
                         <td>&nbsp;</td>--%>
                         <td style="vertical-align:top;"">
                             <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                                 <asp:Image ID="Image1" ImageUrl="~/images/img_2.jpg" runat="server" Width="70%" Height="250px" style="padding-right:20px;" />
                            <%--  <i class="ti-info-alt"></i>--%>
                              <p>
      <table style="width:100%">
                              
                              
                               <tr>
                                  <td style="width: 155px; color:#005d63;">Erf No.</td>
                                  <td>
                                      <asp:Label ID="lblErf" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 155px ; color:#005d63;">Portion No.</td>
                                  <td>
                                      <asp:Label ID="lblPortion" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
           <tr>
                                  <td style="width: 155px; color:#005d63;">Area or Extent</td>
                                  <td>
                                      <asp:Label ID="lblArea" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:#005d63;">Contact Person</td>
                                  <td>
                                      <asp:Label ID="lblContactPerson" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:#005d63;">Telephone</td>
                                  <td><asp:Label ID="lblTelephone" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:#005d63;">Fax No.</td>
                                  <td><asp:Label ID="lblFaxNo" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:#005d63;">Email Address</td>
                                  <td><asp:Label ID="lblEmailAddress" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:#005d63;">Physical Address</td>
                                  <td><asp:Label ID="lblPhysicalAddress" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:#005d63;">Postal Address</td>
                                  <td><asp:Label ID="lblPostalAddress" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:#005d63;">Latitude</td>
                                  <td>
                                      <asp:Label ID="lblLat" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:#005d63;">Longitude</td>
                                  <td>
                                      <asp:Label ID="lblLong" ForeColor="Black" runat="server"></asp:Label><asp:SqlDataSource ID="sdsPropertyProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="PropertyID" SessionField="PropertyID" Type="Int32" />
                                      </SelectParameters>
                                      </asp:SqlDataSource></td>
                              </tr>
                                <tr>
                                  <td style="width: 155px; color:#005d63;">&nbsp;</td>
                                  <td>
                             </td>
                              </tr>
                            <tr>
                                  <td style="width: 155px; color:#005d63;"> </td>
                                  <td>
                             </td>
                              </tr>
                          </table> 
                             </p>
                            </div>
                         </td>
                     </tr>
                     <tr>
                         <td>

                         </td>
                     </tr>
                 </table>
         <asp:SqlDataSource ID="sdsUnits" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyUnit" SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:ControlParameter ControlID="ddlProperty" DefaultValue="" Name="PropertyID" PropertyName="SelectedValue" Type="Int32" />
             <asp:Parameter DefaultValue="0" Name="PropertyUnitID" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>
          <asp:DataList ID="dlUnits" runat="server" EditItemStyle-Height="50%" ItemStyle-Width="50%" ItemStyle-VerticalAlign="top" RepeatColumns="2" Width="100%" DataSourceID="sdsUnits" OnItemDataBound="dlUnits_ItemDataBound" >
                 <HeaderTemplate>
                     Property Units
                 </HeaderTemplate>
                            <ItemTemplate >
            
                                          <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                                               <div id="myCarousel" class="carousel slide" data-ride="carousel" style="vertical-align:top; " >
                <div class="carousel-inner" role="listbox" style="vertical-align:top;" >
                    <asp:HiddenField ID="hfPropertyUnitID" runat="server" value='<%# Eval("PropertyUnitID") %>'  />
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="carousel-item <%#GetActiveClass(Container.ItemIndex) %>" style="vertical-align:top; width:200px;">
                         
                                <asp:Image ID="Image1" ImageUrl='<%# "..//propertunitypic//"+Eval("PropertyUnitID")+"//"+Eval("ImageName") %>' runat="server" Width="100%" Height="150px" style="padding-right:20px;" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <img runat="server" id="NoImage" alt="NoImage" visible="false" style="height: 150px; width:100%; " src="..//images//img_2.jpg" />
                </div>
                <a class="carousel-control-prev" href="#myCarousel" data-slide="prev" role="button">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#myCarousel" data-slide="next" role="button">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
                                                    <table style="width:100%">
                              
                              
                               <tr>  <td style="width: 155px; color:#005d63;"><asp:Label ID="lblPropertyUnit" runat="server" ForeColor="Black" Text='<%# Eval("PropertyUnit") %>'></asp:Label> </td></tr>
                                  <tr>  <td style="width: 155px; color:#005d63;"><asp:Label ID="Label2" runat="server" Text='<%#  "Unit Area: "+Eval("UnitArea") %>'></asp:Label> m<sup>2</sup> </td></tr>
                                                        <tr>  
                                                            <td style="width: 155px; color:#005d63;">
                                                                 <asp:HiddenField ID="hfRentalAmount" runat="server" value='<%# Eval("PropertyUnitID", "{0: R ### ### ###.00}") %>'  />
                  
                                                                <asp:Label ID="Label3" runat="server" Text='<%#  "Rental Amount: "+ Eval("EstRatePerSQM", "{0: R ### ### ###.00}") %>'></asp:Label> </td></tr>
                                                        <tr>  
                                                            <td style="width: 155px; color:#005d63;"> </td>

                                                        </tr>
                              
                                                        </table>

                                    
                                

                              
                             </div>
                                  

                     
                            </ItemTemplate>
                     <SeparatorTemplate>
                         &nbsp;&nbsp;
                     </SeparatorTemplate>
                        </asp:DataList>
             


    
    </div>
                    <div id="ApplicationProcess" runat="server" visible="true" style="  padding-top:10px;" class="tabcontent">
        
<h3>Application Process:</h3>
This application form consist of the following sections
<ul>
  <li>Applicant Details </li>
  <li>Employment Details of Applicant</li>
    <li>General Details </li>
  <li>Applicant Spouse (Only if married)</li>
    <li>Applicant Spouse Employement Details (Only if married)</li> 
    <li>Applicant Income</li>
    <li>Applicant Expenditure </li>
     <li>Supporting Documents </li>
    <li>Declaration</li>
</ul>
<br />
    
        </div>

             </div>
        </td>
    </tr>
  
</table>
 
    </ContentTemplate>
</asp:UpdatePanel>

