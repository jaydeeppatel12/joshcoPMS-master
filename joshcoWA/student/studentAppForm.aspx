<%@ Page Title="" Language="C#" MasterPageFile="student.Master" AutoEventWireup="true" CodeBehind="studentAppForm.aspx.cs" Inherits="joshcoWA.student.studentAppForm" %>

<%@ Register Src="frmStudentAccommodation.ascx" TagPrefix="uc1" TagName="frmStudentAccommodation" %>
<%@ Register Src="frmStudentApplicant.ascx" TagPrefix="uc1" TagName="frmStudentApplicant" %>
<%@ Register Src="frmStudentParent.ascx" TagPrefix="uc1" TagName="frmStudentParent" %>
<%@ Register Src="frmStudentFinancialSponsor.ascx" TagPrefix="uc1" TagName="frmStudentFinancialSponsor" %>
<%@ Register Src="frmStudentDeclaration.ascx" TagPrefix="uc1" TagName="frmStudentDeclaration" %>
<%@ Register Src="frmStudentOTPVerification.ascx" TagPrefix="uc1" TagName="frmStudentOTPVerification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
        <script type="text/javascript">
    $(function () {
        $("[id*=btnSubmit]").click(function () {
            var ddlFruits = $("[id*=ddlFruits]");
            if (ddlFruits.val() == "") {
                //If the "Please Select" option is selected display error.
                alert("Please select an option!");
                return false;
            }
            return true;
        });
    });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="site-section">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <div class="container">
<div class="row justify-content-center">
<div class="row">
<div class="col-md-12 form-group">
       

    <div class="d-flex flex-row">
        <div class="p-2"><asp:Button ID="btnStudentApplicantDetails" runat="server"  OnClick="btnStudentApplicantDetails_Click" Text="Applicant Details" CssClass="btn btn-warning"  /></div>
        <div class="p-2"><asp:Button ID="btnStudentAccommodation" runat="server"  OnClick="btnStudentAccommodation_Click" Text="Accommodation Details" CssClass="btn btn-warning"  /></div>
        <div class="p-2"><asp:Button ID="btnStudentParent" runat="server"   Text="Parent Details" CssClass="btn btn-warning"  OnClick="btnStudentParent_Click"  /></div>
        <div class="p-2"><asp:Button ID="btnStudentSponsor" runat="server"   Text="Financial Sponsor" CssClass="btn btn-warning" OnClick="btnStudentSponsor_Click" /></div>
        <div class="p-2"><asp:Button ID="btnStudentDeclaration" runat="server"   Text="Student Declaration" CssClass="btn btn-warning"  OnClick="btnStudentDeclaration_Click" /></div>
       <div class="p-2"><asp:Button ID="btnStudentOTPVerification" runat="server"   Text="OTP Verification" CssClass="btn btn-warning" OnClick="btnStudentOTPVerification_Click"  /></div> 
    </div>

   
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Panel ID="pnlBody" runat="server"  Width="100%" HorizontalAlign="Left">
      
      <uc1:frmStudentApplicant runat="server" id="frmStudentApplicant" visible="false" />
      <uc1:frmStudentAccommodation runat="server" id="frmStudentAccommodation" visible="false" />
      <uc1:frmStudentParent runat="server" id="frmStudentParent" visible="false" />
      <uc1:frmStudentFinancialSponsor runat="server" id="frmStudentFinancialSponsor" visible="false" />
      <uc1:frmStudentDeclaration runat="server" id="frmStudentDeclaration" visible="false" />
      <uc1:frmStudentOTPVerification runat="server" id="frmStudentOTPVerification" visible="false" />       
    </asp:Panel>
       <%-- <asp:HiddenField ID="hfIndex" runat="server" Value="0" />--%>
    <table style="width:100%;">
        <tr><td style="width:100%; align-items:center; align-content:center; text-align: center;"><br />
         <%--<asp:Label ID="lblIndex" runat="server" Text=""></asp:Label> --%>
        <asp:Button ID="btnSave" runat="server"  OnClick="btnSave_Click" Text="Save Applicant Details" CssClass="btn btn-warning" ValidationGroup="StudentApplicationForm"  Width="250px" />
     </td></tr></table>
       
 
     </div>
</div> 
</div>
</div>
    </section>
</asp:Content>
