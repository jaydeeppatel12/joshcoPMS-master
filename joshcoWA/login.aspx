<%@ Page Title="" Language="C#" MasterPageFile="home.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="joshcoWA.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />  <br />
   
     <section class="site-section" >
<div class="container">
<div class="row justify-content-center">
<div class="col-md-7">
<div class="form-wrap" style="width:80%;">
<h2 class="mb-4">Admin Log In</h2>
  <form id="form1" runat="server"   >
<div class="row">
<div class="col-md-12 form-group">
<label for="name">Username</label>
	<input ID="txtUserName" runat="server" class="form-control py-2" placeholder="" type="text">
</div>
</div>
<div class="row mb-5">
<div class="col-md-12 form-group">
<label for="name">Password</label>
<input ID="txtPassword" runat="server" class="form-control py-2" placeholder="" type="password">
</div>
</div>
    

<div class="row">
<div class="col-md-6 form-group" >
     <asp:RadioButtonList ID="rblType" Visible="false" runat="server" Width="220px" RepeatDirection="Horizontal">
         <asp:ListItem Value="2" Selected="True">Admin</asp:ListItem>
         <asp:ListItem Value="1">Tenant</asp:ListItem>
         <asp:ListItem Value="3" >Supplier</asp:ListItem>
     </asp:RadioButtonList>
<%--<input type="submit" value="Login" class="btn btn-primary px-5 py-2">--%>
   <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" CssClass="btn btn-primary px-5 py-2" />
    <asp:Label ID="lblErrorMessage" runat="server" BackColor="White" ForeColor="Red"></asp:Label>
<a class="nav-link active" href="forgotpassword.aspx">Forgot password?</a>
</div>
</div>
</form>
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
