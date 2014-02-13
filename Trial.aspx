<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Trial.aspx.cs" Inherits="WebApplication1._Default"
    MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="contentpaneopen">
        <tr>
            <td style="height: 32px">
                <div style="padding: 5px 5px 3px 5px; margin: 0px; color: White; background-color: #5064A0">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Hard Code: "></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="txtHardCode" runat="server" Font-Size="12px" Width="168px"></asp:TextBox>
                    &nbsp;
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="PcName"></asp:Label>
                    <asp:TextBox ID="txtPcName" runat="server" Width="167px"></asp:TextBox>&nbsp;
                    <asp:Button ID="btnSearch" runat="server" Font-Size="12px" Text="Search" Width="100px"
                        OnClick="btnSearch_Click" />
                    <asp:Button ID="btnViewall" runat="server" Font-Size="12px" Text="View All" Width="100px"
                        OnClick="btnViewall_Click" />
                    &nbsp;
                </div>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; vertical-align: bottom; height: 20px;">
                <asp:Label ID="Label2" runat="server" Text="总试用人数"></asp:Label>
                :
                <asp:Label ID="lbTotal" runat="server" Text="10000"></asp:Label>&nbsp;&nbsp; &nbsp;
                <asp:Label ID="Label3" runat="server" Text="昨天试用人数"></asp:Label>
                :
                <asp:Label ID="lbLastDay" runat="server" Text="10000"></asp:Label>
                &nbsp;&nbsp;&nbsp; 
                <asp:Label ID="Label5" runat="server" Text="今天试用人数"></asp:Label>:
                <asp:Label ID="lbToday" runat="server" Text="10000"></asp:Label>
                &nbsp;&nbsp; &nbsp;<asp:Button ID="btnCountryAnalyze" runat="server" Text="Country Analyze" Width="131px" PostBackUrl="~/CountryAnalyze.aspx" />
                <asp:Button ID="btnDailyAnalyze" runat="server" PostBackUrl="~/TrialDailyPage.aspx"
                    Text="Daily Analyze" Width="109px" />
                <asp:Button ID="btnAnalyze" runat="server" PostBackUrl="~/TrialAnalyze.aspx" Text="Analyze" />&nbsp;&nbsp;
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    Width="100%" DataKeyNames="ID" DataSourceID="SqlDataSource1" CellPadding="4"
                    CssClass="list versionCompare" ForeColor="#333333" GridLines="None" EmptyDataText="No displaying data records."
                    OnDataBound="GridView1_DataBound" PageSize="30" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="HardCode" HeaderText="HardCode" >
                            <ItemStyle Width="330px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PcID" HeaderText="PcID" >
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PcName" HeaderText="PcName" >
                            <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IP" HeaderText="IP" >
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Location" >
                            <ItemStyle Width="110px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TrialDate" HeaderText="TrialDate" >
                            <ItemStyle Width="140px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Account" HeaderText="Account" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BackupCowConnectionString %>"
                    SelectCommand="SELECT * FROM Trial ORDER BY TrialDate DESC" DeleteCommand="DELETE FROM [Trial] WHERE [ID] = @ID"
                    ConflictDetection="CompareAllValues"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
