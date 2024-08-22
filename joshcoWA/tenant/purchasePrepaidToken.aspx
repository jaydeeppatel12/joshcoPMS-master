<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="purchasePrepaidToken.aspx.cs" Inherits="joshcoWA.tenant.purchasePrepaidToken" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  


<link rel="stylesheet" href="../css/PopUp.css" />
    <script src="../js/jquery-3.2.1.min.js"></script>
    
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
 
    <h2 class="mb-5">Purchase Prepaid Token</h2>
                      
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


<%--<asp:LinkButton ID="lnkBuyPrepaid" runat="server"></asp:LinkButton>
<asp:ModalPopupExtender ID="mpeBuyPrepaid" runat="server" PopupControlID="pnlBuyPrepaid" TargetControlID="lnkBuyPrepaid"
         BackgroundCssClass="modalBackground" Drag="true"  X="0" Y="0"  PopupDragHandleControlID="hdlPrepaidHeader" >
</asp:ModalPopupExtender>--%>

<%-- <asp:Panel ID="pnlBuyPrepaid" runat="server" CssClass="PopupCsdfSS" Style=" display:none; z-index:10; " >
     <div class="form-wrap"  style="width:400px; padding:15px; margin-top:50px; "  > 
        <div class="block-20;">
            <h3 id="hdlPrepaidHeader" class="heading"><asp:Label ID="lblPrepaidDocHeader" runat="server" Text="Prepaid Details"></asp:Label>
            <asp:ImageButton ID="btnClos" runat="server" style="float:right;" ImageUrl="~/images/close.png" AlternateText="Close"  /></h3>
            <p><asp:Label ID="lblRefNo" runat="server" Text="" Font-Bold="true"></asp:Label> : payment made successfully</p>
        </div>
    </div>
 </asp:Panel>--%>

 <table style="width:65%; padding-bottom:10px">
            <tr> 
                <td class="auto-style3"> Reference Number</td>
                <td style="padding-bottom:8px" class="auto-style2">
                    <asp:Label ID="lblReferenceNo" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>
                 </td>
                 <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"> 
                    <asp:Label ID="lblTenant" runat="server" Text="Tenant"></asp:Label>
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                    <asp:Label ID="lblTenantName" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>
                </td>
                <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>
            <tr> 
                <td class="auto-style3"> 
                    Project
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                    <asp:Label ID="lblProperty" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>                    
                  
                </td>
                <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>
            <tr> 
                <td class="auto-style3"> Unit Number                 
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                        <asp:HiddenField ID="hfPropertyUnitID" runat="server"></asp:HiddenField>
                         <asp:Label ID="lblPropertyUnit" runat="server" ForeColor="#333333" Font-Bold="True"></asp:Label>                   
                         
                </td>
                <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>
            <tr> 
                <td class="auto-style3"> Payment Type                
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                        <asp:HiddenField ID="hfPaymentTypeID" runat="server"></asp:HiddenField>
                         <asp:Label ID="lblPaymentType" runat="server" Text="Prepaid" ForeColor="#333333" Font-Bold="True"></asp:Label>                   
                         
                </td>
                <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>
           <tr> 
                <td class="auto-style3">Electricity/Water</td>
                <td style="padding-bottom:8px" class="auto-style2">
                  <asp:DropDownList ID="ddlWaterElectricityCategory" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" >                       
                        </asp:DropDownList>
                                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [FM_QueryCategory] ORDER BY [QueryCategory]"></asp:SqlDataSource>
                                         </td><td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>

            </tr>
 <tr> 
                <td class="auto-style3"> 
                    Meter Number<span style="color: red">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMeterNumber" ErrorMessage="*Required" ValidationGroup="Payment" ForeColor="Red" BackColor="#FFFF99" Font-Size="8pt"></asp:RequiredFieldValidator>
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                   <asp:textbox id="txtMeterNumber" runat="server" CssClass="form-control" ValidationGroup="Payment"></asp:textbox>                  
                  
                </td>
                <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>
 <tr> 
                <td class="auto-style3"> 
                    Amount<span style="color: red">*</span><asp:RequiredFieldValidator ID="rfvAmount" runat="server" ControlToValidate="txtAmount" ErrorMessage="*Required" ValidationGroup="Payment" ForeColor="Red" BackColor="#FFFF99" Font-Size="8pt"></asp:RequiredFieldValidator>
                </td>
                <td style="padding-bottom:8px" class="auto-style2">
                   <asp:textbox id="txtAmount" runat="server" CssClass="form-control" ValidationGroup="Payment"></asp:textbox>                  
                  
                </td>
                <td style="padding-bottom:8px" class="auto-style1">&nbsp;</td>
            </tr>
                    

                      <tr> <td class="auto-style3">  
                 
                          </td><td class="auto-style2">  
                        <asp:linkbutton id="lnkSubmit" runat="server" CssClass="btn btn-warning" onclick="lnkSubmit_Click" ValidationGroup="Edit">
                            <span aria-hidden="true" class="fa fa-plus"></span>&nbsp;Submit
                        </asp:linkbutton>
                        <asp:linkbutton id="lbClear" runat="server" cssclass="btn btn-danger" CausesValidation="False" PostBackUrl="paymentHistory.aspx">
                            <span aria-hidden="true" class="fa fa-step-backward"></span>&nbsp;Cancel
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
</asp:Content>
