<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApplicationForm.ascx.cs" Inherits="joshcoWA.ApplicationForm" %>
 <%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="ks" %>
 <div style="width:100%">
 
    
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
                <asp:DropDownList ID="ddlProperty" runat="server" CssClass="btn-outline-warning btn-fw" AppendDataBoundItems="True" DataSourceID="sdsProperty" DataTextField="PropertyName" DataValueField="PropertyID" >
                <asp:ListItem Value="0">-- Select a property --</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="sdsProperty" runat="server" ConnectionString="<%$ ConnectionStrings:joshcoCS %>" SelectCommand="SELECT * FROM [Property] 

ORDER BY [PropertyName]">
               
            </asp:SqlDataSource>
<%--&nbsp;<select name="" id="" class="form-control">
<option value="">City Deep - 100 Heidelburg Road, City Deep.</option>
<option value="">Selby Village - 1 Ntemi Piliso Street, Selby.</option>
<option value="">Orlando Ekhaya - 1 Nicolas Street, Orlando Power Station Soweto.</option>
<option value="">Antea Village - Corner Kelvin & Maraisburg, Johannesburg.</option>
<option value="">Jabulani - Soweto.</option>
<option value="">Diepkloof - Soweto.</option>
<option value="">Orlando West - Soweto.</option>
<option value="">Klipspruit Hostel - 1 Mofokeng Street, Klipsruit Soweto.</option>
<option value="">Fluerhof Junction- Main Reef Road, Rooderport.</option>
<option value="">Fluerhof Riverside - Main Reef Road, Rooderport.</option>
<option value="">Kliptown Golf Course - Corner Modjadji and Klipsruit Valley Roads, Kliptown Soweto</option>
<option value="">Kliptown Square - Corner Dlamini Klipvalley Roads, Kliptown Soweto.</option>
<option value="">Tshedzani - Corner Kerk and Nefdt Streets, Rooderport.</option>
<option value="">Pennyville - Buffallo Road, New Canada.</option>
<option value="">Botlhabela - Corner Thoko Mngoma and Lenin Drive, Alexandra.</option>
<option value="">AA House - Corner Wandereres and Noord Street, Joahannesburg.</option>
<option value="">Casa Mia - 37 Soper Street, Berea.</option>
<option value="">Europa House - Plein and Joubert Street, Johannesburg.</option>
<option value="">MBV Building - Corner Quatz and Hancock Street, Joubert Park.</option>
<option value="">Chelsea - Corner Catherine and Kotze Street, Hillbrow.</option>
<option value="">La Rosabel - 62 Corner Quatz and Smit Street, Hillbrow.</option>
<option value="">Bellavista Infill - Corner Bellavista and Selous Roads, Bellavista.</option>
<option value="">Citirine Court - Corner Bellavista and Selous Roads, Bellavista.</option>
<option value="">Raschers - 70 Loveday Street, Johannesburg.</option>
<option value="">BG Alexander - Inner City.</option>
<option value="">Hoek Street - 27 Hoek Street and Wolmarans, Braamfontein.</option>
<option value="">Textile Building - 23 Kerk Street, Johannesburg.</option>
<option value="">African Diamond Building - 25 Kerk Street, Johannesburg.</option>
<option value="">Phoenix House - 3-7 Stephenson Street, Faraday.</option>
<option value="">Abel Street - Inner City.</option>
<option value="">Albert Street - Inner City.</option>
<option value="">Devland - Golden Highway Freedom Park.</option>
<option value="">Dobsonville - Soweto.</option>
<option value="">Turffontein - Johannesburg South.</option>
<option value="">Wolmarans Street - Inner City.</option>

</select>--%>

</div>
</div>

<div class="row">
<div class="col-md-12 form-group">
<label for="name">Title<span style="color:red; float:right; ">*</span></label>
<input type="text" id="txtTitle" runat="server"  style="width:30%" class="form-control py-2">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="App" runat="server" ControlToValidate="txtTitle" Font-Size="8pt" ForeColor="Red" ErrorMessage="*Required"></asp:RequiredFieldValidator>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">Name<span style="color:red; float:right; ">*</span></label>
<input type="text" id="txtName" runat="server" class="form-control py-2 ">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="App" runat="server" ControlToValidate="txtName" Font-Size="8pt" ForeColor="Red" ErrorMessage="*Required"></asp:RequiredFieldValidator>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">Surname<span style="color:red; float:right; ">*</span></label>
<input type="text" id="txtSurname" runat="server" class="form-control py-2 ">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="App" runat="server" ControlToValidate="txtSurname" Font-Size="8pt" ForeColor="Red" ErrorMessage="*Required"></asp:RequiredFieldValidator>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">Gender</label><br />
     <input type="radio" id="male" runat="server" name="gender" value="male">
  <label for="male">male</label> 
  <input type="radio" id="female" runat="server"  name="gender" value="female" >
  <label for="female">female</label>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">ID  / Passport Number<span style="color:red; float:right; ">*</span></label>
<input type="text" id="txtIDnumber" runat="server" maxlength="13" onkeypress="return event.charCode >= 48 && event.charCode <= 57"  class="form-control py-2 ">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="App" runat="server" ControlToValidate="txtIDnumber" Font-Size="8pt" ForeColor="Red" ErrorMessage="*Required"></asp:RequiredFieldValidator>
</div>
</div>
<div class="row">
<div class="col-md-12 form-group">
<label for="name">Nationality</label>
    <asp:DropDownList ID="ddlCountry" runat="server" class="btn-outline-warning btn-fw"></asp:DropDownList>
<%--<input type="text" id="ddlCountry" runat="server" class="form-control py-2 ">--%>
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
<input type="text" id="txtTelephone" runat="server" class="form-control py-2 ">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="App" runat="server" ControlToValidate="txtTelephone" Font-Size="8pt" ForeColor="Red" ErrorMessage="*Required"></asp:RequiredFieldValidator>
</div>
</div>
    <div class="row">
<div class="col-md-12 form-group">
<label for="name">Mobile Number</label>
<input type="text" id="txtMobileNumber" runat="server" class="form-control py-2 ">
</div>
</div>
        <div class="row">
<div class="col-md-12 form-group">
<label for="name">Fax Number</label>
<input type="text" id="txtFaxNumber" runat="server" class="form-control py-2 ">
</div>
</div>

<div class="row">
<div class="col-md-12 form-group">
<label for="name">Email Address<span style="color:red; float:right; ">*</span></label>
<input type="text" id="txtEmailAddress" runat="server" class="form-control py-2 ">
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
<input type="text" id="txtPhysicalAddress" runat="server" class="form-control py-2 ">
</div>
</div>
    <div class="row">
<div class="col-md-12 form-group">
<label for="name">Physical Address Code</label>
<input type="text" id="txtPhysicalAddressCode" runat="server" style="width:30%" class="form-control py-2 ">
</div>
</div>
    <div class="row">
<div class="col-md-12 form-group">
<label for="name">Postal Address</label><asp:HyperLink ID="hlnkSame1" runat="server" Font-Size="8pt" style="float:right; cursor:pointer" ForeColor="#0000CC"> Postal same as physical address</asp:HyperLink>
<input type="text" id="txtPostalAddress" runat="server" class="form-control py-2 ">
</div>
</div>
    <div class="row">
<div class="col-md-12 form-group">
<label for="name">Postal Address Code</label>
<input type="text" id="txtPostalAddressCode" runat="server" style="width:30%" class="form-control py-2 ">
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
</div>
</div>

         <div class="row">
<div class="col-md-12 form-group">
  <asp:UpdatePanel ID="UP1" runat="server">

                                <ContentTemplate>

                                           <div class="row">
<div class="col-md-12 form-group">
    <%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="ks" %>  <ks:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
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

                                </ContentTemplate>

                            </asp:UpdatePanel>
</div>
</div>

 
 
<div class="row">
<div class="col-md-6 form-group">
<%--<input type="submit" value="Register" class="btn btn-primary px-5 py-2">--%>
     <asp:Button ID="Button1" runat="server"  OnClick="Button1_Click" Text="Submit" CssClass="btn btn-primary px-5 py-2" ValidationGroup="App" Width="250px" />
</div>
</div>

</div>

        