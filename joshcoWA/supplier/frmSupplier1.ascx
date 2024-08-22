<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSupplier1.ascx.cs" Inherits="joshcoWA.supplier.frmSupplier1" %>
  


<style type="text/css">
        .auto-style1 {
            font-size: 8pt;
        }
    </style>
 

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>              </ContentTemplate>
                <Triggers>
                   <%-- <asp:PostBackTrigger  ControlID="lnk"  />--%>
                </Triggers>
            </asp:UpdatePanel>                                                             
                    <table id="tblEditApplicant" >
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="formTextTD" colspan="3">
                                <strong>COMPANY REGISTRATION DOCUMENTS</strong></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">
                                <asp:Label ID="lblRefNo" runat="server" Text="Reference No." Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblReferenceNo" runat="server" Font-Bold="True" Visible="False"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Company Type <span style="color:red">*</span></td>
                            <td>                           
                                <asp:DropDownList ID="ddlCompanyType" runat="server" CssClass="btn-outline-warning btn-fw" OnSelectedIndexChanged="ddlCompanyType_SelectedIndexChanged" AppendDataBoundItems="True" DataSourceID="sdsCompanyType" DataTextField="CompanyType" DataValueField="CompanyTypeID">
                                    <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                </asp:DropDownList>                              
                                <asp:SqlDataSource ID="sdsCompanyType" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [CompanyType] ORDER BY [CompanyType]"></asp:SqlDataSource>
                                    
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                <asp:Label ID="lblDocType" runat="server" Text="Company Type Document Upload"></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClick="LinkButton1_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuCompanyTypeDoc" runat="server" accept=".pdf" CssClass="btn btn-warning" />
                                 <asp:Button ID="btnPAYEUpload4" runat="server" CssClass="btn btn-warning" OnClick="btnPAYEUpload4_Click" style="font-size:small;" Text="+ Upload" CausesValidation="False" />
                                 <asp:HiddenField ID="hfCompanyTypeDoc" runat="server" />
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
                            <td class="formTextTD"><strong>COMPANY REGISTRATION NUMBER</strong></td>
                            <td>
                                &nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Company Registration Document Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="#FFFF99" ControlToValidate="fuCompanyRegistrationDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier1"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClick="LinkButton2_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuCompanyRegistrationDoc" runat="server" EnableViewState="true" accept=".pdf" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload3" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload3_Click" />
                                <asp:HiddenField ID="hfCompanyRegistrationDoc" runat="server" />                          
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A </td>
                            <td>
                                <asp:CheckBox ID="chkCompanyRegistrationDoc_NA" runat="server" CssClass="btn btn-outline-warning btn-fw" OnCheckedChanged="chkCompanyRegistrationDoc_NA_CheckedChanged" AutoPostBack="True" />
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
                            <td class="formTextTD"><strong>PROOF OF SHAREHOLDING DOCUMENTS</strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style1" colspan="2">CERTIFIED COPIES of shareholders certificates or CK members share allocation documents must be supplied</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Shareholders Documents Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="#FFFF99" ControlToValidate="fuProofOfShareHoldingDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier1"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" OnClick="LinkButton3_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuProofOfShareHoldingDoc" runat="server" accept=".pdf" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload2" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload2_Click" />
                                <asp:HiddenField ID="hfProofOfShareHoldingDoc" runat="server" />                          
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A </td>
                            <td> 
                                <asp:CheckBox ID="chkProofOfShareHoldingDoc_NA" runat="server" CssClass="btn btn-outline-warning btn-fw" OnCheckedChanged="chkProofOfShareHoldingDoc_NA_CheckedChanged" AutoPostBack="True" />
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
                            <td class="formTextTD"><strong>PROOF OF BANKING DETAILS</strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style1">Original of cancelled cheque or letter of confirmation from bank</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Proof of Banking Details Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="#FFFF99" ControlToValidate="fuProofOfBankingDetailDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier1"></asp:RequiredFieldValidator></td>
                            <td>
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" OnClick="LinkButton4_Click"></asp:LinkButton>
                               <asp:FileUpload ID="fuProofOfBankingDetailDoc" runat="server" EnableViewState="true" accept=".pdf" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload1" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload1_Click" />
                                <asp:HiddenField ID="hfProofOfBankingDetailDoc" runat="server" />                          
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A </td>
                            <td><%-- <asp:PostBackTrigger  ControlID="lnk"  />--%>
                                <asp:CheckBox ID="chkProofOfBankingDetailDoc_NA" runat="server" CssClass="btn btn-outline-warning btn-fw"  OnCheckedChanged="chkProofOfBankingDetailDoc_NA_CheckedChanged" AutoPostBack="True" />
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
                            <td class="formTextTD"><strong>VAT REGISTRATION NUMBER</strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style1">If you qualify for VAT exemption, please attach a VAT exemption document</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">VAT Registration (VAT103) Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="fuVatRegistrationNoDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier1"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" OnClick="LinkButton5_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuVatRegistrationNoDoc" runat="server" EnableViewState="true" accept=".pdf" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload0" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload0_Click" />
                                <asp:HiddenField ID="hfVatRegistrationNoDoc" runat="server" />                          
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A </td>
                            <td> 
                                <asp:CheckBox ID="chkVatRegistrationNoDoc_NA" runat="server" CssClass="btn btn-outline-warning btn-fw"  OnCheckedChanged="chkVatRegistrationNoDoc_NA_CheckedChanged" AutoPostBack="True" />
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
                            <td class="formTextTD"><strong>P.A.Y.E DOCUMENT</strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">P.A.Y.E Document Upload<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BackColor="#FFFF99" ControlToValidate="fuPAYEDoc" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="frmSupplier1"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton6" runat="server" CausesValidation="False" OnClick="LinkButton6_Click"></asp:LinkButton>
                                <asp:FileUpload ID="fuPAYEDoc" runat="server" accept=".pdf" EnableViewState="true" CssClass="btn btn-warning" />
                                <asp:Button ID="btnPAYEUpload" runat="server" CssClass="btn btn-warning" style="font-size:small;" Text="+ Upload" CausesValidation="False" OnClick="btnPAYEUpload_Click" />
                                <asp:HiddenField ID="hfPAYEDoc" runat="server" />                          
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">Tick box if N/A</td>
                            <td> <%-- <asp:Image ID="Image2" runat="server" Height="35px" ImageUrl='<%# Eval("IconUrl") %>' />--%>
                                <asp:CheckBox ID="chkPAYEDoc_NA" runat="server" CssClass="btn btn-outline-warning btn-fw"  OnCheckedChanged="chkPAYEDoc_NA_CheckedChanged" AutoPostBack="True" />
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
<%-- <asp:Image ID="Image2" runat="server" Height="35px" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Data")) %>' />--%>
     
<asp:HiddenField ID="hfID" runat="server" Value="0" />
