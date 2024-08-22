<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addComplaint.ascx.cs" Inherits="joshcoWA.CRM.addComplaint" %>
<style type="text/css">
    .auto-style1 {
        width: 30%;
    }

    .auto-style2 {
        width: 65%;
    }

    .auto-style3 {
        width: 35%;
    }
</style>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<link rel="stylesheet" href="../css/PopUp.css" />


<asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton>
<asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
    BackgroundCssClass="modalBackground" Drag="true" X="0" Y="0" PopupDragHandleControlID="hdlLeaseHeader">
</asp:ModalPopupExtender>

<asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style="display: none; z-index: 10;">

    <div class="form-wrap" style="width: 400px; padding: 15px; margin-top: 50px;">

        <div class="block-20;">
            <h3 id="hdlLeaseHeader" class="heading">
                <asp:Label ID="lblLeaseDocHeader" runat="server" Text="Complaint Details"></asp:Label>
                <asp:ImageButton ID="btnClos" runat="server" Style="float: right;" ImageUrl="~/images/close.png" AlternateText="Close" /></h3>
            <table>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label5" runat="server" Text="Reference Number: " ForeColor="#333333" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblRefNo" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Description: " ForeColor="#333333" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblQuerydescription" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Property: " ForeColor="#333333" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblProperty" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" Text="Severity: " ForeColor="#333333" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblSeverity" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label6" runat="server" Text="Category: " ForeColor="#333333" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblCategory" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</asp:Panel>

<table style="width: 70%; padding-bottom: 10px">
    <tr>
        <td class="auto-style3">Reference Number</td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:Label ID="lblReferenceNo" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>
        </td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
   <%-- <tr>
        <td class="auto-style3">
            <asp:Label ID="lblTenant" runat="server" Text="Tenant"></asp:Label>
        </td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:Label ID="lblTenantName" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>
        </td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>--%>

    <tr>
        <td class="auto-style3">Project</td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>



                    <asp:DropDownList ID="ddlProperty" runat="server" DataSourceID="sdsProperty" CssClass="btn-outline-warning btn-fw" DataTextField="PropertyName" DataValueField="PropertyID" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlProperty_SelectedIndexChanged">
                        <asp:ListItem Value="0">--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>

        </td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Unit Number</td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>


                    <asp:DropDownList ID="ddlPropertyUnit" runat="server" DataSourceID="sdsPropertyUnit" CssClass="btn-outline-warning btn-fw" DataTextField="PropertyUnit" DataValueField="PropertyUnitID" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsPropertyUnit" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [PropertyUnit] WHERE ([PropertyID] = @PropertyID) ORDER BY [PropertyUnit]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProperty" Name="PropertyID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>

        </td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Complaint Category</td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="ddlQueryItem" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ComplaintCategory" DataValueField="ComplaintCategoryID" OnSelectedIndexChanged="ddlQueryItem_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [ComplaintCategory] ORDER BY [ComplaintCategory]"></asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>

        </td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Complaint Sub Category</td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="ddlSubCategory" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" DataSourceID="SqlDataSource2" DataTextField="ComplaintSubCategory" DataValueField="ComplaintSubCategoryID">
                        <asp:ListItem></asp:ListItem>


                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [ComplaintSubCategory] WHERE ([ComplaintCategoryID] = @ComplaintCategoryID) ORDER BY [ComplaintSubCategory]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlQueryItem" DefaultValue="0" Name="ComplaintCategoryID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>



                </ContentTemplate>
            </asp:UpdatePanel>

        </td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td style="vertical-align: top" class="auto-style3">Complaint Description<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription" ErrorMessage="*Required" ValidationGroup="Edit" ForeColor="Red" BackColor="#FFFF99" Font-Size="8pt"></asp:RequiredFieldValidator>
        </td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Height="120px" TextMode="MultiLine" ValidationGroup="Edit"></asp:TextBox></td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Severity</td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:DropDownList ID="ddlSeverity" runat="server" CssClass="btn-outline-warning btn-fw"
                AppendDataBoundItems="True">
                <asp:ListItem>Low</asp:ListItem>
                <asp:ListItem>Medium</asp:ListItem>
                <asp:ListItem>High</asp:ListItem>
            </asp:DropDownList></td>
        <td style="padding-bottom: 8px">&nbsp;</td>
    </tr>


    <tr style="border:1">
        <td class="auto-style3">Imagess</td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:FileUpload ID="flUpload" runat="server" Multiple="Multiple" ToolTip="Upload images here" CssClass="btn btn-warning" />
        </td>
        <td style="padding-bottom: 8px"></td>
    </tr>


    <tr>
        <td class="auto-style3">
            <asp:SqlDataSource ID="sdsTenant" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectTenantByUnitID" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlPropertyUnit" Name="PropertyUnitID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td class="auto-style2">
            <asp:LinkButton ID="lnkSubmit" runat="server" CssClass="btn btn-warning" OnClick="lnkSubmit_Click" ValidationGroup="Edit"> <span aria-hidden="true" class="fa fa-plus"></span>&nbsp;Submit </asp:LinkButton>
            <asp:LinkButton ID="lbClear" runat="server" CssClass="btn btn-danger" CausesValidation="False" PostBackUrl="complaintList.aspx"> <span aria-hidden="true" class="fa fa-step-backward"></span>&nbsp;Cancel </asp:LinkButton>

        </td>
        <td>&nbsp;</td>
    </tr>
</table>
