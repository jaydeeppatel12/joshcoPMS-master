<%@ Page Title="" Language="C#" MasterPageFile="home.Master" enableEventValidation="true" AutoEventWireup="true" CodeBehind="searchApplication.aspx.cs" Inherits="joshcoWA.applicant.searchApplication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />  <br />
 <form id="form1" runat="server">
    
     <section class="site-section" >
<div class="container">
<div class="row justify-content-center">
<div class="col-md-7">
<div class="form-wrap" style="width:80%;">
<h2 class="mb-4">Applicant Log In</h2>
    <div class="row">
<div class="col-md-12 form-group">
   <asp:Label ID="lblErrorMessage" runat="server" BackColor="White" ForeColor="Red"></asp:Label>
    <table>
        <tr>
            <td>
 Email Address / Cellphone No. </td>
            <td>
	<asp:TextBox ID="txtEmailAddress" runat="server" ValidationGroup="App" Width="250px"></asp:TextBox>
                    </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmailAddress" Display="Dynamic" style="float:left;"  ErrorMessage="**" ForeColor="Red" ValidationGroup="App"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
 ID / Passport No </td>
            <td>
<asp:TextBox ID="txtIDnumber" runat="server" ValidationGroup="App" Width="250px"></asp:TextBox>

                </td>
            <td>                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtIDnumber" ErrorMessage="Invalid entry" ForeColor="Red" ValidationExpression="[0-9]{13}" ValidationGroup="App"></asp:RegularExpressionValidator>--%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtIDnumber" Display="Dynamic" style="float:left;" ErrorMessage="**" ForeColor="Red" ValidationGroup="App"></asp:RequiredFieldValidator></td>
        </tr>
    </table>
  <asp:Button ID="Button1" runat="server" ValidationGroup="App" Text="Login" CssClass="btn btn-primary px-5 py-2" OnClick="Button1_Click" />
 
</div>
</div>
 
</div>
</div>
</div>
</div>
</section>
       </form> 

</asp:Content>
