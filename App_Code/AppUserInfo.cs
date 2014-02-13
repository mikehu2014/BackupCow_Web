using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using IMSite.Data;
using System.Data.SqlClient;

/// <summary>
/// AppUserInfo 的摘要说明
/// </summary>
public class AppUserInfo
{
    private string PcID;
    private string PcName;
    private string Ip;
    private string NetworkMode;
    private int NetworkPc;
    private int LocalBackup;
    private int NetworkBackup;
    private string BackupAnalyze;
    private string Account;
    private string Status;

    public AppUserInfo(string _PcID, string _PcName)
    {
        PcID = _PcID;
        PcName = _PcName;
    }

    public void SetNetworkInfo(string _Ip, string _NetworkMode, int _NetworkPc)
    {
        Ip = _Ip;
        NetworkMode = _NetworkMode;
        NetworkPc = _NetworkPc;
    }

    public void SetBackupInfo(int _LocalBackup, int _NetworkBackup)
    {
        LocalBackup = _LocalBackup;
        NetworkBackup = _NetworkBackup;
    }

    public void SetBackupAnalyze(string _BackupAnalyze)
    {
        BackupAnalyze = _BackupAnalyze;
    }

    public void SetAccount(string _Account)
    {
        Account = _Account;
    }

    public void SetStatus(string _Status)
    {
        Status = _Status;
    }

    public void MarkApp()
    {
        DateTime LastRun = getAppLastRunTime();
        if( LastRun == DateTime.MinValue )  // 是否第一次运行
            FirstUse();
        else   // 是否同一天运行
        if ((LastRun.Year == DateTime.Now.Year) && (LastRun.Month == DateTime.Now.Month) && (LastRun.Day == DateTime.Now.Day))
            return;
        else   // 刷新运行信息
        {
            int UseCont = getUseCount();
            UseCont++;
            UpdateLastUse(UseCont);
        }
    }

    private DateTime getAppLastRunTime()
    {
        DateTime LastRun = DateTime.MinValue; 

        Conn con = new Conn();
        string sql = "SELECT LastUse FROM AppUser Where PcID = '" + PcID + "'";
        SqlDataReader sdr = con.ExecuteReaderD(sql);
        if (sdr.Read())
        {
            try
            {
                LastRun = DateTime.Parse(sdr["LastUse"].ToString());
            }
            catch { }

        }
        sdr.Close();

        return LastRun;
    }

        // 获取使用次数
    private int getUseCount()
    {
        int UseCount = 0;

        Conn con = new Conn();
        string sql = "SELECT UseCount FROM AppUser Where PcID = '" + PcID + "'";
        SqlDataReader sdr = con.ExecuteReaderD(sql);
        if (sdr.Read())
        {
            UseCount = int.Parse(sdr["UseCount"].ToString());
        }
        sdr.Close();

        return UseCount;    
    }

        // 第一次运行时调用
    private void FirstUse()
    {
        string sql = "insert into AppUser ( PcID, PcName, FirstUse, LastUse, UseCount, IP, LocalBackup, NetworkBackup, NetworkMode, NetworkPc, BackupAnalyze, Account, Status ) values ";
        sql = sql + "( '" + PcID + "', '" + PcName + "', '" + DateTime.Now + "', '" + DateTime.Now + "', " + 1 + ", '" + Ip + "' ";
        sql = sql + ", " + LocalBackup + ", " + NetworkBackup + ", '" + NetworkMode + "', " + NetworkPc + ", '" + BackupAnalyze + "', '" + Account + "', '" + Status + "' )";

        Conn con = new Conn();
        try
        {
            con.ExecuteNonQueryD(sql);
        }
        catch { };
    }

        // 第N+1次运行时调用
    private void UpdateLastUse(int UseCount)
    {
        string sql = "UPDATE AppUser SET LastUse = '" + DateTime.Now + "', UseCount = " + UseCount + ", IP = '" + Ip + "'";
        sql = sql + ", LocalBackup = " + LocalBackup + ", NetworkBackup = " + NetworkBackup + ", NetworkMode = '" + NetworkMode + "'";
        sql = sql + ", NetworkPc = " + NetworkPc + ", BackupAnalyze = '" + BackupAnalyze + "', Account = '" + Account + "', Status = '" + Status + "' where PcID = '" + PcID + "'";

        Conn con = new Conn();
        try
        {
            con.ExecuteNonQueryD(sql);
        }
        catch { };         
    }
}
