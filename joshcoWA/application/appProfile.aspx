<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="appProfile.aspx.cs" Inherits="joshcoWA.appProfile" %>
<%@ Register src="../lease/leaseAdd.ascx" tagname="AddLease" tagprefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register Src="../applicant/frmApplicant.ascx" TagPrefix="uc1" TagName="frmApplicant" %>
<%@ Register Src="../applicant/frmApplicantEmployment.ascx" TagPrefix="uc1" TagName="frmApplicantEmployment" %>
<%@ Register Src="../applicant/frmApplicantSpouse.ascx" TagPrefix="uc1" TagName="frmApplicantSpouse" %>
<%@ Register Src="../applicant/frmApplicantSpouseEmployment.ascx" TagPrefix="uc1" TagName="frmApplicantSpouseEmployment" %>
<%@ Register Src="../applicant/frmApplicantGeneralDetails.ascx" TagPrefix="uc1" TagName="frmApplicantGeneralDetails" %>
<%@ Register Src="../applicant/frmApplicantDeclaration.ascx" TagPrefix="uc1" TagName="frmApplicantDeclaration" %>
<%@ Register Src="../applicant/frmApplicantDocument.ascx" TagPrefix="uc1" TagName="frmApplicantDocument" %>
<%@ Register Src="../applicant/frmApplicantIncome.ascx" TagPrefix="uc1" TagName="frmApplicantIncome" %>
<%@ Register Src="../applicant/frmApplicantExpenditure.ascx" TagPrefix="uc1" TagName="frmApplicantExpenditure" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <link rel="stylesheet" href="../css/PopUp.css" />
    <style type="text/css">
.Initial
{
  display: block;
  padding: 4px 18px 4px 18px;
  float: left;
  background: url("../Images/InitialImage.png") no-repeat right top;
  color: Black;
   font-size:small;
  /*font-weight: bold;*/
}
.Initial:hover
{
  color: White;
  background: url("../Images/SelectedButton.png") no-repeat right top;
}
.Clicked
{
  float: left;
  display: block;
  background: url("../Images/SelectedButton.png") no-repeat right top;
  padding: 4px 18px 4px 18px;
  color: Black;
  font-size:small;
  /*font-weight: bold;*/
  color: White;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style='position:absolute;z-index:5;top:45%;left:45%;'>
      <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
   
          <asp:Image ID="imgLoading" runat="server" ImageUrl="../Images/loading.gif" />
        </ProgressTemplate>
      </asp:UpdateProgress>

    </div>

     <link rel="stylesheet" href="../css/PopUp.css" />
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

    <h2>Application Form</h2>
      <asp:Image ID="imgback" ImageUrl="../images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="appList.aspx" runat="server">Back</asp:HyperLink>
    <asp:ImageButton ID="imbDownloadApplication" runat="server" ImageUrl="../images/PDF-icon-small-231x300-231x300.png" style="float:right;" ToolTip="Download application form" CausesValidation="False" OnClick="imbDownloadApplication_Click" Width="25px"  />
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <asp:SqlDataSource ID="sdsApplicationForm" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationForm" SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:SessionParameter Name="ApplicantID" SessionField="ApplicantID" Type="Int32" />
         </SelectParameters>
    </asp:SqlDataSource>
     <asp:LinkButton ID="lnkLeaseAdd" runat="server"></asp:LinkButton>
                                      <asp:ModalPopupExtender ID="mpeLeaseAdd" runat="server" PopupControlID="pnlLeaseAdd" TargetControlID="lnkLeaseAdd"
      CancelControlID="btnClos"   BackgroundCssClass="modalBackground" Drag="true"  X="0" Y="50"  PopupDragHandleControlID="hdlLeaseHeader" >
</asp:ModalPopupExtender>

 <asp:Panel ID="pnlLeaseAdd" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
                                         

<div class="pop"  style="width:800px; padding:15px; margin-top:50px; "  >
 
   
        <asp:Label ID="lblLeaseDocHeader" runat="server" Text=""></asp:Label><h3 id="hdlLeaseHeader" class="heading">Lease Information</h3>
       <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="../images/close.png" AlternateText="Close" />
       
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                              <ContentTemplate>
     <uc1:AddLease ID="AddLease1" runat="server" /> </ContentTemplate>
                                          </asp:UpdatePanel>

      
    </div>
                                                   
</asp:Panel>
    <div>
        <asp:Button Text="Applicant Details" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server"
              OnClick="Tab1_Click" />
          <asp:Button Text="Employment Details" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server"
              OnClick="Tab2_Click" />
          <asp:Button Text="General Details" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server"
              OnClick="Tab3_Click" />
                  <asp:Button Text="Applicant Spouse" BorderStyle="None" ID="Tab4" CssClass="Initial" runat="server"
              OnClick="Tab4_Click" />
                  <asp:Button Text="Spouse Employment" BorderStyle="None" ID="Tab5" CssClass="Initial" runat="server"
              OnClick="Tab5_Click" />

         <asp:Button Text="Applicant Income" BorderStyle="None" ID="Tab66" CssClass="Initial" runat="server"
              OnClick="Tab66_Click" />

                 <asp:Button Text="Applicant Expenditure" BorderStyle="None" ID="Tab77" CssClass="Initial" runat="server"
              OnClick="Tab77_Click" />


                  <asp:Button Text="Documents" BorderStyle="None" ID="Tab6" CssClass="Initial" runat="server"
              OnClick="Tab6_Click" />
        
                  <asp:Button Text="Declaration" BorderStyle="None" ID="Tab7" CssClass="Initial" runat="server"
              OnClick="Tab7_Click" />

         <asp:Button Text="Approved" BorderStyle="None" ID="Tab10" CssClass="Initial" runat="server"
              OnClick="Tab10_Click" Visible="false" />

          <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                    <uc1:frmApplicant runat="server" id="frmApplicant" /> 
                      
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
           
                     <uc1:frmApplicantEmployment runat="server" id="frmApplicantEmployment"  />
                  
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
             
                   <uc1:frmApplicantGeneralDetails runat="server" id="frmApplicantGeneralDetails" />
            
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View4" runat="server">
            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
            <tr>
                <td>
                 
            <uc1:frmApplicantSpouse runat="server" id="frmApplicantSpouse" />
                 
                </td>
            </tr>
            </table>
        </asp:View>
            <asp:View ID="View5" runat="server">
            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
            <tr>
                <td>
                 
                <uc1:frmApplicantSpouseEmployment runat="server" id="frmApplicantSpouseEmployment" />
                  
                </td>
            </tr>
            </table>
                </asp:View>
            <asp:View ID="View8" runat="server">
            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
            <tr>
                <td>
                 
                <uc1:frmApplicantIncome runat="server" id="frmApplicantIncome" />
                  
                </td>
            </tr>
            </table>
        </asp:View>
            <asp:View ID="View9" runat="server">
            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
            <tr>
                <td>
                 
                <uc1:frmApplicantExpenditure runat="server" id="frmApplicantExpenditure" />
                  
                </td>
            </tr>
            </table>
        </asp:View>
            <asp:View ID="View6" runat="server">
            <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
            <tr>
                <td>
                 
                <uc1:frmApplicantDocument runat="server" id="frmApplicantDocument"  />
                
                </td>
            </tr>
            </table>
        </asp:View>
            <asp:View ID="View7" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
               
                 <uc1:frmApplicantDeclaration runat="server" id="frmApplicantDeclaration"  />
                   
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View10" runat="server"  >
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid;  ">
                <tr>
                  <td>
                          <asp:Panel ID="pnlAddLease" runat="server" CssClass="block-20"  Visible="False" Width="100%" >
                               <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                                        <table style="width:100%;">
                                             <tr><td style="vertical-align: top;  padding:10px; ">
                                                 <h3 class="heading">Create Lease</h3>
                                                 </td>
                                                  </tr>
                        <tr>
                            <td style="vertical-align: top;  padding:10px; text-align:center; font-size:20px; ">
                                       Application Approved, please click
                                <asp:LinkButton ID="hlnkAddLease" runat="server" CausesValidation="false" OnClick="hlnkAddLease_Click" PostBackUrl="../lease/leaseAdd.aspx">here</asp:LinkButton>
                                      
                                       &nbsp;to create a lease.
                                   </td>
                        </tr>
                    </table>
                                   </div>
                                   </asp:Panel> 
                                    <asp:Panel ID="pnlLease" runat="server" CssClass="block-20"  BackColor="GreenYellow" Visible="False" Width="100%">
                                        <table style="width:100%;">
                        <tr>
                            <td style="vertical-align: top;  padding:10px;">
                                <asp:HiddenField ID="hfLeaseID" runat="server" />
                                        Application was approved, and a lease was created <br />
                                        <asp:HyperLink ID="hlnkViewLease"  NavigateUrl="../lease/leaseProfile.aspx"  runat="server">View lease</asp:HyperLink> 
                                      
                                   </td>
                        </tr>
                    </table>

                                   </asp:Panel><br />
<asp:HiddenField ID="lblLastDeposit" runat="server" />
                <asp:Panel ID="pnlDeposit" runat="server" CssClass="block-20"  Visible="False" Width="100%"    >
                     <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
                                        <table style="width:100%;">
                        <tr>
                            <td style="vertical-align: top;  padding:10px; ">
                                       <table class="w-100">
                                           <tr>
                                               <td><h3 class="heading">Deposit</h3>
</td>
                                           </tr>
 <tr>
                                               <td> 
                                             <h5 style="color: black">Deposit Required <span class="badge badge-info"> R
<asp:Label ID="lblDeposit" runat="server"></asp:Label>
                                            </span></h5>

                                              </td>
                                           </tr>                                          
                                           <tr>
                                               <td>
                                                   <table style="width: 100%">
                                          <tr>
                                              <td style="vertical-align:top;width:65%">
                                                  Deposit Amount Paid<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BackColor="#FFFF99" ControlToValidate="txtDepositAmount" Display="Dynamic" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="Deposit"></asp:RequiredFieldValidator>
                                                  <asp:RegularExpressionValidator ID="revNumber" runat="server" ControlToValidate="txtDepositAmount"
           ErrorMessage="Please enter only numbers like 100 or 100.00" Font-Size="8pt" BackColor="#FFFF99" ForeColor="Red" ValidationGroup="Deposit" ValidationExpression="^\d+(\.\d\d)?$" Display="Dynamic"></asp:RegularExpressionValidator>
                                              </td>
                                               <td style="vertical-align:middle;width:35%">
                                      
                                                   Payment Source</td>
                                              <td style="vertical-align:top;width:35%">Proof Of Payment<span style="color:red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BackColor="#FFFF99" ControlToValidate="flProofOfPayment" Display="Dynamic" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="Deposit"></asp:RequiredFieldValidator>
                                              </td>
                                              <td>
                                                  &nbsp;</td>
                                          </tr>
                                                       <tr>
                                                           <td style="vertical-align:top;width:65%">
                                                               <input id="txtDepositAmount"  runat="server" style="width:100%" type="text" class="form-control" placeholder="" validationgroup="Deposit" />
                                                           </td>
                                                           <td style="vertical-align:middle;width:35%">
                                                               <asp:DropDownList ID="ddlSource" runat="server" CssClass="btn-outline-warning btn-fw">
                                                                   <asp:ListItem>Bank Deposit</asp:ListItem>
                                                                   <asp:ListItem>EFT</asp:ListItem>
                                                               </asp:DropDownList>
                                                           </td>
                                                           <td style="vertical-align:top;width:35%">
                                                               <asp:FileUpload ID="flProofOfPayment" runat="server" />
                                                               <asp:LinkButton ID="lnkProofOfDeposit" runat="server" Width="300px" OnClick="lnkProofOfDeposit_Click" Visible="true"></asp:LinkButton>
                                                           </td>
                                                           <td>
                                                               <asp:Button ID="btnDeposit" runat="server" CssClass="btn btn-warning px-5 py-2" OnClick="btnDeposit_Click" Text="Submit" />
                                                           </td>
                                                       </tr>
                                      </table>
                                               </td>
                                           </tr>
                                         
                                       </table>
&nbsp;</td>
                        </tr>
                    </table>
                         </div>
                                   </asp:Panel>

                          
                   
                  </td>
                </tr>
              </table>
            </asp:View>
          </asp:MultiView>
 
    </div>

        <div class="block-20 ">
        <br />
   
     </div>
          <%-- <div class="block-20 ">
        <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
             <table class="w-100">
                                           <tr>
                                               <td><h3 class="heading">Credit Check</h3>
</td>
                                           </tr><tr>
                                               <td>
<asp:Label ID="lblConsumerReport" runat="server" Text=""></asp:Label>
                                               </td>
                                                </tr>
                 <tr>
                                               <td>
<asp:Label ID="lblIdVerify" runat="server" Text=""></asp:Label>
                                               </td>
                                                </tr>
                 </table>

             
             </div>
        <br />
   
     </div>--%>

            <div class="block-20 ">
         <div class="alert alert-success mt-4 d-flex align-items-center" role="alert">
             
              <table style="Width: 100%"  >
                  <tr>
                      <td>
<h3 class="heading">Application Review</h3>
                      </td>

                  </tr>
                               <tr>
                                  <td>
                                     <table id="pnlStatus" runat="server" style="width: 100%">
                                          <tr>
                                              <td style="vertical-align:middle;width:65%">
                                      <input id="txtComment"  runat="server" style="width:100%" type="text" class="form-control" placeholder="Enter status comment here..." />
                                              </td>
                                               <td style="vertical-align:middle;width:35%">
                                      
                                                   <asp:DropDownList ID="DropDownList1" runat="server" CssClass="btn-outline-warning btn-fw"   DataSourceID="sdsApplicationStatus" DataTextField="ApplicationStatus" DataValueField="ApplicationStatusID">
                                                   </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsApplicationStatus" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationStatusList" SelectCommandType="StoredProcedure" >
                           
                                <SelectParameters>
                                    <asp:SessionParameter Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource>
                     
                                              </td>
                                              <td>
                                                  <asp:Button ID="Button2" CssClass="btn btn-warning px-5 py-2" OnClick="lnkAddStatus_Click"  runat="server" Text="Submit" />
                                                  
                                      
                                              </td>
                                          </tr>
                                      </table>
                                   </td>
 
                              </tr>
                              <tr>
                                  <td>&nbsp;
                                      </td>
                                  </tr>
                              <tr>
                                  <td> 
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sdsApplicationStatusUpdate" CellPadding="2" CellSpacing="2" GridLines="None" Width="100%" HorizontalAlign="Left" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                <asp:BoundField DataField="StatusDate" HeaderText="Status Date" />
                                <asp:BoundField DataField="Comment" HeaderText="Comment" />
                                <asp:BoundField DataField="ApplicationStatus"  HeaderText="Application Status"/>
 
                                <asp:TemplateField>
                                    <ItemTemplate>
                                         <a id="remove" runat="server" visible='<%# Convert.ToBoolean(Eval("ApplicationStatusID").ToString()=="1"?"False":"True") %>' title="Click to remove item"  onclick="return confirm('Remove item?');" onserverclick="HtmlAnchor_Click"><i class="fa fa-trash"></i></a> 
                                        <asp:HiddenField ID="hfApplicationStatusID" Value='<%# Eval("ApplicationStatusUpdateID") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsApplicationStatusUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationStatusUpdate" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM ApplicationStatusUpdate WHERE (ApplicationStatusUpdateID = @ApplicationStatusUpdateID)" InsertCommand="InsertApplicationStatus" InsertCommandType="StoredProcedure" >
                           
                                <DeleteParameters>
                                    <asp:Parameter Name="ApplicationStatusUpdateID" />
                                </DeleteParameters>
                           
                                <InsertParameters>
                                    <asp:Parameter Name="Comment" Type="String" />
                                    <asp:Parameter Name="ApplicationStatusID" Type="Int32" />
                                    <asp:Parameter Name="ApplicationID" Type="Int32" />
                                </InsertParameters>
                           
                                <SelectParameters>
                                    <asp:SessionParameter Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
                                </SelectParameters>
                                      </asp:SqlDataSource>
                     
                                      </td>
 
                              </tr>
                              </table>
                <asp:SqlDataSource ID="sdsApp" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationProfile" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
                    </SelectParameters>
            </asp:SqlDataSource>
       
                <asp:HiddenField ID="EmailAddress" runat="server" />
            <asp:HiddenField ID="IDNumber" runat="server" />
            <asp:HiddenField ID="Name" runat="server" />
             <asp:HiddenField ID="Mobile" runat="server" />
             <asp:HiddenField ID="hDepositAmount" runat="server" />

                        <asp:HiddenField ID="hfApplicationID" runat="server" />

                        </div>
        <br />
   
     </div>



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
