<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addWorkOrder.ascx.cs" Inherits="joshcoWA.workorder.addWorkOrder" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>


    <table style="width:100%">
                                 
                                <tr>
                                    <td class="auto-style1"> Quotation Reference</td><td>
                                    <asp:DropDownList ID="ddlQuotation" runat="server" DataSourceID="sdsQuotation" CssClass="btn-outline-warning btn-fw" DataTextField="Quote" DataValueField="InvitationToQuoteID" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlQuotation_SelectedIndexChanged">
                                        <asp:ListItem Value="0">--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectQuoteDropdown" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="InvitationToQuoteID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1"> Category</td><td>
                                    <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="sdsCategory" CssClass="btn-outline-warning btn-fw" DataTextField="FacilityManagementCategory" DataValueField="FacilityManagementCategoryID" AppendDataBoundItems="True">
                                        <asp:ListItem Value="0">--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [FacilityManagementCategory] ORDER BY [FacilityManagementCategory]"></asp:SqlDataSource>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1"> Property </td><td>
                                    <asp:DropDownList ID="ddlProperty" runat="server" DataSourceID="sdsProperty" CssClass="btn-outline-warning btn-fw" DataTextField="PropertyName" DataValueField="PropertyID" AppendDataBoundItems="True" AutoPostBack="True">
                                        <asp:ListItem Value="0">--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1"> Property Unit</td><td>
                                    <asp:DropDownList ID="ddlPropertyUnit" runat="server" DataSourceID="sdsPropertyUnit" CssClass="btn-outline-warning btn-fw" DataTextField="PropertyUnit" DataValueField="PropertyUnitID" AppendDataBoundItems="True">
                                        <asp:ListItem Value="0">--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsPropertyUnit" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT [PropertyUnit], [PropertyUnitID] FROM [PropertyUnit] WHERE ([PropertyID] = @PropertyID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlProperty" DefaultValue="0" Name="PropertyID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1"> Service Provider </td><td>
                                        <asp:DropDownList ID="ddlServiceProvider" runat="server" DataSourceID="sdsServiceProvider" CssClass="btn-outline-warning btn-fw" DataTextField="BusinessName" DataValueField="ServiceProviderID" AppendDataBoundItems="True">
                                            <asp:ListItem Value="0">--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="sdsServiceProvider" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectProviderList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1"> Start Date<span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="dpStartDate" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                        </span> </td><td>
                                        <asp:TextBox ID="dpStartDate" runat="server" TextMode="Date" CssClass="form-control" ></asp:TextBox>
                                        </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1"> End Date<span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BackColor="#FFFF99" ControlToValidate="dpEndDate" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                        </span></td><td> 
                                        <asp:TextBox ID="dpEndDate" runat="server" TextMode="Date" CssClass="form-control" ></asp:TextBox>
                                         </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         &nbsp;</td><td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         Total Cost<span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="#FFFF99" ControlToValidate="txtCost" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                         </span>&nbsp;</td><td><input runat="server" type="text" class="form-control" placeholder="Cost" id="txtCost" /></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                         Cost Paid </td><td>
                                        <asp:RadioButtonList ID="rblCostPaid" runat="server" RepeatDirection="Horizontal" CssClass="btn btn-outline-warning dropdown-toggle">
                                            <asp:ListItem Value="True">Yes</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="False">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>

                                <tr>
                                    <td class="auto-style1"> Work Description<span style="color:red">*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" BackColor="#FFFF99" ControlToValidate="txtNotes" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator>
                                    </td><td><textarea runat="server" class="form-control" rows="4"  placeholder="Notes" id="txtNotes"></textarea></td> 
                                   
                                    <td>
                                        &nbsp;</td> 
                                   
                                    <td>&nbsp;</td> 
                                   
                                </tr>
                                
                               
                                <tr>
                                    <td class="auto-style1"> 
                                        <asp:Label ID="lblQueryID" runat="server" Text="0"></asp:Label>
                                    </td><td>
                                         <asp:Button ID="btnSave" CssClass="btn btn-warning" runat="server" Text="Submit" OnClick="btnSave_Click" ValidationGroup="AddP" />
                                         <asp:LinkButton ID="lbClear" runat="server" CausesValidation="False" cssclass="btn btn-danger" PostBackUrl="workorderList.aspx">
                            <span aria-hidden="true" class="fa fa-step-backward"></span>&nbsp;Cancel
                        </asp:LinkButton>
                                         <asp:SqlDataSource ID="sdsFacilityManagement" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" InsertCommand="InsertFacilityManagement" InsertCommandType="StoredProcedure" SelectCommand="SelectFacilityManagementProfile" SelectCommandType="StoredProcedure" UpdateCommand="UpdateFacilityManagement" UpdateCommandType="StoredProcedure" OnInserted="sdsInspection_Inserted">
                                             <InsertParameters>
                                                 <asp:Parameter Name="InvitationToQuoteID" Type="Int32" />
                                                 <asp:Parameter Name="FacilityManagementCategoryID" Type="Int32" />
                                                 <asp:Parameter Name="PropertyUnitID" Type="Int32" />
                                                 <asp:Parameter Name="ServiceProviderID" Type="Int32" />
                                                 <asp:Parameter Name="StartDate" Type="DateTime" />
                                                 <asp:Parameter Name="EndDate" Type="DateTime" />
                                                 <asp:Parameter Name="TotalCost" Type="Decimal" />
                                                 <asp:Parameter Name="TotalCostPaid" Type="Boolean" />
                                                 <asp:Parameter Name="Description" Type="String" />
                                                 <asp:Parameter Name="FacilityManagementStatusID" Type="Int32" />
                                                 <asp:Parameter Direction="InputOutput" Name="FacilityManagementID" Type="Int32" />
                                             </InsertParameters>
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="hfFacilityManagementID" Name="FacilityManagementID" PropertyName="Value" Type="Int32" />
                                             </SelectParameters>
                                             <UpdateParameters>
                                                <%-- <asp:Parameter Name="RefNumber" Type="String" />--%>
                                                 <asp:Parameter Name="FacilityManagementCategoryID" Type="Int32" />
                                                 <asp:Parameter Name="PropertyUnitID" Type="Int32" />
                                                 <asp:Parameter Name="ServiceProviderID" Type="Int32" />
                                                 <asp:Parameter Name="StartDate" Type="DateTime" />
                                                 <asp:Parameter Name="EndDate" Type="DateTime" />
                                                 <asp:Parameter Name="TotalCost" Type="Decimal" />
                                                 <asp:Parameter Name="TotalCostPaid" Type="Boolean" />
                                                 <asp:Parameter Name="Description" Type="String" />
                                                <%-- <asp:Parameter Name="FacilityManagementStatusID" Type="Int32" />--%>
                                                 <asp:Parameter Name="FacilityManagementID" Type="Int32" />
                                             </UpdateParameters>
                                         </asp:SqlDataSource>
                                         <asp:HiddenField ID="hfFacilityManagementID" runat="server" />
                                         </td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                    <td>
                                         &nbsp;</td> 
                                    
                                </tr>
                            </table>

            </ContentTemplate>

</asp:UpdatePanel>