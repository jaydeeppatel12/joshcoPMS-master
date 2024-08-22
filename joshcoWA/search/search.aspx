<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="joshcoWA.search.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
            
            div.scroll {
                margin:5px;
                /*padding:5px;*/
                /*background-color: green;*/
                width: 500px;
                height: 110px;
                overflow: auto;
                text-align:justify;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
 
    <h2 class="mb-5">Search</h2>
                        <asp:Label ID="lblTotalProperties" runat="server" Text=""></asp:Label>
    <div style="float:right; width:250px">
                            <table><tr><td>
                            <input id="txtSearch" runat="server" type="text" class="form-control py-2" /></td><td><asp:Button ID="btnSearch" runat="server" style=" vertical-align:bottom; float:right;  " OnClick="SearchProperty" Text="Search" ToolTip="Search"  CssClass="btn btn-warning" /></td></tr></table> </div> 

<br />
   <asp:Panel ID="pnlApplication" Visible="false"  runat="server" Width="100%">
       <h4>
           <asp:HyperLink ID="hlnkApplications" runat="server">Applications</asp:HyperLink></h4>
        
          <div id="Applications" runat="server" class="alert alert-success mt-4 d-flex align-items-center " role="alert" style="width:100%; overflow: auto;">
      <div style="width:100%;">
            <asp:GridView ID="gvApplication" runat="server" AutoGenerateColumns="False" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvApplication_RowCommand" OnRowDataBound="gvApplication_RowDataBound">
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                            <Columns>
                                <asp:BoundField DataField="ApplicationDate" DataFormatString="{0:ddd, dd MMM yy}" HeaderText="Date Received" />
                                  <asp:BoundField DataField="FullName"   HeaderText="Applicant" />
                                 
                                <asp:BoundField DataField="PropertyName"   HeaderText="Property Name " />
                                <%--<asp:BoundField DataField="ApplicationStatusDate" ItemStyle-BackColor="#ccffff" HeaderText="Status Date" />--%>
                                <asp:BoundField DataField="ApplicationStatus"  ItemStyle-BackColor="#def0ed" HeaderText="Application Status" />
                                
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                     
                                    <asp:HiddenField ID="hfPendingReview" runat="server" Value='<%# Eval("PendingReview") %>' />

                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewApplication" CommandArgument='<%# Eval("ApplicationID") %>' ToolTip="View Application details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                              <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsApplication" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationList" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="ApplicationID" Type="Int32" />
                                    <asp:Parameter DefaultValue="All" Name="Filter" Type="String" />
                                  
                                </SelectParameters>
                         </asp:SqlDataSource>
           </div>  </div>
       </asp:Panel>  
  
                                                                                    
   <asp:Panel ID="pnlLease"  Visible="false" runat="server" Width="100%">
       <h4><asp:HyperLink ID="hlnkLeases" runat="server">Leases</asp:HyperLink></h4>
      <div id="Leases" runat="server" class="alert alert-success mt-4 d-flex align-items-center" role="alert" style="width:100%; overflow: auto;">
      <div style="width:100%">
               <asp:GridView ID="gvLease" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvLease_RowCommand" OnRowDataBound="gvLease_RowDataBound">
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                 <asp:BoundField DataField="LesseeName" HeaderText="Lessee Name" />

                                        <asp:BoundField DataField="PropertyName" HeaderText="Property Name" />
                                 <asp:BoundField DataField="PropertyUnit" HeaderText="Unit" />
                                <asp:BoundField DataField="UnitArea"  DataFormatString="{0: 0sqm}" HeaderText="Area" />
                               
                         
                                <asp:BoundField DataField="Frequency" HeaderText="Lease Frequency" />
                              <%--  <asp:BoundField DataField="AmountDueThisMonth" DataFormatString="{0:c}" HeaderText="Amount Due This Month" />--%>
                             <%--   <asp:BoundField DataField="LeaseStartDate" DataFormatString="{0:d}" HeaderText="Commencement Date" />--%>
                                <asp:BoundField DataField="LeaseEndDate" DataFormatString="{0:ddd, dd MMM yy}" HeaderText="Terminantion Date" />
                                <asp:BoundField DataField="LeaseStatus" HeaderText="Lease Status" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                               <asp:HiddenField ID="hfActive" runat="server" Value='<%# Eval("LeaseStatus") %>' />
                                    <asp:HiddenField ID="hfExpiring" runat="server" Value='<%# Eval("Expiring") %>' />


                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewLease" CommandArgument='<%# Eval("LeaseID") %>' ToolTip="View lease details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                             <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsLease" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectLeaseList" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="0" Name="LeaseID" Type="Int32" />
                                    <asp:Parameter DefaultValue=" " Name="Filter" Type="String" />
                                    <asp:Parameter DefaultValue=" " Name="Search" Type="String" />
                                </SelectParameters>
                         </asp:SqlDataSource>
          </div>
          </div>
       </asp:Panel>

  <asp:Panel ID="pnlTenant"  Visible="false" runat="server" Width="100%">
       <h4><asp:HyperLink ID="hlnkTenants" runat="server">Tenants</asp:HyperLink></h4>
      <div id="Tenants" runat="server" class="alert alert-success mt-4 d-flex align-items-center" role="alert" style="width:100%; overflow: auto;">
      <div style="width:100%">
                                                    <asp:SqlDataSource ID="sdsTenant" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectTenantList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  
 <asp:GridView ID="gvTenant" runat="server" AutoGenerateColumns="False"  Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvTenant_RowCommand" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                               <asp:BoundField DataField="FullName" HeaderText="Name" />
                              
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile No." />
                             <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" />
                         
                
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                              

                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewTenant" CommandArgument='<%# Eval("TenantID") %>' ToolTip="View tenant details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
          </div>
          </div>
                                                   </asp:Panel>

   <asp:Panel ID="pnlProperties" Visible="false"  runat="server" Width="100%">
       <h4><asp:HyperLink ID="hlnkProperties" runat="server">Tenants</asp:HyperLink></h4>
     <div id="Properties" runat="server" class="alert alert-success mt-4 d-flex align-items-center" role="alert" style="width:100%; overflow: auto;">
      <div style="width:100%">
                                                  <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyList" SelectCommandType="StoredProcedure"   >
                                
                        </asp:SqlDataSource>
                    
 <asp:GridView ID="gvProperties" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvProperties_RowCommand" >
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                               <asp:BoundField DataField="PropertyName" HeaderText="Property Name" />
                              
                                <asp:BoundField DataField="UnitOccupied" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Units Occupied" />
                                <asp:BoundField DataField="UnitVacant" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Units Vacant" />
                         
                
                                <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                              

                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewProperty" CommandArgument='<%# Eval("PropertyID") %>' ToolTip="View property details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
          </div>
         </div>
                                                  </asp:Panel>

  <asp:Panel ID="pnlComplaint" Visible="false"  runat="server" Width="100%">
       <h4><asp:HyperLink ID="hlnkComplaints" runat="server">Complaints</asp:HyperLink></h4>
     <div id="Complaints" runat="server" class="alert alert-success mt-4 d-flex align-items-center" role="alert" style="width:100%; overflow: auto;">
      <div style="width:100%">
                                                  <asp:GridView ID="gvComplaint" runat="server" AutoGenerateColumns="False" datakeynames="ComplaintID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                       <Columns>
                              
                    <asp:BoundField DataField="DateAdded" DataFormatString="{0:ddd, dd MMM yy}"
                        SortExpression="DateAdded" HeaderText="Date logged" />
                                <asp:BoundField DataField="Tenant"
                        SortExpression="Tenant" HeaderText="Tenant" />

                             <asp:BoundField DataField="PropertyName"
                        SortExpression="PropertyName" HeaderText="Project" />
                        

                     <asp:BoundField DataField="ComplaintCategory"
                        SortExpression="ComplaintCategory" HeaderText="Category" />
                        <asp:BoundField DataField="ComplaintSubCategory"
                        SortExpression="ComplaintSubCategory" HeaderText="Sub Category" />
                    <asp:BoundField DataField="Severity"
                        SortExpression="Severity" HeaderText="Severity" ItemStyle-BackColor="AntiqueWhite" />
                              <asp:BoundField DataField="Status"
                        SortExpression="Status" HeaderText="Status" ItemStyle-BackColor="AntiqueWhite" />
                    <asp:BoundField DataField="StatusDate"
                        SortExpression="StatusDate" HeaderText="Status Date" DataFormatString="{0:ddd, dd MMM yy}" ItemStyle-BackColor="AntiqueWhite"/>
                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>      
                            <asp:HyperLink ID="hlEdit" runat="server" NavigateUrl='<%# Eval("ComplaintID","../CRM/complaintView.aspx?ID={0}") %>'>
                               View
                            </asp:HyperLink>         
                        </ItemTemplate>

 
                    </asp:TemplateField>
 
                </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
          </div>
         </div>
   </asp:Panel>

  <asp:Panel ID="pnlQuery" Visible="false"  runat="server" Width="100%">
       <h4><asp:HyperLink ID="hlnkQueries" runat="server">Queries</asp:HyperLink></h4>
      <div id="Queries" runat="server" class="alert alert-success mt-4 d-flex align-items-center" role="alert" style="width:100%; overflow: auto;">
      <div style="width:100%">
   <asp:GridView ID="gvQuery" runat="server" AutoGenerateColumns="False" datakeynames="QueryID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                       <Columns>
                            <asp:BoundField DataField="ReferenceNo"
                        SortExpression="ReferenceNo" HeaderText="#Ref No." />  
                    <asp:BoundField DataField="DateAdded" DataFormatString="{0:ddd, dd MMM yy}"
                        SortExpression="DateAdded" HeaderText="Date logged" />
                     <asp:BoundField DataField="QueryCategory"
                        SortExpression="QueryCategory" HeaderText="Category (Maintenance or General)" />
                        <asp:BoundField DataField="QueryDescription"
                        SortExpression="QueryDescription" HeaderText="Query Item" />
                    <asp:BoundField DataField="Status"
                        SortExpression="Status" HeaderText="Status" ItemStyle-BackColor="AntiqueWhite" />
                    <asp:BoundField DataField="StatusDate"
                        SortExpression="StatusDate" HeaderText="Status Date" DataFormatString="{0:ddd, dd MMM yy}" ItemStyle-BackColor="AntiqueWhite"/>
                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>      
                            <asp:HyperLink ID="hlEdit" runat="server" NavigateUrl='<%# Eval("QueryID","../query/QueryView.aspx?ID={0}") %>'>
                               View
                            </asp:HyperLink>         
                        </ItemTemplate>

 
                    </asp:TemplateField>
 
                </Columns>
                           <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
          </div>
          </div>
 </asp:Panel>


                                              <br />
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

    </section>
</asp:Content>
