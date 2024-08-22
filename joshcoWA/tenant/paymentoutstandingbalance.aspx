<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="paymentOutstandingBalance.aspx.cs" Inherits="joshcoWA.tenant.paymentOutstandingBalance" %>
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
 
    <h2 class="mb-5">Pay Outstanding Balance </h2>
     <div id="divErrorMessage" runat="server" visible="false" class="alert alert-danger"> 
          <asp:Label ID="lblErrorMessage" runat="server" visible="false" ></asp:Label>
      </div>
   <asp:HiddenField ID="hfPropertyID" runat="server" />
    <asp:HiddenField ID="HiddenField1" runat="server" />                                   
       
    <asp:HiddenField ID="hfTenantName" runat="server" />
                           
  
    
    <asp:SqlDataSource ID="sdsLeaseProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseList" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="LeaseID" SessionField="AppLeaseID" Type="Int32" />
                                          <asp:Parameter Name="Filter" Type="String" DefaultValue=" " />
                                          <asp:Parameter Name="Search" Type="String" DefaultValue=" "  />
                                      </SelectParameters>
                                      </asp:SqlDataSource>
                                            
 <table style="width:65%; padding-bottom:10px">
            <tr> 
                <td class="auto-style3"> Reference Number</td>
                <td style="padding-bottom:8px" class="auto-style2">
                    <asp:Label ID="lblReferenceNo" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>
                 </td>
                 <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>         
          <tr> 
                <td class="auto-style3"> Payment Type                
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                        <asp:HiddenField ID="hfPaymentTypeID" runat="server"></asp:HiddenField>
                         <asp:Label ID="lblPaymentType" runat="server" ForeColor="#333333" Text="Outstanding Balance" Font-Bold="True"></asp:Label>                   
                         
                </td>
                <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
        </tr>        
        <tr> 
                <td class="auto-style3"> 
                    Outstanding Balance
                    <span style="color: red">*<asp:RequiredFieldValidator ID="rfvOutstandingBalance" runat="server" ControlToValidate="txtOutstandingBalance" ErrorMessage="Required" ValidationGroup="OutstandingBalance" ForeColor="Red" BackColor="#FFFF99" Font-Size="8pt"></asp:RequiredFieldValidator>
                              </span>
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                   <asp:textbox id="txtOutstandingBalance" runat="server" CssClass="form-control" ValidationGroup="OutstandingBalance"></asp:textbox>                  
                  
                </td>
                <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>                        

                      <tr> <td class="auto-style3">  
                 
                          </td><td class="auto-style2">  
                        <asp:linkbutton id="lnkPay" runat="server" CssClass="btn btn-warning" onclick="lnkPay_Click" ValidationGroup="OutstandingBalance">
                            <span aria-hidden="true" class="fa fa-plus"></span>&nbsp;Pay
                        </asp:linkbutton>                   
                    </td>
                          <td> &nbsp;</td>
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
<%--</form>--%>
</asp:Content>
