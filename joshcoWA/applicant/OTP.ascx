<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OTP.ascx.cs" Inherits="joshcoWA.applicant.OTP" %>
<style type="text/css">
    .auto-style1 {
        width: 100px;
    }
</style>
<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>--%>
                    <table id="tblEditDialogfrmApplicantFinish" class="ui-widget-content" style="width:95%">
                         <tr>
                            <td class="formTextTD">
                                <strong>Please enter the OTP(One Time Password) sent to your registered mobile </strong>
                                <asp:Label ID="lblCellNo" runat="server"></asp:Label>
                             </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            
                        </tr>
                       
                         <tr>
                             <td>This OTP will expire in 5 minutes.</td>
                         </tr>
                       
                        <tr>
                            <td>
                                <table class="auto-style1">
                                    <tr>
                                        <td>OTP</td>
                                        <td>
                                            <asp:TextBox ID="txtOTP" CssClass="applicant form-control py-2" runat="server" Width="150px"></asp:TextBox>
                                        </td>
                                        <td><asp:Button ID="btnOTP" runat="server"  Text="Verify OTP" CssClass="btn btn-warning" OnClick="btnOTP_Click"  /></td>
                                        <td>
                                            <asp:LinkButton ID="lblReSend" runat="server" CausesValidation="False" OnClick="lblReSend_Click" Width="150px"> or Re-Send OTP</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMessage" runat="server" BackColor="#FFFFCC" ForeColor="Red"></asp:Label>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HiddenField ID="hfOTP" runat="server" />
                                <asp:HiddenField ID="hfOTPTime" runat="server" />
                                <asp:HiddenField ID="hfOTPPassed" runat="server" />
                                <asp:HiddenField ID="hfCellphoneNo" runat="server" />
                            </td>
                        </tr>
                       
                         <tr>
                             <td>&nbsp;&nbsp;</td>
                         </tr>
                       
                    </table>
               <%-- </ContentTemplate>--%>
              <%--  <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
        <%--    </asp:UpdatePanel>--%>