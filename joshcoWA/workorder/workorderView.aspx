﻿<%@ Page Title="" Language="C#" MasterPageFile="workorder.Master" AutoEventWireup="true" CodeBehind="workorderView.aspx.cs" Inherits="joshcoWA.workorder.workorderView" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
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

   <h2>Work Order<asp:Label ID="lblCompanyName" runat="server" Text=""></asp:Label></h2>
       <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="workorderList.aspx" runat="server">Back</asp:HyperLink>
<div class="row">
    

    <div class="col">
 
    <div class="block-20 ">
        <div style="padding:15px">  
                      
  <div id="Home" class="tabcontent">
                 
     <table  >
                               <tr>
                                  <td style="width: 155px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Ref#</td>
                                  <td>
                                      <asp:Label ID="lblRefNo" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Category</td>
                                  <td><asp:Label ID="lblCategory" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Property</td>
                                  <td><asp:Label ID="lblProperty"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Property Unit</td>
                                  <td><asp:Label ID="lblPropertyUnit"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Service Provider</td>
                                  <td><asp:Label ID="lblServiceProvider"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Start Date</td>
                                  <td><asp:Label ID="lblStartDate"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">End Date</td>
                                  <td><asp:Label ID="lblEndDate"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Total Cost</td>
                                  <td><asp:Label ID="lblTotalCost"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Total Cost Paid</td>
                                  <td><asp:Label ID="lblCostPaid"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">Work Description</td>
                                  <td><asp:Label ID="lblDescription"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px"><asp:SqlDataSource ID="sdsFacilityManagementProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectFacilityManagementProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="FacilityManagementID" SessionField="FacilityManagementID" Type="Int32" />
                                      </SelectParameters>
                                      </asp:SqlDataSource></td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>
                 <br />
          </div>

            <div id="WorkOrder" class="tabcontent" style="display:none;">
                 
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                 <ContentTemplate>
                                     <asp:Panel ID="Panel1" runat="server" Width="100%" ScrollBars="Horizontal">
                          <table style="Width: 65%"  >
                                <tr>
                                
                                  <td>&nbsp;</td>
                              </tr>

                               <tr>
                                  <td>
                                     <table style="width: 80%">
                                          <tr>
                    <td style="  text-align: left;">Task Activity
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTaskComment" Display="Dynamic" ErrorMessage="**Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="Task"></asp:RequiredFieldValidator>
                                              </td>
                    <td style="  text-align: left;">Status</td>
                    <td style="  text-align: left;">Start Time
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdpStartTime" Display="Dynamic" ErrorMessage="**Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="Task"></asp:RequiredFieldValidator>
                                              </td>
                    <td style="  text-align: left;">End Time
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rdpEndTime" Display="Dynamic" ErrorMessage="**Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="Task"></asp:RequiredFieldValidator>
                                              </td>
                                              <td>
                                                  &nbsp;</td>
                                              <td>
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                               <td style="vertical-align:top;" >
                                                   <asp:SqlDataSource ID="sdsTask" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" DeleteCommand="DeleteFacilityManagementTimeSheet" DeleteCommandType="StoredProcedure" InsertCommand="InsertFacilityManagementTimeSheet" InsertCommandType="StoredProcedure" SelectCommand="SelectFacilityManagementTimeSheet" SelectCommandType="StoredProcedure">
                                                       <DeleteParameters>
                                                           <asp:Parameter Name="FacilityManagementTimeSheetID" Type="Int32" />
                                                       </DeleteParameters>
                                                       <InsertParameters>
                                                           <asp:Parameter Name="FacilityManagementID" Type="Int32" />
                                                           <asp:Parameter Name="TaskStatusID" Type="Int32" />
                                                           <asp:Parameter Name="TaskComment" Type="String" />
                                                           <asp:Parameter Name="StartTime" Type="DateTime" />
                                                           <asp:Parameter Name="EndTime" Type="DateTime" />
                                                       </InsertParameters>
                                                       <SelectParameters>
                                                           <asp:SessionParameter Name="FacilityManagementID" SessionField="FacilityManagementID" Type="Int32" />
                                                       </SelectParameters>
                                                   </asp:SqlDataSource>
                                       <input id="txtTaskComment"  runat="server" style="width:250px" type="text" class="form-control" placeholder="Enter activity here..."  />
                                                  
                     
                                              </td>
                                               <td style="vertical-align:top;" >
                                      <asp:DropDownList ID="ddlTaskStatus" runat="server" CssClass="btn-outline-warning btn-fw" DataSourceID="sdsTaskStatus" DataTextField="TaskStatus" DataValueField="TaskStatusID">
                                                   </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsTaskStatus" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [TaskStatus] ORDER BY [TaskStatus]" >
                           
                               
                                      </asp:SqlDataSource>
                                                  
                     
                                              </td>
                                               <td style="vertical-align:top;" >
                                                   <telerik:RadDateTimePicker ID="rdpStartTime" ZIndex="140000" Runat="server">
                                                   </telerik:RadDateTimePicker>
                                                  
                     
                                              </td>
                                               <td style="vertical-align:top;" >
                                                   <telerik:RadDateTimePicker ID="rdpEndTime" ZIndex="140000"   Runat="server">
                                                   </telerik:RadDateTimePicker>
                                                  
                     
                                              </td>
                                              <td style="vertical-align: top">
                                                  &nbsp;</td>
                                              <td style="vertical-align: top">
                                                  <asp:Button ID="btnTimeSheet" CssClass="btn btn-warning"  runat="server" Text="Submit" OnClick="btnTimeSheet_Click" ValidationGroup="Task" />
                                                  
                                      
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
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="sdsTimeSheet" CellPadding="2" CellSpacing="2" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                              
                                <asp:BoundField DataField="TaskComment" HeaderText="Task" />
    
                                   <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                                   <asp:BoundField DataField="EndTime" HeaderText="End Time" />
 <asp:BoundField DataField="TaskStatus" HeaderText="Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                         <a id="remove" runat="server" title="Click to remove item"  onclick="return confirm('Remove item?');" onserverclick="HtmlAnchor_Click"><i class="fa fa-trash"></i></a> 
                                        <asp:HiddenField ID="hfFacilityManagementTimeSheetID" Value='<%# Eval("FacilityManagementTimeSheetID") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsTimeSheet" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectFacilityManagementTimeSheet" SelectCommandType="StoredProcedure"   >
                           
                                <SelectParameters>
                                    <asp:SessionParameter Name="FacilityManagementID" SessionField="FacilityManagementID" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource>  
                                      

                                      </td>
 
                              </tr>
                              </table>
</asp:Panel>
                                 </ContentTemplate>
                             </asp:UpdatePanel>
            </div>

            <div id="Documents" class="tabcontent" style="display:none;">
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                 <ContentTemplate>
              	              <table >
                        <tr>
                            <td style="vertical-align: top;  padding:5px;">
                                       Status
                                      
                                   </td>
                        </tr>
                                             <tr>
                            <td style="vertical-align: top;  padding:5px;">
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="btn-outline-warning btn-fw" DataSourceID="SqlDataSource1" AppendDataBoundItems="true" DataTextField="FacilityManagementStatus" AutoPostBack="true" DataValueField="FacilityManagementStatusID" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                </asp:DropDownList>
                                      
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [FacilityManagementStatus] ORDER BY [FacilityManagementStatus]" UpdateCommand="Update [dbo].[FacilityManagement]
Set FacilityManagementStatusID = @FacilityManagementStatusID

Where FacilityManagementID = @FacilityManagementID">
                                       <UpdateParameters>
                                           <asp:Parameter Name="FacilityManagementStatusID" />
                                           <asp:Parameter Name="FacilityManagementID" />
                                       </UpdateParameters>
                                </asp:SqlDataSource>
                                      
                                   </td>
                        </tr>
                    </table>
                                     </ContentTemplate>
                       </asp:UpdatePanel>
            </div>          
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
<h3 class="heading">Work Order Menu</h3>
<ul>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Home')">Home <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'WorkOrder')">Tasks<span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Documents')">Status <span></span></a></li>
 

</ul>
</div>
       </div>
     </div>

    </div>
    </div>
 </section>
</asp:Content>
