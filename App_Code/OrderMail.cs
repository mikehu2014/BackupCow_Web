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
using System.Collections.Generic;
using BackupCowWeb.Order;
using System.Text.RegularExpressions;

namespace BackupCowWeb.Order
{
    public class OrderMail
    {
        const string Gmail_Adress = "pop.gmail.com";
        const int Gmail_Port = 995;

        const string Gmail_AccountName = "backupcow@gmail.com";
        const string Gmail_Password = "share18bc";

        const string EmailEdition_Profession = "pro";
        const string EmailEdition_Enterprise = "ent";

        const string EmailEdition_Profession_Per = "prp";
        const string EmailEdition_Enterprise_Per = "enp";

        const string EmailEdition_Profession_Server = "prs";

        const string EmailEdition_OneServer = "cs1";
        const string EmailEdition_TwoServer = "cs2";
        const string EmailEdition_ThreeServer = "cs3";
        const string EmailEdition_FiveServer = "cs5";
        const string EmailEdition_TenServer = "cs10";

        const int OrderEdition_Profession = 1;
        const int OrderEdition_Enterprise = 2;

        const int OrderEdition_OneServer = 3;
        const int OrderEdition_TwoServer = 4;
        const int OrderEdition_ThreeServer = 5;
        const int OrderEdition_FiveServer = 6;
        const int OrderEdition_TenServer = 7;

        const int OrderDay_Year = 365;
        const int OrderDay_Permanent = 365000;

        const string Account_Normal = "";
        const string Account_CA = "CA";
        const string Account_Server = "Server";

            // 检测 email 是否已开通订单
        static public void CheckOrderExist(string OrderID)
        {
            Pop3MailClient GmailClient = new Pop3MailClient( Gmail_Adress, Gmail_Port, true, Gmail_AccountName, Gmail_Password );
            GmailClient.IsAutoReconnect = true;
            GmailClient.ReadTimeout = 60000;
            try
            {     // 登录
                GmailClient.Connect();
            }
            catch
            {
                return;
            }
                
                // 获取邮箱信息    
            int NumberOfMails, MailboxSize;
            GmailClient.GetMailboxStats(out NumberOfMails, out MailboxSize);
            if (NumberOfMails == 0) // 没有邮件
            {
                GmailClient.Disconnect();
                return;
            }
                
                // 获取邮件集合信息
            List<EmailUid> EmailUids;
            if (GmailClient.GetUniqueEmailIdList(out EmailUids))
            {
                for (int i = EmailUids.Count - 1; i >= 0; i--)
                {
                        // 获取 email 内容
                    int eMailUid = EmailUids[i].EmailId; 
                    string eMailContent;
                    GmailClient.GetRawEmail(eMailUid, "", out eMailContent);
                    if (string.IsNullOrEmpty(eMailContent)) // 没有内容
                        continue;

                        // 提取 Order Number
                    string eMailOrderID = FindOrderNum(eMailContent); 
                    if (eMailOrderID != OrderID) // 与激活邮件不相同, 跳过
                        continue;

                        // 邮件插入数据库
                    InserOrderMail(eMailUid, eMailContent);

                        // 提取 版本号
                    int orderEdition = FindOrderEdition(eMailContent);
                    if (orderEdition == -1) // 格式错误
                        continue;

                        // 获取 使用日期
                    int orderDay = OrderDay_Permanent;

                        // 提取 用户数
                    int orderUserCount = FindUserCount(eMailContent);
                    if (orderUserCount == -1) // 格式错误
                        continue;

                        // 提取 日期
                    DateTime OrderDate = FindOrderDate(eMailContent);

                        // 获取 邮件体质
                    string Email = FindEmail(eMailContent);

                        // 获取 Account
                    string Account = FindAccount(eMailContent);

                        // Cloud版 客户端数
                    int ClientCount = 0;

                        // p2p版 和 cloud版
                    if ((orderEdition == OrderEdition_Profession) || (orderEdition == OrderEdition_Enterprise))
                    {
                        ClientCount = 0;
                    }
                    else
                    {
                        ClientCount = orderUserCount;
                        if (orderEdition == OrderEdition_OneServer)
                            orderUserCount = 1;
                        else
                        if (orderEdition == OrderEdition_TwoServer)
                            orderUserCount = 2;
                        else
                        if (orderEdition == OrderEdition_ThreeServer)
                            orderUserCount = 3;
                        else
                        if (orderEdition == OrderEdition_FiveServer)
                            orderUserCount = 5;
                        else
                        if (orderEdition == OrderEdition_TenServer)
                            orderUserCount = 10;
                        orderEdition = OrderEdition_Enterprise; 
                    }

                        // 添加到数据库
                    TOrderAddInfo OrderAddInfo = new TOrderAddInfo(OrderID, OrderDate, orderUserCount);
                    OrderAddInfo.setEditionInfo(orderEdition, orderDay);
                    OrderAddInfo.setUserInfo(Email, Account);
                    OrderAddInfo.setClientCount(ClientCount);
                    OrderAddInfo.Add();

                    return;
                }
             }
        }

            // 提取 Order Num
        static private string FindOrderNum(string eMailContent)
        {
            string OrderID = "";
            int n = eMailContent.IndexOf("Order Number:");
            if (n > -1)
            {
                OrderID = eMailContent.Substring(n + 13);
                n = OrderID.IndexOf("\r\n");
                if (n > -1)
                    OrderID = OrderID.Substring(0, n).Trim();
            }
            return OrderID;
        }

            // 插入数据库
        static private void InserOrderMail(int eMailUid, string eMailContent)
        {
            Conn con = new Conn();
            string sql = "Insert Into OrderEmail (Uid, EmailContent) values ('" + eMailUid + "', '" + eMailContent + "')";
            try
            {
                con.ExecuteNonQueryD(sql);
            }
            catch { }
        }

            // 版本号
        static private int FindOrderEdition(string eMailContent)
        { 
            int n = eMailContent.IndexOf("Product Number:");
            if (n > -1)
            {
                string tmpText = eMailContent.Substring(n + 15);
                n = tmpText.IndexOf("\r\n");
                if (n > -1)
                {
                    tmpText = tmpText.Substring(0, n);
                    if ((tmpText.IndexOf(EmailEdition_Enterprise) > -1) || (tmpText.IndexOf(EmailEdition_Enterprise_Per) > -1))
                        return OrderEdition_Enterprise;
                    else
                    if ((tmpText.IndexOf(EmailEdition_Profession) > -1) || (tmpText.IndexOf(EmailEdition_Profession_Per) > -1) || (tmpText.IndexOf(EmailEdition_Profession_Server) > -1))
                        return OrderEdition_Profession;
                    else
                    if(tmpText.IndexOf(EmailEdition_TenServer) > -1)
                        return OrderEdition_TenServer;
                    else
                    if(tmpText.IndexOf(EmailEdition_OneServer) > -1)
                        return OrderEdition_OneServer;
                    else
                    if(tmpText.IndexOf(EmailEdition_TwoServer) > -1)
                        return OrderEdition_TwoServer;
                    else
                    if(tmpText.IndexOf(EmailEdition_ThreeServer) > -1)
                        return OrderEdition_ThreeServer;
                    else
                    if(tmpText.IndexOf(EmailEdition_FiveServer) > -1)
                        return OrderEdition_FiveServer;

                }
            }
            return -1;
        }

            // User 数目
        static private int FindUserCount(string eMailContent)
        {
            int n = eMailContent.IndexOf("Quantity:");
            if (n > -1)
            {
                string tmpText = eMailContent.Substring(n + 9);
                n = tmpText.IndexOf("\r\n");
                if (n > -1)
                {
                    tmpText = tmpText.Substring(0, n);
                    try
                    {
                        return int.Parse(tmpText);
                    }
                    catch {}
                }
            }
            return -1;
        }

        // email
        static private string FindEmail(string eMailContent)
        {
            int n = eMailContent.IndexOf("Email Address:");
            if (n > -1)
            {
                string tmpText = eMailContent.Substring(n + 14);
                n = tmpText.IndexOf("\r\n");
                if (n > -1)
                {
                    tmpText = tmpText.Substring(0, n);
                    try
                    {
                        return tmpText;
                    }
                    catch { }
                }
            }
            return "";
        }

        static private int FindMoonStrToInt(string StrMoon)
        {
            switch (StrMoon)
            {
                case "Jan": return 1;
                case "Feb": return 2;
                case "Mar": return 3;
                case "Apr": return 4;
                case "May": return 5;
                case "Jun": return 6;
                case "Jul": return 7;
                case "Aug": return 8;
                case "Sep": return 9;
                case "Oct": return 10;
                case "Nov": return 11;
                case "Dec": return 12;
                default: return DateTime.Now.Month;
            }
        }


            // Order 日期
        static private DateTime FindOrderDate(string eMailContent)
        {
            int n = eMailContent.IndexOf(" Date: ");
            if (n > -1)
            {
                string tmpText = eMailContent.Substring(n + 7);
                n = tmpText.IndexOf("\r\n");
                if (n > -1)
                {
                    tmpText = tmpText.Substring(0, n).Trim();
                    string[] arr = Regex.Split(tmpText, @"\s+");
                    if (arr.Length == 5)
                    {
                        string Year = arr[4];
                        string Month = "" + FindMoonStrToInt(arr[1]);
                        string Day = arr[2];
                        string Time = arr[3];
                        DateTime dt;
                        if (DateTime.TryParse(Year + "-" + Month + "-" + Day + " " + Time, out dt))
                            return dt;
                    }
                }
            }
            return DateTime.Now;
        }

        // 使用日期
        static private string FindAccount(string eMailContent)
        {
            int n = eMailContent.IndexOf("Product Number:");
            if (n > -1)
            {
                string tmpText = eMailContent.Substring(n + 15);
                n = tmpText.IndexOf("\r\n");
                if (n > -1)
                {
                    tmpText = tmpText.Substring(0, n);
                    if ((tmpText.IndexOf(EmailEdition_Profession) > -1) || (tmpText.IndexOf(EmailEdition_Enterprise) > -1))
                        return Account_CA;
                    else
                    if ((tmpText.IndexOf(EmailEdition_Profession_Per) > -1) || (tmpText.IndexOf(EmailEdition_Enterprise_Per) > -1))
                        return Account_Normal;
                    else
                    if (tmpText.IndexOf(EmailEdition_Profession_Server) > -1)
                        return Account_Server;
                }
            }
            return Account_Normal;
        }

            // 使用日期
        static private int FindOrderDays(string eMailContent)
        {
            int n = eMailContent.IndexOf("Product Number:");
            if (n > -1)
            {
                string tmpText = eMailContent.Substring(n + 15);
                n = tmpText.IndexOf("\r\n");
                if (n > -1)
                {
                    tmpText = tmpText.Substring(0, n);
                    if ( (tmpText.IndexOf(EmailEdition_Profession) > -1)||(tmpText.IndexOf(EmailEdition_Enterprise) > -1))
                        return OrderDay_Year;
                    else
                        if ((tmpText.IndexOf(EmailEdition_Profession_Per) > -1) || (tmpText.IndexOf(EmailEdition_Enterprise_Per) > -1) || (tmpText.IndexOf(EmailEdition_Profession_Server) > -1))
                         return OrderDay_Permanent;
                }
            }
            return -1;
        }


    }
}
