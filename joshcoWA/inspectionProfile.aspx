<%@ Page Title="" Language="C#" MasterPageFile="application/admin.Master" AutoEventWireup="true" CodeBehind="inspectionProfile.aspx.cs" Inherits="joshcoWA.inspectionProfile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="~/inspectionItemDocument.ascx" TagPrefix="uc1" TagName="inspectionItemDocument" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="js/vtab.js"></script> 
    <link rel="stylesheet" href="css/PopUp.css" />
   
         <section class="site-section"  >
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px"  >

    <h2>Inspection Profile</h2>
       <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="~/inspectionList.aspx" runat="server">Back</asp:HyperLink>
<div class="row">
     <div class="col-md-6 col-lg-4 order-md-1">
<div class="block-24 mb-5">
<h3 class="heading">Service Provider Menu</h3>
<ul>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Home')">Home <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'WorkOrder')">Inspected Items<span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Documents')">Documents <span></span></a></li>
 

</ul>
</div>
     </div>

    <div class="col">
 
    <div class="block-20 ">
        <div style="padding:15px">  
                     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
                                                         
                                          
            <div id="Home" class="tabcontent">
                 
  <table style="width:100%" >
                               <tr>
                                  <td style="width: 232px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 232px">Inspected Property</td>
                                  <td>
                                      <asp:Label ID="lblProperty" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 232px">Service Provider</td>
                                  <td>
                                      <asp:Label ID="lblServiceProviderName" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                                <tr>
                                  <td style="width: 232px">Inspection Date</td>
                                  <td><asp:Label ID="lblInspectionDate" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 232px">Hours Spent</td>
                                  <td><asp:Label ID="lblHoursSpent" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 232px">Total Inspection Cost</td>
                                  <td><asp:Label ID="lblIspectionCost" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 232px">Inspection Cost Paid</td>
                                  <td><asp:Label ID="lblIspectionCostPaid" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 232px">Next Inspection Date</td>
                                  <td><asp:Label ID="lblNextInspectionDate" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 232px">Notes</td>
                                  <td><asp:Label ID="lblNotes"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 232px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 232px"><asp:SqlDataSource ID="sdsInspectionProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyInspectionList" SelectCommandType="StoredProcedure" DeleteCommand=" Delete [dbo].[PropertyInspection]Where PropertyInspectionID = @PropertyInspectionID">
                                      <DeleteParameters>
                                          <asp:Parameter Name="PropertyInspectionID" />
                                      </DeleteParameters>
                                      <SelectParameters>
                                          <asp:Parameter DefaultValue="0" Name="PropertyID" Type="Int32" />
                                          <asp:SessionParameter Name="PropertyInspectionID" SessionField="PropertyInspectionID" Type="Int32" DefaultValue="" />
                                          
                                      </SelectParameters>
                                      </asp:SqlDataSource></td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 232px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 232px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>
                 <br />
          </div>

            <div id="WorkOrder" class="tabcontent"  style="display:none;">
                        <table>
                                <tr>
                                
                                  <td>&nbsp;</td>
                              </tr>

                               <tr>
                                  <td>
                                     <table>
                                          <tr>
                                              <td style="vertical-align:middle;">
                                      <asp:DropDownList ID="DropDownList1" runat="server" CssClass="btn-outline-warning btn-fw" DataSourceID="sdsInspectionItemStatus" DataTextField="InspectionItem" DataValueField="InspectionItemID">
                                                   </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsInspectionItemStatus" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectInspectionItem" SelectCommandType="StoredProcedure" >
                           
                               
                                      </asp:SqlDataSource>
                                              </td>
                                               <td style="vertical-align:middle; " >
                                       <input id="txtNote"  runat="server" style="width:200px" type="text" class="form-control" placeholder="Enter notes here..." />
                                                  
                     
                                              </td>
                                               <td style="vertical-align:middle;" >
                                                   <asp:FileUpload ID="flUpload" runat="server" Width="110px" Multiple="Multiple" ToolTip="Upload images here" />
                                                  
                     
                                              </td>
                                              <td>
                                                  &nbsp;</td>
                                              <td>
                                                  <asp:Button ID="Button2" CssClass="btn btn-primary px-5 py-2" OnClick="lnkAddInspection_Click"  runat="server" Text="Submit" />
                                                  
                                      
                                              </td>
                                          </tr>
                                      </table>
                                   </td>
 
                              </tr>
                              <tr>
                                  <td>&nbsp;
                                      </td>
                                  </tr>
                              <tr>
                                  <td> 
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sdsInspection" CellPadding="2" CellSpacing="2" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                <asp:BoundField DataField="InspectionItem" HeaderText="Inspected Item" />
                                <asp:BoundField DataField="InspectionNotes" HeaderText="Inspection Notes" />
   <asp:TemplateField HeaderText="file(s)">
                                    <ItemTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
<asp:LinkButton ID="LinkButton1" CausesValidation="false" runat="server" CommandArgument='<%# Eval("InspectionID") %>' CommandName="ViewImages" Text='<%# Eval("Images") %>'></asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                         <a id="remove" runat="server" title="Click to remove item"  onclick="return confirm('Remove item?');" onserverclick="HtmlAnchor_Click"><i class="fa fa-trash"></i></a> 
                                        <asp:HiddenField ID="hfPropertyInspectionID" Value='<%# Eval("InspectionID") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <HeaderStyle BackColor="#66C0C2" ForeColor="White" />
                         
                            <RowStyle HorizontalAlign="Left" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsInspection" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectInspection" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM [Inspection] WHERE (InspectionID = @InspectionID)" InsertCommand="InsertInspection" InsertCommandType="StoredProcedure" OnInserted="sdsInspection_Inserted" >
                           
                                <DeleteParameters>
                                    <asp:Parameter Name="InspectionID" />
                                </DeleteParameters>
                           
                                <InsertParameters>
                                    <asp:Parameter Name="InspectionItemID" Type="Int32" />
                                    <asp:Parameter Name="PropertyInspectionID" Type="Int32" />
                                    <asp:Parameter Name="InspectionNotes" Type="String" />
                                    <asp:Parameter Direction="InputOutput" Name="InspectionID" Type="Int32" />
                                </InsertParameters>
                           
                                <SelectParameters>
                                    <asp:SessionParameter Name="PropertyInspectionID" SessionField="PropertyInspectionID" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource>
                     
                                      <asp:LinkButton ID="lnkPopUp" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkPopUp"
      CancelControlID="btnClose"   BackgroundCssClass="modalBackground" Drag="true" X="0" Y="0" PopupDragHandleControlID="hdlHeader" >
</asp:ModalPopupExtender>

                                      <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" style="width:75%;"   >
    <div id="hdlHeader" class="header">
        <asp:Label ID="lblPopUpHeader" runat="server" Text=""></asp:Label>  Images
    </div>
    <div class="body" style="padding:10px">
<uc1:inspectionItemDocument runat="server" id="inspectionItemDocument" />
    </div>
    <div class="footer" style="width:100%; align-content:center">
            <asp:Button ID="btnClose" runat="server" style="width:100%;" CausesValidation="false" CssClass="btn btn-dm" Text="Close" />
    </div>
</asp:Panel>

                                      </td>
 
                              </tr>
                              </table>
          
            </div>

            <div id="Documents" class="tabcontent">
               SharePoint documents coming soon...
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
