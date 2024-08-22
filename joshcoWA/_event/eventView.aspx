<%@ Page Title="" Language="C#" MasterPageFile="_event.Master" AutoEventWireup="true" CodeBehind="eventView.aspx.cs" Inherits="joshcoWA._event.eventView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
 <section class="site-section">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">

                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">

<h2>Event Details</h2><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
      <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="eventList.aspx" runat="server">Back</asp:HyperLink>
   
          

             <table style="padding-bottom:10px; width:100% ;"><tr> <td style="width: 20%"> &nbsp;</td><td style="padding-bottom:8px">
                  &nbsp;</td><td style="padding-bottom:8px" class="auto-style1" rowspan="5">
                                             <asp:Panel ID="pnlRSVP" runat="server"  CssClass="block-20"  style="background-color:#def0ed;" >
                                                 <table class="auto-style3">
                                                     <tr>
                                                         <td><strong class="auto-style4">RSVP</strong></td>
                                                     </tr>
                                                     <tr>
                                                         <td>
                                                             <asp:RadioButtonList ID="rblRSVP" runat="server" Width="146px" AutoPostBack="True" OnSelectedIndexChanged="rblRSVP_SelectedIndexChanged">
                                                                 <asp:ListItem>Yes, I&#39;ll attend</asp:ListItem>
                                                                 <asp:ListItem>Maybe</asp:ListItem>
                                                                 <asp:ListItem>No</asp:ListItem>
                                                             </asp:RadioButtonList>
                                                         </td>
                                                     </tr>
                                                 </table>
                                                 &nbsp;</asp:Panel>
                                              </td></tr>
                      <tr> <td style="width: 20%"> Event Title</td><td style="padding-bottom:8px">
                  <asp:Label ID="lblTitle" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>
                                         </td></tr>
                      <tr> <td style="width: 20%"> Start Date</td><td style="padding-bottom:8px">
                  <asp:Label ID="lblStartDate" runat="server" ForeColor="#333333"></asp:Label>
                                         </td></tr>
                      <tr> <td style="width: 20%;"> End Date</td><td style="padding-bottom:8px">
                          <asp:Label ID="lblEndDate" runat="server" ForeColor="#333333"></asp:Label>
                          </td></tr>
                      <tr>
                                    <td class="auto-style1">
                                         Post on Twitter</td><td>
                                        <asp:RadioButtonList ID="rblTwitter" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="True">Yes</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="False">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                  <tr>
                                    <td class="auto-style1"> Post on Facebook</td><td> 
                                        <asp:RadioButtonList ID="rblFacebook" runat="server"  RepeatDirection="Horizontal">
                                            <asp:ListItem Value="True">Yes</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="False">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                      </td> 
                                   
                                      <td>
                                  <asp:LinkButton ID="lnkEdit" Font-Size="Small" style="float:right;" OnClick="lnkEdit_Click" runat="server">edit event details</asp:LinkButton></td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>

                                  <tr>
                                    <td class="auto-style1"> Public event</td><td> 
                                        <asp:RadioButtonList ID="rblWebsite" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="True">Yes</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="False">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                         <asp:SqlDataSource ID="sdsEvent" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" DeleteCommand="DeleteEvent" DeleteCommandType="StoredProcedure" InsertCommand="InsertEvent" InsertCommandType="StoredProcedure" SelectCommand="SelectEvent" SelectCommandType="StoredProcedure">
                                             <DeleteParameters>
                                                 <asp:Parameter Name="EventID" Type="Int32" />
                                             </DeleteParameters>
                                             <InsertParameters>
                                                 <asp:Parameter Name="EventTitle" Type="String" />
                                                 <asp:Parameter Name="PostOnTwitter" Type="Boolean" />
                                                 <asp:Parameter Name="PostOnFacebook" Type="Boolean" />
                                                 <asp:Parameter Name="PostOnWebSite" Type="Boolean" />
                                                 <asp:Parameter Name="Event" Type="String" />
                                                 <asp:Parameter Name="StartDate" Type="DateTime" />
                                                 <asp:Parameter Name="EndDate" Type="DateTime" />
                                                 <asp:Parameter Name="AddedBy" Type="Int32" />
                                                 <asp:Parameter Direction="InputOutput" Name="EventID" Type="Int32" />
                                             </InsertParameters>
                                             <SelectParameters>
                                                 <asp:Parameter DefaultValue="0" Name="PropertyID" Type="Int32" />
                                                 <asp:Parameter DefaultValue="0" Name="AddedBy" Type="Int32" />
                                                 <asp:SessionParameter DefaultValue="" Name="EventID" SessionField="EventID" Type="Int32" />
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                      </td> 
                                   
                                      <td>
                                          <asp:SqlDataSource ID="sdsEventRSVP" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" InsertCommand="InsertEventRSVP" InsertCommandType="StoredProcedure" SelectCommand="SelectEventRSVP" SelectCommandType="StoredProcedure">
                                              <InsertParameters>
                                                  <asp:Parameter Name="UserID" Type="Int32" />
                                                  <asp:Parameter Name="EventID" Type="Int32" />
                                                  <asp:Parameter Name="RSVP" Type="String" />
                                              </InsertParameters>
                                              <SelectParameters>
                                                  <asp:SessionParameter Name="EventID" SessionField="EventID" Type="Int32" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                                      </td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>
                      <tr> <td style="width: 20%; vertical-align: top;"> Event Description</td><td style="padding-bottom:8px">
                          <asp:Literal ID="ltDescription" runat="server"></asp:Literal>
                          </td></tr>
                      
                              
                      <tr> <td style="width:20%; "> &nbsp;</td><td style="padding-bottom:8px; vertical-align:top">
                                  &nbsp;</td><td style="padding-bottom:8px">  <asp:SqlDataSource ID="sdsRSVP" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" InsertCommand="InsertEventRSVP" InsertCommandType="StoredProcedure" SelectCommand="Select * From [dbo].[EventRSVP] Where EventID = @EventID and UserID = @UserID">
                                              <InsertParameters>
                                                  <asp:Parameter Name="UserID" Type="Int32" />
                                                  <asp:Parameter Name="EventID" Type="Int32" />
                                                  <asp:Parameter Name="RSVP" Type="String" />
                                              </InsertParameters>
                                              <SelectParameters>
                                                  <asp:SessionParameter Name="EventID" SessionField="EventID" Type="Int32" />
                                                  <asp:SessionParameter Name="UserID" SessionField="UserID" />
                                              </SelectParameters>
                                          </asp:SqlDataSource>
                                                 </td></tr>
                      

                      <tr> <td style="width:20%; vertical-align: top;"> &nbsp;</td><td style="padding-bottom:8px; vertical-align:top">
                                   
                                         </td><td style="padding-bottom:8px">&nbsp;</td></tr>
                      

                      </table> 
                                            <div class="block-20 ">
                                                    <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
             <table class="w-100">
                                           <tr>
                                               <td><h3 class="heading">Properties</h3>
</td>
                                           </tr><tr>
                                               <td>
 
                                        <asp:GridView ID="gvProperty" runat="server" Width="100%" AutoGenerateColumns="False" ShowHeader="False" GridLines="None">
                                    <Columns>
                                          <asp:TemplateField ItemStyle-Width="20px" ItemStyle-VerticalAlign="Top" >
                        <ItemTemplate> 
                           <img src="../images/dot.png" width="6" />
                            </ItemTemplate>
                                              <ItemStyle Width="20px" />
                          </asp:TemplateField>
                         <asp:TemplateField >
                        <ItemTemplate>
                            <asp:Label ID="lblProperty" runat="server" Text='<%# Eval("PropertyName") %>'></asp:Label>
                            <asp:HiddenField ID="hfPropertyID" Value='<%# Eval("PropertyID") %>' runat="server" />
                            </ItemTemplate>
                          </asp:TemplateField>
                                          
                                    </Columns>
                                </asp:GridView>
                                         <asp:SqlDataSource ID="sdsPropertyEvent" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyEvent" DeleteCommand="DeletePropertyEvent" DeleteCommandType="StoredProcedure" InsertCommand="InsertPropertyEvent" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                                             <DeleteParameters>
                                                 <asp:Parameter Name="EventID" Type="Int32" />
                                                 <asp:Parameter Name="PropertyID" Type="Int32" />
                                             </DeleteParameters>
                                             <InsertParameters>
                                                 <asp:Parameter Name="EventID" Type="Int32" />
                                                 <asp:Parameter Name="PropertyID" Type="Int32" />
                                             </InsertParameters>
                                             <SelectParameters>
                                                 <asp:SessionParameter DefaultValue="0" Name="EventID" SessionField="EventID" Type="Int32" />
                                             </SelectParameters>
                                         </asp:SqlDataSource>
 
                                               </td>
                                                </tr>
                 <tr>
                                               <td>
 
                                               </td>
                                                </tr>
                 </table>

             
             </div>
  <br />
</div>

                                          
                                            <div class="block-20 ">
        <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
             <table class="w-100">
                                           <tr>
                                               <td><h3 class="heading">RSVP List</h3>
</td>
                                           </tr><tr>
                                               <td>
 
                                               </td>
                                                </tr>
                 <tr>
                                               <td>
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left"  DataSourceID="sdsEventRSVP">
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                <asp:BoundField DataField="UserGroup" HeaderText="User Group" />
                                 <asp:BoundField DataField="DateAdded" DataFormatString="{0:ddd, dd MMM yy}" HeaderText="Date Added" />
                                 
                                 <asp:BoundField DataField="RSVP" HeaderText="RSVP" />
                          
                                
                            </Columns>
                             <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                                               </td>
                                                </tr>
                 </table>

             
             </div>
        <br />
   
     </div>
   </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
