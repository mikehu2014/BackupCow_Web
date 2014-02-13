<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OtherPage.aspx.cs" Inherits="OtherPage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="btnAddOrder" runat="server" PostBackUrl="~/OrderAdd.aspx" Text="Add a Order" />
    &nbsp; &nbsp;<asp:Button ID="btnAdminList" runat="server" PostBackUrl="~/adminList.aspx"
        Text="Admin List" />
    &nbsp;<br />
    <br />
    <asp:Button ID="BtnTryAnalyze" runat="server" PostBackUrl="~/TrialAnalyze.aspx" Text="Try Analyze" />
    &nbsp;
    <asp:Button ID="btnUseAnalyze" runat="server" PostBackUrl="~/UseAnalyze.aspx" Text="Use Analyze" /><br />
    <br />
    <asp:Button ID="btnMoblieSuggession" runat="server" PostBackUrl="~/SuggestionList.aspx"
        Text="Moblie Suggession" /><br />
    <br />
</asp:Content>

