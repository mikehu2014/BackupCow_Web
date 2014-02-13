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
using BackupCowWeb.Activate;

namespace WebApplication1
{
    public partial class WebForm1 : IMSite.Admin.SupperAdminPage
    {       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string orderID = txtID.Text.Trim();
            string email = "";
            if (string.IsNullOrEmpty(orderID) && string.IsNullOrEmpty(email))
                return;

            string whereSql = " where ";
            if (!string.IsNullOrEmpty(orderID))
                whereSql += "( Orders.OrderID = '" + orderID + "')";
            if (!string.IsNullOrEmpty(email))
            {
                if (whereSql != " where ")
                    whereSql += " and ";
                whereSql += "( Orders.Email = '" + email + "')";
            }
            whereSql += " ";


            string sql = "SELECT Orders.isValid, Orders.OrderID, CAST(Orders.UserCount AS varchar) + '/' + CAST(Orders.ActiveUser AS varchar) + '/' + CAST(Orders.AdditionCount AS varchar) AS UserCount, CASE WHEN orders.adminid = - 1 THEN 'System' ELSE Administrator.Username END AS UserName, Orders.Days, Orders.OrderDate, Edition.EditionName, Orders.AccountName, Orders.Email, Orders.ServerCount FROM Orders LEFT OUTER JOIN Edition ON Orders.OrderEdition = Edition.EditionID LEFT OUTER JOIN Administrator ON Administrator.adminId = Orders.adminid" + whereSql + "ORDER BY Orders.OrderDate DESC";

            SqlDataSource1.SelectCommand = sql;
            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex != -1)
            {
                if (string.Compare(e.Row.Cells[8].Text, "True") == 0)
                    e.Row.Cells[8].Text = "¡Ì";
                else if (string.Compare(e.Row.Cells[8].Text, "False") == 0)
                    e.Row.Cells[8].Text = "¡Á";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT isValid, OrderID, (cast(UserCount as varchar) + '/' + cast(ActiveUser as varchar) + '/' + cast(AdditionCount as varchar)) as UserCount, CASE WHEN orders.adminid = - 1 THEN 'System' ELSE Administrator.Username END as UserName, Days, OrderDate, Edition.EditionName, AccountName FROM Orders LEFT OUTER JOIN Edition ON OrderEdition = Edition.EditionID LEFT OUTER JOIN Administrator ON Administrator.adminId = Orders.adminid ORDER BY OrderDate DESC";
            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string sql = string.Empty;

            if (string.Compare(GridView1.Rows[e.NewSelectedIndex].Cells[8].Text.ToString().Trim(), "¡Ì") == 0)
                sql = "Update Orders set Isvalid = 0 where OrderID = '" + GridView1.Rows[e.NewSelectedIndex].Cells[1].Text.ToString().Trim() + "'";
            else
                sql = "Update Orders set Isvalid = 1 where OrderID = '" + GridView1.Rows[e.NewSelectedIndex].Cells[1].Text.ToString().Trim() + "'";

            Conn con = new Conn();
            con.ExecuteNonQueryD(sql);
            GridView1.DataBind();
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            Conn con = new Conn();
            DataTable dt = con.ExecuteDataTable("select count(*) from orders", false);
            if (dt.Rows.Count > 0)
                Label2.Text = "Orders Count: " + dt.Rows[0][0].ToString();
        }
    }
}
