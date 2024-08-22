<%@ Page Title="" Language="C#" MasterPageFile="ServiceProvider.Master" AutoEventWireup="true" CodeBehind="serviceProviderQuotation.aspx.cs" Inherits="joshcoWA.serviceProviderQuotation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

    <h2 class="mb-5">Quotation List</h2>
     
     <asp:GridView ID="gvQuotation" runat="server" AutoGenerateColumns="False" CellPadding="2" Font-Size="10.2pt" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvQuotation_RowCommand" RowDataBound="gvQuotation_RowDataBound" >
                            <AlternatingRowStyle BackColor="#f0f0f0" />
                            <Columns>
                               <asp:BoundField DataField="ReferenceNumber" HeaderText="Reference No." />
                                 <asp:BoundField DataField="PropertyName" HeaderText="Property" />
                                <asp:BoundField DataField="QuoteTitle" HeaderText="Title" />
                                
                                <asp:BoundField DataField="DueDate" HeaderText="DueDate" />
                                <asp:BoundField DataField="ContactPerson"  HeaderText="Contact Person" />
                                <asp:BoundField DataField="ContactEmail" HeaderText="Contact Email" />
      
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="ViewQuotation" CommandArgument='<%# Eval("InvitationToQuoteID") %>' ToolTip="View Quotation details" ForeColor="#75C5CA">view</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />                        
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                            </asp:GridView>
                  
     <asp:SqlDataSource ID="sdsQuotation" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectServiceProviderInvitationToQuote" SelectCommandType="StoredProcedure" InsertCommand="InsertInvitationToQuote" InsertCommandType="StoredProcedure" OnInserted="sdsQuotation_Inserted">
                                <InsertParameters>
                                    <asp:Parameter Name="QuoteTitle" Type="String" />
                                    <asp:Parameter Name="WorkDescription" Type="String" />
                                      <asp:Parameter Name="PropertyID" Type="Int32" />
                                    <asp:Parameter Name="DueDate" Type="DateTime" />
                                    <asp:Parameter Name="MeetingRequired" Type="Boolean" />
                                    <asp:Parameter Name="MeetingDate" Type="DateTime" />
                                    <asp:Parameter Name="MeetingVenue" Type="String" />
                                    <asp:Parameter Name="ContactPerson" Type="String" />
                                    <asp:Parameter Name="ContactEmail" Type="String" />
                                    <asp:Parameter Name="InvitationToQuoteID" Type="Int32" Direction="InputOutput" />
                                    <asp:Parameter Name="ReferenceNumber" Type="String" />
                                    <asp:Parameter Name="ContactTelephone" Type="String" />
                                    <asp:Parameter Name="QueryID" Type="Int32" />
                                </InsertParameters>
                                
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="ServiceProviderID" SessionField="ServiceProviderID" Type="Int32" />
                                </SelectParameters>
                                
                         </asp:SqlDataSource>
             
 
    
    
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
