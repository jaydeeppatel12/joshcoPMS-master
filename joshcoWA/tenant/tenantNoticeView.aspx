<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="tenantNoticeView.aspx.cs" Inherits="joshcoWA.tenant.tenantNoticeView1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>
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
                                            <h2> Notice View</h2>
                                        <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" Font-Underline="false" NavigateUrl="TenantNoticeList.aspx" runat="server">&nbsp;Back</asp:HyperLink>
<br />    <br />
                                                        <table  class="w-100"  >
                                
                                                <tr>
                                                    <td style="width: 20%; vertical-align: top;"> Title </td>
                                                    <td style="padding-bottom:8px"><asp:Literal ID="ltNoticeTitle" runat="server"></asp:Literal></td>                                                                 
                                                 </tr>
                                                            <tr> 
                                                     <td style="width: 20%; vertical-align: top;">Added By</td>
                                                     <td style="padding-bottom:8px"> <asp:Literal ID="AddedBy" runat="server"></asp:Literal></td>
                                                 </tr>    

                                                 <tr> 
                                                     <td style="width: 20%; vertical-align: top;"> <br />  <br />Notice</td>
                                                     <td style="padding-bottom:8px"> 
                                                         <asp:Literal ID="ltNoticeDescription" runat="server"></asp:Literal>
                                                      </td>
                                                 </tr>    
                                                              </table>
                            
                                        <asp:HiddenField ID="hfNoticeID" runat="server" Value="0" />
                                                                
                                         <asp:SqlDataSource ID="sdsNotice" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectNotice" SelectCommandType="StoredProcedure">
                                             <DeleteParameters>
                                                 <asp:Parameter Name="NoticeID" Type="Int32" />
                                             </DeleteParameters>
                                             <InsertParameters>
                                                 <asp:Parameter Name="NoticeTitle" Type="String" />
                                                 <asp:Parameter Name="PostOnTwitter" Type="Boolean" />
                                                 <asp:Parameter Name="PostOnFacebook" Type="Boolean" />
                                                 <asp:Parameter Name="PostOnWebSite" Type="Boolean" />
                                                 <asp:Parameter Name="Notice" Type="String" />
                                                 <asp:Parameter Name="AddedBy" Type="Int32" />
                                                 <asp:Parameter Direction="InputOutput" Name="NoticeID" Type="Int32" />
                                             </InsertParameters>
                                             <SelectParameters>
                                                 <asp:Parameter DefaultValue="0" Name="PropertyID" Type="Int32" />
                                                 <asp:Parameter DefaultValue="0" Name="AddedBy" Type="Int32" />
                                                 <asp:SessionParameter DefaultValue="" Name="NoticeID" SessionField="NoticeID" Type="Int32" />
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