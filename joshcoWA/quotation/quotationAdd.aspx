﻿<%@ Page Title="" Language="C#" MasterPageFile="quotation.Master" AutoEventWireup="true" CodeBehind="quotationAdd.aspx.cs" Inherits="joshcoWA.quotation.quotationAdd" %>

<%@ Register Src="addQuotation.ascx" TagPrefix="uc1" TagName="addQuotation" %>

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

    <h2 class="mb-5"> <asp:Label ID="lblLeaseDocHeader" runat="server" Text="Invitation To Quote Details"></asp:Label></h2>
     <uc1:addQuotation runat="server" id="addQuotation" />
          
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