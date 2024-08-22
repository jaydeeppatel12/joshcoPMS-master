<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="StudentApplicationPayDeposit.aspx.cs" Inherits="joshcoWA.student.StudentApplicationPayDeposit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <section class="site-section">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <div class="container">
<div class="row justify-content-center">
<div class="row">
<div class="col-md-12 form-group">
  <table style="width:80%">
            <tr>
                <td> &nbsp;Hi
                    <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                    ,
                    <br />
                    &nbsp;view your application status below.<br /> </td>
            </tr>                                    
           </table>
                    <br />

     <asp:Panel ID="pnlApplicationInProgress"  Visible="true"   runat="server" >    
                      <asp:Label ID="lblApplicationInProgress" runat="server" ForeColor="Red" Text=" Application process in progress..."></asp:Label> 
           </asp:Panel>

     <asp:Panel ID="pnlApplicationReceived"  Visible="false"   runat="server" >    
                        <asp:Label ID="Label1" runat="server"  Text="Your application was received successfully. We will let you know when your application status changes!"></asp:Label> 
           </asp:Panel>
    
     </div>
</div> 
</div>
</div>
    </section>
</asp:Content>
