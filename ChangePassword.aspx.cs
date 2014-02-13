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

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        string GroupName = txtGroupName.Text;
        string OldPassword = txtOldPassword.Text;
        string NewPassword = txtNewPassword.Text;
        string NewPassword2 = txtNewPassword2.Text;
        string OldPasswordMD5 = FormsAuthentication.HashPasswordForStoringInConfigFile(OldPassword, "MD5");
        string NewPasswordMD5 = FormsAuthentication.HashPasswordForStoringInConfigFile(NewPassword, "MD5");
        string ShowResult;

        if (!readGroupIsExist(GroupName))
        {
            ShowResult = "Group Name Not Exist";      
        }
        else if (readGroupPassword(GroupName) != OldPasswordMD5)
        {
            ShowResult = "Old password is incorrect";
        }
        else if (NewPassword != NewPassword2)
        {
            ShowResult = "Password Not Match";
        }
        else
        {
            setGroupPassword(GroupName, NewPasswordMD5);
            ShowResult = "Success";
        }
        lbResult.Text = ShowResult;
    }
    private Boolean readGroupIsExist(string GroupName)
    {
        Conn con = new Conn();
        string sql = "SELECT * FROM CompanyNetwork Where CompanyName = '" + GroupName + "'";
        DataTable dt = con.ExecuteDataTable(sql, false);
        if (dt.Rows.Count > 0)
            return true;
        else
            return false;
    }
    private string readGroupPassword(string GroupName)
    {
        string sql = "SELECT Password FROM CompanyNetwork Where CompanyName = '" + GroupName + "'";
        Conn con = new Conn();
        SqlDataReader sdr = con.ExecuteReaderD(sql);
        string Password = "";
        if (sdr.Read())
            Password = sdr["Password"].ToString();
        sdr.Close();
        return Password;
    }
    private void setGroupPassword(string GroupName, string Password)
    {
        string sql = "UPDATE CompanyNetwork SET Password = '" + Password + "' ";
        sql = sql + "where CompanyName = '" + GroupName + "'";

        Conn con = new Conn();
        try
        {
            con.ExecuteNonQueryD(sql);
        }
        catch { };  
    }
}
