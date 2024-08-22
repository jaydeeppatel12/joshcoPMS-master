<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmApplicantFinish.ascx.cs" Inherits="joshcoWA.applicant.frmApplicantFinish" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <table id="tblEditDialogfrmApplicantFinish" class="ui-widget-content" style="width:95%">
                         <tr>
                            <td class="formTextTD">
                                <strong>Your application was received successfully!!!</strong></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            
                        </tr>
                       
                        <tr>
                            <td>Your application was received successfully you will receive a notification email confirming receipt of your appplication.&nbsp; </td>
                        </tr>
                        <tr>
                            <td>You can check the status of your application
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="../searchApplication.aspx">here</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                       
                    </table>
                </ContentTemplate>
              <%--  <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmdLoad" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>