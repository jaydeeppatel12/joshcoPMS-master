<%@ Page Title="" Language="C#" MasterPageFile="~/tenant/tenant.Master" AutoEventWireup="true" CodeBehind="tenantNoticeList.aspx.cs" Inherits="joshcoWA.tenant.tenantNoticeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <section class="site-section">   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>    
     <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">

                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">

                            <h2 class="mb-5">Notice List</h2>                                               
                                           
                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" DataSourceID="sdsNotice">
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                 <asp:BoundField DataField="DateAdded" DataFormatString="{0:ddd, dd MMM yy}" HeaderText="Date Added" />
                                 <asp:BoundField DataField="NoticeTitle" HeaderText="Notice Title" />
                                 <asp:BoundField DataField="PostOnTwitter" HeaderText="Posted On Twitter" />
                                <asp:BoundField DataField="PostOnFacebook" HeaderText="Posted On Facebook" />
                                <asp:BoundField DataField="PostOnWebSite" HeaderText="Posted On WebSite" />                              
                             <asp:TemplateField>
                                    <ItemTemplate> 
                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewNotice" CommandArgument='<%# Eval("NoticeID") %>' ToolTip="View notice details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div align="center">No records found.</div>
                            </EmptyDataTemplate>
                             <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />                         
                            </asp:GridView>

                            <asp:SqlDataSource ID="sdsNotice" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectNotice" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="PropertyID" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="AddedBy" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="NoticeID" Type="Int32" />
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