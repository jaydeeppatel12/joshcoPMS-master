<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="tenantNotice.aspx.cs" Inherits="joshcoWA.tenant.tenantNotice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        .auto-style1 {
            width: 1032px;
        }
        .auto-style2 {              text-align: center;
          }
        .auto-style3 {
            text-align: center;
            width: 167px;
              height: 18px;
          }
        .auto-style6 {
            width: 167px;
            height: 11px;
        }
        .auto-style7 {
            height: 11px;
        }
        .auto-style9 {
            height: 11px;
            width: 692px;
        }
        .auto-style10 {
            text-align: center;
          }
        .auto-style11 {
            font-weight: bold;
        }
 p.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:107%;
	font-size:11.0pt;
	/*font-family:"Calibri",sans-serif;*/
	}
        .auto-style23 {
            width: 84px;
            text-align: center;
        }
        .auto-style24 {
            width: 3px;
        }
        .auto-style25 {
            width: 903px;
        }
        .auto-style26 {
            font-size: 20pt;
        }
          .auto-style27 {
              text-align: center;
              height: 13px;
          }
          .auto-style28 {
              width: 692px;
              height: 13px;
          }
          .auto-style29 {
              height: 13px;
          }
          .auto-style30 {
              text-align: center;
              height: 18px;
          }
          .auto-style32 {
              height: 62px;
              width: 692px;
          }
          .auto-style33 {
              text-align: center;
              height: 62px;
          }
          .auto-style34 {
              height: 62px;
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
   <h2 class="mb-5">Notice </h2>
                                                         <div class="block-20 ">
                                                    <div class="alert alert-warning mt-4 d-flex align-items-center" role="alert" >
               <table  style=" width:100%; ">
                    <tr>
                        <td>
 <table style="width:100%">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                  
                    <tr>
                        <td class="auto-style3"></td>
                        <td class="auto-style10">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="18pt"></asp:Label>
                          </td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
 
                    </table>
                        </td>
                        </tr>
                   <tr>
                       <td style="text-align: center">
 <asp:Literal ID="ltNotice" runat="server"></asp:Literal>
                       </td>
                   </tr>
                   </table> 
</div>
                                                             </div>
                                            <br />
                                            <asp:Panel ID="Panel1" runat="server" Height="500px"  ScrollBars="Both"   Width="100%" >
         <asp:GridView ID="gvNotice" runat="server" AutoGenerateColumns="False"   DataSourceID="sdsNotice" GridLines="None"  ShowHeader="False" style="text-align: left; font-size: 10pt;" Width="100%" OnRowCommand="gvNotice_RowCommand" >
                                      <Columns>
                                          <asp:TemplateField>
                                              <ItemTemplate>
                                                  <table style="width: 100%">
                                      <tr>
                        <td class="auto-style23" style="border: 1px solid #FDCB64; vertical-align: top"><strong class="auto-style11"><span class="auto-style26"><%# Eval("DateAdded", "{0:dd}") %></span></strong><strong><br />
                            <%# Eval("DateAdded", "{0:MMM}") %></strong><font size="2"> <%# Eval("DateAdded", "{0:yy}") %></font></td>
                        <td class="auto-style24">&nbsp;</td>
                        <td class="auto-style25" style="border-width: 1px; border-color: #FDCB64; border-bottom-style: dotted; padding-left:10px"><%# Eval("NoticeTitle" ) %></td>
                        <td style="width:50px">
                           <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewNotice" CommandArgument='<%# Eval("NoticeID") %>' ToolTip="View notice details" ForeColor="#75C5CA">view</asp:LinkButton>
                                          </td>
                    </tr></table>
              <asp:HiddenField ID="hfTitle" runat="server" Value='<%# Eval("NoticeTitle") %>' />
             <asp:Literal ID="ltrNotice" runat="server" Visible="false" Text='<%# Eval("Notice") %>'></asp:Literal>

                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                      <HeaderStyle BorderStyle="None" HorizontalAlign="Left" />
                                      <RowStyle HorizontalAlign="Left" />
                                      </asp:GridView>
                                               <asp:SqlDataSource ID="sdsNotice" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectNotice" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="PropertyID" SessionField="PropertyID" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="AddedBy" Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="NoticeID" Type="Int32" />
                                </SelectParameters>
                         </asp:SqlDataSource>
                                                </asp:Panel>

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