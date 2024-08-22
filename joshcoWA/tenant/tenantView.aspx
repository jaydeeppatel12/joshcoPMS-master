<%@ Page Title="" Language="C#" MasterPageFile="../application/admin.Master" AutoEventWireup="true" CodeBehind="tenantView.aspx.cs" Inherits="joshcoWA.tenant.tenantView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="../js/vtab.js"></script> 
    <link rel="stylesheet" href="../css/PopUp.css" />
   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section class="site-section">
        <div class="content-wrapper">
            <div class="row">
 
 <div class="col-md-8 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">

   <h2>Tenant Profile </h2>
       <asp:Image ID="imgback" ImageUrl="~/images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="tenantList.aspx" runat="server">Back</asp:HyperLink>
<div class="row">
    

    <div class="col">
 
    <div class="block-20 ">
        <div style="padding:15px">  
                      
  <div id="Home" class="tabcontent">
                        <table  >
                               <tr>
                                  <td style="width: 171px">&nbsp;</td>
                                  <td>
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">
                                      <asp:Label ID="lblNameCompanyNumber" runat="server">Name</asp:Label>
                                  </td>
                                  <td><asp:Label ID="lblName" Font-Bold="true"  runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="display: none;">
                                      <asp:Label ID="lblSurnameC" runat="server"></asp:Label>
                                  </td>
                                  <td style="display: none;"><asp:Label ID="lblSurname"  Font-Bold="true" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="display: none;">
                                      <asp:Label ID="lblDesignationC" runat="server"></asp:Label>
                                  </td>
                                  <td style="Display: none;"><asp:Label ID="lblDesignation"  Font-Bold="true" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="display: none;">
                                      <asp:Label ID="lblIDNumberC" runat="server"></asp:Label>
                                  </td>
                                  <td style="Display: none;"><asp:Label ID="lblIDNumber"  Font-Bold="true" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="display: none;">
                                      <asp:Label ID="lblGenderC" runat="server"></asp:Label>
                                  </td>
                                  <td style="Display: none;"><asp:Label ID="lblGender"  Font-Bold="true" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">Telephone</td>
                                  <td><asp:Label ID="lblTelephone"  Font-Bold="true" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">Cellphone No.</td>
                                  <td><asp:Label ID="lblCellNo"  Font-Bold="true" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">Fax No.</td>
                                  <td><asp:Label ID="lblFaxNo"  Font-Bold="true" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">Email Address</td>
                                  <td><asp:Label ID="lblEmailAddress"  Font-Bold="true" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">Physical Address</td>
                                  <td><asp:Label ID="lblPhysicalAddress"  Font-Bold="true" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">Postal Address</td>
                                  <td><asp:Label ID="lblPostalAddress"  Font-Bold="true" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 171px"><asp:SqlDataSource ID="sdsTenantProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectTenantProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="TenantID" SessionField="TenantID" Type="Int32" />
                                      </SelectParameters>
                                      </asp:SqlDataSource></td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px">&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>
    
                 <br />
          </div>

                        <div id="Unit" class="tabcontent" style="display:none;">
                 
           <table style="Width: 100%"  >
                               <tr>
                                  <td>
                                       <asp:LinkButton ID="LinkButton2" Font-Bold="true" Visible="false" Style="float:right;"  CausesValidation="false" runat="server" ToolTip="Add a new lease" ForeColor="#75C5CA">+Add New Lease</asp:LinkButton>
                                   </td>
 
                              </tr>
                              <tr>
                                  <td> 
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sdsRentalHistory" CellPadding="2" CellSpacing="2" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand">
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                <asp:BoundField DataField="PropertyName" HeaderText="Property" />
                                <asp:BoundField DataField="LeaseFrequency" HeaderText="Lease Frequency" />
                                <asp:BoundField DataField="AmountDueThisMonth"  DataFormatString="{0:c}" HeaderText="Amount Due This Month" />
                                <asp:BoundField DataField="LeaseStartDate" HeaderText="Commencement Date" />
                                <asp:BoundField DataField="LeaseEndDate" HeaderText="Terminantion Date" />
                                <asp:BoundField DataField="LeaseStatus" HeaderText="Lease Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2"  CausesValidation="false" runat="server" CommandName="ViewLease" CommandArgument='<%# Eval("LeaseID") %>' ToolTip="View lease details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsRentalHistory" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectTenantRentalHistory" SelectCommandType="StoredProcedure" >
                           
                                <SelectParameters>
                                    <asp:SessionParameter Name="TenantID" SessionField="TenantID" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource>
                     
                                      </td>
 
                              </tr>
                              </table>
            </div>

                       
              
            <div id="BankDetails" class="tabcontent" style="display:none;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                    
                                <table  >
                               <tr>
                                  <td style="width: 171px">&nbsp;</td>
                                  <td>
                                      &nbsp;</td>
                                  <td>
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px; vertical-align:top">
                                      <asp:Label ID="Label1" runat="server">Account Reference</asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="txtAccountReference" CssClass="form-control" runat="server" Width="200px"></asp:TextBox>
                                  </td>
                                  <td>
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px; vertical-align:top">
                                      <asp:Label ID="Label3" runat="server">Account Name</asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="txtAccountName" CssClass="form-control" runat="server" Width="200px"></asp:TextBox>
                                  </td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td >
                                      <asp:Label ID="Label5" runat="server">Account Active</asp:Label>
                                  </td>
                                  <td   style="width: 171px; vertical-align:top">
                                      <asp:RadioButtonList ID="rblAccountActive" CssClass="form-control" RepeatDirection="Horizontal" runat="server">
                                          <asp:ListItem Value="0">Inactive</asp:ListItem>
                                          <asp:ListItem Value="1">Active</asp:ListItem>
                                      </asp:RadioButtonList>
                                  </td>
                                  <td >&nbsp;</td>
                              </tr>
                              <tr>
                                  <td >
                                      <asp:Label ID="Label7" runat="server">Delete this Account</asp:Label>
                                  </td>
                                  <td > <asp:RadioButtonList ID="rblDeleteThisAccount" CssClass="form-control" RepeatDirection="Horizontal" runat="server">
                                          <asp:ListItem Value="0">Don't delete</asp:ListItem>
                                          <asp:ListItem Value="1">Delete</asp:ListItem>
                                      </asp:RadioButtonList></td>
                                  <td >&nbsp;</td>
                              </tr>
                               <tr>
                                  <td >
                                      <asp:Label ID="Label9" runat="server">Banking Detail Type</asp:Label>
                                  </td>
                                  <td  style="width: 171px; vertical-align:top"><asp:RadioButtonList ID="rblBankingDetailType" CssClass="form-control" AutoPostBack="true"  runat="server" OnSelectedIndexChanged="rblBankingDetailType_SelectedIndexChanged">
                                          <asp:ListItem Value="1">Bank account</asp:ListItem>
                                          <asp:ListItem Value="2">Credit card</asp:ListItem>
                                      </asp:RadioButtonList></td>
                                  <td >&nbsp;</td>
                              </tr>
                               <tr>
                                  <td >
                                      &nbsp;</td>
                                  <td >&nbsp;&nbsp;</td>
                                  <td >&nbsp;</td>
                              </tr>
                              </table>
     <asp:Panel ID="pnkBankAccount" Visible="false" runat="server">
                              <table  >
                             
                              <tr>
                                  <td  style="width: 171px; vertical-align:top">
                                      <asp:Label ID="Label11" runat="server">Bank Account Name</asp:Label>
                                  </td>
                                  <td >   <asp:TextBox ID="txtBankAccountName" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></td>
                                  <td  >&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px; vertical-align:top">Bank Account Type</td>
                                  <td><asp:RadioButtonList ID="rblBankAccountType" CssClass="form-control" runat="server">
                                          <asp:ListItem Value="1">Current / Checking</asp:ListItem>
                                          <asp:ListItem Value="2">Savings</asp:ListItem>
                                      <asp:ListItem Value="3">Transmission</asp:ListItem>
                                      <asp:ListItem Value="4">Bond</asp:ListItem>
                                      </asp:RadioButtonList></td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px; vertical-align:top">Bank Account Branch.</td>
                                  <td><asp:TextBox ID="txtBankAccountBranch" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px; vertical-align:top">Bank Account Number</td>
                                  <td><asp:TextBox ID="txtBankAccountNumber" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px; vertical-align:top">
                                      <asp:SqlDataSource ID="sdsBankAccount" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="Select ''" UpdateCommand="UpdateTenantBankAccount" UpdateCommandType="StoredProcedure">
                                          <UpdateParameters>
                                              <asp:Parameter Name="AccountReference" Type="String" />
                                              <asp:Parameter Name="AccountName" Type="String" />
                                              <asp:Parameter Name="AccountActive" Type="String" />
                                              <asp:Parameter Name="DeleteThisAccount" Type="String" />
                                              <asp:Parameter Name="BankingDetailType" Type="String" />
                                              <asp:Parameter Name="BankAccountName" Type="String" />
                                              <asp:Parameter Name="BankAccountType" Type="String" />
                                              <asp:Parameter Name="BankAccountBranch" Type="String" />
                                              <asp:Parameter Name="Filler" Type="String" />
                                              <asp:Parameter Name="BankAccountNumber" Type="String" />
                                              <asp:Parameter Name="TenantID" Type="Int32" />
                                          </UpdateParameters>
                                      </asp:SqlDataSource>
                                  </td>
                                  <td>
                                      <asp:Button ID="Button2" runat="server" CssClass="btn btn-warning px-5 py-2" OnClick="Button2_Click" Text="Save" />
                                  </td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>

         </asp:Panel>
     &nbsp;
          <asp:Panel ID="pnlCreditCard" Visible="false" runat="server">
                              <table  >
                             
                              <tr>
                                  <td style="width: 171px; vertical-align:top">
                                      <asp:Label ID="Label2" runat="server">Credit Card Holder</asp:Label>
                                  </td>
                                  <td >   <asp:TextBox ID="txtCreditCardHolder" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></td>
                                  <td  >&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px; vertical-align:top">Credit Card Type</td>
                                  <td><asp:RadioButtonList ID="rblCreditCardType" CssClass="form-control"  runat="server">
                                          <asp:ListItem Value="1">Mastercard</asp:ListItem>
                                          <asp:ListItem Value="2">Visa</asp:ListItem>
                                     
                                      </asp:RadioButtonList></td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px; vertical-align:top">Expiry Month</td>
                                  <td><asp:TextBox ID="txtExpiryMonth" CssClass="form-control" runat="server" Width="120px"></asp:TextBox> </td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 171px; vertical-align:top">Expiry Year</td>
                                  <td><asp:TextBox ID="txtExpiryYear" CssClass="form-control" runat="server" Width="120px"></asp:TextBox></td>
                                  <td>&nbsp;</td>
                              </tr>
                                   <tr>
                                  <td style="width: 171px; vertical-align:top">Credit Card Number</td>
                                  <td><asp:TextBox ID="txtMaskedCreditCardNumber" CssClass="form-control" runat="server" Width="120px"></asp:TextBox></td>
                                  <td>&nbsp;</td>
                              </tr>
                                    <tr>
                                  <td style="width: 171px; vertical-align:top">Debit Amount</td>
                                  <td><asp:TextBox ID="txtDebitAmount" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></td>
                                  <td>&nbsp;</td>
                              </tr>
<tr>
                                  <td style="width: 171px; vertical-align:top">Email Address</td>
                                  <td><asp:TextBox ID="txtEmailAddress" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></td>
                                  <td>&nbsp;</td>
                              </tr>
                                  <tr>
                                  <td style="width: 171px; vertical-align:top">Mobile Number</td>
                                  <td><asp:TextBox ID="txtMobileNumber" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></td>
                                  <td>&nbsp;</td>
                              </tr>

                              <tr>
                                  <td style="width: 171px">
                                      <asp:SqlDataSource ID="sdsCreditCard" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="Select ''" UpdateCommand="UpdateTenantCreditCard" UpdateCommandType="StoredProcedure">
                                          <UpdateParameters>
                                              <asp:Parameter Name="AccountReference" Type="String" />
                                              <asp:Parameter Name="AccountName" Type="String" />
                                              <asp:Parameter Name="AccountActive" Type="String" />
                                              <asp:Parameter Name="DeleteThisAccount" Type="String" />
                                              <asp:Parameter Name="BankingDetailType" Type="String" />
                                              <asp:Parameter Name="CreditCardHolder" Type="String" />
                                              <asp:Parameter Name="CreditCardType" Type="String" />
                                              <asp:Parameter Name="ExpiryMonth" Type="String" />
                                              <asp:Parameter Name="ExpiryYear" Type="String" />
                                              <asp:Parameter Name="CreditCardToken" Type="String" />
                                              <asp:Parameter Name="MaskedCreditCardNumber" Type="String" />
                                              <asp:Parameter Name="DefaultDebitAmount" Type="Decimal" />
                                              <asp:Parameter Name="DebitAmount" Type="Decimal" />
                                              <asp:Parameter Name="CreditCardEmailAddress" Type="String" />
                                              <asp:Parameter Name="CreditCardMobileNumber" Type="String" />
                                              <asp:Parameter Name="DebitMasterfileGroup" Type="String" />
                                              <asp:Parameter Name="ResubmitUnpaids" Type="String" />
                                              <asp:Parameter Name="TenantID" Type="Int32" />
                                          </UpdateParameters>
                                      </asp:SqlDataSource>
                                  </td>
                                  <td>
                                      <asp:Button ID="Button3" runat="server" CssClass="btn btn-warning px-5 py-2" Text="Save" OnClick="Button3_Click" />
                                  </td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>

         </asp:Panel>
                </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div id="Documents" class="tabcontent" style="display:none;">
                         <table  >
                               <tr>
                                  <td >&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td >
                                      <table style="width: 100px">
                                          <tr>
                                              <td style="vertical-align:middle;">
                                      <asp:FileUpload ID="FileUpload1" CssClass="btn btn-warning px-5 py-2" runat="server"  />
                                              </td>
                                              <td>
                                                  <asp:Button ID="Button1" CssClass="btn btn-warning px-5 py-2" OnClick="lnkUpload_Click"  runat="server" Text="Upload" />
                                                  
                                      
                                              </td>
                                          </tr>
                                      </table>
                                  </td>
                                  <td>
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td >&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td > <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="sdsDocument" GridLines="None" OnRowCommand="GridView2_RowCommand" ShowHeader="False" style="text-align: left; font-size: 10pt;" Width="100%">
                                      <Columns>
                                          <asp:TemplateField>
                                              <ItemTemplate>
                                                  <table cellpadding="0" cellspacing="0" style=" width:100%;">
                                                      <tr>
                                                          <td style="width: 77px; text-align: center" valign="top">
                                                              <asp:Image ID="Image1" Height="35px" runat="server" ImageUrl='<%# Eval("IconUrl") %>' />
                                                            
                                                          </td>
                                                          <td style="border-bottom: 1px dotted #808080; width: 369px; height: 1px;" valign="Top">
                                                              <asp:LinkButton ID="lnkDocument" runat="server" CausesValidation="False" CommandArgument='<%# Eval("TenantDocumentID") %>' CommandName="Download" Font-Underline="False" Text='<%# Eval("DocumentName") %>'></asp:LinkButton>
                                                          </td>
                                                          <td align="left" style="border-bottom: 1px dotted #808080; width: 94px; height: 1px;" valign="Top">
                                                              <asp:Label ID="Label13" runat="server" Text='<%# "Size: "+(Convert.ToInt32(Eval("Size"))/1024).ToString()+"KB" %>' Width="150px"></asp:Label>
                                                          </td>
                                                          <td align="left" style="border-bottom: 1px dotted #808080; width: 151px; height: 1px;" valign="Top">
                                                              <asp:Label ID="Label14" runat="server" Text='<%# "Doc type: "+ Eval("ContentType") %>' Visible="False"></asp:Label>
                                                          </td>
                                                          <td align="right" style="border-bottom: 1px dotted #808080; height: 1px;" valign="Top" width="20">
                                                                          <a id="remove" runat="server" title="Click to remove document"  onclick="return confirm('Remove document?');" onserverclick="HtmlAnchorDeleteDoc_Click"><i class="fa fa-trash"></i></a> 
                                        <asp:HiddenField ID="hfTenantDocumentID" Value='<%# Eval("TenantDocumentID") %>' runat="server" />
                                                              <asp:ImageButton ID="ImageButton1" Visible="false" runat="server" CommandArgument='<%# Eval("TenantDocumentID") %>' CommandName="Remove" ImageUrl="~/img/Delete.gif" onclientclick="return confirm('Remove Document?');" ToolTip="Remove document" />
                                                          </td>
                                                      </tr>
                                                  </table>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                      <HeaderStyle BorderStyle="None" HorizontalAlign="Left" />
                                      <RowStyle HorizontalAlign="Left" />
                                      </asp:GridView>
                                  </td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td ><asp:SqlDataSource ID="sdsDocument" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectTenantDocument" SelectCommandType="StoredProcedure" DeleteCommand="Delete [dbo].[TenantDocument] Where TenantDocumentID = @TenantDocumentID">
                                      <DeleteParameters>
                                          <asp:Parameter Name="TenantDocumentID" />
                                      </DeleteParameters>
                                      <SelectParameters>
                                          <asp:SessionParameter Name="TenantID" SessionField="TenantID" Type="Int32" />
                                      </SelectParameters>
                                      </asp:SqlDataSource></td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td >&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td >&nbsp;</td>
                                  <td>&nbsp;</td>
                              </tr>
                          </table>
            </div>      
           <div id="RentalPaymentHistory" class="tabcontent" style="display:none;">
               <asp:GridView ID="gvPaymentHistory" runat="server" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" datakeynames="LeaseRentPaidID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" >
                 <AlternatingRowStyle BackColor="#f0f0f0" />
                <Columns>
                    <asp:BoundField DataField="FinYear"
                        SortExpression="FinYear" HeaderText="FinYear" /> 
                        <asp:BoundField DataField="LeaseRentID"
                        SortExpression="LeaseRentID" HeaderText="LeaseRentID"/> 
                    <asp:BoundField DataField="AmountPaid"
                        SortExpression="AmountPaid" HeaderText="Amount Paid" /> 
                     <asp:BoundField DataField="PaymentSource"
                        SortExpression="PaymentSource" HeaderText="Payment Source" />   
                     <asp:BoundField DataField="ReferenceNo"
                        SortExpression="ReferenceNo" HeaderText="Reference Number" />   
                      <asp:BoundField DataField="PayFastPaymentId"
                        SortExpression="PayFastPaymentId" HeaderText="PayFastPaymentID" />   
                    <asp:BoundField DataField="DatePaid"
                        SortExpression="DatePaid" HeaderText="Date Paid" />
                </Columns>          
                <EmptyDataTemplate>
                    <div align="center">No records found.</div>
                </EmptyDataTemplate>
                <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />                         
                <RowStyle HorizontalAlign="Left" BackColor="White" />                         
    </asp:GridView>                
           </div>
        </div>

            </div>
        <br />  
     </div>

 </div>
 
     


</div>



    </div>
    </div>
                <div class="col-md-4 grid-margin stretch-card" style="height:200px">
   <div class="card">
                <div class="card-body">
<h3 class="heading">Tenant Menu</h3>
<ul>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Home')">Home <span></span></a></li>
<li><a href="#" class="tablinks" onclick="openCity(event, 'Unit')">Rental History<span></span></a></li>
 
    <li><a href="#" class="tablinks" onclick="openCity(event, 'BankDetails')">Bank Details <span></span></a></li>
    <li><a href="#" class="tablinks" onclick="openCity(event, 'Documents')">Documents <span></span></a></li>
  <li><a href="#" class="tablinks" onclick="openCity(event, 'RentalPaymentHistory')">Rental Payment History <span></span></a></li>

</ul>
</div>
       </div>
     </div>

    </div>
    </div>
 </section>
</asp:Content>
