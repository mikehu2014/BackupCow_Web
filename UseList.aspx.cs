using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using IMSite.Data;
using System.Data.SqlClient;

public partial class UseList : IMSite.Admin.SupperAdminPage
{
    static string SelectSql = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SelectSql = "SELECT distinct AppUser.PcID, AppUser.PcName, AppUser.FirstUse, AppUser.LastUse, AppUser.UseCount";
            SelectSql = SelectSql + ", AppUser.NetworkMode, AppUser.IP, AppUser.LocalBackup, AppUser.NetworkBackup";
            SelectSql = SelectSql + ", AppUser.NetworkPc, AppUser.BackupAnalyze, AppUser.Account, Activate.OrderID, AppUser.Status FROM AppUser LEFT OUTER JOIN Activate ON";
            SelectSql = SelectSql + " AppUser.PcID = Activate.PcID ORDER BY AppUser.LastUse DESC";
            ddlSearchType.Attributes.Add("onchange", "changearea1()");

            ddlSearchType.Attributes.Add("onchange", "changearea1()");
            ddlSearchType2.Attributes.Add("onchange", "changearea2()");
            ddlSearchType3.Attributes.Add("onchange", "changearea3()");
            ddlSearchType4.Attributes.Add("onchange", "changearea4()");
            ddlSearchType5.Attributes.Add("onchange", "changearea5()");

            lbLastDay.Text = getDateUser(DateTime.Now.AddDays(-1).Date);
            lbToday.Text = getDateUser(DateTime.Now.Date);
        }

        SqlDataSource1.SelectCommand = SelectSql;
    }
    protected void GvUseList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int IpNum = 10;
        int LocationNum = 11;
        try
        {
            if (e.Row.RowIndex != -1)
            {
                string city, country;
                Conn conn = new Conn();
                if (string.Compare(e.Row.Cells[IpNum].Text, "unknown", true) != 0
                    && !string.IsNullOrEmpty(e.Row.Cells[IpNum].Text) && string.Compare(e.Row.Cells[IpNum].Text, "&nbsp;", true) != 0)
                {
                    conn.AddParamWithValue("@IP", e.Row.Cells[IpNum].Text);
                    SqlParameter pCountry = conn.AddParamWithValue("@country", String.Empty);
                    SqlParameter pCity = conn.AddParamWithValue("@city", String.Empty);
                    pCountry.Size = 100;
                    pCity.Size = 100;
                    pCountry.Direction = ParameterDirection.Output;
                    pCity.Direction = ParameterDirection.Output;
                    conn.CommandType = CommandType.StoredProcedure;
                    conn.ExecuteNonQueryD("GetIpInfo");
                    if (pCity.Value == null)
                        city = string.Empty;
                    else
                        city = pCity.Value.ToString();
                    if (pCountry.Value == null)
                        country = string.Empty;
                    else
                        country = pCountry.Value.ToString();

                    if (string.IsNullOrEmpty(city))
                        e.Row.Cells[LocationNum].Text = country;
                    else
                        e.Row.Cells[LocationNum].Text = city + ", " + country;
                }
            }
        }
        catch {
            e.Row.Cells[LocationNum].Text = "unknown";
        }
    }

    private void SearchUserList(string SearchSql)
    {
        if (SearchSql != "")
            SearchSql = " where " + SearchSql;

        SelectSql = "SELECT distinct AppUser.PcID, AppUser.PcName, AppUser.FirstUse, AppUser.LastUse, AppUser.UseCount";
        SelectSql = SelectSql + ", AppUser.NetworkMode, AppUser.IP, AppUser.LocalBackup, AppUser.NetworkBackup";
        SelectSql = SelectSql + ", AppUser.NetworkPc, AppUser.BackupAnalyze, AppUser.Account, Activate.OrderID, AppUser.Status FROM AppUser LEFT OUTER JOIN Activate ON";
        SelectSql = SelectSql + " AppUser.PcID = Activate.PcID";
        string sql1 = SelectSql;

        string sql2 = "  ORDER BY AppUser.LastUse DESC";
        string sqlAll = sql1 + SearchSql + sql2;

        try
        {
            SelectSql = sqlAll;
            SqlDataSource1.SelectCommand = sqlAll;
            SqlDataSource1.DataBind();
            GvUseList.DataBind();
        }
        catch
        { }

        // 过滤人数
        sql1 = "select count(*) FROM AppUser LEFT OUTER JOIN Activate ON AppUser.PcID = Activate.PcID";
        sqlAll = sql1 + SearchSql;

        try
        {
            Conn con = new Conn();
            DataTable dt = con.ExecuteDataTable(sqlAll, false);
            if (dt.Rows.Count > 0)
                lbFilter.Text = dt.Rows[0][0].ToString();
        }
        catch
        { }

    }

    private string getDateUser(DateTime dt)
    {
        int UseCount = 0;

        string sql = "select UserCount from DailyAnalyze where Time = '" + dt + "'";
        try
        {
            Conn con = new Conn();
            SqlDataReader sdr = con.ExecuteReaderD(sql);
            if (sdr.Read())
            {
                int.TryParse(sdr["UserCount"].ToString(), out UseCount);
            }
            sdr.Close();
        }
        catch { };

        return "" + UseCount;
    }

    const string SearchType_All = "All";
    const string SearchType_PcID = "PcID";
    const string SearchType_PcName = "PcName";
    const string SearchType_NetworkPc = "NetworkPc";
    const string SearchType_LocalBackup = "LocalBackup";
    const string SearchType_NetworkBackup = "NetworkBackup";
    const string SearchType_Ip = "Ip";
    const string SearchType_OrderID = "OrderID";
    const string SearchType_Account = "Account";
    const string SearchType_FirstUse = "FirstUse";
    const string SearchType_LastUse = "LastUse";
    const string SearchType_ActionUse = "ActionUse";

    private string ReadSearchSql(string SearchType, string SearchValue)
    {
        string SearchSql = "";

        if (SearchType == SearchType_All)
            SearchSql = "";
        else
        if (SearchType == SearchType_PcID)
            SearchSql = "AppUser.PcID = '" + SearchValue + "'";
        else
        if (SearchType == SearchType_PcName)
            SearchSql = "AppUser.PcName = '" + SearchValue + "'";
        else
        if (SearchType == SearchType_NetworkPc)
            SearchSql = "AppUser.NetworkPc >= " + SearchValue;
        else
        if (SearchType == SearchType_LocalBackup)
            SearchSql = "AppUser.LocalBackup >= " + SearchValue;
        else
        if (SearchType == SearchType_NetworkBackup)
            SearchSql = "AppUser.NetworkBackup >= " + SearchValue;
        else
        if (SearchType == SearchType_Ip)
            SearchSql = "AppUser.IP = '" + SearchValue + "'";
        else
        if (SearchType == SearchType_OrderID)
        {
            if (SearchValue == "")
                SearchSql = "Activate.OrderID <> ''";
            else
                SearchSql = "Activate.OrderID = '" + SearchValue + "'";
        }
        else
        if (SearchType == SearchType_Account)
             SearchSql = "AppUser.Account = '" + SearchValue + "'";
        else
        {
            char[] splitDate = new char[] { '|' };
            string[] DateList = SearchValue.Split(splitDate);
            if (DateList.Length < 2)
                return "";
            string DateSql = "'" + DateList[0] + "' and '" + DateList[1] + "'";
            if (SearchType == SearchType_FirstUse)
                SearchSql = "AppUser.FirstUse between " + DateSql;
            else
            if (SearchType == SearchType_LastUse)
                SearchSql = "AppUser.LastUse between " + DateSql;
        };
        return SearchSql;
    }



    private string ReadSearchSqlAll(string searchSql, string SearchType, string SearchValue)
    {
        string tempsql = ReadSearchSql(SearchType, SearchValue);
        if (tempsql != "")
        {
            tempsql = "( " + tempsql + " )";
            if (searchSql != "")
                searchSql = searchSql + " and ";
            searchSql = searchSql + tempsql;
        }
        return searchSql;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string SearchSql = "";
        SearchSql = ReadSearchSqlAll(SearchSql, ddlSearchType.Text, tbSearchValue.Text);
        SearchSql = ReadSearchSqlAll(SearchSql, ddlSearchType2.Text, tbSearchValue2.Text);
        SearchSql = ReadSearchSqlAll(SearchSql, ddlSearchType3.Text, tbSearchValue3.Text);
        SearchSql = ReadSearchSqlAll(SearchSql, ddlSearchType4.Text, tbSearchValue4.Text);
        SearchSql = ReadSearchSqlAll(SearchSql, ddlSearchType5.Text, tbSearchValue5.Text);

        SearchUserList(SearchSql);
    }
    protected void GvUseList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void tbSearchValue2_TextChanged(object sender, EventArgs e)
    {

    }
}
