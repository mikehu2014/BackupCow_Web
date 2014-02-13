<%@ Page Language="C#" MasterPageFile="RemoteGroup.Master" AutoEventWireup="true"
    CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding-bottom:10px">
        Please reset your password with your account name. (A url will be sent to your email
        to reset your password.)</div>
    <table class="contentpaneopen">
        <tr>
            <td style="width: 100px; height: 25px">
                <asp:Label ID="Label1" runat="server" Text="Group Name:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtAccountName" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAccountName"
                    ErrorMessage="Please input account name" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Account name dost not exist"
                    ControlToValidate="txtAccountName" Display="Dynamic" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td style="height: 25px">
                <asp:Label ID="Label2" runat="server" Text="Security Code:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtSecurityCode" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please input security code"
                    ControlToValidate="txtSecurityCode" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtSecurityCode"
                    Display="Dynamic" ErrorMessage="Security code is incorrect" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="height: 25px">
                <div>
                    <img alt="" src="ValidCode.aspx" id="Img1" /></div>
                <div style="padding-top:5px">
                    <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" Text="Send to email"
                        Width="120px" />
                    <asp:Label ID="lbResult" runat="server"></asp:Label></div>
            </td>
        </tr>
    </table>
</asp:Content>
