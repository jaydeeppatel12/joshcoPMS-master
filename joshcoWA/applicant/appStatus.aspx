<%@ Page Title="" Language="C#" MasterPageFile="applicant.Master" AutoEventWireup="true" CodeBehind="appStatus.aspx.cs" Inherits="joshcoWA.applicant.ApplicationDetails" %>
 
 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="site-section">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <%--<div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">

                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">--%>

          <asp:Panel ID="pnlAppDep"   runat="server" >
                <div class="alert alert-success mt-4 d-flex align-items-center" >
                                <table style="width:100%">
            <tr>
                <td> &nbsp;Hi
                    <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                    ,
                    <br />
                    &nbsp;view your application status below.<br /> </td>
            </tr>
                                    
        </table>
                    </div>
                              </asp:Panel><br />
                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sdsApplicationStatusUpdate" CellPadding="2" CellSpacing="2" GridLines="None" Width="100%" HorizontalAlign="Left" EmptyDataText="Your application was received successfully , we will contact you shortly to finalise your application process" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                <asp:BoundField DataField="StatusDate" HeaderText="Status Date" />
                                <asp:BoundField DataField="Comment" HeaderText="Comment" />
                                <asp:BoundField DataField="ApplicationStatus"  HeaderText="Application Status"/>
 
                                
                            </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsApplicationStatusUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationStatusUpdate" SelectCommandType="StoredProcedure"  >
                           
                                <SelectParameters>
                                    <asp:SessionParameter Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource><br />
    <br />
   <asp:Panel ID="pnlPayfastDepositPayment" runat="server" Visible="false">
                <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                       <table style="width:100%">
                           <tr>
                                 <td>                                     
                                     <h5 style="color: black">Deposit Required <span class="badge badge-info"> R
                                            <asp:Label ID="lblDepositRequired" Text="0" runat="server"></asp:Label>
                                            </span>
                                     </h5>    
                                         <asp:Button ID="btnPayDeposit" CssClass="btn btn-warning px-5 py-2" runat="server" Text="Pay Deposit" CausesValidation="false" OnClick="btnPayDeposit_Click"  />

                                   </td>
                                     </tr>                                                               
                    </table>
                    </div>
                              </asp:Panel>
                                            <br />
                                     <asp:Panel ID="Panel1" runat="server" Visible="False">
                                            <h5 style="color: black">Signed Lease Agreement Form </h5>                                    
                                            <asp:FileUpload ID="flUpload" runat="server" ToolTip="Upload" CssClass="btn btn-warning" />   
                                             <asp:Button ID="Upload" CssClass="btn btn-warning px-5 py-2" runat="server" Text="Upload" CausesValidation="false" OnClick="Upload_Click" />  
                                            <%-- <asp:LinkButton ID="lnkSignedLeaseAgreementForm" runat="server" Width="300px" Visible="false"  OnClick="lnkSignedLeaseAgreementForm_Click">View Signed Lease Agreement Form</asp:LinkButton>   --%>                                                     
                                        </asp:Panel>
                             <%--           </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>

    </section>
        </asp:Content>
