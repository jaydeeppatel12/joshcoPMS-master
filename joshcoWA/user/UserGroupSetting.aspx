<%@ Page Title="" Language="C#" MasterPageFile="~/user/admin.Master" AutoEventWireup="true" CodeBehind="UserGroupSetting.aspx.cs" Inherits="joshcoWA.user.UserGroupSetting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>  
     <section class="site-section"  >
<div class="container"  >
<div class="row justify-content-left" >
<div class="col-md-7" >
<div class="form-wrap"  style="width:1100px;height:1200px; "  >

    <h2 class="mb-5">User Group Settings</h2>
    
  
    <div class="accordion block-8" id="accordion">
  
<div class="accordion-item">
<h3 class="mb-0 heading">
<a class="btn-block" data-toggle="collapse" href="#collapseTwo" role="button" aria-expanded="false" aria-controls="collapseTwo">Set up system user groups. <span class="icon"></span>  
</a></h3> 

<div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
<div class="body-text" style="height:350px; padding-bottom:15px;">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width:75%">
                                <tr>
                                    <td style="width:25%"> User Group<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserGroup" Display="Dynamic" ErrorMessage="*Required" Font-Size="7pt" ForeColor="Red" BorderColor="#FFFFFF" ValidationGroup="AddP"></asp:RequiredFieldValidator></td><td><input runat="server" type="text" class="form-control py-2" placeholder="User group name" id="txtUserGroup" /> </td> 
                                   
                                    <td>
                                        <asp:HiddenField ID="hfUserGroupID" runat="server" />
                                    </td> 
                                   
                                    <td>  <asp:Button ID="btnSave" CssClass="btn btn-primary px-5 py-2" runat="server"  Text="Submit" OnClick="btnSave_Click" ValidationGroup="AddP" /></td> 
                                   
                                </tr>
 
                                </table><br />
    <asp:SqlDataSource ID="sdsUserGroup" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectUserGroup" SelectCommandType="StoredProcedure" InsertCommand="InsertUserGroup" InsertCommandType="StoredProcedure">
                                      <InsertParameters>
                                          <asp:Parameter Name="UserGroup" Type="String" />
                                          <asp:Parameter Name="UserGroupID" Type="Int32" />
                                     
                                      </InsertParameters>
                                      <SelectParameters>
                         
                                          <asp:Parameter DefaultValue="0" Name="UserGroupID" Type="Int32" />
                                           
                                      </SelectParameters>
                                      </asp:SqlDataSource>
     
     <asp:GridView ID="gvUserGroup" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt" CellPadding="2" CellSpacing="3" GridLines="None" Width="100%" HorizontalAlign="Left" OnRowCommand="gvUserGroup_RowCommand" DataSourceID="sdsUserGroup">
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                 <asp:BoundField DataField="UserGroup" HeaderText="User Group" />
 
                                <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:LinkButton ID="lnkEdit"  runat="server" CausesValidation="false"  CommandName="editRecord" CommandArgument='<%# Eval("UserGroupID") %>' ToolTip="edit details" ForeColor="#75C5CA">edit</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
  
</div>
</div>
</div> 

<div class="accordion-item">
<h3 class="mb-0 heading">
<a class="btn-block" data-toggle="collapse" href="#collapseThree" role="button" aria-expanded="false" aria-controls="collapseThree">Set up system user group module access/restrictions <span class="icon"></span></a>
 
</h3>
<div id="collapseThree" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
<div class="body-text" style="padding-bottom:15px;">
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table style="width:75%">
                                <tr>
                                    <td style="width:25%"> Select User Group</td><td>        
                                         <asp:DropDownList ID="ddlUserGroup"  runat="server" AppendDataBoundItems="True" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlUserGroup_SelectedIndexChanged" DataSourceID="sdsUserGroup" DataTextField="UserGroup" DataValueField="UserGroupID">
                                        <asp:ListItem Value="" Text="-- Select --"></asp:ListItem>
                                    </asp:DropDownList>  </td> 
                                   
                                    <td>
                                        
                                    </td> 
                                   
                                    <td>  </td> 
                                   
                                </tr>
 
                                </table><br />
    
     <asp:SqlDataSource ID="sdsSystemModule" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectUserGroupSystemModule" SelectCommandType="StoredProcedure" InsertCommand="InsertUserGroupAccess" InsertCommandType="StoredProcedure" >
                                      
                                      <InsertParameters>
                                          <asp:Parameter Name="UserGroupID" Type="Int32" />
                                          <asp:Parameter Name="SystemModuleID" Type="Int32" />
                                          <asp:Parameter Name="Read" Type="Boolean" />
                                          <asp:Parameter Name="Write" Type="Boolean" />
                                          <asp:Parameter Name="Edit" Type="Boolean" />
                                          <asp:Parameter Name="Delete" Type="Boolean" />
                                      </InsertParameters>
                                      
                                      <SelectParameters>
                         <asp:ControlParameter ControlID="ddlUserGroup" Name="UserGroupID" Type="Int32" />
                                          
                                           
                                      </SelectParameters>
                                      </asp:SqlDataSource>
     <asp:GridView ID="gvSystemModule" runat="server" AutoGenerateColumns="False" Font-Size="10.2pt" CellPadding="2" CellSpacing="3" OnRowCommand="gvSystemModule_RowCommand" GridLines="None" Width="100%" HorizontalAlign="Left" DataSourceID="sdsSystemModule">
                            <AlternatingRowStyle BackColor="#EFEFEF" />
                            <Columns>
                                 <asp:BoundField DataField="SystemModule" HeaderText="System Module" />
  <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkRead" Checked='<%# Convert.ToBoolean(Eval("Read")) %>' Text="read" runat="server" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:CheckBox ID="chkWrite" Checked='<%# Convert.ToBoolean(Eval("Write")) %>' Text="write" runat="server" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:CheckBox ID="chkEdit" Checked='<%# Convert.ToBoolean(Eval("Edit")) %>' Text="edit" runat="server" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField>
                                    <ItemTemplate>
                                    <asp:CheckBox ID="chkDelete" Checked='<%# Convert.ToBoolean(Eval("Delete")) %>' Text="delete" runat="server" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:LinkButton ID="lnkUpdate"  runat="server" CausesValidation="false"  CommandName="updateRecord" CommandArgument='<%# Eval("SystemModuleID") %>' ToolTip="update details" ForeColor="#75C5CA">update</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                         <HeaderStyle CssClass="gvHeader"  ForeColor="#005d63" />
                         
                            <RowStyle HorizontalAlign="Left" BackColor="White" />
                         
                            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
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
