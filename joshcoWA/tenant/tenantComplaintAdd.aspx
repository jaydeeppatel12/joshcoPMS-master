<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="tenantComplaintAdd.aspx.cs" Inherits="joshcoWA.tenant.tenantComplaintAdd" %>

<%@ Register Src="addTenantComplaint.ascx" TagPrefix="uc1" TagName="addTenantComplaint" %>

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

    <h2 class="mb-5"> <asp:Label ID="lblComplaintDocHeader" runat="server" Text="Complaint Details"></asp:Label></h2>
     <div id="divErrorMessage" runat="server" class="alert alert-danger" visible="false"> 
          <asp:Label ID="lblErrorMessage" runat="server" visible="false"></asp:Label>
      </div>
<uc1:addTenantComplaint runat="server" id="addTenantComplaint" />
                                             
                <asp:HiddenField ID="hfPropertyID" runat="server" />
                <asp:HiddenField ID="hfPropertyUnitID" runat="server" />
                <asp:HiddenField ID="hfTenantName" runat="server" />
    
    <asp:SqlDataSource ID="sdsLeaseProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseList" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="LeaseID" SessionField="AppLeaseID" Type="Int32" />
                                          <asp:Parameter Name="Filter" Type="String" DefaultValue=" " />
                                          <asp:Parameter Name="Search" Type="String" DefaultValue=" "  />
                                      </SelectParameters>
                                      </asp:SqlDataSource>                   
 
    
    
   
                           

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