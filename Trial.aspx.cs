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

namespace WebApplication1
{
    public partial class _Default : IMSite.Admin.SupperAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbLastDay.Text = getDateUser(DateTime.Now.AddDays(-1).Date);
                lbToday.Text = getDateUser(DateTime.Now.Date);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string hardCode = txtHardCode.Text.Trim();
            string pcName = txtPcName.Text.Trim();

            Boolean isEmptyHardCode = string.IsNullOrEmpty(hardCode);
            Boolean isEmptyPcName = string.IsNullOrEmpty(pcName);
            Boolean notSearch = isEmptyHardCode && isEmptyPcName;

            if (notSearch)
                return;

            string sql = "SELECT * FROM Trial Where ";
            if (!isEmptyHardCode)
            {
                sql = sql + "( HardCode = '" + hardCode + "' )";
            }

            if (!isEmptyPcName)
            {
                if (!isEmptyHardCode)
                    sql = sql + " and ";
                sql = sql + "( PcName = '" + pcName + "' ) ";
            }
            sql = sql + "ORDER BY trialdate DESC";

            SqlDataSource1.SelectCommand = sql;
            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }

        protected void btnViewall_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM Trial ORDER BY trialdate DESC";
            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            Conn con = new Conn();
            DataTable dt = con.ExecuteDataTable("select count(*) from Trial", false);
            if (dt.Rows.Count > 0)
                lbTotal.Text = dt.Rows[0][0].ToString();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex != -1)
            {
                try
                {
                    string city, country;
                    Conn conn = new Conn();
                    if (string.Compare(e.Row.Cells[3].Text, "unknown", true) != 0
                        && !string.IsNullOrEmpty(e.Row.Cells[3].Text) && string.Compare(e.Row.Cells[3].Text, "&nbsp;", true) != 0)
                    {
                        conn.AddParamWithValue("@IP", e.Row.Cells[3].Text);
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
                            e.Row.Cells[4].Text = country;
                        else
                            e.Row.Cells[4].Text = city + ", " + country;
                    }
                }
                catch 
                {
                    e.Row.Cells[4].Text = "unknown";    
                }
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private string getDateUser(DateTime dt)
        {
            int UseCount = 0;

            string sql = "select UserCount from TrialDaily where Time = '" + dt + "'";
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
    }
}
