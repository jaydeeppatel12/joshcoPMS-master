﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Student/studentHome.Master" AutoEventWireup="true" CodeBehind="studentLogin.aspx.cs" Inherits="joshcoWA.Student.studentLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="site-section" >
<div class="container">
<div class="row justify-content-center">
<div class="row">
<div class="col-md-12 form-group">
   <div><h2 >Login</h2></div> 
    <table>
        <tr>
            <td>
                Email Address
                 <span style="color:red">*<asp:RequiredFieldValidator ID="rfvEmailAddress" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmailAddress" ErrorMessage="Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentRegistreation"></asp:RequiredFieldValidator>
                     </span>
                </td>
            <td>
	        <asp:TextBox ID="txtEmailAddress" runat="server" ValidationGroup="StudentRegistreation" class="form-control py-2" Width="250px"></asp:TextBox>
             </td>
          
           </tr>
        <tr>
            <td>Password 
                   <span style="color:red">*<asp:RequiredFieldValidator ID="rfvPassword" runat="server" BackColor="#FFFF99" ControlToValidate="txtPassword" ErrorMessage="Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentRegistreation"></asp:RequiredFieldValidator>
                     </span>
                </td>               
            <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ValidationGroup="StudentRegistreation" class="form-control py-2" Width="250px"></asp:TextBox></td>
                         
         </tr>       
           <tr>
            <td></td>
            <td>
                <asp:Button ID="btnLogin" runat="server" ValidationGroup="StudentRegistreation"  Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-warning" />
            </td>  
                </tr>  
    </table> 
 </div>
</div> 
</div>
</div>
</section>  
</asp:Content>
