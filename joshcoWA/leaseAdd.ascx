<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="leaseAdd.ascx.cs" Inherits="joshcoWA.leaseAdd" %>
<%@ Register namespace="Telerik.Web.UI" tagprefix="UI" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
 
<style type="text/css">

    .auto-style1 {
        width: 100%;
    }
    .auto-style3 {
        width: 210px;
    }
</style>
<script type="text/javascript" >
    function txtStartDateToday() {
        var datepicker = $find("<%=txtStartDate.ClientID%>");
         var dt = new Date();
         datepicker.set_selectedDate(dt);
     }
    function txtEndDateToday() {
        var datepicker = $find("<%=txtEndDate.ClientID%>");
        var dt = new Date();
        datepicker.set_selectedDate(dt);
    }
</script>

<table style="Width: 100%">
                             <tr>
                                 <td>

                                 </td>
                             </tr>
                                  <tr>
                                 <td> 
 

                                     <asp:Panel ID="pnlLease" runat="server" >
                                         <table class="auto-style1">
                                             
                                             <tr>
                                                 <td class="auto-style3">
                                                     Property<asp:HiddenField ID="hfPropertyID" runat="server" />
                                                     <asp:HiddenField ID="hfApplicationID" runat="server" /></td>
                                                 <td>
                                                     <asp:DropDownList ID="ddlProperty" runat="server" AppendDataBoundItems="True" CssClass="btn-outline-warning btn-fw" AutoPostBack="True" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID" OnSelectedIndexChanged="ddlProperty_SelectedIndexChanged" Visible="False">
                                                         <asp:ListItem Value="0">-- </asp:ListItem>
                                                     </asp:DropDownList>
                                                     <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [Property] 
 
ORDER BY [PropertyName]"></asp:SqlDataSource>
                                                     <asp:Label ID="lblPropertyName" runat="server" Font-Bold="True"></asp:Label>
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">Property Unit</td>
                                                 <td>
                                                     <asp:DropDownList ID="ddlPropertyUnit" runat="server" DataSourceID="sdsPropertyUnit" CssClass="btn-outline-warning btn-fw" DataTextField="PropertyUnit" DataValueField="PropertyUnitID">
                                                     </asp:DropDownList>
                                                     <asp:SqlDataSource ID="sdsPropertyUnit" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [PropertyUnit] WHERE ([PropertyID] = @PropertyID) ORDER BY [PropertyUnit]">
                                                         <SelectParameters>
                                                             <asp:ControlParameter ControlID="hfPropertyID" Name="PropertyID" PropertyName="Value" Type="Int32" />
                                                         </SelectParameters>
                                                     </asp:SqlDataSource>
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">Rate Per Sqm</td>
                                                 <td>
                                                     <asp:TextBox ID="txtRatePerSqm" runat="server" ValidationGroup="App" CssClass="form-control py-2" Width="100px"></asp:TextBox>
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">
                                                     Initial Value</td>
                                                 <td>
                                                     <asp:TextBox ID="txtInitialValue" runat="server" ValidationGroup="App" CssClass="form-control py-2" Width="100px"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtInitialValue" Display="Dynamic" ErrorMessage="**" ForeColor="Red" ValidationGroup="App"></asp:RequiredFieldValidator>
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">
                                                     Escalation %</td>
                                                 <td>
                                                     <asp:TextBox ID="txtEscalation" runat="server" ValidationGroup="App" CssClass="form-control py-2" Width="100px"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtEscalation" Display="Dynamic" ErrorMessage="**" ForeColor="Red" ValidationGroup="App"></asp:RequiredFieldValidator>
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">Interest %</td>
                                                 <td>
                                                     <asp:TextBox ID="txtInterest" runat="server" ValidationGroup="App" CssClass="form-control py-2" Width="100px"></asp:TextBox>
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">Frequency</td>
                                                 <td>
                                                     <asp:DropDownList ID="ddlFrequency" CssClass="btn-outline-warning btn-fw" runat="server">
                                                         <asp:ListItem>Monthly</asp:ListItem>
                                                         <asp:ListItem>Yearly</asp:ListItem>
                                                     </asp:DropDownList>
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">&nbsp;</td>
                                                 <td>&nbsp;</td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">
                                                     Commencement</td>
                                                 <td>
                                                     <telerik:RadDatePicker ID="txtStartDate" CssClass="form-control py-2" Runat="server" ZIndex="140000">
                                                          <calendar runat="server"> 
            <FooterTemplate> 
                <div style="width: 100%; text-align: center; background-color: Gray;"> 
                    <input id="Basduttons1" onclick="txtStartDateToday()" type="button" value="Today" /> 
                </div> 
            </FooterTemplate> 
        </calendar> 
                                                    </telerik:RadDatePicker>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtStartDate" Display="Dynamic" ErrorMessage="**" ForeColor="Red" ValidationGroup="App"></asp:RequiredFieldValidator>
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">Termination</td>
                                                 <td>
                                                       <telerik:RadDatePicker ID="txtEndDate" CssClass="form-control py-2" Runat="server" ZIndex="140000">
                                                          <calendar runat="server"> 
            <FooterTemplate> 
                <div style="width: 100%; text-align: center; background-color: Gray;"> 
                    <input id="Basduttons1" onclick="txtEndDateToday()" type="button" value="Today" /> 
                </div> 
            </FooterTemplate> 
        </calendar> 
                                                    </telerik:RadDatePicker>
                                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEndDate" Display="Dynamic" ErrorMessage="**" ForeColor="Red" ValidationGroup="App"></asp:RequiredFieldValidator>
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">
                                                     Comment</td>
                                                 <td>
                                                     <asp:TextBox ID="txtComment" runat="server" CssClass="form-control py-2" ValidationGroup="App" Width="250px" BorderColor="#F0F0F0" Height="65px" TextMode="MultiLine"></asp:TextBox>
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style2" colspan="2" style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #C0C0C0">&nbsp;</td>
                                                 <td>
                                                     &nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">&nbsp;</td>
                                                 <td>   <asp:SqlDataSource ID="sdsApplication" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" InsertCommand="InsertApplicationLease" InsertCommandType="StoredProcedure" SelectCommand="Select ''" UpdateCommand="UpdateApplication" UpdateCommandType="StoredProcedure" OnInserted="sdsApplication_Inserted">
                                                         <InsertParameters>
 
                                                             <asp:Parameter Name="ApplicationID" Type="Int32" />
                                                             <asp:Parameter Name="LeaseID" Type="Int32" Direction="InputOutput" />
                                                             <asp:Parameter Name="Frequency" Type="String" />
                                                             <asp:Parameter Name="PropertyUnitID" Type="Int32" />
                                                             <asp:Parameter Name="InitialValue" Type="Decimal" />
                                                             <asp:Parameter Name="Vatable" Type="String" />
                                                             <asp:Parameter Name="Escalation" Type="Decimal" />
                                                             <asp:Parameter DbType="Date" Name="Commencement" />
                                                             <asp:Parameter DbType="Date" Name="Termination" />
                                                             <asp:Parameter Name="Interest" Type="String" />
                                                             <asp:Parameter Name="InterestPercentage" Type="Decimal" />
                                                             <asp:Parameter Name="TypeOfLease" Type="Int32" />
                                                             <asp:Parameter Name="Comment" Type="String" />
                                                             <asp:Parameter Name="RatePerSQM" Type="Decimal" />
                                                         </InsertParameters>
                                                         <UpdateParameters>
                                                             <asp:Parameter Name="CompanyID" Type="Int32" />
                                                             <asp:Parameter Name="PersonOrCompany" Type="String" />
                                                             <asp:Parameter Name="CompanyName" Type="String" />
                                                             <asp:Parameter Name="Title" Type="String" />
                                                             <asp:Parameter Name="Name" Type="String" />
                                                             <asp:Parameter Name="Surname" Type="String" />
                                                             <asp:Parameter Name="Designation" Type="String" />
                                                             <asp:Parameter Name="IDNumber" Type="String" />
                                                             <asp:Parameter Name="MaritalStatus" Type="String" />
                                                             <asp:Parameter Name="Gender" Type="String" />
                                                             <asp:Parameter Name="Nationality" Type="String" />
                                                             <asp:Parameter Name="Telephone" Type="String" />
                                                             <asp:Parameter Name="Mobile" Type="String" />
                                                             <asp:Parameter Name="Fax" Type="String" />
                                                             <asp:Parameter Name="EmailAddress" Type="String" />
                                                             <asp:Parameter Name="Address" Type="String" />
                                                             <asp:Parameter Name="AddressCode" Type="Int32" />
                                                             <asp:Parameter Name="PhysicalAddress" Type="String" />
                                                             <asp:Parameter Name="PhysicalAddressCode" Type="Int32" />
                                                             <asp:Parameter Name="CompanyRegNumber" Type="String" />
                                                             <asp:Parameter Name="PropertyID" Type="Int32" />
                                                             <asp:Parameter Name="SMSNotification" Type="String" />
                                                             <asp:Parameter Name="EmailNotification" Type="String" />
                                                             <asp:Parameter Name="ApplicationID" Type="Int32" />
                                                         </UpdateParameters>
                                                     </asp:SqlDataSource>
                                                     <asp:SqlDataSource ID="sdsLeaseProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
                                           
                                      </SelectParameters>
                                      </asp:SqlDataSource>
                                                     <asp:Button ID="btnSubmit0" runat="server"  OnClick="btnSubmit_Click" Text="Submit" CssClass="btn btn-primary px-5 py-2" ValidationGroup="App" Width="250px" />
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style3">&nbsp;</td>
                                                 <td>
                                                     <asp:HiddenField ID="hfEmail" runat="server" />
                                                     <asp:HiddenField ID="hfName" runat="server" />
                                                     <asp:HiddenField ID="hfIDNumber" runat="server" />
                                                 </td>
                                                 <td>&nbsp;</td>
                                             </tr>
                                         </table>
                                     </asp:Panel>
                             

                                   </td>
                             </tr>
                                  <tr>
                                 <td>
                                   
                                 

    
                                   
                                  

                                 </td>
                             </tr>
                                  <tr>
                                 <td></td>
                             </tr>
                         </table>
