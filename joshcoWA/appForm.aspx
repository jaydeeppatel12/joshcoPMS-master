<%@ Page Title="" Language="C#" MasterPageFile="home.Master" AutoEventWireup="true" CodeBehind="appForm.aspx.cs" Inherits="joshcoWA.application" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="ks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section class="site-section">
<div class="container">
<div class="row justify-content-left">
<div class="col-md-7">

 
<div class="form-wrap" style="width:1100px" >
<div class="row">
<div class="col">

<div style="width:100%">
<h2 class="mb-5">Application form</h2>
    
    <div class="row">
<div class="col-md-12 form-group"><asp:HiddenField ID="hfApplicationID" runat="server" Value="0" />
 <label for="name">Property
    <asp:SqlDataSource ID="sdsApplication" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" InsertCommand="InsertApplication" InsertCommandType="StoredProcedure" OnInserted="sdsApplication_Inserted" SelectCommand="SelectApplicationList" SelectCommandType="StoredProcedure" UpdateCommand="UpdateApplication" UpdateCommandType="StoredProcedure">
        <InsertParameters>
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
            <asp:Parameter Name="PropertyID" Type="Int32" />
            <asp:Parameter Name="SMSNotification" Type="String" />
            <asp:Parameter Name="EmailNotification" Type="String" />
              <asp:Parameter Name="DoCreditCheck" Type="String" />
              <asp:Parameter Name="CreditCheckStatus" Type="String" />
            <asp:Parameter Direction="InputOutput" Name="ApplicationID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfApplicationID" Name="ApplicationID" PropertyName="Value" Type="Int32" />
            <asp:Parameter DefaultValue="All" Name="Filter" Type="String" />
        </SelectParameters>
        <UpdateParameters>
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
            <asp:Parameter Name="PropertyID" Type="Int32" />
            <asp:Parameter Name="SMSNotification" Type="String" />
            <asp:Parameter Name="EmailNotification" Type="String" />
            <asp:Parameter Name="ApplicationID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </label>
                <asp:DropDownList ID="ddlProperty" runat="server" CssClass="btn-outline-warning btn-fw" AppendDataBoundItems="True" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID" AutoPostBack="True" OnSelectedIndexChanged="ddlProperty_SelectedIndexChanged">
                <asp:ListItem Value="0">-- Select a property --</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [Property] 

ORDER BY [PropertyName]">
               
            </asp:SqlDataSource>
    <%--    <div class="row">
<div class="col-md-12 form-group">
  <asp:UpdatePanel ID="UP1" runat="server">

                                <ContentTemplate>

                                    <table>

                                        <tr>

                                            <td style="height: 50px; width: 100px;">
                                                <asp:Image ID="imgCaptcha" ImageUrl="Captcha.ashx" runat="server" />

                                            </td>

                                            <td valign="middle">

                                                <asp:ImageButton ID="btnRefresh" ImageUrl="~/images/Refresh.png" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />

                                            </td>

                                        </tr>

                                    </table>

                                </ContentTemplate>

                            </asp:UpdatePanel>
</div>
</div>--%>

</div>
</div>

<div class="row">
<div class="col-md-12 form-group">
<label for="name">Title<span style="color:red; float:right; ">*</span></label>
<input type="text" id="txtTitle" runat="server"  style="width:30%" class="form-control py-2"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="App" runat="server" ControlToValidate="txtTitle" Font-Size="8pt" ForeColor="Red" ErrorMessage="*Required"></asp:RequiredFieldValidator>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">Name<span style="color:red; float:right; ">*</span></label>
<input type="text" id="txtName" runat="server" class="form-control py-2 "/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="App" runat="server" ControlToValidate="txtName" Font-Size="8pt" ForeColor="Red" ErrorMessage="*Required"></asp:RequiredFieldValidator>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">Surname<span style="color:red; float:right; ">*</span></label>
<input type="text" id="txtSurname" runat="server" class="form-control py-2 "/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="App" runat="server" ControlToValidate="txtSurname" Font-Size="8pt" ForeColor="Red" ErrorMessage="*Required"></asp:RequiredFieldValidator>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">Gender</label><br />
     <input type="radio" id="male" runat="server" name="gender" value="male"/>
  <label for="male">male</label> 
  <input type="radio" id="female" runat="server"  name="gender" value="female" />
  <label for="female">female</label>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">ID  / Passport Number<span style="color:red; float:right; ">*</span></label>
<input type="text" id="txtIDnumber" runat="server" maxlength="13" onkeypress="return event.charCode >= 48 && event.charCode <= 57"  class="form-control py-2 "/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="App" runat="server" ControlToValidate="txtIDnumber" Font-Size="8pt" ForeColor="Red" ErrorMessage="*Required"></asp:RequiredFieldValidator>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">Nationality</label>
    <asp:DropDownList ID="ddlCountry" runat="server" class="btn-outline-warning btn-fw"></asp:DropDownList>
    <%--<div class="row">
<div class="col-md-12 form-group">
<label for="name">Captcha code</label>
<input type="text" id="txtCaptcha" runat="server" style="width:30%" class="form-control py-2 ">
</div>
</div>--%>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">Marital Status</label><br />
<asp:RadioButtonList ID="rblMaritalStatus" runat="server" CssClass="form-control py-2" Font-Bold="False">
                <asp:ListItem>Married</asp:ListItem>
                <asp:ListItem>Widowed</asp:ListItem>
                <asp:ListItem>Separated</asp:ListItem>
                <asp:ListItem>Divorced</asp:ListItem>
                <asp:ListItem Selected="True">Single</asp:ListItem>
            </asp:RadioButtonList>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">Telephone<span style="color:red; float:right; ">*</span></label>
<input type="text" id="txtTelephone" runat="server"  class="form-control py-2 "/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="App" runat="server" ControlToValidate="txtTelephone" Font-Size="8pt" ForeColor="Red" ErrorMessage="*Required"></asp:RequiredFieldValidator>
</div>
</div>
    <div class="row">
<div class="col-md-12 form-group">
<label for="name">Mobile Number</label>
<input type="text" id="txtMobileNumber" runat="server" class="form-control py-2 "/>
</div>
</div>
        <div class="row">
<div class="col-md-12 form-group">
<label for="name">Fax Number</label>
<input type="text" id="txtFaxNumber" runat="server" class="form-control py-2 "/>
</div>
</div>

<div class="row">
<div class="col-md-12 form-group">
<label for="name">Email Address<span style="color:red; float:right; ">*</span></label>
<input type="text" id="txtEmailAddress" runat="server" class="form-control py-2 "/>
    <asp:Label ID="lblAppEmailAddress" runat="server" Visible="false" Text=""></asp:Label>
    <asp:SqlDataSource ID="sdsCheckEmailAddress" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="CheckEmailExist" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:ControlParameter ControlID="txtEmailAddress" Name="Email" PropertyName="Value" Type="String" />
                                      </SelectParameters>
                                      </asp:SqlDataSource>
    
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtEmailAddress" Display="Dynamic" 
                                ErrorMessage="*Invalid email address" Font-Size="8pt" ForeColor="Red" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="App" Width="120px"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="App" runat="server" ControlToValidate="txtEmailAddress" Font-Size="8pt" ForeColor="Red" ErrorMessage="*Required"></asp:RequiredFieldValidator>
</div>
</div>

<div class="row">
<div class="col-md-12 form-group">
<label for="name">Physical Address</label>
<input type="text" id="txtPhysicalAddress" runat="server" class="form-control py-2 "/>
</div>
</div>
    <div class="row">
<div class="col-md-12 form-group">
<label for="name">Physical Address Code</label>
<input type="text" id="txtPhysicalAddressCode" runat="server" style="width:30%" class="form-control py-2 "/>
</div>
</div>
    <div class="row">
<div class="col-md-12 form-group">
<label for="name">Postal Address</label><asp:HyperLink ID="hlnkSame1" runat="server" Font-Size="8pt" style="float:right; cursor:pointer" ForeColor="#0000CC"> Postal same as physical address</asp:HyperLink>
<input type="text" id="txtPostalAddress" runat="server" class="form-control py-2 "/>
</div>
</div>
    <div class="row">
<div class="col-md-12 form-group">
<label for="name">Postal Address Code</label>
<input type="text" id="txtPostalAddressCode" runat="server" style="width:30%" class="form-control py-2 "/>
</div>
</div>
    <div class="row">
<div class="col-md-12 form-group">
<label for="name">Notifications</label><br />
<asp:CheckBox ID="chkSMS" Text="SMS" runat="server" />
    <asp:CheckBox ID="chkEmail" Text="Email" runat="server" />
</div>
</div>

            <div class="row">
<div class="col-md-12 form-group">
    <asp:CheckBox ID="chkCheck1" runat="server" Text="I / we declare that the information we have given in this application form is true and correct to the best of my / our knowledge and that I / we have not failed to provide any information which, if the Landlord had known such information, would have not allowed the application to be successful."   Font-Size="9pt" />
     
</div>
</div>

            <div class="row">
<div class="col-md-12 form-group">
    <asp:CheckBox ID="chkCheck2" runat="server" Text="I / We agree and allow the Landlord or Agent at all times to:"   Font-Size="9pt" />  
    <p style="font-size:9pt">1.	contact, request and obtain information from any credit provider (or potential credit provider) or registered credit bureau that may be necessary to assess my / our behaviour, profile, payment patterns, indebtedness, whereabouts, and creditworthiness;</p>
    <p style="font-size:9pt">2.	furnish information concerning the behaviour, profile, payment patterns, indebtedness, whereabouts, and creditworthiness of me / us to any registered credit bureau or to any credit provider (or potential credit provider) seeking a trade reference regarding my / our dealings with the Landlord.</p>
</div>
</div>

        <div class="row">
<div class="col-md-12 form-group">
    <%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="ks" %>  
    <ks:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
            CaptchaHeight="60" CaptchaWidth="200" CaptchaMinTimeout="5" CaptchaMaxTimeout="240"
            FontColor="#0066FF" NoiseColor="#B1B1B1" CaptchaChars="ABCDEFGHJKLMNPQRSTUVWXYZ23456789" />
            <%--<asp:Button ID="Refresh" runat="server" Text="Refresh" OnClick="RefreshImage" />--%>
    <asp:ImageButton ID="Refresh" runat="server" OnClick="RefreshImage" ImageUrl="~/images/Refresh.png" ToolTip="Refresh"  />
</div>
</div>
            <div class="row">
<div class="col-md-12 form-group">
          <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
</div>
    <%--<input type="submit" value="Register" class="btn btn-primary px-5 py-2">--%>

<%--<div class="row">
<div class="col-md-12 form-group">
<label for="name">Captcha code</label>
<input type="text" id="txtCaptcha" runat="server" style="width:30%" class="form-control py-2 ">
</div>
</div>--%>

 
<div class="row">
<div class="col-md-6 form-group">
<%--<input type="submit" value="Register" class="btn btn-primary px-5 py-2">--%>
     <asp:Button ID="Button1" runat="server"  OnClick="Button1_Click" Text="Submit" CssClass="btn btn-primary px-5 py-2" ValidationGroup="App" Width="250px" />
</div>
</div>

</div>
</div>

<div class="col" style="background-color:#66c0c2;">

<div id="PropertyProfile" runat="server" visible="false" class="tabcontent">
                 <div style="padding-top:10px;">
                     <asp:Image ID="Image1" ImageUrl="~/images/prop1.jpg" runat="server" Width="100%" Height="80%" />
                      
                 </div><br />
      <table style="width:100%">
                              
                              
                               <tr>
                                  <td style="width: 155px; color:white;">Erf No.</td>
                                  <td>
                                      <asp:Label ID="lblErf" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                               <tr>
                                  <td style="width: 155px ; color:white;">Portion No.</td>
                                  <td>
                                      <asp:Label ID="lblPortion" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
           <tr>
                                  <td style="width: 155px; color:white;">Area or Extent</td>
                                  <td>
                                      <asp:Label ID="lblArea" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:white;">Contact Person</td>
                                  <td>
                                      <asp:Label ID="lblContactPerson" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:white;">Telephone</td>
                                  <td><asp:Label ID="lblTelephone" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:white;">Fax No.</td>
                                  <td><asp:Label ID="lblFaxNo" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:white;">Email Address</td>
                                  <td><asp:Label ID="lblEmailAddress" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:white;">Physical Address</td>
                                  <td><asp:Label ID="lblPhysicalAddress" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:white;">Postal Address</td>
                                  <td><asp:Label ID="lblPostalAddress" ForeColor="Black" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:white;">Latitude</td>
                                  <td>
                                      <asp:Label ID="lblLat" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px; color:white;">Longitude</td>
                                  <td>
                                      <asp:Label ID="lblLong" ForeColor="Black" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px"><asp:SqlDataSource ID="sdsPropertyProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectPropertyProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="PropertyID" SessionField="PropertyID" Type="Int32" />
                                      </SelectParameters>
                                      </asp:SqlDataSource></td>
                                  <td>  &nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">&nbsp;</td>
                                  <td></td>
                              </tr>
                              <tr>
                                  <td style="width: 155px">&nbsp;</td>
                                  <td></td>
                              </tr>
                          </table>
                 <br />
                  <div id="MapView" class="tab-pane fade in active">&nbsp;
                      <div class="chanel-item">
                           <div id="dvMap" style="width: 95%; height: 500px">&nbsp;
    </div>

                          </div>
                         </div>




             </div>

    <div id="AboutJoshco" runat="server" visible="true" style="color:white; padding-top:10px;" class="tabcontent">
        
<h3>Our core business includes:</h3>
<ul>
  <li>The development of social rental housing.</li>
  <li>The refurbishment, housing management.</li>
  <li>The refurbishment, upgrading and management of hostels and</li>
    <li>The provision of turnaround strategies where necessary.</li>
</ul>

    <h3>Our Project Portfolio includes:</h3>
<ul>
  <li>Greenfield and Brownfield developments.</li>
  <li>Hostel redevelopment.</li>
  <li>Inner City refurbishments/conversions.</li>
    <li>COJ public stock/upgrades.</li>
    <li>Communal and transitional housing.</li>
    <li>Student accomodation.</li>

</ul>
        </div>
</div>     
</div>


</div>
 </div>

</div>
</div>
</section>
            <asp:SqlDataSource ID="sdsApplicationProfile" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SelectApplicationProfile" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="ApplicationID" SessionField="ApplicationID" Type="Int32" />
                                           
                                      </SelectParameters>
                                      </asp:SqlDataSource>
        </form> 
</asp:Content>
