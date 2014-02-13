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

public partial class Suggession : System.Web.UI.Page
{
    string Email;
    string MessageStr;
    protected void Page_Load(object sender, EventArgs e)
    {
        Email = Request.QueryString["email"];
        MessageStr = Request.QueryString["message"];

        if (string.IsNullOrEmpty(Email) || string.IsNullOrEmpty(MessageStr))
        {
            Response.Clear();
            Response.Write("");
            Response.End();
            return;
        }

        InsertMessage();

        Response.Write("Completed");
    }

    private void InsertMessage()
    {
        string sql = "insert into Suggession ( Email, Message, MessageTime, IP ) values ";
        sql = sql + "( '" + Email + "', '" + MessageStr + "', '" + DateTime.Now + "', '" + RemoteIpReader.ReadIp() +"')";
        try
        {
            Conn con = new Conn();
            con.ExecuteNonQueryD(sql);
        }
        catch { };
    }
}
