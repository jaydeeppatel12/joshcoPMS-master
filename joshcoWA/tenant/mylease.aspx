<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="mylease.aspx.cs" Inherits="joshcoWA.mylease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="site-section">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">

                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
 
    <h2 class="mb-5">My Lease</h2>
                       <div id="divErrorMessage" runat="server" visible="false" class="alert alert-danger"> 
          <asp:Label ID="lblErrorMessage" runat="server" visible="false" ></asp:Label>
      </div>
                        <br />
   <table>
                              
                              <tr>
                                  <td style="width: 165px">Property</td>
                                  <td>
                                      <asp:Label ID="lblProperty" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Unit</td>
                                  <td>
                                      <asp:Label ID="lblUnit" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Area</td>
                                  <td>
                                      <asp:Label ID="lblArea" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Rate/SQM</td>
                                  <td>
                                      <asp:Label ID="lblRate" Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Tenant</td>
                                  <td><asp:Label ID="lblTenant" Font-Bold="True"  runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Initial Value</td>
                                  <td><asp:Label ID="lblInitialValue"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Vatable</td>
                                  <td><asp:Label ID="lblVatable"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Escalation</td>
                                  <td><asp:Label ID="lblEscalation"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Commencement Date</td>
                                  <td><asp:Label ID="lblCommencement"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Termination Date</td>
                                  <td><asp:Label ID="lblTermination"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Interest</td>
                                  <td><asp:Label ID="lblInterest"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Interest %</td>
                                  <td><asp:Label ID="lblInterestPercentage"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Type of lease</td>
                                  <td><asp:Label ID="lblTypeOfLease"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Lease Status</td>
                                  <td><asp:Label ID="lblLeaseStatus"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">Comment</td>
                                  <td><asp:Label ID="lblComment"  Font-Bold="True" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 165px"><asp:SqlDataSource ID="sdsLeaseProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseList" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="LeaseID" SessionField="AppLeaseID" Type="Int32" />
                                          <asp:Parameter Name="Filter" Type="String" DefaultValue=" " />
                                          <asp:Parameter Name="Search" Type="String" DefaultValue=" "  />
                                      </SelectParameters>
                                      </asp:SqlDataSource></td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 165px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>
 </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
