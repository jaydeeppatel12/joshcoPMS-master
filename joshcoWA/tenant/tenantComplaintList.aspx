<%@ Page Title="" Language="C#" MasterPageFile="tenant.Master" AutoEventWireup="true" CodeBehind="tenantComplaintList.aspx.cs" Inherits="joshcoWA.tenant.tenantComplaintList" %>

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

    <h2 class="mb-5">Complaint List<asp:Button ID="btnAddComplaint" runat="server" style=" vertical-align:bottom; float:right;" Text="+ New complaint" CssClass="btn btn-warning" PostBackUrl="tenantComplaintAdd.aspx" /></h2>
           
     <asp:GridView ID="gvQuery" runat="server" AutoGenerateColumns="False" datakeynames="ComplaintID" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                    <Columns>                              
                    <asp:BoundField DataField="DateAdded"
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
                        SortExpression="StatusDate" HeaderText="Status Date"  ItemStyle-BackColor="AntiqueWhite"/>
                    <asp:TemplateField ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>      
                            <asp:HyperLink ID="hlEdit" runat="server" NavigateUrl='<%# Eval("ComplaintID","complaintView.aspx?ID={0}") %>'>
                               View
                            </asp:HyperLink>         
                        </ItemTemplate> 
                    </asp:TemplateField> 
                </Columns>
                <EmptyDataTemplate>
                    <div align="center">No records found.</div>
                </EmptyDataTemplate>
                <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />                         
                <RowStyle HorizontalAlign="Left" BackColor="White" />                         
       </asp:GridView>  
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