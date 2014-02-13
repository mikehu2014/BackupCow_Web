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

public partial class AppRunMark : System.Web.UI.Page
{   
    const string HttpMarkRun_PcID = "PcID";
    const string HttpMarkRun_PcName = "PcName";
    const string HttpMarkRun_NetworkMode = "NetworkMode";
    const string HttpMarkRun_NetworkPc = "NetworkPc";
    const string HttpMarkRun_LocalBackup = "LocalBackup";
    const string HttpMarkRun_NetworkBackup = "NetworkBackup";
    const string HttpMarkApp_BackupAnalyze = "BackupAnalyze";
    const string HttpMarkApp_Account = "Account";
    const string HttpMarkApp_Status = "Status";


    protected void Page_Load(object sender, EventArgs e)
    {
        string PcID = HttpContext.Current.Request[HttpMarkRun_PcID];
        string PcName = HttpContext.Current.Request[HttpMarkRun_PcName];
        string IP = RemoteIpReader.ReadIp();
        if (string.IsNullOrEmpty(PcID) || string.IsNullOrEmpty(PcName))
        {
            Response.Clear();
            Response.Write("");
            Response.End();
            return;
        }

        string NetworkMode = HttpContext.Current.Request[HttpMarkRun_NetworkMode];
        string LocalBackupStr = HttpContext.Current.Request[HttpMarkRun_LocalBackup];
        string NetworkBackupStr = HttpContext.Current.Request[HttpMarkRun_NetworkBackup];
        if (string.IsNullOrEmpty(NetworkMode) || string.IsNullOrEmpty(LocalBackupStr) || string.IsNullOrEmpty(NetworkBackupStr))
        {
            Response.Clear();
            Response.Write("");
            Response.End();
            return;
        }

        int LocalBackup = 0;
        int.TryParse(LocalBackupStr, out LocalBackup);

        int NetworkBackup = 0;
        int.TryParse(NetworkBackupStr, out NetworkBackup);

        string NetworkPc = HttpContext.Current.Request[HttpMarkRun_NetworkPc];
        int NetworkPcCount = 0;
        int.TryParse(NetworkPc, out NetworkPcCount);

        string BackupAnalyze = HttpContext.Current.Request[HttpMarkApp_BackupAnalyze];
        string Account = HttpContext.Current.Request[HttpMarkApp_Account];

        string BackupStatus = HttpContext.Current.Request[HttpMarkApp_Status];

            // 记录Pc运行信息
        AppUserInfo au = new AppUserInfo(PcID, PcName);
        au.SetNetworkInfo(IP, NetworkMode, NetworkPcCount);
        au.SetBackupInfo(LocalBackup, NetworkBackup);
        au.SetBackupAnalyze(BackupAnalyze);
        au.SetAccount(Account);
        au.SetStatus(BackupStatus);
        au.MarkApp();

            // 记录每日统计信息
        DailyUserInfo du = new DailyUserInfo();
        du.Upgrade();
    }
}
