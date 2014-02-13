<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderAdd.aspx.cs" Inherits="WebApplication1.OrderAdd"
    MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="contentpaneopen" style="line-height:30px; border:1px solid #646464">
        <tr>
            <td style="width: 100px; text-align: right; padding-right:5px; border:1px solid #646464">
                <asp:Label ID="Label1" runat="server" Text="Order ID:"></asp:Label></td>
            <td style="padding:5px 0px 0px 5px; border:1px solid #646464">
                <asp:TextBox ID="txtOrderID" runat="server" Width="200px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: right; padding-right:5px; border:1px solid #646464">
                <asp:Label ID="Label2" runat="server" Text="Buy Days:" Width="75px"></asp:Label></td>
            <td style="padding:5px 0px 0px 5px; border:1px solid #646464">
                <asp:TextBox ID="txtBuyDays" runat="server" Width="50px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: right; padding-right:5px; border:1px solid #646464">
                <asp:Label ID="Label10" runat="server" Text="Buy Users:" Width="87px"></asp:Label></td>
            <td style="padding:5px 0px 0px 5px; border:1px solid #646464">
                <asp:TextBox ID="txtBuyUsers" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: right; padding-right:5px; border:1px solid #646464">
                <asp:Label ID="Label6" runat="server" Text="Addition Users:" Width="125px"></asp:Label></td>
            <td style="padding:5px 0px 0px 5px; border:1px solid #646464">
                <asp:TextBox ID="txtAdditionUsers" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: right; padding-right:5px; border:1px solid #646464; height: 31px;">
                <asp:Label ID="Label8" runat="server" Text="Client Count:" Width="110px"></asp:Label></td>
            <td style="padding:5px 0px 0px 5px; border:1px solid #646464; height: 31px;">
                <asp:TextBox ID="TxtServerCount" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: right; padding-right:5px; border:1px solid #646464">
                <asp:Label ID="Label3" runat="server" Text="Order Date:"></asp:Label></td>
            <td style="padding:5px 0px 0px 5px; border:1px solid #646464">
                <asp:TextBox ID="txtOrderDate" runat="server" Width="200px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: right; padding-right:5px; border:1px solid #646464">
                <asp:Label ID="Label4" runat="server" Text="Order Edition:"></asp:Label></td>
            <td style="padding:5px 0px 0px 5px; border:1px solid #646464">
                <asp:DropDownList ID="ddlEdition" runat="server" DataSourceID="SqlDataSource1" DataTextField="EditionName"
                    DataValueField="EditionID">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="text-align: right; padding-right:5px; border:1px solid #646464">
                <asp:Label ID="Label5" runat="server" Text="Operator:"></asp:Label></td>
            <td style="padding:0px 0px 0px 5px; border:1px solid #646464">
                <asp:Label ID="lbOperator" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align: right; padding-right:5px; border:1px solid #646464">
                <asp:Label ID="Label7" runat="server" Text="Is Verified:" Width="103px"></asp:Label></td>
            <td style="padding:8px 0px 0px 5px; border:1px solid #646464">
                <asp:CheckBox ID="chkIsVerifled" runat="server" Checked="True" /></td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="padding:5px">
                <asp:Button ID="BtnAddOrder" runat="server" Text="Add Order" OnClick="BtnAddOrder_Click"
                    Width="120px" />
                <asp:Label ID="lbSuccess" runat="server" ForeColor="Green" Text="Add to orders successfully."
                    Visible="False"></asp:Label>
                <asp:Label ID="lbFailure" runat="server" ForeColor="Red" Text="Failed to add order."
                    Visible="False"></asp:Label></td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BackupCowConnectionString %>"
        SelectCommand="SELECT * FROM [Edition]"></asp:SqlDataSource>
</asp:Content>
