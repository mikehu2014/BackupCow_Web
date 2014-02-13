<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DailyAnalyze.aspx.cs" Inherits="DailyAnalyze" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="list versionCompare" DataSourceID="SqlDataSource1" PageSize="30" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
            <asp:BoundField DataField="UserCount" HeaderText="UserCount" SortExpression="UserCount" />
        </Columns>
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BackupCowConnectionString %>"
        SelectCommand="SELECT [Time], [UserCount] FROM [DailyAnalyze] ORDER BY [Time] DESC"></asp:SqlDataSource>
</asp:Content>

