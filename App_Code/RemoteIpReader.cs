using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// RemoteIpReader 的摘要说明
/// </summary>
public class RemoteIpReader
{
    public RemoteIpReader()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    static public string ReadIp()
    {
        string userIP = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (string.IsNullOrEmpty(userIP) || userIP.IndexOf("unknown", StringComparison.OrdinalIgnoreCase) > -1)
        {
            userIP = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_REAL_IP"];
            if (string.IsNullOrEmpty(userIP) || userIP.IndexOf("unknown", StringComparison.OrdinalIgnoreCase) > -1)
                userIP = System.Web.HttpContext.Current.Request.UserHostAddress;
            else if (userIP.IndexOf(",") > -1)
                userIP = userIP.Substring(0, userIP.IndexOf(","));
        }
        else if (userIP.IndexOf(",") > -1)
            userIP = userIP.Substring(0, userIP.IndexOf(","));

        return userIP.Trim();
    }
}
