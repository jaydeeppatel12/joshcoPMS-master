﻿<%@ Page Title="" Language="C#" MasterPageFile="~/user/admin.Master" AutoEventWireup="true" CodeBehind="adminUserAccountAdd.aspx.cs" Inherits="joshcoWA.user.adminUserAccountAdd" %>

<%@ Register Src="addAdminUser.ascx" TagPrefix="uc1" TagName="addAdminUser" %>

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
                                            <h2 class="mb-5"> <asp:Label ID="lblAdminDocHeader" runat="server" Text="Add Admin User Account"></asp:Label></h2>                                                                                
                                               <uc1:addAdminUser runat="server" id="addAdminUser" />    
    
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