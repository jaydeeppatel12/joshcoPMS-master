<%@ Page Title="" Language="C#" MasterPageFile="home.Master" AutoEventWireup="true" CodeBehind="publicEvent.aspx.cs" Inherits="joshcoWA.publicEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        .auto-style3 {
            text-align: center;
            width: 167px;
              height: 18px;
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
          </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
   
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
   <h2 class="mb-5">Public Event </h2>
                                            <asp:Panel ID="Panel2" runat="server" visible="false" Width="100%" >
                                                 <table style="width:100%">
                               <tr>
                        <td style="width:25%">
                           <b>Start date/time: </b>   <asp:Label ID="lblStart" runat="server"  ></asp:Label><br />
                            <b> End date/time:</b>  <asp:Label ID="lblEnd" runat="server" Text=""></asp:Label>

                        </td>
                        <td class="text-center">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="18pt"></asp:Label>
                          </td>
                        <td style="width:25%">
                           &nbsp;
                        </td>
                    </tr>
                                                     </table>

                                                 <div class="block-20 ">
                                                    <div class="alert alert-warning mt-4 d-flex align-items-center" role="alert" >
               <table  style=" width:100%; ">
                    <tr>
                        <td>
 <table style="width:100%">

                    <tr>
                        <td></td>
                        <td class="text-center"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="text-center">
 <asp:Literal ID="ltEvent" runat="server"></asp:Literal>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="text-center">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    
 
                    </table>
                        </td>
                        </tr>
                   <tr>
                       <td style="text-align: center">
                           &nbsp;</td>
                   </tr>
                   </table> 
                                                        </div>
                                                     </div>
                                                </asp:Panel>

                                            <br />
                                            <asp:Panel ID="Panel1" runat="server" visible="false" Height="500px"  ScrollBars="Both"   Width="100%" >
         <asp:GridView ID="gvEvent" runat="server" AutoGenerateColumns="False"   DataSourceID="sdsEvent" GridLines="None"  ShowHeader="False" style="text-align: left; font-size: 10pt;" Width="100%" OnRowCommand="gvEvent_RowCommand" >
                                      <Columns>
                                          <asp:TemplateField>
                                              <ItemTemplate>
                                                 <table style="width: 100%">
                                      <tr>
                        <td class="auto-style23" style="border: 1px solid #FDCB64; vertical-align: top"><strong class="auto-style11"><span class="auto-style26"><%# Eval("Start", "{0:dd}") %></span></strong><strong><br />
                            <%# Eval("Start", "{0:MMM}") %></strong><font size="2"> <%# Eval("Start", "{0:yy}") %></font></td>
                        <td class="auto-style24">&nbsp;</td>
                        <td class="auto-style25" style="border-width: 1px; border-color: #FDCB64; border-bottom-style: dotted; padding-left:10px"><%# Eval("EventTitle" ) %></td>
                        <td style="width:50px">
                           <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewEvent" CommandArgument='<%# Eval("EventID") %>' ToolTip="View Event details" ForeColor="#75C5CA">view</asp:LinkButton>
                                          </td>
                    </tr></table>
              <asp:HiddenField ID="hfTitle" runat="server" Value='<%# Eval("EventTitle") %>' />
                                                   <asp:HiddenField ID="hfStart" runat="server" Value='<%# Eval("Start") %>' />
                                                   <asp:HiddenField ID="hfEnd" runat="server" Value='<%# Eval("End") %>' />

             <asp:Literal ID="ltrEvent" runat="server" Visible="false" Text='<%# Eval("Event") %>'></asp:Literal>

                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                      <HeaderStyle BorderStyle="None" HorizontalAlign="Left" />
                                      <RowStyle HorizontalAlign="Left" />
                                      </asp:GridView>
                                               <asp:SqlDataSource ID="sdsEvent" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [Events] WHERE ([PostOnWebSite] = @PostOnWebSite) ORDER BY [Start] DESC">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="True" Name="PostOnWebSite" Type="Boolean" />
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
        <script src="js/jquery-3.2.1.min.js"></script>
<script src="js/jquery-migrate-3.0.0.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/main.js"></script>
           </form>
</asp:Content>
