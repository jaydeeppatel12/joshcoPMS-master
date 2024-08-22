<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PropProfilePic.ascx.cs" Inherits="joshcoWA.PropProfilePic" %>
 
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-warning px-5 py-2" />
            <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" CssClass="btn btn-warning px-5 py-2" />
            <asp:HiddenField ID="hfPropertyID" runat="server" />
            <hr />
            <asp:Image ID="Image1" runat="server" Height = "400" Width = "600" />
      