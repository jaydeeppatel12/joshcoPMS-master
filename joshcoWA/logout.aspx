<%@ Page Title="" Language="C#" MasterPageFile="home.Master" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="joshcoWA.logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <link href="css/style.css" rel="stylesheet" />
       <br />  <br />
   
     <section class="site-section" >
<div class="container">
<div class="row justify-content-center">
<div class="col-md-7">
<div class="form-wrap" style="width:80%;">
<h2 class="mb-4">Logout</h2>

    You are now signed out! <br />
    <asp:Label ID="lblSession" runat="server" BackColor="#FFFF99" Text="Your session has expired,please login again" Visible="False"></asp:Label>

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
</asp:Content>
