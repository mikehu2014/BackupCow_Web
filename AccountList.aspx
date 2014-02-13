<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AccountList.aspx.cs" Inherits="BackupCowWeb.AccountList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="contentpaneopen">
        <tr>
            <td style="padding-top:10px">
                <asp:Button ID="btnAddAcount" runat="server" Text="Add Account" PostBackUrl="~/RemoteGroup.aspx"
                    Font-Size="12px" Width="120px" />
                &nbsp;
                <asp:Button ID="btnSoryBySignpTime" runat="server" Text="Sort By SingupTime" OnClick="btnSoryBySignpTime_Click"
                    Font-Size="12px" Width="120px" />&nbsp;
                <asp:Button ID="btnSoryByGroupUser" runat="server" Text="Sort By GroupUser" OnClick="btnSoryByGroupUser_Click"
                    Font-Size="12px" Width="120px" />&nbsp;<asp:Button ID="btnRefresh" runat="server"
                        PostBackUrl="~/Company/GetCompanyList.aspx?cmd=refresh" Text="Refresh" /></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvCompany" runat="server" AutoGenerateColumns="False" CssClass="list versionCompare"
                    DataKeyNames="CompanyName" DataSourceID="sqlDataCompany" Width="100%" AllowPaging="True"
                    CellPadding="4" OnRowUpdating="gvCompany_RowUpdating" OnSelectedIndexChanged="gvCompany_SelectedIndexChanged"
                    PageSize="30" EmptyDataText="No displaying data records.">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ItemStyle-Width="30px" />
                        <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" ReadOnly="True"
                            ItemStyle-Width="200px" />
                        <asp:BoundField DataField="SignupTime" HeaderText="SignupTime" ItemStyle-Width="150px" />
                        <asp:BoundField DataField="GroupUser" HeaderText="GroupUser" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sqlDataCompany" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:BackupCowConnectionString %>" SelectCommand="SELECT CompanyName, SignupTime, GroupUser FROM CompanyNetwork ORDER BY GroupUser DESC">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
