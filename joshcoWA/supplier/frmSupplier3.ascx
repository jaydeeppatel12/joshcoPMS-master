<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSupplier3.ascx.cs" Inherits="joshcoWA.supplier.frmSupplier3" %>
    <style type="text/css">
        .auto-style1 {
            font-size: 8pt;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditApplicant" >
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="formTextTD" colspan="3">
                                <strong>CORE BUSINESS OPERATIONS </strong></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Operations</td>
                            <td>
                                
                                <asp:DropDownList ID="ddlBusinessOperation" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" DataSourceID="sdsBusinessOperation" DataTextField="BusinessOperation" DataValueField="BusinessOperationID">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsBusinessOperation" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [BusinessOperation] ORDER BY [BusinessOperation]"></asp:SqlDataSource>
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"><strong>ANNUAL AVARAGE TURNOVER </strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td  class="auto-style1">Financial statement of the last financial year must be attached if applying for SMME status</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Indicate Annual Average Turnover, during the past three years<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" BackColor="#FFFF99" ControlToValidate="txtAnnualAvarageTurnover" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier3"></asp:RequiredFieldValidator>
                                <span style="color: red">
                                <asp:RegularExpressionValidator ID="revNumber" runat="server" BackColor="#FFFF99" ControlToValidate="txtAnnualAvarageTurnover" Display="Dynamic" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="^\d+(\.\d\d)?$" ValidationGroup="frmSupplier3"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtAnnualAvarageTurnover" />
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Indicate Gross Asset Value<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" BackColor="#FFFF99" ControlToValidate="txtGrossAssetValue" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier3"></asp:RequiredFieldValidator>
                                <span style="color: red">
                                <asp:RegularExpressionValidator ID="revNumber0" runat="server" BackColor="#FFFF99" ControlToValidate="txtGrossAssetValue" Display="Dynamic" ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" ForeColor="Red" ValidationExpression="^\d+(\.\d\d)?$" ValidationGroup="frmSupplier3"></asp:RegularExpressionValidator>
                                </span>
                            </td>
                            <td>
                                
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtGrossAssetValue" />
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"><strong> SMALL BUSINESS INFORMATION </strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td >Economic Sector </td>
                            <td>
                                <asp:DropDownList ID="ddlEconomicSector" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" DataSourceID="sdsEconomicSector" DataTextField="EconomicSector" DataValueField="EconomicSectorID">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsEconomicSector" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [EconomicSector] ORDER BY [EconomicSector]"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"> Type of business </td>
                            <td>
                                
                                <asp:DropDownList ID="ddlTypeOfBusiness" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" DataSourceID="sdsBusinessType" DataTextField="BusinessType" DataValueField="BusinessTypeID">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsBusinessType" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [BusinessType] ORDER BY [BusinessType]"></asp:SqlDataSource>
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        
                       
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        
                       
                        <tr>
                            <td class="auto-style2"></td>
                            <td class="auto-style2"><strong> TOTAL FULL TIME EQUIVALENT OF PAID EMPLOYEES </strong></td>
                            <td class="auto-style2"></td>
                            <td class="auto-style2"></td>
                        </tr>
                      
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Total full time equivalent of paid employees<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" BackColor="#FFFF99" ControlToValidate="txtFullTimePaidEmployees" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier3"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                
                                <input runat="server" type="text" class="form-control" placeholder="" id="txtFullTimePaidEmployees" />
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                     
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"><strong> SMME Status </strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                          
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">SMME Status</td>
                            <td>
                                
                                <asp:DropDownList ID="ddlSMMEStatus" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" DataSourceID="sdsSMMEStatus" DataTextField="SMMEStatus" DataValueField="SMMEStatusID">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsSMMEStatus" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [SMMEStatus] ORDER BY [SMMEStatus]"></asp:SqlDataSource>
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
             <%--   <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>
<asp:HiddenField ID="hfID" runat="server" Value="0" />
