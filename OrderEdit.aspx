<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderEdit.aspx.cs" Inherits="WebApplication1.WebForm2"
    MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="contentpaneopen">
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1"
                    DefaultMode="Edit" Width="100%" CssClass="list versionCompare" OnItemUpdating="DetailsView1_ItemUpdating">
                    <Fields>
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID:" ReadOnly="True">
                            <HeaderStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date:" ReadOnly="True" />
                        <asp:BoundField DataField="Days" HeaderText="Days:">
                            <ControlStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UserCount" HeaderText="Users:" ReadOnly="True" />
                        <asp:BoundField DataField="AdditionCount" HeaderText="Addition Users:" />
                        <asp:BoundField DataField="ActiveUser" HeaderText="Activate:" ReadOnly="True" />
                        <asp:BoundField DataField="ServerCount" HeaderText="Client Count:" ReadOnly="False" />
                        <asp:TemplateField HeaderText="Order Edition:" SortExpression="OrderEdition">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                                    DataTextField="EditionName" DataValueField="EditionID" SelectedValue='<%# Bind("OrderEdition") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                                    DataTextField="EditionName" DataValueField="EditionID" SelectedValue='<%# Bind("OrderEdition") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="AccountName" HeaderText="Account Name:" ControlStyle-Width="400px" />
                        <asp:BoundField DataField="Email" HeaderText="Email:" ControlStyle-Width="400px" />
                        <asp:BoundField DataField="Memo" HeaderText="Memo:">
                            <ControlStyle Width="400px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Username" HeaderText="Operator:" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Is Verified:" SortExpression="isValid">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isValid") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isValid") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ShowCancelButton="False" />                        
                    </Fields>
                </asp:DetailsView>
                <asp:Label id="lbSuccess" runat="server" Text="Update orders successfully." Visible="False" ForeColor="Green"></asp:Label>
                <asp:Label ID="lbFailure" runat="server" ForeColor="Red" Text="Failed to update order." Visible="False"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BackupCowConnectionString %>"
                    SelectCommand="SELECT isValid, OrderID, OrderDate, Days, Email, UserCount, ActiveUser, OrderEdition, CASE WHEN orders.adminid = -1 THEN 'System' ELSE Administrator.Username END as UserName, AccountName, AdditionCount, Memo, ServerCount FROM Orders LEFT OUTER JOIN Administrator ON Orders.adminid = Administrator.adminId WHERE OrderID = @OrderID"
                    UpdateCommand="UPDATE Orders SET Days = @Days, Email = @Email, OrderEdition = @OrderEdition, isValid = @isValid, adminid = @adminId, AccountName = @AccountName, AdditionCount = @AdditionCount, ServerCount = @ServerCount, Memo = @Memo WHERE OrderID = @OrderID">
                    <UpdateParameters>
                        <asp:Parameter Name="Days" />
                        <asp:Parameter Name="Email" />
                        <asp:Parameter Name="OrderEdition" />
                        <asp:Parameter Name="UserCount" />
                        <asp:Parameter Name="isValid" />
                        <asp:Parameter Name="adminId" />
                        <asp:QueryStringParameter Name="OrderID" QueryStringField="id" Type="String" />
                        <asp:Parameter Name="ServerCount" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="OrderID" QueryStringField="id" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BackupCowConnectionString %>"
                    SelectCommand="SELECT * FROM [Edition]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="100%"
                    CssClass="list versionCompare" ForeColor="#333333" DataKeyNames="ID" OnRowDeleting="GridView1_RowDeleting" 
                    AllowPaging="True" GridLines="None" EmptyDataText="No displaying data records.">
                    <Columns>
                        <asp:BoundField DataField="HardCode" HeaderText="HardCode" ItemStyle-Width="100px" ReadOnly="true" />
                        <asp:BoundField DataField="PcID" HeaderText="PC ID" ItemStyle-Width="50px" ReadOnly="true" />
                        <asp:BoundField DataField="PcName" HeaderText="PC Name" ItemStyle-Width="280px" ReadOnly="true" />
                        <asp:BoundField DataField="IP" HeaderText="IP"  ItemStyle-Width="100px" ReadOnly="true" />
                        <asp:BoundField DataField="ActivateTime" HeaderText="Activate Time" ItemStyle-Width="140px" ReadOnly="true" />
                        <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="50px" />
                        <asp:HyperLinkField DataNavigateUrlFields="OrderID,HardCode" DataNavigateUrlFormatString="~/Activate/GetLicenseKey.aspx?OrderID={0}&amp;HardCode={1}"
                            Text="License" ItemStyle-Width="40px" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BackupCowConnectionString %>"
                    SelectCommand="SELECT HardCode, OrderID, ID, PcName, IP, ActivateTime, Status, PcID FROM Activate WHERE OrderID = @OrderID" 
                    ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM Activate WHERE ID = @original_ID" 
                    OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE Activate SET Status = @Status WHERE (ID = @original_ID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="OrderID" QueryStringField="id" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
