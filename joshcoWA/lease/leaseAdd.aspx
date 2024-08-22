<%@ Page Title="" Language="C#" MasterPageFile="../application/admin.Master" AutoEventWireup="true" CodeBehind="leaseAdd.aspx.cs" Inherits="joshcoWA.lease.leaseAdd1" %>

<%@ Register Src="leaseAdd.ascx" TagPrefix="uc1" TagName="leaseAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                                                <h2>Lease Form</h2>
      <asp:Image ID="imgback" ImageUrl="../images/back.png" runat="server" /><asp:HyperLink ID="hlnkBack" NavigateUrl="../Application/appProfile.aspx" runat="server">Back</asp:HyperLink>

                <asp:SqlDataSource ID="sdsApp" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationProfile" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
                    </SelectParameters>
            </asp:SqlDataSource>
       
            <uc1:leaseAdd runat="server" id="leaseAdd" />



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
