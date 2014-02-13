using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Text; 

namespace ip
{

    public class SocketObj 
    { 
    private NetworkStream ns; 
    private bool _alreadyDispose = false; 
    #region 构造与释构 

    public  SocketObj(string url, int port) 
    { 
        Connection(url, port); 
    }
    ~SocketObj() 
    { 
        Dispose(); 
    } 
    protected virtual void Dispose(bool isDisposing) 
    { 
        if (_alreadyDispose) return; 
        if (isDisposing) 
        { 
            if (ns != null) 
        { 
        try 
        { 
            ns.Close(); 
        } 
        catch{ } 
        ns.Dispose(); 
        } 
        } 
        _alreadyDispose = true; 
    } 
    #endregion 

    #region IDisposable 成员 
    public void Dispose() 
    { 
        Dispose(true); 
        GC.SuppressFinalize(this); 
    } 
    #endregion 

    #region 打开端口 
        /// <summary> 
        /// 打开端口 
        /// </summary> 
        /// <param name="url">URL或者:IP地址</param> 
        /// <param name="port"></param> 
        /// <returns></returns> 
    public virtual void Connection(string url, int port) 
    { 
        if (url == null || url == "") return; 
        if (port < 0) return; 
        if (port.ToString()==string.Empty) port = 80; 
        TcpClient tcp = null; 
        try 
        { 
            tcp = new TcpClient(url, port); 
        } 
        catch (Exception E) 
        { 
            throw new Exception(E.Message+ "Can't connection:" + url); 
        } 
        this.ns = tcp.GetStream(); 
    } 
    #endregion 

    #region 发送Socket 
        /// <summary> 
        /// 发送Socket 
        /// </summary> 
        /// <param name="ns"></param> 
        /// <param name="message"></param> 
        /// <returns></returns> 
    public virtual bool Send(string message) 
    { 
        if (ns == null) return false; 
        if (message == null || message == "") return false; 
        byte[] buf = Encoding.ASCII.GetBytes(message); 
        try 
        { 
            ns.Write(buf, 0, buf.Length); 
        } 
        catch (Exception E) 
        { 
            throw new Exception(E.Message+"Send Date Fail!"); 
        } 
        return true; 
    } 
    #endregion 

    #region 收取信息 
    /// <summary> 
    /// 收取信息 
    /// </summary> 
    /// <param name="ns"></param> 
    /// <returns></returns> 
        public string Recev() 
        { 
            if (ns == null) return null; 
            byte[] buf = new byte[4096]; 
            int length = 0; 
            try 
            { 
            length = ns.Read(buf, 0, buf.Length); 
            } 
            catch (Exception E) 
            { 
            throw new Exception(E.Message+"Receive data fail!"); 
            } 
            return Encoding.ASCII.GetString(buf, 0, length); 
        
        } 
    #endregion 
    } 


    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

          string act = Request.QueryString["act"];
          if (string.IsNullOrEmpty(act)) act = "getip";

          string port = Request.QueryString["port"];
          if (string.IsNullOrEmpty(port)) port = "80";

          if (act == "getip")
          {
              Response.Write (RemoteIpReader.ReadIp());
          }
          else if (act == "gethttp")
          {

              string SendStr = "GET / HTTP/1.1\n";
              SendStr += "Accept: */*\n";
              SendStr += "Accept-Language: zh-cn\n";
              SendStr += "User-Agent: Mozilla/4.0";
              SendStr += "Accept-Encoding: deflate\n";
              SendStr += "Host: " + RemoteIpReader.ReadIp()+"\n";
              SendStr += "Connection: Keep-Alive\n";
              SendStr += "\n";
              SocketObj o = new SocketObj(RemoteIpReader.ReadIp(), Int32.Parse( port) ); //创建新对象 
              o.Send(SendStr); //发送数据 
              Response.Write(o.Recev()); //接收数据 
              o.Dispose(); //销毁对象 
          }
          else if (act == "getcmd")
          {


              string SendStr = "HELLO\n";
              SocketObj o = new SocketObj(RemoteIpReader.ReadIp(), Int32.Parse(port)); //创建新对象 
              o.Send(SendStr); //发送数据 
              Response.Write(o.Recev()); //接收数据 
              o.Dispose(); //销毁对象 
          }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {       
            TcpClient tcp = null;
            try
            {
                tcp = new TcpClient(RemoteIpReader.ReadIp(), 80);
            }
            catch (Exception E)
            {
                throw new Exception(E.Message+ "Can't connection:" + RemoteIpReader.ReadIp());
            }
            
            string SendStr = "GET / HTTP/1.1\n";
            SendStr += "Accept: */*";
            SendStr += "Accept-Encoding: deflate\n";
            SendStr += "\n";

            byte[] buf = Encoding.ASCII.GetBytes(SendStr);
            tcp.GetStream().Write(buf, 0, buf.Length);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //GET / HTTP/1.1
            //Accept: */*
            //Accept-Language: zh-cn
            //User-Agent: Mozilla/4.0
            //Accept-Encoding: gzip, deflate
            //Host: 127.0.0.1
            //Connection: Keep-Alive


            string SendStr = "GET / HTTP/1.1\n";
            SendStr += "Accept: */*\n";
            SendStr += "Accept-Language: zh-cn\n";
            SendStr += "User-Agent: Mozilla/4.0";
            SendStr += "Accept-Encoding: deflate\n";
            SendStr += "Host: 127.0.0.1\n";
            SendStr += "Connection: Keep-Alive\n";
            SendStr += "\n";
            SocketObj o = new SocketObj(RemoteIpReader.ReadIp(), 80); //创建新对象 
            o.Send(SendStr); //发送数据 
            Response.Write(o.Recev()); //接收数据 
            o.Dispose(); //销毁对象 
        }

    }
}
