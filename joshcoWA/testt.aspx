﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testt.aspx.cs" Inherits="joshcoWA.testt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>


    
    </div>
    </form>
</body>
</html>


<tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Applicant’s Identity Number
                            <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="#FFFF99" ControlToValidate="txtIdentityNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicant"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  
ControlToValidate="txtIdentityNumber" ErrorMessage="Enter a 13-digit ID number" BackColor="#FFFF99" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicant" 
ValidationExpression="[0-9]{13}"></asp:RegularExpressionValidator>
                                </span>
                               
                            </td>
                            <td> <%--onblur="CheckIdentityNumberAvailability();"--%>
                                <asp:TextBox id="txtIdentityNumber" runat="server" CssClass="form-control" MaxLength="13" onkeypress="return event.charCode >= 48 && event.charCode <= 57" ValidationGroup="frmApplicant"></asp:TextBox>
                                
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Applicant’s Nationality
                            <span style="color:red">*</span></td>
                            <td>
                               <asp:DropDownList ID="ddlNationality" runat="server" CssClass="btn-outline-warning btn-fw" ></asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">
                               
    

 
                            </td>
                            <td>
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD"><strong>CONTACT DETAILS</strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Work Number
                            </td>
                            <td>
                                <asp:TextBox id="txtWorkNumber" runat="server" CssClass="form-control" ValidationGroup="frmApplicant"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Mobile Number
                            <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="txtMobileNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicant"></asp:RequiredFieldValidator>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  
ControlToValidate="txtMobileNumber" ErrorMessage="Enter a 10-digit Cellphone number" BackColor="#FFFF99" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicant" 
ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </span></td>
                            <td>
                                <asp:TextBox id="txtMobileNumber" runat="server"  MaxLength="10" onkeypress="return event.charCode >= 48 && event.charCode <= 57" CssClass="form-control" ValidationGroup="frmApplicant"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Email Address
                                <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmailAddress" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicant"></asp:RequiredFieldValidator>
                                </span>
                            <span style="color:red"><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="txtEmailAddress" Display="Dynamic" ErrorMessage="*Invalid email address" Font-Size="8pt" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="frmApplicant" Width="120px"></asp:RegularExpressionValidator>
                                </span></td>
                            <td>
                                <asp:TextBox id="txtEmailAddress" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmApplicant" ></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Residential Address
                            <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" BackColor="#FFFF99" ControlToValidate="txtResidentialAddress" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicant"></asp:RequiredFieldValidator>
                                </span></td>
                            <td>
                                <asp:TextBox id="txtResidentialAddress" runat="server" MaxLength="150" CssClass="form-control" ValidationGroup="frmApplicant"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Marital Status
                            <span style="color:red">*</span></td>
                            <td>
                                <asp:DropDownList CssClass="btn-outline-warning btn-fw" id="cboMaritalStatusID" runat="server"></asp:DropDownList>                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Alternative Contact Person Full Name
                            <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" BackColor="#FFFF99" ControlToValidate="txtAlternativeContactPersonFullName" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicant"></asp:RequiredFieldValidator>
                                </span></td>
                            <td>
                                <asp:TextBox id="txtAlternativeContactPersonFullName" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmApplicant"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Alternative Contact Person Mobile
                            <span style="color:red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" BackColor="#FFFF99" ControlToValidate="txtAlternativeContactPersonMobile" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicant"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="txtAlternativeContactPersonMobile" ErrorMessage="Enter a 10-digit Cellphone number" Font-Size="8pt" ForeColor="Red" ValidationExpression="[0-9]{10}" ValidationGroup="frmApplicant"></asp:RegularExpressionValidator>
                                </span></td>
                            <td>
                                <asp:TextBox id="txtAlternativeContactPersonMobile" runat="server" CssClass="form-control" MaxLength="10" onkeypress="return event.charCode >= 48 && event.charCode <= 57" ValidationGroup="frmApplicant"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Are you the Owner of the property where you currently stay?
                            </td>
                            <td>
                                <asp:RadioButtonList ID="chkPropertyOwner"  CssClass="btn btn-outline-warning btn-fw" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="True">Yes</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="False">No</asp:ListItem>
                                </asp:RadioButtonList>
                          
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">
                                <label for="name">
                                Notifications<span style="color: red">*</span></label></td>
                            <td>
                                <asp:CheckBox ID="chkSMS" runat="server" CssClass="btn btn-outline-warning btn-fw" Text="SMS" />
                                <asp:CheckBox ID="chkEmail" runat="server" CssClass="btn btn-outline-warning btn-fw" Text="Email" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>