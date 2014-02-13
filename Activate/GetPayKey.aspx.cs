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
using BackupCowWeb.Order;

namespace BackupCowWeb.Activate
{
    public partial class GetPayKey : System.Web.UI.Page
    {
        const string ActivateResult_OK = "OK";
        const string ActivateResult_Error = "Error";
        const string Split_Result = "|";

        const string HttpReq_HardCode = "HardCode";
        const string HttpReq_OrderID = "OrderID";
        const string HttpReq_PcName = "PcName";

        public const string ErrorResult_NotExist = "Order number does not exist.";
        public const string ErrorResult_UserLack = "The quantity of computers you select to register is more than the remaining license quantity. ( User count remains {0} ).";

        
        protected void Page_Load(object sender, EventArgs e)
        {
            string hardcode = HttpContext.Current.Request[HttpReq_HardCode];
            string orderid = HttpContext.Current.Request[HttpReq_OrderID];
            string pcName = HttpContext.Current.Request[HttpReq_PcName];
            string ip = RemoteIpReader.ReadIp();
            DateTime activateTime = DateTime.UtcNow;
            
            //ReceiveMail Rec = new ReceiveMail();
            //Rec.Receive();

            if (string.IsNullOrEmpty(hardcode) || string.IsNullOrEmpty(orderid) || string.IsNullOrEmpty(pcName))
            {
                Response.Clear();
                Response.Write("");
                Response.End();
                return;
            }

                // 如果 Order 不存在， 则 检测 邮箱
            if (!Order.Order.OrderExist(orderid))
                OrderMail.CheckOrderExist(orderid);

            string ResultStr = "";

            TOrderInfo OrderInfo = Order.Order.getOrderInfo(orderid);
            TActivateInfo ActivateInfo = new TActivateInfo(orderid, hardcode);
            ActivateInfo.setPcInfo(pcName, ip, "");
            ActivateInfo.setActivateTime(activateTime);
            if (OrderInfo == null) // 订单不存在
                 ResultStr = ActivateResult_Error + Split_Result + ErrorResult_NotExist;      
            else 
            if( !Activation.activatePc(ActivateInfo))  // 没有足够的剩余激活数量
                ResultStr = ActivateResult_Error + Split_Result + String.Format( ErrorResult_UserLack, 0 );   
            else   // 激活成功
            {
                DateTime oldActivateTime = Activation.getActivateTime(OrderInfo.orderID, hardcode);
                string key = BigInteger.GetKey(hardcode, OrderInfo.edition, oldActivateTime, OrderInfo.days);
                ResultStr = ActivateResult_OK + Split_Result + key;
            }

            Response.Clear();
            Response.Write(ResultStr);
            Response.End();
        }
    }
}
