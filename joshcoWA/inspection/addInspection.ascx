<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addInspection.ascx.cs" Inherits="joshcoWA.inspection.addInspection" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
 <style type="text/css">
   
             .auto-style4 {
                 color: #FF0000;
             }
         </style>
 
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
 <link rel="stylesheet" href="../css/PopUp.css" />

    
                                                        <asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
         BackgroundCssClass="modalBackground" Drag="true"  X="0" Y="0"  PopupDragHandleControlID="hdlLeaseHeader" ></asp:ModalPopupExtender>

 <asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         
<div class="form-wrap"  style="width:400px; padding:15px; margin-top:50px; "  >
 
    <div class="block-20;">
    <h3 id="hdlLeaseHeader" class="heading"><asp:Label ID="lblLeaseDocHeader" runat="server" Text="Inspection Details"></asp:Label>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
<p>
    <asp:Label ID="lblRefNo" runat="server" Text="" Font-Bold="true"></asp:Label> : inspection details captured successfully</p>
        </div>
    </div>
                                                   
</asp:Panel>
    

      <table style="width:65%">
                                
                                <tr>
                                    <td class="auto-style1"> Property </td><td >
                                    <asp:DropDownList ID="ddlProperty" runat="server" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlProperty_SelectedIndexChanged" CssClass="btn-outline-warning btn-fw">
                                        <asp:ListItem Value="0">--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1"> Property Unit</td><td >
                                    <asp:DropDownList ID="ddlPropertyUnit" runat="server" DataSourceID="sdsPropertyUnit" DataTextField="PropertyUnit" DataValueField="PropertyUnitID" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw">
                                        <asp:ListItem Value="0">--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsPropertyUnit" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [PropertyUnit] WHERE ([PropertyID] = @PropertyID) ORDER BY [PropertyUnit]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlProperty" Name="PropertyID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1"> Inspection Date <span style="color: red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="rdpInspectionDate" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                        </span></td><td > 
                                         <asp:TextBox ID="rdpInspectionDate" runat="server" TextMode="Date" ValidationGroup="AddP" CssClass="form-control" Width="180px"></asp:TextBox>

                                        </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         Hours Spent <span style="color: red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="txtHoursSpent" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                             <asp:RangeValidator runat="server" ControlToValidate="txtHoursSpent" ErrorMessage="Enter number only" ValidationGroup="AddP"
    Type="Integer" MinimumValue="0" MaximumValue="10000" Font-Size="7pt" BackColor="#FFFF99" ForeColor="Red"></asp:RangeValidator>
                                         </span> </td><td>
                                        <asp:TextBox ID="txtHoursSpent" runat="server" TextMode="Number" min="0" ValidationGroup="AddP" CssClass="form-control" Width="180px"></asp:TextBox>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         Service Provider <span style="color: red">*</span></td><td>
                                        <asp:DropDownList ID="ddlServiceProvider" runat="server" DataSourceID="sdsServiceProvider" DataTextField="ServiceProviderName" DataValueField="ServiceProviderID" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw">
                                            <asp:ListItem Value="0">--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="sdsServiceProvider" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectProviderList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         Total Inspection Cost <span style="color: red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="#FFFF99" ControlToValidate="txtInspectionCost" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                         </span> </td><td><input runat="server" type="text" class="form-control" placeholder="Inspection Cost" id="txtInspectionCost" width="180px" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         Inspection Cost Paid </td><td>
                                        <asp:RadioButtonList ID="rblCostPaid" runat="server" RepeatDirection="Horizontal" CssClass="btn btn-outline-warning btn-fw" Width="180px">
                                            <asp:ListItem Value="True">Yes</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="False">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                  <tr>
                                    <td class="auto-style1"> Next Inspection Date <span style="color: red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="#FFFF99" ControlToValidate="txtInspectionCost" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                        </span> </td><td> 
                                        <asp:TextBox ID="rdpNextInspectionDate" runat="server" TextMode="Date" ValidationGroup="AddP" CssClass="form-control" Width="180px"></asp:TextBox>
                                      </td> 
                                   
                                      <td>
                                          &nbsp;</td> 
                                   
                                      <td>&nbsp;</td> 
                                   
                                </tr>

                                <tr>
                                    <td class="auto-style1"> Notes </td><td><textarea runat="server" class="form-control" rows="4"  placeholder="Notes" id="txtNotes"></textarea></td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                
                               
                                <tr>
                                    <td class="auto-style1"> </td><td>
                                         <asp:Button ID="btnSave" CssClass="btn btn-warning" runat="server" Text="Submit" OnClick="btnSave_Click" ValidationGroup="AddP" />
                                          <asp:linkbutton id="lbClear" runat="server" cssclass="btn btn-danger" CausesValidation="False" PostBackUrl="inspectionList.aspx">
                            <span aria-hidden="true" class="fa fa-step-backward"></span>&nbsp;Cancel
                        </asp:linkbutton>
                                         <asp:SqlDataSource ID="sdsInspection" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" InsertCommand="InsertPropertyInspection" InsertCommandType="StoredProcedure" SelectCommand="SelectPropertyInspectionList" SelectCommandType="StoredProcedure" UpdateCommand="UpdatePropertyInspection" UpdateCommandType="StoredProcedure" OnInserted="sdsInspection_Inserted">
                                             <InsertParameters>
                                                 <asp:Parameter Name="PropertyUnitID" Type="Int32" />
                                                 <asp:Parameter DbType="Date" Name="InspectionDate" />
                                                 <asp:Parameter Name="HoursSpent" Type="Int32" />
                                                 <asp:Parameter Name="ServiceProviderID" Type="Int32" />
                                                 <asp:Parameter Name="Notes" Type="String" />
                                                 <asp:Parameter DbType="Date" Name="NextInspectionDate" />
                                                 <asp:Parameter Name="TotalInspectionCost" Type="Decimal" />
                                                 <asp:Parameter Name="InspectionCostPaid" Type="Boolean" />
                                                 <asp:Parameter Direction="InputOutput" Name="PropertyInspectionID" Type="Int32" />
                                             </InsertParameters>
                                             <SelectParameters>
                                                 <asp:Parameter DefaultValue="0" Name="PropertyID" Type="Int32" />
                                                 <asp:ControlParameter ControlID="hfPropertyInspectionID" DefaultValue="" Name="PropertyInspectionID" PropertyName="Value" Type="Int32" />
                                             </SelectParameters>
                                             <UpdateParameters>
                                                 <asp:Parameter Name="PropertyUnitID" Type="Int32" />
                                                 <asp:Parameter DbType="Date" Name="InspectionDate" />
                                                 <asp:Parameter Name="HoursSpent" Type="Int32" />
                                                 <asp:Parameter Name="ServiceProviderID" Type="Int32" />
                                                 <asp:Parameter Name="Notes" Type="String" />
                                                 <asp:Parameter DbType="Date" Name="NextInspectionDate" />
                                                 <asp:Parameter Name="TotalInspectionCost" Type="Decimal" />
                                                 <asp:Parameter Name="InspectionCostPaid" Type="Boolean" />
                                                 <asp:Parameter Name="PropertyInspectionID" Type="Int32" />
                                             </UpdateParameters>
                                         </asp:SqlDataSource>
                                         <asp:HiddenField ID="hfPropertyInspectionID" runat="server" Value="0" />
                                         </td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                </tr>
                            </table>

</ContentTemplate>

</asp:UpdatePanel>

       