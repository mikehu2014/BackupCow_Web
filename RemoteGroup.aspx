<%@ Page Language="C#" MasterPageFile="RemoteGroup.Master" AutoEventWireup="true"
    CodeFile="RemoteGroup.aspx.cs" Inherits="BackupCowWeb.RemoteGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="contentpaneopen">
        <tr>
            <td style="width: 120px; height: 25px">
                <asp:Label ID="Label1" runat="server" Text="Group Name:"></asp:Label></td>
            <td style="width: 200px">
                <asp:TextBox ID="txtAccountName" runat="server" Width="200px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="rfdAccountName" runat="server" ControlToValidate="txtAccountName"
                    ErrorMessage="Please input group name"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="height: 25px">
                <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Please input email" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                    Display="Dynamic" ErrorMessage="Email address is invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="height: 25px">
                <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="Please input password"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="height: 25px">
                <asp:Label ID="Label3" runat="server" Text="Retype Password:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPasswordRetype" runat="server" TextMode="Password" Width="200px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPasswordRetype"
                    ErrorMessage="Please retype password" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword"
                    ControlToValidate="txtPasswordRetype" ErrorMessage="Password and Retype Password are not matched"
                    Display="Dynamic"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td style="height: 25px">
                <asp:Label ID="Label5" runat="server" Text="Security Code:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtSecurityCode" runat="server" Width="200px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSecurityCode"
                    Display="Dynamic" ErrorMessage="Please input security code" Width="171px"></asp:RequiredFieldValidator><asp:CustomValidator
                        ID="CustomValidator1" runat="server" ControlToValidate="txtSecurityCode" Display="Dynamic"
                        ErrorMessage="Security code is incorrect" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <div>
                    <img id="Img1" alt="" src="ValidCode.aspx" /></div>
                <div style="padding-top: 5px">
                    <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Sign up"
                        Width="100px" /></div>
            </td>
            <td>
                <asp:Label ID="lbResult" runat="server" ForeColor="Black"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
