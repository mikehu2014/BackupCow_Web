<%@ Page Language="C#" MasterPageFile="~/RemoteGroup.Master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
    <table style="width: 486px; height: 142px">
        <tr>
            <td style="width: 122px">
    <asp:Label ID="Label1" runat="server" Text="Group Name"></asp:Label></td>
            <td style="width: 78px">
    <asp:TextBox ID="txtGroupName" runat="server"></asp:TextBox></td>
            <td style="width: 100px">
    <asp:RequiredFieldValidator ID="rfvGroup" runat="server" ControlToValidate="txtGroupName"
        ErrorMessage="Input Group Name"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 122px">
    <asp:Label ID="Label2" runat="server" Text="Old Password"></asp:Label></td>
            <td style="width: 78px">
    <asp:TextBox ID="txtOldPassword" runat="server"></asp:TextBox></td>
            <td style="width: 100px">
    <asp:RequiredFieldValidator ID="rfvOldPassword" runat="server" ControlToValidate="txtOldPassword"
        ErrorMessage="Input old password"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 122px">
    <asp:Label ID="Label3" runat="server" Text="New Password"></asp:Label></td>
            <td style="width: 78px">
    <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox></td>
            <td style="width: 100px">
    <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword"
        ErrorMessage="Input new password" Width="161px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 122px">
    <asp:Label ID="Label4" runat="server" Text="Retype Password" Width="137px"></asp:Label></td>
            <td style="width: 78px">
    <asp:TextBox ID="txtNewPassword2" runat="server"></asp:TextBox></td>
            <td style="width: 100px">
    <asp:CompareValidator ID="cvNotMatch" runat="server" ControlToCompare="txtNewPassword"
        ControlToValidate="txtNewPassword2" ErrorMessage="Password Not Match" Width="215px"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td style="width: 122px">
            </td>
            <td style="width: 78px">
    <asp:Button ID="btnOK" runat="server" Text="Change Password" OnClick="btnOK_Click" /></td>
            <td style="width: 100px">
    <asp:Label ID="lbResult" runat="server"></asp:Label></td>
        </tr>
    </table>
    &nbsp;<br />
    <br />
    &nbsp;
</asp:Content>

