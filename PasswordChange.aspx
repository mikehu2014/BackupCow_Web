<%@ Page Language="C#" MasterPageFile="RemoteGroup.Master" AutoEventWireup="true"
    CodeFile="PasswordChange.aspx.cs" Inherits="PasswordChange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding-bottom: 10px">
        Please reset a new password:
    </div>
    <table class="contentpaneopen">
        <tr>
            <td style="width: 100px; height: 25px">
                <asp:Label ID="Label1" runat="server" Text="Account Name:"></asp:Label></td>
            <td>
                <asp:Label ID="lbAccountName" runat="server" Width="200px"></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 25px">
                <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please input password"
                    ControlToValidate="txtPassword"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="height: 25px">
                <asp:Label ID="Label3" runat="server" Text="Retype Password:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtRetypePassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please retype password"
                    ControlToValidate="txtRetypePassword" Display="Dynamic"></asp:RequiredFieldValidator><asp:CompareValidator
                        ID="CompareValidator1" runat="server" ErrorMessage="Password and Retype Password are not matched"
                        ControlToCompare="txtPassword" ControlToValidate="txtRetypePassword" Display="Dynamic"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="height: 25px">
                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" Width="200px"
                    OnClick="btnChangePassword_Click" />
                <asp:Label ID="lbResult" runat="server"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
