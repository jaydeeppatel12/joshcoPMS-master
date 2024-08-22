<%@ Page Title="" Language="C#" MasterPageFile="_event.Master" AutoEventWireup="true" CodeBehind="eventList.aspx.cs" Inherits="joshcoWA._event.eventList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <section class="site-section">  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>     
     <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">

                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
    <h2 class="mb-5">Event List<asp:Button ID="btnEvent" runat="server" style=" vertical-align:bottom; float:right; " Text="+ New Event" CssClass="btn btn-warning" PostBackUrl="EventAdd.aspx" /></h2>
      
                                            
                                           
                                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" DataSourceID="sdsEvent">
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                 <asp:BoundField DataField="DateAdded" DataFormatString="{0:ddd, dd MMM yy}" HeaderText="Date Added" />

                                        <asp:BoundField DataField="EventTitle" HeaderText="Event Title" />
                                <asp:BoundField DataField="Start" DataFormatString="{0:ddd, dd MMM yy}" HeaderText="Start Date" />
                                 <asp:BoundField DataField="End" DataFormatString="{0:ddd, dd MMM yy}" HeaderText="End Date" />
                                 <asp:BoundField DataField="PostOnTwitter" HeaderText="Post On Twitter" />
                                <asp:BoundField DataField="PostOnFacebook" HeaderText="Post On Facebook" />
                                <asp:BoundField DataField="PostOnWebSite" HeaderText="Public event" />
                               
                         
 
                                <asp:TemplateField>
                                    <ItemTemplate>
 
                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewEvent" CommandArgument='<%# Eval("EventID") %>' ToolTip="View Event details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                             <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsEvent" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectEvent" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="PropertyID" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="AddedBy" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="EventID" Type="Int32" />
                                </SelectParameters>
                         </asp:SqlDataSource>



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