<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmStudentFinancialSponsor.ascx.cs" Inherits="joshcoWA.student.frmStudentFinancialSponsor" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" >
               <ContentTemplate>
                    <table>
                         <tr>
                            <td colspan="2">
                               <strong>FINANCIAL SPONSOR - </strong>
                                 <asp:Label ID="lblFinancialSponsor" runat="server" ForeColor="Red" Text="Incomplete"></asp:Label>
                            </td>
                            <td>
                                
                            </td>
                        </tr>             
                            <tr>
                            <td>
                                Funding Type
                            </td>                          
                            <td>

                                 <asp:DropDownList ID="ddlFundingList"   CssClass="btn-outline-warning btn-fw"  runat="server">
                                        <asp:ListItem>Self-Funded</asp:ListItem>
                                        <asp:ListItem>NSFAS Funding</asp:ListItem>
                                     <asp:ListItem>Bursary Funding</asp:ListItem>
                                      <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                               
                        </tr>
                      <tr>
                            <td>
                                Sponsor Name
                            </td>                          
                            <td>
                                 <asp:TextBox ID="txtFinancialSponsorName" runat="server" CssClass="form-control"></asp:TextBox>
                            <td>
                        </tr>                         
                         <tr>
                            <td>
                              Sponsor Contact Number
                            </td>                          
                            <td>
                                 <asp:TextBox ID="txttFinancialSponsorContactNumber" runat="server" CssClass="form-control"></asp:TextBox>
                            <td>
                        </tr>
                         <tr>
                            <td>
                                Sponsor's Email Address
                            </td>                          
                            <td>
                                 <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
                            <td>
                        </tr>
                         <table>
               </ContentTemplate>        
            </asp:UpdatePanel>
<asp:HiddenField ID="hfID" runat="server" Value="0" />