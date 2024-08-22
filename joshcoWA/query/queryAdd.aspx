<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="queryAdd.aspx.cs" Inherits="joshcoWA.query.queryAdd" %>
<%@ Register Src="../tenant/addQuery.ascx" TagPrefix="uc1" TagName="addQuery" %>

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

    <h2 class="mb-5"> <asp:Label ID="lblLeaseDocHeader" runat="server" Text="Query Details"></asp:Label></h2>
     
<uc1:addQuery runat="server" id="addQuery"  />
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
