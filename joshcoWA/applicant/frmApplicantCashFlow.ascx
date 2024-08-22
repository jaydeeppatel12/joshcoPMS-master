<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmApplicantCashFlow.ascx.cs" Inherits="joshcoWA.applicant.ApplicantCashFlow" %>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditDialogApplicantCashFlow" class="ui-widget-content">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Total Income
                            </td>
                            <td>
                                <asp:TextBox id="txtDialogTotalIncome" runat="server" CssClass="form-control py-2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Total Expenditure
                            </td>
                            <td>
                                <asp:TextBox id="txtDialogTotalExpenditure" runat="server" CssClass="form-control py-2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Nett Cash Flow
                            </td>
                            <td>
                                <asp:TextBox id="txtDialogNettCashFlow" runat="server" CssClass="form-control py-2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Deposit Amount Required
                            </td>
                            <td>
                                <asp:TextBox id="txtDialogDepositAmountRequired" runat="server" CssClass="form-control py-2"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
              <%--  <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>