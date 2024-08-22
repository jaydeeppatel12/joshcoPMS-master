<%@ Page Title="" Language="C#" MasterPageFile="../Applicant/Apphome.Master" MaintainScrollPositionOnPostback="true" validateRequest="false" AutoEventWireup="true" CodeBehind="supplierAdd.aspx.cs" Inherits="joshcoWA.supplier.supplierAdd" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit"%>--%>

<%@ Register Src="frmSupplier1.ascx" TagPrefix="uc1" TagName="frmSupplier1" %>
<%@ Register Src="frmSupplier2.ascx" TagPrefix="uc1" TagName="frmSupplier2" %>
<%@ Register Src="frmSupplier3.ascx" TagPrefix="uc1" TagName="frmSupplier3" %>
<%@ Register Src="frmSupplier4.ascx" TagPrefix="uc1" TagName="frmSupplier4" %>
<%@ Register Src="frmSupplier5.ascx" TagPrefix="uc1" TagName="frmSupplier5" %>
<%@ Register Src="frmSupplier6.ascx" TagPrefix="uc1" TagName="frmSupplier6" %>
<%@ Register Src="frmSupplier0.ascx" TagPrefix="uc1" TagName="frmSupplier0" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
  <h2 class="mb-5"> <asp:Label ID="lblLeaseDocHeader" runat="server" Text="Service Provider Form"></asp:Label></h2>
 
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Panel ID="pnlBody" runat="server"  Width="100%" HorizontalAlign="Left" >
<uc1:frmSupplier0 runat="server" id="frmSupplier0" />
<uc1:frmSupplier1 runat="server" id="frmSupplier1" visible="false"/>
<uc1:frmSupplier2 runat="server" id="frmSupplier2" visible="false"/>
<uc1:frmSupplier3 runat="server" id="frmSupplier3" visible="false"/>    
<uc1:frmSupplier4 runat="server" id="frmSupplier4" visible="false"/>
<uc1:frmSupplier5 runat="server" id="frmSupplier5" visible="false"/>
<uc1:frmSupplier6 runat="server" id="frmSupplier6" visible="false"/>

</asp:Panel>
        <asp:HiddenField ID="hfIndex" runat="server" Value="0" />
            <table style="width:100%;">
        <tr><td style="width:100%; align-items:center; align-content:center; text-align: center;"><br />
        <asp:Button ID="btnBack" runat="server"  OnClick="btnBback_Click" Text="&lt;&lt; Back" CssClass="btn btn-warning" Width="250px" Visible="False" />
            <asp:Label ID="lblIndex" runat="server" Text=""></asp:Label> <asp:Button ID="btnBegin" runat="server"  OnClick="btnBegin_Click" Text="Start Application" CssClass="btn btn-warning" ValidationGroup="frmApplicant" Width="250px" />
     </td>
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
