<%@ Page Title="" Language="C#" MasterPageFile="home.Master" AutoEventWireup="true" CodeBehind="properties.aspx.cs" Inherits="joshcoWA.properties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <form id="form1" runat="server">

       <section class="site-section"  >
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px;height:2400px"  >

    <h2 class="mb-5" style="padding-bottom:0px;">Properties</h2>
  <div style="float:right; width:250px">
                            <table><tr><td>
                            <input type="text" id="txtSearch" runat="server"  class="form-control py-2 " /></td><td><asp:Button ID="btnSearch" runat="server" style=" vertical-align:bottom; float:right; padding:0; font-size:small;" OnClick="SearchProperty" Text="Search" ToolTip="Search"  CssClass="btn btn-primary" /></td></tr></table> </div> 
    <asp:DataList ID="dlUnits" runat="server" RepeatColumns="2" Width="100%" DataSourceID="sdsProperties" OnItemCommand="dlUnits_ItemCommand" OnItemDataBound="dlUnits_ItemDataBound" >
                 <ItemStyle VerticalAlign="Top" />
                            <ItemTemplate>
                                <div class="block-20" style="height:450px">
                                <figure> 
                                <a href="#"><asp:Image ID="Image1" runat="server" ImageUrl="~/images/img_2.jpg" Height="300px"  class="img-fluid" /> </a>
                                </figure>
                                <div class="text">
                                    <asp:Label ID="lblPropertyUnit" runat="server" ForeColor="Black" Text='<%# Eval("PropertyName") %>'></asp:Label>                                    
                                    <asp:HiddenField ID="hfImageFileName" Value='<%# Eval("ImageFileName") %>' runat="server" />
                                    <asp:HiddenField ID="hfPropertyID" Value='<%# Eval("PropertyID") %>' runat="server" />
                               <div><span class="ion-android-home"></span>  <asp:Label ID="Label2" runat="server" Text='<%#  "Address: "+Eval("Address")+", "+Eval("AddressCode") %>'></asp:Label> m<sup>2</sup></div>
                                <div><span class="ion-android-document"></span>  <asp:Label ID="Label3" runat="server" Text='<%#  "Units: "+ Eval("TotalUnits") %>'></asp:Label> <asp:LinkButton ID="lnkEditUnit" style="float:right;" CausesValidation="false" CommandName="apply" CommandArgument='<%# Eval("PropertyID") %>'  runat="server">Apply</asp:LinkButton></div>
 
                                </div><br />
                                </div>
                            </ItemTemplate>
        <SeparatorTemplate>
            &nbsp;
        </SeparatorTemplate>
                     <SeparatorTemplate>
                         &nbsp;&nbsp;
                     </SeparatorTemplate>
                        </asp:DataList>
    
                            <asp:SqlDataSource ID="sdsProperties" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationPropertyList" SelectCommandType="StoredProcedure">
                         </asp:SqlDataSource>
    
    
    <br />
    <br />
   
     </div>
     </div>
     </div>
     </div>
             </section>
           <script src="js/jquery-3.2.1.min.js"></script>
<script src="js/jquery-migrate-3.0.0.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/main.js"></script>
                 </form>  
</asp:Content>
