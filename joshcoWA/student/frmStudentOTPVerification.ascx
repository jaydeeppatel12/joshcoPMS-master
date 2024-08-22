<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmStudentOTPVerification.ascx.cs" Inherits="joshcoWA.student.StudentOTPVerification" %>
        <table id="tblEditDialogfrmApplicantFinish" class="ui-widget-content" style="width:95%">
            <tr>
                          
                            <td class="formTextTD">
                                <strong>OTP VERIFICATION - 
                                </strong>
                                 <asp:Label ID="lblOTPVerificationDetails" runat="server" ForeColor="Red" Text="Incomplete"></asp:Label>
                            </td>
                        </tr>        
                         <tr>
                            <td class="formTextTD">
                                Please enter the OTP(One Time Password) sent to your registered mobile 
                                <asp:Label ID="lblCellNo" runat="server"></asp:Label>
                             </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            
                        </tr>
                       
<%--                         <tr>
                             <td>This OTP will expire in 5 minutes.</td>
                         </tr>--%>
                       
                        <tr>
                            <td>
                                <table class="auto-style1">
                                    <tr>
                                        <td>OTP</td>
                                        <td>
                                            <asp:TextBox ID="txtOTP" CssClass="applicant form-control py-2" runat="server" Width="150px"></asp:TextBox>
                                        </td>
                                        <td><asp:Button ID="btnOTP" runat="server"  Text="Verify OTP" CssClass="btn btn-warning" OnClick="btnOTP_Click"  /></td> <%--OnClick="btnOTP_Click"--%>
                                        <td>
                                            <asp:LinkButton ID="lblReSend" runat="server" CausesValidation="False"  Width="150px" OnClick="lblReSend_Click"> or Re-Send OTP</asp:LinkButton>  <%--OnClick="lblReSend_Click"--%>
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
                                <asp:HiddenField ID="hfStudentApplicantID" runat="server" />
                            </td>
                        </tr>
                       
                         <tr>
                             <td>&nbsp;&nbsp;</td>
                         </tr>
                       
                    </table>