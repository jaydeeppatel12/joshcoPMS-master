<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addTenantComplaint.ascx.cs" Inherits="joshcoWA.tenant.addTenantComplaint" %>
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

<%--<asp:LinkButton ID="lnkTenantComplaint" runat="server"></asp:LinkButton>

<asp:ModalPopupExtender ID="mpeTenantComplaint" runat="server" PopupControlID="pnlTenantComplaint" TargetControlID="lnkTenantComplaint"
    BackgroundCssClass="modalBackground" Drag="true" X="0" Y="0" PopupDragHandleControlID="hdlTenantComplaintHeader">
</asp:ModalPopupExtender>

<asp:Panel ID="pnlTenantComplaint" runat="server" CssClass="PopupCsdfSS" Style="display: none; z-index: 10;">
    <div class="form-wrap" style="width: 400px; padding: 15px; margin-top: 50px;">
        <div class="block-20;">
            <h3 id="hdlTenantComplaintHeader" class="heading">
                <asp:Label ID="lblTenantComplaintDocHeader" runat="server" Text="Complaint Details"></asp:Label>
                <asp:ImageButton ID="btnClos" runat="server" Style="float: right;" ImageUrl="~/images/close.png" AlternateText="Close" /></h3>

        </div>
    </div>
</asp:Panel>--%>

<table style="width: 70%; padding-bottom: 10px">
    <tr>
        <td class="auto-style3">Reference Number</td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:Label ID="lblReferenceNo" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>
        </td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:Label ID="lblTenant" runat="server" Text="Tenant"></asp:Label>
        </td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:Label ID="lblTenantName" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>
        </td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>

    <tr>
        <td class="auto-style3">Project</td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:Label ID="lblProperty" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>                    
        </td>       
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Unit Number
             <span style="color: red">*</span>  
        </td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:HiddenField ID="hfPropertyUnitID" runat="server"></asp:HiddenField>
            <asp:Label ID="lblPropertyUnit" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>                
            </td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Complaint Category
             <span style="color: red">* <asp:RequiredFieldValidator
             ID="rfvCategory" runat="server"  ControlToValidate="ddlTenantComplaint" InitialValue="--Select Category--" ErrorMessage="Required"  ForeColor="Red">
        </asp:RequiredFieldValidator>
                        </span>  

        </td>
        <td style="padding-bottom: 8px" class="auto-style2">
             <%--OnSelectedIndexChanged="ddlQueryItem_SelectedIndexChanged"--%>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="ddlTenantComplaint" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ComplaintCategory" DataValueField="ComplaintCategoryID">  
                       <asp:ListItem Value="0">--Select Category--</asp:ListItem> 
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [ComplaintCategory] ORDER BY [ComplaintCategory]"></asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>

        </td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Complaint Sub Category
             <span style="color: red">* <asp:RequiredFieldValidator
             ID="rfvComplaintSubCategory" runat="server"  ControlToValidate="ddlSubCategory" InitialValue="--Select Sub Category--" ErrorMessage="Required"  ForeColor="Red" >
        </asp:RequiredFieldValidator>
                        </span>  

        </td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="ddlSubCategory" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" DataSourceID="SqlDataSource2" DataTextField="ComplaintSubCategory" DataValueField="ComplaintSubCategoryID">
                       <asp:ListItem Value="0" Selected="True">--Select Sub Category--</asp:ListItem> 
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [ComplaintSubCategory] WHERE ([ComplaintCategoryID] = @ComplaintCategoryID) ORDER BY [ComplaintSubCategory]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlTenantComplaint" DefaultValue="0" Name="ComplaintCategoryID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>



                </ContentTemplate>
            </asp:UpdatePanel>

        </td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td style="vertical-align: top" class="auto-style3">Complaint Description
                <span style="color: red">*<asp:RequiredFieldValidator ID="rfvComplaintDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Required" ValidationGroup="AddComplaint" ForeColor="Red" BackColor="#FFFF99" Font-Size="8pt"></asp:RequiredFieldValidator>
                              </span>            
        </td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Height="120px" TextMode="MultiLine" ValidationGroup="AddComplaint"></asp:TextBox></td>
        <td style="padding-bottom: 8px" class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Severity
            <span style="color: red">* <asp:RequiredFieldValidator ID="rfvSeverity" runat="server" ControlToValidate="ddlSeverity" InitialValue="--Select Severity--"  ErrorMessage="*Required"  ForeColor="Red"></asp:RequiredFieldValidator>
                               </span>
        </td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:DropDownList ID="ddlSeverity" runat="server" CssClass="btn-outline-warning btn-fw"
                AppendDataBoundItems="True">
                <asp:ListItem Value="0" Selected="True">--Select Severity--</asp:ListItem> 
                <asp:ListItem>Low</asp:ListItem>
                <asp:ListItem>Medium</asp:ListItem>
                <asp:ListItem>High</asp:ListItem>
            </asp:DropDownList></td>
        <td style="padding-bottom: 8px">&nbsp;</td>
    </tr>


    <tr>
        <td class="auto-style3">Images</td>
        <td style="padding-bottom: 8px" class="auto-style2">
            <asp:FileUpload ID="flUpload" runat="server" Multiple="Multiple" ToolTip="Upload images here" CssClass="btn btn-warning" />
        </td>
        <td style="padding-bottom: 8px">&nbsp;</td>
    </tr>


    <tr>
        <td class="auto-style3">       
        </td>
        <td class="auto-style2">
            <asp:LinkButton ID="lnkSubmit" runat="Server"  CssClass="btn btn-warning"  ValidationGroup="AddComplaint" OnClick="lnkSubmit_Click"> <span aria-hidden="true" class="fa fa-plus"></span>&nbsp;Submit </asp:LinkButton>
            <asp:LinkButton ID="lbClear" runat="server" CssClass="btn btn-danger" CausesValidation="False" PostBackUrl="tenantComplaintList.aspx"> <span aria-hidden="true" class="fa fa-step-backward"></span>&nbsp;Cancel </asp:LinkButton>

        </td>
        <td>&nbsp;</td>
    </tr>
</table>