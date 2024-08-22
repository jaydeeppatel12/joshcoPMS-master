<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addQuery.ascx.cs" Inherits="joshcoWA.tenant.addQuery" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<link rel="stylesheet" href="../css/PopUp.css" />
    
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>     

<%--<asp:LinkButton ID="lnkQueryAdd" runat="server"></asp:LinkButton>
<asp:ModalPopupExtender ID="mpeQueryAdd" runat="server" PopupControlID="pnlQueryAdd" TargetControlID="lnkQueryAdd"
         BackgroundCssClass="modalBackground" Drag="true"  X="0" Y="0"  PopupDragHandleControlID="hdlQueryHeader" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlQueryAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
     <div class="form-wrap"  style="width:400px; padding:15px; margin-top:50px; "  > 
        <div class="block-20;">
            <h3 id="hdlQueryHeader" class="heading"><asp:Label ID="lblQueryDocHeader" runat="server" Text="Query Details"></asp:Label>
            <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
            <p><asp:Label ID="lblRefNo" runat="server" Text="" Font-Bold="true"></asp:Label> : query details captured successfully</p>
        </div>
    </div>
 </asp:Panel>--%>
 <table style="width:65%; padding-bottom:10px">
            <tr> 
                <td class="auto-style3"> Reference Number</td>
                <td style="padding-bottom:8px" class="auto-style2">
                    <asp:Label ID="lblReferenceNo" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>
                 </td>
                 <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"> 
                    <asp:Label ID="lblTenant" runat="server" Text="Tenant"></asp:Label>
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                    <asp:Label ID="lblTenantName" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>
                </td>
                <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>
            <tr> 
                <td class="auto-style3"> 
                    Project
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                    <asp:Label ID="lblProperty" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>                                     
                </td>
                <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>
            <tr> 
                <td class="auto-style3"> Unit Number    
                     <span style="color: red">*</span>  
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                        <asp:HiddenField ID="hfPropertyUnitID" runat="server"></asp:HiddenField>
                    <asp:Label ID="lblPropertyUnit" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>                                
                 </td>
                <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>
            <tr> 
                <td class="auto-style3"> Category
                   <span style="color: red">* <asp:RequiredFieldValidator
             ID="rfvCategory" runat="server"  ControlToValidate="ddlQueryItem" InitialValue="--Select Category--" ErrorMessage="Required"  ForeColor="Red"   Font-Names="Impact" >
        </asp:RequiredFieldValidator>
                        </span>  
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                  <asp:DropDownList ID="ddlQueryItem" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" >  
                      <asp:ListItem Value="0">--Select Category--</asp:ListItem>
                        </asp:DropDownList>

                                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [FM_QueryCategory] ORDER BY [QueryCategory]"></asp:SqlDataSource>
                                         </td><td style="padding-bottom:8px" class="auto-style1">&nbsp;</td></tr>
                      <tr> <td style="vertical-align: top" class="auto-style3"> Query Description
                          <span style="color: red">*<asp:RequiredFieldValidator ID="rfvQueryDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Required" ValidationGroup="AddQuery" ForeColor="Red" BackColor="#FFFF99" Font-Size="8pt"></asp:RequiredFieldValidator>
                              </span>
                          
                          </td><td style="padding-bottom:8px" class="auto-style2"><asp:textbox id="txtDescription" runat="server" CssClass="form-control" Height="120px" TextMode="MultiLine" ValidationGroup="AddQuery"></asp:textbox></td><td style="padding-bottom:8px" class="auto-style1">&nbsp;</td></tr>
                      <tr> <td class="auto-style3"> Severity
                          <span style="color: red">* <asp:RequiredFieldValidator ID="rfvSeverity" runat="server" ControlToValidate="ddlSeverity" InitialValue="--Select Severity--"  ErrorMessage="*Required"  ForeColor="Red"></asp:RequiredFieldValidator>
                               </span>
                           </td>
                          <td style="padding-bottom:8px" class="auto-style2">
                          <asp:DropDownList ID="ddlSeverity" runat="server" CssClass="btn-outline-warning btn-fw" AppendDataBoundItems="True" >
                              <asp:ListItem Value="0">--Select Severity--</asp:ListItem>                            
                            <asp:ListItem>Low</asp:ListItem>
                            <asp:ListItem>Medium</asp:ListItem>
                            <asp:ListItem>High</asp:ListItem>
                        </asp:DropDownList></td><td style="padding-bottom:8px">&nbsp;</td></tr>
                      

                      <tr> <td class="auto-style3"> Images</td><td style="padding-bottom:8px" class="auto-style2">
                                      <asp:FileUpload ID="flUpload" runat="server" Multiple="Multiple" ToolTip="Upload images here" CssClass="btn btn-warning"  />
                                              </td><td style="padding-bottom:8px">&nbsp;</td></tr>
                      

                      <tr> <td class="auto-style3">                                    
                          </td><td class="auto-style2">  
                        <asp:linkbutton id="lnkSubmit" runat="server" CssClass="btn btn-warning" onclick="lnkSubmit_Click" ValidationGroup="AddQuery">
                            <span aria-hidden="true" class="fa fa-plus"></span>&nbsp;Submit
                        </asp:linkbutton>
                        <asp:linkbutton id="lbClear" runat="server" cssclass="btn btn-danger" CausesValidation="False" PostBackUrl="tenantQueryList.aspx">
                            <span aria-hidden="true" class="fa fa-step-backward"></span>&nbsp;Cancel
                        </asp:linkbutton>
                                                
                    </td>
                          <td> &nbsp;</td>
                      </tr>
            </table> 
