<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmApplicantGeneralDetails.ascx.cs" Inherits="joshcoWA.applicant.frmApplicantGeneralDetails" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditApplicantGeneralDetails" class="ui-widget-content">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="formTextTD" colspan="2">
                                <strong>FIRST PERSON APPLYING GENERAL DETAILS</strong></td>
                            <td class="formTextTD">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Number Of Adults
                            <span style="color:red">*<asp:RangeValidator runat="server" ControlToValidate="txtNumbefOfAdult" ErrorMessage="Enter number between 0 to 100" ValidationGroup="frmApplicantGeneralDetails"
    Type="Integer" MinimumValue="0" MaximumValue="100" Font-Size="8pt" BackColor="#FFFF99" ForeColor="Red"></asp:RangeValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="txtNumbefOfAdult" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantGeneralDetails"></asp:RequiredFieldValidator>
                                </span></td>
                            <td>
                                <asp:TextBox id="txtNumbefOfAdult" runat="server" TextMode="Number" min="0" max="100"  CssClass="form-control py-2"  ValidationGroup="frmApplicantGeneralDetails">0</asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Number Of Children Under 12 years
                            <span style="color:red">*<asp:RangeValidator runat="server" ControlToValidate="txtNomberOfChildrenUnder12" ErrorMessage="Enter number between 0 to 100" ValidationGroup="frmApplicantGeneralDetails"
    Type="Integer" MinimumValue="0" MaximumValue="100" Font-Size="8pt" BackColor="#FFFF99" ForeColor="Red"></asp:RangeValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="#FFFF99" ControlToValidate="txtNomberOfChildrenUnder12" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmApplicantGeneralDetails"></asp:RequiredFieldValidator>
                                </span></td>
                            <td>
                                <asp:TextBox id="txtNomberOfChildrenUnder12" runat="server" TextMode="Number" CssClass="form-control py-2" min="0" max="100" ValidationGroup="frmApplicantGeneralDetails">0</asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
              <%--  <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>
<asp:HiddenField ID="hfID" runat="server" Value="0" />
