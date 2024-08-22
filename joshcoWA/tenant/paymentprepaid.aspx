<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="paymentPrepaid.aspx.cs" Inherits="joshcoWA.tenant.paymentPrepaid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#payfastdepositbutton").on("click", function (n) {
            n.preventDefault();
            $("#form1").attr("action", "https://sandbox.payfast.co.za​/eng/process"); // repalce with https://www.payfast.co.za/eng/process  to point to pay fast
            $("#form1").submit(); //or whatever your WebForms form element is called
        });
    });
</script>
    
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
 
    <h2 class="mb-5">Buy Prepaid (Electricity & Water Tokens)</h2>
                      
                        <br />
    <%--<form action="https://www.payfast.co.za/eng/process" method="post">--%>
    <div id="divpayfastdeposit">
   <input type="hidden" name="merchant_id" value="<%=System.Configuration.ConfigurationManager.AppSettings["MerchantId"] %>" />
   <input type="hidden" name="merchant_key" value="<%=System.Configuration.ConfigurationManager.AppSettings["MerchantKey"] %>" />
   <input type="hidden" name="return_url" value="http://localhost:6180/tenant/paymentReturn.aspx" /> 
   <input type="hidden" name="cancel_url" value="http://localhost:6180/tenant/paymentCancel.aspx" />
   <input type="hidden" name="notify_url" value="http://localhost:6180/tenant/paymentNotify.aspx" />
    <input type="hidden" name="amount" value="10" />
   <input type="hidden" name="item_name" value="test item" />
   <input type="submit" id="payfastdepositbutton" />
       
   </div>
                                            <%--<table style="width:65%; padding-bottom:10px">--%>
                                               <%-- <tr> 
                                                    <td class="auto-style3"> Reference Number</td>
                                                    <td style="padding-bottom:8px" class="auto-style2">
                  <asp:Label ID="lblReferenceNo" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label></td>
                                                    <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
                                                </tr>--%>
                                              <%--  <tr> 
                                                    <td class="auto-style3"> Project </td>
                                                    <td style="padding-bottom:8px" class="auto-style2">
                                                        <asp:Label ID="Label1" runat="server" ForeColor="#333333" Font-Bold="True"> </asp:Label>
                                                        <input  type="text" id="txtProject" runat="server" readonly="readonly"  class="applicant form-control py-2" value="0" />
                                                    </td>
                                                    <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
                                                </tr>--%>
                                               <%-- <tr> 
                                                    <td class="auto-style3"> Unit Number</td>
                                                    <td style="padding-bottom:8px" class="auto-style2"> 
                                                        <input  type="text" id="txtUnitNumber" runat="server" readonly="readonly"  class="applicant form-control py-2" value="0" />
                                                    </td>
                                                    <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
                                                </tr>--%>
                                              <%--  <tr> 
                                                    <td class="auto-style3"> Outstanding Balance </td>
                                                    <td style="padding-bottom:8px" class="auto-style2">       
                                                        <input  type="text" id="txtOutstandingBalance" runat="server"   class="applicant form-control py-2" value="0" />
                                                    </td>
                                                    <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
                                                </tr>--%>
                                                <%-- <tr> <td class="auto-style3">  </td><td class="auto-style2">  --%>
                                                     <%--onclick="lnkSubmit_Click"--%>
                       <%-- <asp:linkbutton id="lnkSubmit" runat="server" CssClass="btn btn-warning"  ValidationGroup="Edit">
                            <span aria-hidden="true" class="fa fa-plus"></span>&nbsp;Submit
                        </asp:linkbutton>
                        <asp:linkbutton id="lbClear" runat="server" cssclass="btn btn-danger" CausesValidation="False" PostBackUrl="tenantQueryList.aspx">
                            <span aria-hidden="true" class="fa fa-step-backward"></span>&nbsp;Cancel
                        </asp:linkbutton>--%>
                                                
                  <%--  </td>
                          <td> &nbsp;</td>
                      </tr>
                                            </table--%>
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
