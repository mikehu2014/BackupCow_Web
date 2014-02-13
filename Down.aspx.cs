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

public partial class Down : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlParameter p1 = new SqlParameter("@ip", SqlDbType.VarChar, 15);
        p1.Value = Request.UserHostAddress;
        SqlParameter p2 = new SqlParameter("@vTag", SqlDbType.VarChar, 30);
        p2.Value = Request.QueryString["vTag"];

        ArrayList ary = new ArrayList();
        ary.Add(p1);
        ary.Add(p2);
        Conn.ExecuteNonQuerySP("Insert_Download", ary);

        //Response.Write("<script language=javascript>window.opener=null;window.open( '', '_self');window.close();</script>");
        Response.Redirect("http://web.chat4support.com/weboperator/down.aspx?vTag=" + Request.QueryString["vTag"] + "&From=BackupCow");
    }
}