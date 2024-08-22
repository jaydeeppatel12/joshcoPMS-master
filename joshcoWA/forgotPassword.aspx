<%@ Page Title="" Language="C#" MasterPageFile="home.Master" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="joshcoWA.forgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <section class="site-section" >
<div class="container">
<div class="row justify-content-center">
<div class="col-md-7">
<div class="form-wrap" style="width:80%;">
<h2 class="mb-4">Forgot Password</h2>
      <form id="form1" runat="server"   >
        <table style="width: 100%">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <table __designer:mapid="7b5" cellpadding="3" cellspacing="2" class="style5">
                    <tr __designer:mapid="7bb">
                        <td __designer:mapid="7bd" class="stdyle9" colspan="3" style="font-size: 11pt">
                            Please submit your email address to retrieve your password.</td>
                    </tr>
                    <tr __designer:mapid="7dc">
                        <td __designer:mapid="7de" class="style13" valign="top" style="font-size: 10pt">
                            Email Address</td>
                        <td __designer:mapid="7df" class="style12" valign="top">
                            <asp:TextBox ID="txtUserName" runat="server" ValidationGroup="Add" 
                                Width="220px" style="font-size: 10pt"></asp:TextBox><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtUserName" Display="Dynamic" 
                                ErrorMessage="*Invalid email address" Font-Size="8pt" ForeColor="Red" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="Add" Width="120px"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtUserName" CssClass="style12" Display="Dynamic" 
                                ErrorMessage="*Required" ForeColor="Red" style="font-size: 8pt" ValidationGroup="Add"></asp:RequiredFieldValidator>
                        </td>
                        <td __designer:mapid="7e1" class="style19" valign="top">
                            
                        </td>
                    </tr>
                    <tr __designer:mapid="7f7">
                        <td __designer:mapid="7f9" class="style14" colspan="3">
                            <asp:Label ID="lblDetails" runat="server" Font-Size="8pt" 
                                style="color: #0033CC; background-color: #FFFF99" Text="Submited successfully" 
                                Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr __designer:mapid="7f7">
                        <td __designer:mapid="7f9" class="style13">
                            &nbsp;</td>
                        <td __designer:mapid="7fb" class="style12" valign="top">
                             
                            <asp:Button ID="imbSubmit" runat="server" 
                                 onclick="imbSubmit_Click" CssClass="btn btn-primary px-5 py-2"
                                ToolTip="Submit contact details" Text="Submit" ValidationGroup="Add" />
                            &nbsp;
                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="SteelBlue" 
                                NavigateUrl="~/Login.aspx" Font-Underline="False">or login</asp:HyperLink>
                        </td>
                        <td __designer:mapid="7fd" class="style19">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
          </form>
    </div>
</div>
</div>
</div>
</section>
</asp:Content>
