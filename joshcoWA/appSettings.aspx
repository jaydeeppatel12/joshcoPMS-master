<%@ Page Title="" Language="C#" MasterPageFile="user/Admin.Master" AutoEventWireup="true" CodeBehind="appSettings.aspx.cs" Inherits="joshcoWA.appSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>  
     <section class="site-section"  >
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px;height:1200px"  >

    <h2 class="mb-5">Applications Settings</h2>

  
    <div class="accordion block-8" id="accordion">
  
<div class="accordion-item">
<h3 class="mb-0 heading">
<a class="btn-block" data-toggle="collapse" href="#collapseTwo" role="button" aria-expanded="false" aria-controls="collapseTwo">Set up documents required when submitting an application. <span class="icon"></span>  
</a></h3> 

<div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
<div class="body-text" style="height:350px; padding-bottom:15px;">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width:75%">
                                <tr>
                                    <td> Category</td><td><input runat="server" type="text" class="form-control py-2" placeholder="Category name" id="txtCategory" /> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategory" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" ValidationGroup="AddP"></asp:RequiredFieldValidator></td> 
                                   
                                    <td>
                                        <asp:HiddenField ID="hfDocumentCategoryID" runat="server" />
                                    </td> 
                                   
                                    <td>  <asp:Button ID="btnSave" CssClass="btn btn-primary px-5 py-2" runat="server" Text="Submit" OnClick="btnSave_Click" ValidationGroup="AddP" /></td> 
                                   
                                </tr>
 
                                </table>
    <asp:SqlDataSource ID="sdsRequiredDocuments" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectDocumentCategory" SelectCommandType="StoredProcedure" InsertCommand="InsertDocumentCategory" InsertCommandType="StoredProcedure">
                                      <InsertParameters>
                                          <asp:Parameter Name="DocumentCategory" Type="String" />
                                          <asp:Parameter Name="DocumentEntityTypeID" Type="Int32" />
                                          <asp:Parameter Name="DocumentCategoryID" Type="Int32" />
                                      </InsertParameters>
                                      <SelectParameters>
                                          <asp:Parameter DefaultValue="1" Name="DocumentEntityTypeID" Type="Int32" />
                                          <asp:Parameter DefaultValue="0" Name="DocumentCategoryID" Type="Int32" />
                                           
                                      </SelectParameters>
                                      </asp:SqlDataSource>
     
     <asp:GridView ID="gvRequiredDocument" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvRequiredDocument_RowCommand"  DataSourceID="sdsRequiredDocuments">
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                 <asp:BoundField DataField="DocumentCategory" HeaderText="Document Category" />
 
                                <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:LinkButton ID="LinkButtson2"  runat="server" CausesValidation="false"  CommandName="editRecord" CommandArgument='<%# Eval("DocumentCategoryID") %>' ToolTip="edit details" ForeColor="#75C5CA">edit</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#66C0C2" ForeColor="White" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
  
</div>
</div>
</div> 

<div class="accordion-item">
<h3 class="mb-0 heading">
<a class="btn-block" data-toggle="collapse" href="#collapseThree" role="button" aria-expanded="false" aria-controls="collapseThree">Set up which users receive application notifications <span class="icon"></span></a>
 
</h3>
<div id="collapseThree" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
<div class="body-text" style="padding-bottom:15px;">
  Coming soon...
</div>
</div>
</div> 

<div class="accordion-item">
<h3 class="mb-0 heading">
<a class="btn-block" data-toggle="collapse" href="#collapseFour" role="button" aria-expanded="false" aria-controls="collapseFour">Set up which users should update application status<span class="icon"></span></a>
 

</h3>
<div id="collapseFour" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
<div class="body-text" style="padding-bottom:15px;">
 Coming soon...
</div>
</div>
</div> 
</div>


                           



        <br />
    <br />
   
     </div>
     </div>
     </div>
     </div>
             </section>
</asp:Content>
