<%@ Page Title="" Language="C#" MasterPageFile="Apphome.Master" AutoEventWireup="true" CodeBehind="appForm.aspx.cs" Inherits="joshcoWA.applicant.appForm" %>

<%@ Register Src="frmProperty.ascx" TagPrefix="uc1" TagName="frmProperty" %>
<%@ Register Src="frmApplicant.ascx" TagPrefix="uc1" TagName="frmApplicant" %>
<%@ Register Src="frmApplicantEmployment.ascx" TagPrefix="uc1" TagName="frmApplicantEmployment" %>
<%@ Register Src="frmApplicantSpouse.ascx" TagPrefix="uc1" TagName="frmApplicantSpouse" %>
<%@ Register Src="frmApplicantSpouseEmployment.ascx" TagPrefix="uc1" TagName="frmApplicantSpouseEmployment" %>
<%@ Register Src="frmApplicantGeneralDetails.ascx" TagPrefix="uc1" TagName="frmApplicantGeneralDetails" %>
<%@ Register Src="frmApplicantDeclaration.ascx" TagPrefix="uc1" TagName="frmApplicantDeclaration" %>
<%@ Register Src="frmApplicantDocument.ascx" TagPrefix="uc1" TagName="frmApplicantDocument" %>
<%@ Register Src="frmApplicantFinish.ascx" TagPrefix="uc1" TagName="frmApplicantFinish" %>
<%@ Register Src="frmApplicantIncome.ascx" TagPrefix="uc1" TagName="frmApplicantIncome" %>
<%@ Register Src="frmApplicantExpenditure.ascx" TagPrefix="uc1" TagName="frmApplicantExpenditure" %>
<%@ Register Src="OTP.ascx" TagPrefix="uc1" TagName="OTP" %>

  
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">  
    <script src="../js/jquery-3.2.1.min.js"></script>

<%--    <script type="text/javascript">  

        function CheckIdentityNumberAvailability() {
            var idnumber = $('#ContentPlaceHolder1_frmApplicant_txtIdentityNumber').val();
            $.ajax({
                type: "POST",
                url: "appForm.aspx/CheckIdentityNumber", // this for calling the web method function in cs code.
                data: '{userId: "' + idnumber + '" }',// user name or email value
                contentType: "application/json; charset=utf-8",  
                dataType: "json",  
                success: OnSuccess,  
                failure: function (response) {  
                    alert(response);  
                }  
            });  
        
  
        // function OnSuccess  
        function OnSuccess(response) {  
            var msg = $("#<%=Label1.ClientID%>");
            alert(msg)
            }
        }

    </script>  --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="site-section">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="content-wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tab">
                        <div class="tab-content tab-content-basic">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview">

                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
 
 
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Panel ID="pnlBody" runat="server"  Width="100%" HorizontalAlign="Left" >
        <uc1:frmProperty runat="server" id="frmProperty" />
        <uc1:frmApplicant runat="server" id="frmApplicant" visible="false" />
        <uc1:frmApplicantEmployment runat="server" id="frmApplicantEmployment" visible="false" />
     
        <uc1:frmApplicantSpouse runat="server" id="frmApplicantSpouse" visible="false" />
        <uc1:frmApplicantSpouseEmployment runat="server" id="frmApplicantSpouseEmployment" visible="false" />
        <uc1:frmApplicantGeneralDetails runat="server" id="frmApplicantGeneralDetails" visible="false" />
         <uc1:frmApplicantIncome runat="server" id="frmApplicantIncome"  visible="false" />
        <uc1:frmApplicantExpenditure runat="server" id="frmApplicantExpenditure" visible="false" />
        <uc1:frmApplicantDocument runat="server" id="frmApplicantDocument" visible="false" />
       
        <uc1:frmApplicantDeclaration runat="server" id="frmApplicantDeclaration" visible="false" />
        <uc1:frmApplicantFinish runat="server" id="frmApplicantFinish" visible="false"  />
        <uc1:OTP runat="server" id="OTP" visible="false"   />
    </asp:Panel>
        <asp:HiddenField ID="hfIndex" runat="server" Value="0" />
    <table style="width:100%;">
        <tr><td style="width:100%; align-items:center; align-content:center; text-align: center;"><br />
        <asp:Button ID="btnBack" runat="server"  OnClick="btnBback_Click" Text="&lt;&lt; Back" CssClass="btn btn-warning" Width="250px" Visible="False" />
            <asp:Label ID="lblIndex" runat="server" Text=""></asp:Label> <asp:Button ID="btnBegin" runat="server"  OnClick="btnBegin_Click" Text="Start Application" CssClass="btn btn-warning" ValidationGroup="frmApplicant" Width="250px" />
     </td></tr></table>
    
    
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
