<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmApplicantDeclaration.ascx.cs" Inherits="joshcoWA.applicant.frmApplicantDeclaration" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditApplicantDeclaration" class="ui-widget-content" style="width:100%">
                         <tr>
                            <td class="formTextTD">
                                <strong>DECLARATION</strong></td>
                        </tr>
                         <tr>
                            <td class="formTextTD">
                               &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="formTextTD">
                                <asp:CheckBox ID="chkDeclaration1" runat="server"  Text="I / we declare that the information we have given in this application form is true and correct to the best of my / our knowledge and that I / we have not failed to provide any information which, if the Landlord had known such information, would have not allowed the application to be successful ." />
                            </td>
                        </tr>
                          <tr>
                            <td class="formTextTD">
                               &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="formTextTD">
                                <asp:CheckBox ID="chkDeclaration2" runat="server"  Text="I / We agree and allow the Landlord or Agent at all times to contact, request and obtain information from any credit provider (or potential credit provider) or registered credit bureau that may be necessary to assess my / our behaviour, profile, payment patterns, indebtedness, whereabouts, and creditworthiness " />
                            </td>
                        </tr>
                          <tr>
                            <td class="formTextTD">
                               &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="formTextTD">
                                <asp:CheckBox ID="chkDeclaration3" runat="server"  Text="Furnish information concerning the behaviour, profile, payment patterns, indebtedness, whereabouts, and creditworthiness of me / us to any registered credit bureau or to any credit provider (or potential credit provider) seeking a trade reference regarding my / our dealings with the Landlord " />
                            </td>
                        </tr>
                       <tr>
                             <td class="formTextTD">  
                          
&nbsp;
                             </td>  
                                   </tr>
                         </table>
                           <table>
                         <tr>
                             <td class="formTextTD">Signed By Applicant Place </td>
                             <td>
                                 <asp:TextBox ID="txtSignedByApplicantPlace" runat="server" CssClass="form-control py-2" MaxLength="50"></asp:TextBox>
                             </td>   <td>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSignedByApplicantPlace" ErrorMessage="*" ForeColor="Red" ValidationGroup="frmApplicantDeclaration"></asp:RequiredFieldValidator>
                                     </td>
                         </tr>
                               <tr>
                             <td class="formTextTD">&nbsp;</td>  <td class="formTextTD">&nbsp;</td>   <td></td>
                                   </tr>
                         <tr>
                             <td class="formTextTD">&nbsp;</td>
                             <td>    <%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="ks" %>  
    <ks:captchacontrol ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
            CaptchaHeight="60" CaptchaWidth="200" CaptchaMinTimeout="5" CaptchaMaxTimeout="240"
            FontColor="#0066FF" NoiseColor="#B1B1B1" CaptchaChars="ABCDEFGHJKLMNPQRSTUVWXYZ23456789" />
            <%--<asp:Button ID="Refresh" runat="server" Text="Refresh" OnClick="RefreshImage" />--%>
</td>
                                  <td>    <asp:ImageButton ID="Refresh" runat="server" OnClick="RefreshImage" ImageUrl="~/images/Refresh.png" ToolTip="Refresh Captcha"  /></td>
                         </tr>
                         <tr>
                             <td class="formTextTD">&nbsp;</td>
                             <td>  <asp:TextBox ID="txtCaptcha" CssClass="form-control py-2" runat="server"></asp:TextBox></td>
                               <td></td>
                         </tr>
                    </table>
                   
                </ContentTemplate>
                <%--<Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>
<asp:HiddenField ID="hfID" runat="server" Value="0" />
