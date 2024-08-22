<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmStudentAccommodation.ascx.cs" Inherits="joshcoWA.student.frmStudentAccommodation" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<style type="text/css">
    .auto-style1 {
        width: 100%;
        height:100%;
        
    }
   
</style>
<table>
      <tr>
        <td>              
           <strong>ACCOMMODATION DETAILS  - </strong>            
            <asp:Label ID="lblAccommodationDetails" runat="server" ForeColor="Red" Text="Incomplete"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>             
            <asp:DropDownList ID="ddlStudentAccommodation" runat="server" CssClass="btn-outline-warning btn-fw" AppendDataBoundItems="True" DataTextField="StudentAccommodationName" DataValueField="StudentAccommodationID"   AutoPostBack="True" OnSelectedIndexChanged="ddlStudentAccommodation_SelectedIndexChanged"  >
            <asp:ListItem Value="0">-- Please Select Student accommodation --</asp:ListItem>
            </asp:DropDownList>
        
        </td>
    </tr>
    <tr>
        <td>
            <br />          
                 <asp:DropDownList ID="ddlStudentAccommodationUnit" AppendDataBoundItems="true" runat="server"  CssClass="btn-outline-warning btn-fw"  AutoPostBack="True" OnSelectedIndexChanged="ddlStudentAccommodationUnit_SelectedIndexChanged">
                      <asp:ListItem Value="0">-- Please Select Accommodation Unit --</asp:ListItem>
                 </asp:DropDownList>
                     
        </td>
    </tr> 
    <tr>
        <td class ="col" >
             <div id="PropertyTypeProfile" runat="server" visible="false" class="tabcontent">                
                 <table class="auto-style1">
                     <tr>
                         <td style="vertical-align:top;"">
                             <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                                 <asp:Image ID="Image1" ImageUrl="~/images/img_2.jpg" runat="server" Width="70%" Height="250px" style="padding-right:20px;" />
                             <p>
                                <table style="width:100%">                             
                                <tr>
                                  <td style="width: 155px; color:#005d63">Unit Number</td>
                                  <td>
                                      <asp:Label ID="lblUnitNumber" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 155px; color:#005d63">Unit Type</td>
                                  <td>
                                      <asp:Label ID="lblUnitType" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 155px ; color:#005d63;">Number of Beds</td>
                                  <td>
                                      <asp:Label ID="lblNumberOfBeds" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                                <tr>
                                  <td style="width: 155px; color:#005d63;">Deposit</td>
                                  <td>
                                      <asp:Label ID="lblDeposit" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:#005d63;">Rental Amount</td>
                                  <td>
                                      <asp:Label ID="lblRentalAmount" ForeColor="Black" runat="server"></asp:Label></td>
                             <%-- </tr>   --%>                       
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
                 </table>
            </div>
        </td>
    </tr>         
</table>


    </ContentTemplate>
</asp:UpdatePanel>

