<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="WebApplication1.WebForm1"
    MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="contentpaneopen">
        <tr>
            <td>
                Order ID:
                <asp:TextBox ID="txtID" runat="server"></asp:TextBox>&nbsp; <asp:Button ID="Button1" runat="server" Font-Size="12px" Text="Search" OnClick="Button1_Click" Width="63px" />&nbsp;&nbsp;&nbsp;
                &nbsp; &nbsp;<asp:Button ID="btnAddOrder" runat="server" PostBackUrl="~/OrderAdd.aspx" Text="Add a Order" />
                &nbsp;&nbsp; &nbsp;<asp:Label ID="Label2" runat="server"></asp:Label>
                &nbsp; &nbsp;<asp:Button ID="btnActivate" runat="server" PostBackUrl="~/Activate/GetLicenseKey.aspx" Font-Size="12px"
                    Text="Activate"  Width="100px" /></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    Width="110%" DataKeyNames="OrderID" DataSourceID="SqlDataSource1" CellPadding="4"
                    CssClass="list versionCompare" ForeColor="#333333" GridLines="None" PageSize="20"
                    EmptyDataText="No displaying data records." OnRowDataBound="GridView1_RowDataBound" 
                    OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnDataBound="GridView1_DataBound">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="~/OrderEdit.aspx?id={0}"
                            Text="Change" >
                            <ItemStyle Width="20px" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="True" SortExpression="OrderID" >
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EditionName" HeaderText="Edition" SortExpression="EditionName" >
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Days" HeaderText="Days" SortExpression="Days" >
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UserCount" HeaderText="Total/Active/Addition" SortExpression="UserCount" />
                        <asp:BoundField DataField="ServerCount" HeaderText="Client Count" />
                        <asp:BoundField DataField="Username" HeaderText="Operator" SortExpression="Username" >
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" >
                            <ItemStyle Width="140px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="AccountName" HeaderText="Account" SortExpression="AccoutName" >
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:CommandField DeleteText="Delete" ShowDeleteButton="True" >
                            <ItemStyle Width="20px" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BackupCowConnectionString %>"
                    SelectCommand="SELECT Orders.isValid, Orders.OrderID, CAST(Orders.UserCount AS varchar) + '/' + CAST(Orders.ActiveUser AS varchar) + '/' + CAST(Orders.AdditionCount AS varchar) AS UserCount, CASE WHEN orders.adminid = - 1 THEN 'System' ELSE Administrator.Username END AS UserName, Orders.Days, Orders.OrderDate, Edition.EditionName, Orders.AccountName, Orders.Email, Orders.ServerCount FROM Orders LEFT OUTER JOIN Edition ON Orders.OrderEdition = Edition.EditionID LEFT OUTER JOIN Administrator ON Administrator.adminId = Orders.adminid ORDER BY Orders.OrderDate DESC"
                    DeleteCommand="Delete From Orders where OrderID = @OrderID">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="OrderID" PropertyName="DataKeyNames" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
