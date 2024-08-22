<%@ Page Title="" Language="C#" MasterPageFile="_event.Master" AutoEventWireup="true" CodeBehind="PostEvent.aspx.cs" Inherits="joshcoWA._event.PostEvent" %>
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Button ID="btnExport" Text="Export to Image" runat="server" UseSubmitBehavior="false"  OnClick="ExportToImage" OnClientClick="return ConvertToImage(this)" />
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
                  
                    
 
                    </table>
                        </td>
                        </tr>
                  
                   </table> 
                                                        </div>
                                                     </div>
                                              
                                             <asp:SqlDataSource ID="sdsEvent" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [Events] WHERE ([EventID] = @EventID) ">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="0" Name="EventID" QueryStringField="EventID" Type="Int32" />
                                </SelectParameters>
                         </asp:SqlDataSource>
</div>
</asp:Content>
