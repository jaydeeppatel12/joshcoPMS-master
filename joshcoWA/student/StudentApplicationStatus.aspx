<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="StudentApplicationStatus.aspx.cs" Inherits="joshcoWA.student.StudentApplicationStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

          <asp:Panel ID="pnlReceived"  Visible="false"   runat="server" >    

                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sdsApplicationStatusUpdate" CellPadding="2" CellSpacing="2" GridLines="None" Width="100%" HorizontalAlign="Left" EmptyDataText="Your application was received successfully. We will let you know when your application status changes!" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                <asp:BoundField DataField="StatusDate" HeaderText="Status Date" />
                                <asp:BoundField DataField="Comment" HeaderText="Comment" />
                                <asp:BoundField DataField="ApplicationStatus"  HeaderText="Application Status"/>
 
                                
                            </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsApplicationStatusUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationStatusUpdate" SelectCommandType="StoredProcedure"  >
                           
                                <SelectParameters>
                                    <asp:SessionParameter Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource>
                </asp:Panel>
                        <br />   
                    </div>
                </div>
            </div>
         </div>
</asp:Content>
