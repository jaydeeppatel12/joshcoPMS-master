<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="tenantEventView.aspx.cs" Inherits="joshcoWA.tenant.tenantEventView" %>
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
      <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" Font-Underline="false" NavigateUrl="TenantEventList.aspx" runat="server">&nbsp;Back</asp:HyperLink>
   
          

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
                                    <td class="auto-style1">Event Description </td><td> 
                                      <asp:Literal ID="ltDescription" runat="server"></asp:Literal>
                                         <asp:SqlDataSource ID="sdsEvent" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" DeleteCommand="DeleteEvent" DeleteCommandType="StoredProcedure" InsertCommand="InsertEvent" InsertCommandType="StoredProcedure" SelectCommand="SelectEvent" SelectCommandType="StoredProcedure">
                                             <DeleteParameters>
                                                 <asp:Parameter Name="EventID" Type="Int32" />
                                             </DeleteParameters>
                                             <InsertParameters>
                                                 <asp:Parameter Name="EventTitle" Type="String" />
                                                <%--<asp:Parameter Name="PostOnTwitter" Type="Boolean" />
                                                 <asp:Parameter Name="PostOnFacebook" Type="Boolean" />
                                                 <asp:Parameter Name="PostOnWebSite" Type="Boolean" />--%>
                                             <%--    <asp:Parameter Name="Event" Type="String" />--%>
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
                                             
  <br />
</div>

                                          
                                            <div class="block-20 ">
  
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