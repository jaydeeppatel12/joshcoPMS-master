<%@ Page Title="" Language="C#" MasterPageFile="inspection.Master" AutoEventWireup="true" CodeBehind="inspectionView.aspx.cs" Inherits="joshcoWA.inspection.inspectionView" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="inspectionItemDocument.ascx" TagPrefix="uc1" TagName="inspectionItemDocument" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <script src="../js/vtab.js"></script> 
    <link rel="stylesheet" href="../css/PopUp.css" />
   
        <section class="site-section">
        <div class="content-wrapper">
            <div class="row">
 
 <div class="col-md-8 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">

   <h2>Inspection Profile<asp:Label ID="lblCompanyName" runat="server" Text=""></asp:Label></h2>
       <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="inspectionList.aspx" runat="server">Back</asp:HyperLink>
<div class="row">
    

    <div class="col">
 
    <div class="block-20 ">
        <div style="padding:15px">  
                      
  <div id="Home" class="tabcontent">
                 
  <table style="width:100%" >
                               <tr>
                                  <td style="width: 232px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 232px; vertical-align: top;">Inspected Property</td>
                                  <td>
                                      <asp:Label ID="lblProperty" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 232px; vertical-align: top;">Service Provider</td>
                                  <td>
                                      <asp:Label ID="lblServiceProviderName" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                                <tr>
                                  <td style="width: 232px; vertical-align: top;">Inspection Date</td>
                                  <td><asp:Label ID="lblInspectionDate" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 232px; vertical-align: top;">Hours Spent</td>
                                  <td><asp:Label ID="lblHoursSpent" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 232px; vertical-align: top;">Total Inspection Cost</td>
                                  <td><asp:Label ID="lblIspectionCost" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 232px; vertical-align: top;">Inspection Cost Paid</td>
                                  <td><asp:Label ID="lblIspectionCostPaid" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 232px; vertical-align: top;">Next Inspection Date</td>
                                  <td><asp:Label ID="lblNextInspectionDate" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 232px; vertical-align: top;">Notes</td>
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

            <div id="WorkOrder" class="tabcontent" style="display:none;">
                 
                   <table style="width:100%" >
                                <tr>
                                
                                  <td>&nbsp;</td>
                              </tr>

                               <tr>
                                  <td>
                                     <table style="width:100%" >
                                          <tr>
                                              <td style="vertical-align:top;">
                                      <asp:DropDownList ID="DropDownList1" runat="server" CssClass="btn-outline-warning btn-fw" DataSourceID="sdsInspectionItemStatus" DataTextField="InspectionItem" DataValueField="InspectionItemID">
                                                   </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsInspectionItemStatus" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectInspectionItem" SelectCommandType="StoredProcedure" >
                           
                               
                                      </asp:SqlDataSource>
                                              </td>
                                               <td style="vertical-align:top; " >
                                       <input id="txtNote"  runat="server" style="width:100%" type="text" class="form-control" placeholder="Enter notes here..." />
                                                  
                     
                                              </td>
                                               <td style="vertical-align:top;" >
                                                   <asp:FileUpload ID="flUpload" runat="server" Width="110px" CssClass="btn btn-warning" Multiple="Multiple" ToolTip="Upload images here" />
                                                  
                     
                                              </td>
                                              <td>
                                                  &nbsp;</td>
                                              <td>
                                                  <asp:Button ID="Button2" CssClass="btn btn-warning" OnClick="lnkAddInspection_Click"  runat="server" Text="Submit" />
                                                  
                                      
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
                                        <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
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

            <%--<div id="Documents" class="tabcontent" style="display:none;">
                SharePoint documents coming soon...
            </div>  --%>        
        </div>

            </div>
        <br />  
     </div>

 </div>
 
     


</div>



    </div>
    </div>
                <div class="col-md-4 grid-margin stretch-card" style="height:200px">
   <div class="card">
                <div class="card-body">
<h3 class="heading">Inspection Menu</h3>
<ul>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Home')">Home <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'WorkOrder')">Inspected Items<span></span></a></li>
<%--<li><a href="#" class="tablinks" onclick="openCity(event, 'Documents')">Documents <span></span></a></li>--%>
 

</ul>
</div>
       </div>
     </div>

    </div>
    </div>
 </section>
</asp:Content>
