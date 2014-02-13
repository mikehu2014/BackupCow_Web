<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UseList.aspx.cs" Inherits="UseList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language = "JavaScript" type="text/javascript">
    
    function readValue(TypeStr)
    {
        var SearchType = TypeStr;
        var SearchValue = "";
        if (SearchType == "NetworkPc")
           SearchValue = "2";
        else
        if (SearchType == "LocalBackup")
            SearchValue = "1";
        else
        if (SearchType == "NetworkBackup")
            SearchValue = "1";
        else
        {
            var currentDate = new Date();
            var yy = currentDate.getFullYear();
            var mm = currentDate.getMonth() + 1;
            var dd = currentDate.getDate();
            var DateStr = yy + "-" + mm + "-" + dd;
            if (SearchType == "FirstUse")
                SearchValue = DateStr + "|" + DateStr
            else
            if (SearchType == "LastUse")
                SearchValue = DateStr + "|" + DateStr
            else
            if (SearchType == "ActionUse")
                SearchValue = DateStr + "|" + DateStr
        }
            
        return SearchValue;    
    }
    
    
    function changearea1()
    {
        var SearchType = document.all("<% =ddlSearchType.ClientID %>").value;
        document.all("<% =tbSearchValue.ClientID %>").value = readValue( SearchType );
    }
    
    function changearea2()
    {
        var SearchType = document.all("<% =ddlSearchType2.ClientID %>").value;
        document.all("<% =tbSearchValue2.ClientID %>").value = readValue( SearchType );
    }
    
    function changearea3()
    {
         var SearchType = document.all("<% =ddlSearchType3.ClientID %>").value;
        document.all("<% =tbSearchValue3.ClientID %>").value = readValue( SearchType );
    }
    
    function changearea4()
    {
        var SearchType = document.all("<% =ddlSearchType4.ClientID %>").value;
        document.all("<% =tbSearchValue4.ClientID %>").value = readValue( SearchType );
    }
    
    function changearea5()
    {
        var SearchType = document.all("<% =ddlSearchType5.ClientID %>").value;
        document.all("<% =tbSearchValue5.ClientID %>").value = readValue( SearchType );
    }
    
    </script> 

    <div style="width: 986px; height: 36px">
    
    <asp:DropDownList ID="ddlSearchType" runat="server" >
        <asp:ListItem>All</asp:ListItem>
        <asp:ListItem>PcID</asp:ListItem>
        <asp:ListItem>PcName</asp:ListItem>
        <asp:ListItem>NetworkPc</asp:ListItem>
        <asp:ListItem>LocalBackup</asp:ListItem>
        <asp:ListItem>NetworkBackup</asp:ListItem>
        <asp:ListItem>Ip</asp:ListItem>
        <asp:ListItem>OrderID</asp:ListItem>
        <asp:ListItem>Account</asp:ListItem>
        <asp:ListItem>FirstUse</asp:ListItem>
        <asp:ListItem>LastUse</asp:ListItem>
    </asp:DropDownList>
        &gt;= &nbsp;
        <asp:TextBox ID="tbSearchValue" runat="server"></asp:TextBox>
        &nbsp; &nbsp;&nbsp;
    <asp:DropDownList ID="ddlSearchType3" runat="server">
        <asp:ListItem>All</asp:ListItem>
        <asp:ListItem>PcID</asp:ListItem>
        <asp:ListItem>PcName</asp:ListItem>
        <asp:ListItem>NetworkPc</asp:ListItem>
        <asp:ListItem>LocalBackup</asp:ListItem>
        <asp:ListItem>NetworkBackup</asp:ListItem>
        <asp:ListItem>Ip</asp:ListItem>
        <asp:ListItem>OrderID</asp:ListItem>
        <asp:ListItem>Account</asp:ListItem>
        <asp:ListItem>FirstUse</asp:ListItem>
        <asp:ListItem>LastUse</asp:ListItem>
    </asp:DropDownList>
       &gt;= &nbsp;
       <asp:TextBox ID="tbSearchValue3" runat="server"></asp:TextBox>
       &nbsp; &nbsp; &nbsp;
       <asp:Button ID="btnDailyAnalyze" runat="server" PostBackUrl="~/DailyAnalyze.aspx" Text="Daily Analyze" />
       <br />
       
    <asp:DropDownList ID="ddlSearchType2" runat="server" >
        <asp:ListItem>All</asp:ListItem>
        <asp:ListItem>PcID</asp:ListItem>
        <asp:ListItem>PcName</asp:ListItem>
        <asp:ListItem>NetworkPc</asp:ListItem>
        <asp:ListItem>LocalBackup</asp:ListItem>
        <asp:ListItem>NetworkBackup</asp:ListItem>
        <asp:ListItem>Ip</asp:ListItem>
        <asp:ListItem>OrderID</asp:ListItem>
        <asp:ListItem>Account</asp:ListItem>
        <asp:ListItem>FirstUse</asp:ListItem>
        <asp:ListItem>LastUse</asp:ListItem>
    </asp:DropDownList>
        &gt;= &nbsp;
        <asp:TextBox ID="tbSearchValue2" runat="server"></asp:TextBox>
        &nbsp; &nbsp; &nbsp;<asp:DropDownList ID="ddlSearchType5" runat="server">
        <asp:ListItem>All</asp:ListItem>
        <asp:ListItem>PcID</asp:ListItem>
        <asp:ListItem>PcName</asp:ListItem>
        <asp:ListItem>NetworkPc</asp:ListItem>
        <asp:ListItem>LocalBackup</asp:ListItem>
        <asp:ListItem>NetworkBackup</asp:ListItem>
        <asp:ListItem>Ip</asp:ListItem>
        <asp:ListItem>OrderID</asp:ListItem>
        <asp:ListItem>Account</asp:ListItem>
        <asp:ListItem>FirstUse</asp:ListItem>
        <asp:ListItem>LastUse</asp:ListItem>
    </asp:DropDownList>
        &gt;= &nbsp;
        <asp:TextBox ID="tbSearchValue5" runat="server"></asp:TextBox>
        &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnAnalyze" runat="server" PostBackUrl="~/UseAnalyze.aspx" Text="Analyze" />
        <br />
    <asp:DropDownList ID="ddlSearchType4" runat="server">
        <asp:ListItem>All</asp:ListItem>
        <asp:ListItem>PcID</asp:ListItem>
        <asp:ListItem>PcName</asp:ListItem>
        <asp:ListItem>NetworkPc</asp:ListItem>
        <asp:ListItem>LocalBackup</asp:ListItem>
        <asp:ListItem>NetworkBackup</asp:ListItem>
        <asp:ListItem>Ip</asp:ListItem>
        <asp:ListItem>OrderID</asp:ListItem>
        <asp:ListItem>Account</asp:ListItem>
        <asp:ListItem>FirstUse</asp:ListItem>
        <asp:ListItem>LastUse</asp:ListItem>
    </asp:DropDownList>
        &gt;= &nbsp;
        <asp:TextBox ID="tbSearchValue4" runat="server"></asp:TextBox>
        &nbsp; &nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" Text="OK" Width="63px" OnClick="btnSearch_Click" />
        &nbsp; &nbsp;&nbsp;
        Filter User : &nbsp;<asp:Label ID="lbFilter" runat="server" Text="0"></asp:Label>
        &nbsp;&nbsp;
    </div>
    <br />
    <br />
    <br />
     <div style="width: 610px; height: 24px">
      Yesterday User:<asp:Label ID="lbLastDay" runat="server" Text="10000"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        Today User: &nbsp;<asp:Label ID="lbToday" runat="server" Text="10000"></asp:Label> 
     </div>
    <table class="contentpaneopen">
        <tr>
            <td>
                <br />
                <asp:GridView ID="GvUseList" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="list versionCompare" DataKeyNames="PcID" DataSourceID="SqlDataSource1"
                    PageSize="30" CellPadding="4" ForeColor="#333333" GridLines="None" EmptyDataText="No displaying data records." OnRowDataBound="GvUseList_RowDataBound" OnSelectedIndexChanged="GvUseList_SelectedIndexChanged" Width="110%">
                    <Columns>
                        <asp:BoundField DataField="PcID" HeaderText="PcID" ReadOnly="True" SortExpression="PcID" />
                        <asp:BoundField DataField="PcName" HeaderText="PcName" SortExpression="PcName" />
                        <asp:BoundField DataField="FirstUse" HeaderText="FirstUse" SortExpression="FirstUse" />
                        <asp:BoundField DataField="LastUse" HeaderText="LastUse" SortExpression="LastUse" />
                        <asp:BoundField DataField="UseCount" HeaderText="UseCount" SortExpression="UseCount" />
                        <asp:BoundField DataField="LocalBackup" HeaderText="LocalBackup" SortExpression="LocalBackup" />
                        <asp:BoundField DataField="NetworkBackup" HeaderText="NetworkBackup" SortExpression="NetworkBackup" />
                        <asp:BoundField DataField="NetworkMode" HeaderText="NetworkMode" SortExpression="NetworkMode" />
                        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
                        <asp:BoundField DataField="NetworkPc" HeaderText="NetworkPc" SortExpression="NetworkPc" />
                        <asp:BoundField DataField="BackupAnalyze" HeaderText="BackupAnalyze" SortExpression="BackupAnalyze" />
                        <asp:BoundField DataField="Account" HeaderText="Account" SortExpression="Account" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BackupCowConnectionString %>"
                    SelectCommand="SELECT DISTINCT AppUser.PcID, AppUser.PcName, AppUser.FirstUse, AppUser.LastUse, AppUser.UseCount, AppUser.LocalBackup, AppUser.NetworkBackup, AppUser.NetworkMode, AppUser.IP, AppUser.NetworkPc, AppUser.BackupAnalyze, AppUser.Account, AppUser.Status FROM AppUser LEFT OUTER JOIN Activate ON AppUser.PcID = Activate.PcID ORDER BY AppUser.LastUse DESC"
                    DeleteCommand="DELETE FROM [AppUser] WHERE [PcID] = @PcID">
                    <DeleteParameters>
                        <asp:Parameter Name="PcID" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
