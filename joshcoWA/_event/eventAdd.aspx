﻿<%@ Page Title="" Language="C#" MasterPageFile="_event.Master" AutoEventWireup="true" CodeBehind="eventAdd.aspx.cs" Inherits="joshcoWA._event.eventAdd" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>  
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>  
<script type="text/javascript">
    function ConvertToImage(btnExport) {
        debugger;
        html2canvas($("#dvTable")[0]).then(function (canvas) {
            debugger;
            var base64 = canvas.toDataURL();
            $("[id*=hfImageData]").val(base64);
            debugger;
            __doPostBack(btnExport.name, "");

        });
        return false;
    }
</script>  
    <style>
   .round{
  border-radius: 5.5px;
  background: #ffffff;
  padding: 10px;
  width: 100%;
  /*height: 100%;*/
}
        </style>

<%--     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js" type="text/javascript"></script>  
    <div id="fb-root">  
    </div>  
    <script>  
        window.fbAsyncInit = function () {  
            FB.init({ appId: '491677990891136', status: true, cookie: true,  
                xfbml: true  
            });  
        };  
        (function () {  
            var e = document.createElement('script'); e.async = true;  
            e.src = document.location.protocol +  
'//connect.facebook.net/en_US/all.js';  
            document.getElementById('fb-root').appendChild(e);  
        } ());  
    </script>  
    <script type="text/javascript">  
        $(document).ready(function () {  
            $('#share_button').click(function (e) {  
                e.preventDefault();  
                FB.ui(  
{  
    method: 'feed',  
    name: 'jQuery Dialog',  
    link: 'http://www.c-sharpcorner.com/authors/raj1979/raj-kumar.aspx',  
    picture: 'http://www.c-sharpcorner.com/UploadFile/AuthorImage/raj1979.gif',  
    caption: 'This article demonstrates how to use the jQuery dialog feature in ASP.Net.',  
    description: 'First of all make a new website in ASP.Net and add a new stylesheet and add .js files and put images in the images folder and make a reference to the page.',  
    message: 'hello raj message'  
});  
            });  
        });  
    </script> --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <link rel="stylesheet" href="../css/PopUp.css" />

  
                                                        <asp:LinkButton ID="lnkFB" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpeFB" runat="server" PopupControlID="pnlFB" TargetControlID="lnkFB"
      CancelControlID="btnFB"   BackgroundCssClass="modalBackground" Drag="true"  X="500" Y="0"  PopupDragHandleControlID="hdlUser" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlFB" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         

 <div style="padding:15px; color:black;" class="alert alert-success mt-4 align-items-left">
   
    <h3 id="hdlUser" class="heading"><asp:Label ID="lblU" runat="server" Text="Confirm Posting to Facebook/Twitter"></asp:Label>
       <asp:ImageButton ID="btnFB" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
<asp:HiddenField ID="hfImageData" runat="server" />
                                                          <div id="dvTable" style = "width:550px; padding:0;" class="round" >
     

                                          
                                                 <table style="width:100%">
                                                     <tr>
                                                         <td style="text-align: center;">
                                                             &nbsp;</td>
                                                     </tr>
                                                     <tr>
                                                         <td style="text-align: center;">
                                                             <asp:Label ID="lblTitle" runat="server" Font-Bold="True" style="color: #fcaf17" Font-Size="16pt"></asp:Label>
                                                         </td>
                                                     </tr>
                               <tr>
                        <td style="width:25%; padding:5px;" >
                           <b>Start date/time: </b>   <asp:Label ID="lblStart" runat="server"  ></asp:Label><br />
                            <b> End date/time:</b>  <asp:Label ID="lblEnd" runat="server" Text=""></asp:Label>

                        </td>
                        
                    </tr>
                                                     
                                                     </table>

                                                 <div class="block-20 ">
                                                    <div class="alert alert-warning mt-4 d-flex align-items-center" role="alert"  style="overflow-y:auto;overflow-x:auto;">
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
                  
                    
 
                    </table>
                        </td>
                        </tr>
                  
                   </table> 
                                                        </div>
                                                     </div>
                                              
                                              
</div>
       <br />
     <asp:Button ID="btnExport" CssClass="btn btn-warning" runat="server" Text="Send Post" UseSubmitBehavior="false"  OnClick="ExportToImage" OnClientClick="return ConvertToImage(this)" />
     </div>
    
                                                   
</asp:Panel>

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

    <h2 class="mb-5"> Event Add</h2> <asp:Image ID="imgback" ImageUrl="../images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="eventView.aspx" runat="server">Back</asp:HyperLink>


                                            <table class="w-100">
                                                <tr>
                                                    <td>
                                                        <table style="width:100%">
                                
                                <tr>
                                    <td class="auto-style1"> Event Title 
                                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>
                                    </td><td >
                                    <asp:TextBox ID="txtEvent" runat="server" CssClass="form-control "></asp:TextBox>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1" style="WIdth: 200px;">
                                         Start Date</td><td>
                                        <telerik:RadDateTimePicker ID="dpStartDate" runat="server">
                                        </telerik:RadDateTimePicker>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         End Date</td><td>
                                        <telerik:RadDateTimePicker ID="dpEndDate" runat="server">
                                        </telerik:RadDateTimePicker>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
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
                                          &nbsp;</td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>

                                  <tr>
                                    <td class="auto-style1"> Public event</td><td> 
                                        <asp:RadioButtonList ID="rblWebsite" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="True">Yes</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="False">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                      </td> 
                                   
                                      <td>
                                          &nbsp;</td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>

                                  <tr>
                                    <td class="auto-style1"> Post on Property </td><td> 
                                        <asp:DropDownList ID="ddlProperty" runat="server" CssClass="btn-outline-warning btn-fw" AppendDataBoundItems="True" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID">
                                            <asp:ListItem Value="0">-- Select Project --</asp:ListItem>
                                        </asp:DropDownList>
                                         <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT [PropertyName], [PropertyID] FROM [Property] ORDER BY [PropertyName]" DeleteCommand="DeletePropertyEvent" DeleteCommandType="StoredProcedure" InsertCommand="InsertPropertyEvent" InsertCommandType="StoredProcedure">
                                             <DeleteParameters>
                                                 <asp:Parameter Name="EventID" Type="Int32" />
                                                 <asp:Parameter Name="PropertyID" Type="Int32" />
                                             </DeleteParameters>
                                             <InsertParameters>
                                                 <asp:Parameter Name="EventID" Type="Int32" />
                                                 <asp:Parameter Name="PropertyID" Type="Int32" />
                                             </InsertParameters>
                                         </asp:SqlDataSource>
                                      </td> 
                                   
                                      <td>
                                         <asp:Button ID="btnSave0" CssClass="btn btn-warning" runat="server" Text="Add" ValidationGroup="AddP" Font-Size="9pt" OnClick="btnSave0_Click" />
                                         </td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>

                                  <tr>
                                    <td class="auto-style1"> &nbsp;</td><td> 
                                           <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                                        <asp:GridView ID="gvProperty" runat="server" Width="100%" AutoGenerateColumns="False" ShowHeader="False" GridLines="None" OnRowCommand="gvProperty_RowCommand">
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
                                          <asp:TemplateField ItemStyle-Width="10px" >
                        <ItemTemplate> 
                            <asp:ImageButton ID="imbRemove" runat="server" CommandName="Remove" Width="10px" CommandArgument='<%# Eval("PropertyID") %>' ImageUrl="../images/close.png" ToolTip="Remove property" />
                            </ItemTemplate>
                                              <ItemStyle Width="10px" />
                          </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                               </div><br />

                                                                        </td> 
                                   
                                      <td>
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
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>

                                <tr>
                                    <td class="auto-style1"> Event </td><td>
                                    <telerik:RadEditor ID="RadEditor1" Runat="server"
                                        ImageManager-UploadPaths="/_event/files"
 ImageManager-DeletePaths="/_event/files"
 ImageManager-ViewPaths="/_event/files"
                                        Width="100%">

                                    </telerik:RadEditor>
                                    </td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                
                               
                                <tr>
                                    <td class="auto-style1"> 
                                        <asp:HiddenField ID="hfEventID" runat="server" Value="0" />
                                    </td><td>
                                         <asp:Button ID="btnSave" CssClass="btn btn-warning" runat="server" Text="Submit" ValidationGroup="AddP" OnClick="btnSave_Click" />
                                         <asp:SqlDataSource ID="sdsEvent" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" DeleteCommand="DeleteEvent" DeleteCommandType="StoredProcedure" InsertCommand="InsertEvent" InsertCommandType="StoredProcedure" SelectCommand="SelectEvent" SelectCommandType="StoredProcedure" OnInserted="sdsEvent_Inserted" UpdateCommand="UpdateEvent" UpdateCommandType="StoredProcedure">
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
                                             <UpdateParameters>
                                                 <asp:Parameter Name="EventTitle" Type="String" />
                                                 <asp:Parameter Name="PostOnTwitter" Type="Boolean" />
                                                 <asp:Parameter Name="PostOnFacebook" Type="Boolean" />
                                                 <asp:Parameter Name="PostOnWebSite" Type="Boolean" />
                                                 <asp:Parameter Name="Event" Type="String" />
                                                 <asp:Parameter Name="StartDate" Type="DateTime" />
                                                 <asp:Parameter Name="EndDate" Type="DateTime" />
                                                 <asp:Parameter Name="AddedBy" Type="Int32" />
                                                 <asp:Parameter Name="EventID" Type="Int32" />
                                             </UpdateParameters>
                                         </asp:SqlDataSource>
                                         </td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                </tr>
                            </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>    
                                                    </td>
                                                </tr>
                                            </table>
                               





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
 
    <div>
     
  
    </div>
</asp:Content>