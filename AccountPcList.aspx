<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AccountPcList.aspx.cs" Inherits="BackupCowWeb.AccountPcList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gvAccountPcList" runat="server" AutoGenerateColumns="False" CssClass="list versionCompare"
        DataSourceID="SqlDataSource1" Width="100%" CellPadding="4">
        <Columns>
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" ItemStyle-Width="120px" />
            <asp:BoundField DataField="PcID" HeaderText="PC ID" ItemStyle-Width="100px" />
            <asp:BoundField DataField="PCName" HeaderText="PC Name" ItemStyle-Width="120px" />
            <asp:BoundField DataField="LanIp" HeaderText="Local IP" ItemStyle-Width="110px" />
            <asp:BoundField DataField="LanPort" HeaderText="Local Port" ItemStyle-Width="40px" />
            <asp:BoundField DataField="InternetIp" HeaderText="Internet Ip" ItemStyle-Width="110px" />
            <asp:BoundField DataField="InternetPort" HeaderText="Internet Port" ItemStyle-Width="40px"  />
            <asp:BoundField DataField="CloudIDNumber" HeaderText="Cloud ID Number" />
            <asp:BoundField DataField="OnlineTime" HeaderText="Start Time" ItemStyle-Width="110px" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BackupCowConnectionString %>"
        SelectCommand="SELECT * FROM [CompanyComputer] WHERE ([CompanyName] = @CompanyName)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CompanyName" QueryStringField="CompanyName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
