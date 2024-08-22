<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSupplier2.ascx.cs" Inherits="joshcoWA.supplier.frmSupplier2" %>
    <style type="text/css">
        .auto-style1 {
            font-size: 8pt;
        }
    </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>  </ContentTemplate>
             <%--   <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>
<asp:HiddenField ID="hfID" runat="server" Value="0" />
                    <table id="tblEditApplicant" >
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="formTextTD" colspan="3">
                                <strong>UNEMPLOYMENT INSURANCE FUND DOCUMENTS</strong></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Unemployment Insurance Fund number<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="#FFFF99" ControlToValidate="txtUnemployementInsuranceFundNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier2"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUnemployementInsuranceFundNumber" runat="server" CssClass="form-control" MaxLength="50" ValidationGroup="frmApplicant"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                                                <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">UIIF Document Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="fuUnemployementInsuranceFundDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier2"></asp:RequiredFieldValidator>
                                                    </td>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClick="LinkButton1_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuUnemployementInsuranceFundDoc" runat="server" accept=".pdf" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload_Click" />
                                <asp:HiddenField ID="hfUnemployementInsuranceFundDoc" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A </td>
                            <td>
                                <asp:CheckBox ID="chkUnemployementInsuranceFundDoc_NA" runat="server" CssClass="btn btn-outline-warning btn-fw" OnCheckedChanged="chkUnemployementInsuranceFundDoc_NA_CheckedChanged" AutoPostBack="True" />
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
                            <td class="formTextTD"><strong>WORKMAN’S COMPENSATION FUND DOCUMENTS </strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td >Workmans Compensation Number<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BackColor="#FFFF99" ControlToValidate="txtWorkmanCompensationFundNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier2"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtWorkmanCompensationFundNumber" runat="server" CssClass="form-control" MaxLength="50" ValidationGroup="frmApplicant"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Workmans Compensation Document Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" BackColor="#FFFF99" ControlToValidate="fuWorkmanCompensationFundDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier2"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClick="LinkButton2_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuWorkmanCompensationFundDoc" runat="server" accept=".pdf" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload0" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload0_Click" />
                                <asp:HiddenField ID="hfWorkmanCompensationFundDoc" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A </td>
                            <td><%--AutoPostBack="True"--%>
                                <asp:CheckBox ID="chkWorkmanCompensationFundDoc_NA" runat="server" CssClass="btn btn-outline-warning btn-fw"  OnCheckedChanged="chkWorkmanCompensationFundDoc_NA_CheckedChanged" AutoPostBack="True" />
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
                            <td class="formTextTD"><strong>PROFESSIONAL REGISTRATION </strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td >Professional Registration Number<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" BackColor="#FFFF99" ControlToValidate="txtProfessionalRegistrationNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier2"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtProfessionalRegistrationNumber" runat="server" CssClass="form-control" MaxLength="50" ValidationGroup="frmApplicant"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Professional Registration Document Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" BackColor="#FFFF99" ControlToValidate="fuProfessionalRegistrationDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier2"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" OnClick="LinkButton3_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuProfessionalRegistrationDoc" runat="server" accept=".pdf" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload1" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload1_Click" />
                                <asp:HiddenField ID="hfProfessionalRegistrationDoc" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A </td>
                            <td><%--AutoPostBack="True"--%>
                                <asp:CheckBox ID="chkProfessionalRegistrationDoc_NA" runat="server" CssClass="btn btn-outline-warning btn-fw" OnCheckedChanged="chkProfessionalRegistrationDoc_NA_CheckedChanged" AutoPostBack="True" />
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
                            <td class="formTextTD"><strong>DISABILITY DOCUMENTS </strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                      
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Disability Document Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" BackColor="#FFFF99" ControlToValidate="fuDisabilityDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier2"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" OnClick="LinkButton4_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuDisabilityDoc" runat="server" accept=".pdf" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload2" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload2_Click" />
                                <asp:HiddenField ID="hfDisabilityDoc" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A </td>
                            <td><%--AutoPostBack="True"--%>
                                <asp:CheckBox ID="chkDisabilityDoc_NA" runat="server" CssClass="btn btn-outline-warning btn-fw"  OnCheckedChanged="chkDisabilityDoc_NA_CheckedChanged" AutoPostBack="True" />
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
                            <td class="formTextTD"><strong>INCOME TAX REGISTRATION </strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style1">If you qualify for income tax exemption, please attach an income tax exemption document</td>
                            <td>
                            
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Income Tax Registration Number<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" BackColor="#FFFF99" ControlToValidate="txtIncomeTaxRegistrationNumber" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier2"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                
                                <asp:TextBox ID="txtIncomeTaxRegistrationNumber" runat="server" CssClass="form-control" MaxLength="50" ValidationGroup="frmApplicant"></asp:TextBox>
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Income Tax Registration Document Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" BackColor="#FFFF99" ControlToValidate="fuIncomeTaxRegistrationDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier2"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" OnClick="LinkButton5_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuIncomeTaxRegistrationDoc" runat="server" accept=".pdf" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload3" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload3_Click" />
                                <asp:HiddenField ID="hfIncomeTaxRegistrationDoc" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A</td>
                            <td>
                                <asp:CheckBox ID="chkIncomeTaxRegistrationDoc_NA" runat="server" CssClass="btn btn-outline-warning btn-fw" OnCheckedChanged="chkIncomeTaxRegistrationDoc_NA_CheckedChanged" AutoPostBack="True" />
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
                            <td class="formTextTD"><strong>TAX CLEARANCE CERTIFICATE </strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style1" colspan="2">The registration of a vendor will lapse immediately on expiry of the tax clearance certificate. It is the vendor’s responsibility to continuously renew the certificate with SARS</td>
                            <td>&nbsp;</td>
                        </tr>              
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Original Tax Clearance Certificate Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" BackColor="#FFFF99" ControlToValidate="fuTaxClearanceCertificateDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier2"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <asp:LinkButton ID="LinkButton6" runat="server" CausesValidation="False" OnClick="LinkButton6_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuTaxClearanceCertificateDoc" runat="server" accept=".pdf" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload4" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload4_Click" />
                                <asp:HiddenField ID="hfTaxClearanceCertificateDoc" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A</td>
                            <td><%--AutoPostBack="True"--%>
                                <asp:CheckBox ID="chkTaxClearanceCertificate_NA" runat="server" CssClass="btn btn-outline-warning btn-fw" OnCheckedChanged="chkTaxClearanceCertificate_NA_CheckedChanged" AutoPostBack="True" />
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
                            <td class="formTextTD"><strong>BEE CERTIFICATE</strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style1" colspan="2">Issued by either verification agencies accredited by the South African Accreditation System (SANAS) or by registered auditors approved by the Independent Regulatory Board for Auditors (IRBA) or sworn affidavit in case where the bidder’s annual turnover is below 10 million.</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">B-BEE Level<span style="color:red">*</span></td>
                            <td>
                                
                                <asp:DropDownList ID="ddlBeeLevel" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" DataSourceID="sdsBeeLevel" DataTextField="BEELevel" DataValueField="BEELevelID">
                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsBeeLevel" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [BEELevel] ORDER BY [BEELevel]"></asp:SqlDataSource>
                                
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Original BEE Certificate or Sworn Affidavit Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" BackColor="#FFFF99" ControlToValidate="fuBEECertificateDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier2"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <asp:LinkButton ID="LinkButton7" runat="server" CausesValidation="False" OnClick="LinkButton7_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuBEECertificateDoc" runat="server" accept=".pdf" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload5" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload5_Click" />
                                <asp:HiddenField ID="hfBEECertificateDoc" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A</td>
                            <td><%--AutoPostBack="True"--%>
                                <asp:CheckBox ID="chkBEECertificateDoc_NA" runat="server" CssClass="btn btn-outline-warning btn-fw" OnCheckedChanged="chkBEECertificateDoc_NA_CheckedChanged" AutoPostBack="True" />
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
              
