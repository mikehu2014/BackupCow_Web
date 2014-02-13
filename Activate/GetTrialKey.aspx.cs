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
using Decryption;

namespace BackupCowWeb.Activate
{
    public partial class GetTrialKey : System.Web.UI.Page
    {
        const int trialDay = 15;
        const string HttpReq_HardCode = "HardCode";
        const string HttpReq_PcName = "PcName";
        const string HttpReq_PcID = "PcID";
        const string HttpReq_Account = "Account";

        protected void Page_Load(object sender, EventArgs e)
        {
            string hardcode = HttpContext.Current.Request[ HttpReq_HardCode ];
            string pcName = HttpContext.Current.Request[HttpReq_PcName];
            string pcID = HttpContext.Current.Request[HttpReq_PcID];
            string accountName = HttpContext.Current.Request[HttpReq_Account];
            string ip = RemoteIpReader.ReadIp();

            string key = string.Empty;

            if (string.IsNullOrEmpty(hardcode))
            {
                Response.Clear();
                Response.Write(key);
                Response.End();
                return;
            }

                // 版本兼容
            if (string.IsNullOrEmpty(pcID))
                if (hardcode.Length >= 20)
                    pcID = pcName;
                else
                    pcID = hardcode;
            
                
                // 记录试用信息
            if (!TrialHandle.checkExist(hardcode, pcName))
            {
                TrialInfo t = new TrialInfo(hardcode);
                t.setPcInfo(pcName, ip);
                t.setTrialTime(DateTime.UtcNow);
                t.setAccountInfo(pcID, accountName);
                
                TrialHandle.addTrial(t);

                TrialDaily td = new TrialDaily();
                td.Upgrade();
            };

            DateTime trialTime = TrialHandle.getTrialTime(hardcode);
            key = BigInteger.GetKey(hardcode, 0, trialTime, trialDay); 

            Response.Clear();
            Response.Write(key);
            Response.End();
        }
    }
}
