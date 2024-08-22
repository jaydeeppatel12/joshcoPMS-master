<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSupplier6.ascx.cs" Inherits="joshcoWA.supplier.frmSupplier6" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditApplicantDeclaration" class="ui-widget-content" style="width:100%">
                         <tr>
                            <td class="formTextTD">
                                <strong>DECLARATION</strong></td>
                        </tr>
                         <tr>
                            <td class="formTextTD">
                              CERTIFICATION OF CORRECTNESS OF INFORMATION SUPPLIED IN THIS DOCUMENT
</td>
                        </tr>
                          <tr>
                            <td class="formTextTD">
                               &nbsp;</td>
                        </tr>
                          <tr>
                            <td class="formTextTD">
                            <asp:CheckBox ID="chkDeclaration1" runat="server"  Text=" I/WE, THE UNDERSIGNED, WHO WARRANTS THAT HE/SHE IS DULY AUTHORISED TO DO SO ON BEHALF OF THE SERVICE PROVIDER, CERTIFIES THAT THE INFORMATION SUPPLIED IN TERMS OF THIS DOCUMENT INCLUDING THE ADDITIONAL INFORMATION ANS SUPORTING DOCUMENTS ATTACHED, IS CORRECT AND ACCURATE AND ACKNOWLEDGES THAT :" /></td>
                        </tr>
                        <tr>
                            <td class="formTextTD">
                               &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="formTextTD">
                                <p>
                                1. The Service Provider will be required to furnish documentary proof of the claims, if requested to do so.
                                <br />
                                2. If the information supplied is found to be incorrect then JOSHCO may, in addition to any remedies it may have: a) Disqualify the Service Provider/contractor for a particular tender/contract/project it may be considered for, or which had been allocated/awarded to the Service Provider/contractor;
                                <br />
                                b) Recover from the Service Provider/contractor all costs, losses or damages incurred or sustained by JOSHCO as a result of breach of the contract;
                                <br />
                                c) Cancel the contract and claim any damages which JOSHCO may have suffer by having to make less favourable arrangements after such cancellation; and/or
                                <br />
                                d) De-register the Service Provider registered on the Service Provider Database
 </p>
                            </td>
                        </tr>
                          <tr>
                            <td class="formTextTD">
                               &nbsp;</td>
                        </tr>
                       
                        <tr>
                            <td class="formTextTD">
                                &nbsp;</td>
                        </tr>
                          <tr>
                            <td class="formTextTD">
                               &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="formTextTD">
                                &nbsp;</td>
                        </tr>
                       <tr>
                             <td class="formTextTD">  
                          
&nbsp;
                             </td>  
                                   </tr>
                         </table>
                           <table>
                         <tr>
                             <td class="formTextTD">Name of Authorized Representative </td>
                             <td>
                                 <asp:TextBox ID="txtRepresentativeName" runat="server" CssClass="form-control py-2" MaxLength="50"></asp:TextBox>
                             </td>   <td>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRepresentativeName" ErrorMessage="*" ForeColor="Red" ValidationGroup="frmSupplier6"></asp:RequiredFieldValidator>
                                     </td>
                         </tr>
                               <tr>
                             <td class="formTextTD">In His/her Capacity As</td>  <td class="formTextTD"> <asp:TextBox ID="txtRepresentativeCapacity" runat="server" CssClass="form-control py-2" MaxLength="50"></asp:TextBox></td>   <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRepresentativeCapacity" ErrorMessage="*" ForeColor="Red" ValidationGroup="frmSupplier6"></asp:RequiredFieldValidator></td>
                                   </tr>
                         <tr>
                             <td class="formTextTD">&nbsp;</td>
                             <td> 
                               <%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="ks" %>  
    <ks:captchacontrol ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
            CaptchaHeight="60" CaptchaWidth="200" CaptchaMinTimeout="5" CaptchaMaxTimeout="240"
            FontColor="#0066FF" NoiseColor="#B1B1B1" CaptchaChars="ABCDEFGHJKLMNPQRSTUVWXYZ23456789" />
               <%--  <asp:Button ID="Refresh" runat="server" Text="Refresh" OnClick="RefreshImage" />--%>
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