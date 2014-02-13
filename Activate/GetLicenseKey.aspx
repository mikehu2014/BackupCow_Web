<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetLicenseKey.aspx.cs" Inherits="BackupCowWeb.Activate.GetLicenseKey" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Backup Cow System</title>
    <meta content="Backup Cow can transform your networked computers into a private cloud that acts as your private dropbox. You can backup, synchronize, encrypt and share your files across LAN or Internet/Intranet. Any network users can choose to be a cloud storage contributor or consumer or both."
        name="description" />
    <meta name="keywords" content="backup spoftware,cloud backup,backup solutions,backup cloud storage,private cloud,private cloud storage, cloud backup software,build private cloud,cloud backup solution,cloud file storage,network backup solution,back up your computer,back up my files,back up my computor,back up your files,backup,restore,synchronize,synchronization,sync,synchronize files, file synchronization,private dropbox" />
    <link href="../backupcow.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="../css/reset.css" type="text/css" />
    <link rel="stylesheet" href="../css/style1.css" type="text/css" />
    <link rel="stylesheet" href="../css/menu_top.css" type="text/css" />
    <link rel="stylesheet" href="../css/menu_bottom.css" type="text/css" />
</head>
<body>
    <div id="container">
        <div id="header">
        </div>
        <div id="top">
            <div>
                <ul id="nav_top">
                    <li><a href="http://www.BackupCow.com">
                        <img alt="Home" src="../images/home_icon-trans.png"><span>Home</span></a></li>
                    <li><a href="../../EditionComparison.asp">
                        <img alt="Products" src="../images/products_icon-trans.png"><span>Features</span></a></li>
                    <li><a href="../../Download.asp">
                        <img alt="Download" src="../images/download_icon-trans.png"><span>Download</span></a></li>
                    <li><a href="../../Screenshots.asp">
                        <img alt="Screenshots" src="../images/products_icon-screen.png"><span>Screenshots</span></a></li>
                    <li><a href="../../BuyNow.asp">
                        <img alt="BuyNow" src="../images/cart_icon-trans.png"><span>BuyNow</span></a></li>
                    <li><a href="../../support.asp">
                        <img alt="Support" src="../images/help_icon-trans.png"><span>Online Manual</span></a></li>
                    <li><a href="../../ContactUs.asp">
                        <img alt="Contact Us" src="../images/contact_icon-trans.png"><span>Contact Us</span></a></li>
                    <li><a href="../../sitemap.asp">
                        <img alt="SiteMap" src="../images/sitemap_icon-trans.png"><span>Site Map</span></a></li>
                </ul>
            </div>
        </div>
        <div id="poster">
            <div class="postergroup">
                <div class="posteritem">
                    <img src="../images/kc_products.jpg" alt="BackupCow" /><div class="clr">
                    </div>
                </div>
            </div>
        </div>
        <div id="spaceBar">
        </div>
        <form id="form1" runat="server">
            <div id="mainMenuWrapper">
                <table style="margin-top: 5px">
                    <tr>
                        <td>
                            <span style="padding: 0px 20px 0px 0px">
                                <img src="../images/Nav.jpg" alt="" />&nbsp;<a href="../download.aspx" style="color: Gray">Downloading
                                    Statistic</a> </span>
                        </td>
                        <td>
                            <span style="padding: 0px 20px 0px 0px">
                                <img src="../images/Nav.jpg" alt="" />&nbsp;<a href="../Orders.aspx" style="color: Gray">Orders
                                    List</a> </span>
                        </td>
                        <td>
                            <span style="padding: 0px 20px 0px 20px">
                                <img src="../images/Nav.jpg" alt="" />&nbsp;<a href="../OrderAdd.aspx" style="color: Gray">Add
                                    a Order</a> </span>
                        </td>
                        <td>
                            <span style="padding: 0px 20px 0px 20px">
                                <img src="../images/Nav.jpg" alt="" />&nbsp;<a href="../Trial.aspx" style="color: Gray">Trial
                                    List</a> </span>
                        </td>
                        <td>
                            <span style="padding: 0px 20px 0px 20px">
                                <img src="../images/Nav.jpg" alt="" />&nbsp;<a href="../adminList.aspx" style="color: Gray">Admin
                                    List</a> </span>
                        </td>
                        <td>
                            <span style="padding: 0px 20px 0px 20px">
                                <img src="../images/Nav.jpg" alt="" />&nbsp;<a href="../AccountList.aspx" style="color: Gray">Group
                                    List</a> </span>
                        </td>
                        <td>
                            <span style="padding: 0px 20px 0px 20px">
                                <img src="../images/Nav.jpg" alt="" />&nbsp;<a href="../UseList.aspx" style="color: Gray">User
                                    List</a> </span>
                        </td>
                        <td>
                            <span style="padding: 5px 20px 0px 20px">
                                <img src="../images/Nav.jpg" alt="" />&nbsp;<a href="../Logout.aspx" style="color: Gray">Logout</a>
                            </span>
                        </td>
                    </tr>
                </table>
            </div>
            <table class="contentpaneopen" style="margin: 8px; line-height:25px">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Hard Code:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtHardCode" runat="server" Width="400px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHardCode"
                            ErrorMessage="Input hard code"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="lbOrderID" runat="server" Text="Order Number:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtOrderID" runat="server" Width="400px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOrderID"
                            ErrorMessage="Input order number"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="License:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtLicense" runat="server" Height="200px" ReadOnly="True" TextMode="MultiLine"
                            Width="400px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="padding-top:10px">
                        <asp:Button ID="btnGetLicense" runat="server" OnClick="btnGetLicense_Click" Text="Get License" Width="120px" /></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Label ID="lbResult" runat="server"></asp:Label></td>
                </tr>
            </table>
            <div class="clr">
            </div>
            <div id="containerHelper">
            </div>
            <!-- FOOTER -->
            <asp:SiteMapDataSource ID="SiteMapDS" runat="server" ShowStartingNode="False" />
        </form>
    </div>
    <div id="bottomContainer">
        <div id="bottomHelper">
            <div id="spaceBarBottom">
            </div>
            <div id="bottomMenuWrapper">
                <ul class="menu" id="nav_bottom">
                    <li><a href="../../Backup_Software.asp"><u>Backup Software</u></a></li>
                    <li class="lispa"><a href="../../Backup_Your_Computer.asp"><u>Backup Your Computer</u></a></li>
                    <li class="lispa"><a href="../../Cloud_File_Storage.asp"><u>Cloud File Storage</u></a></li>
                    <li class="lispa"><a href="../../Private_Cloud_Storage.asp"><u>Private Cloud Storage</u></a></li>
                    <li class="lispa"><a href="../../Build_Private_Cloud.asp"><u>Build Private Cloud</u></a></li>
                    <li class="lispa"><a href="../../Network_Backup_Solutions.asp"><u>Network Backup Solutions</u></a></li>
                    <li class="lispa"><a href="../../Private_Cloud_Sync_Software.asp"><u>Private Could Sync
                        Software</u></a></li>
                </ul>
                <ul class="menu" id="nav_bottom3">
                    <li class="lispa"><a href="../../Sync_Files_Between_Computers.asp"><u>Sync Files Between
                        Computers</u></a></li>
                    <li class="lispa"><a href="../../Cloud_Backup_Solutions.asp"><u>Cloud Backup Solutions</u></a></li>
                    <li class="lispa"><a href="../../Cloud_Backup_Software.asp"><u>Cloud Backup Software</u></a></li>
                    <li class="lispa"><a href="../../Resources.asp"><u>Resources</u></a></li>
                </ul>
                <ul class="menu" id="nav_bottom2">
                    <li>CodingBest Products:</li>
                    <li><a href="http://www.Chat4Support.com" target="_blank"><u>Chat4Support</u></a></li>
                    <li class="lispa"><a href="http://www.KeywordCompeting.com" target="_blank"><u>Keyword
                        Competing</u></a></li>
                    <li class="lispa"><a href="http://www.FolderTransfer.com" target="_blank"><u>Folder
                        Transfer</u></a></li>
                    <li class="lispa"><a href="http://www.DuplicateFilter.com" target="_blank"><u>Duplicate
                        Filter</u></a></li>
                    <li class="lispa"><a href="http://www.TextFinding.com" target="_blank"><u>Text Finding</u></a></li>
                    <li class="lispa"><a href="http://www.U5Me.com" target="_blank"><u>U5Me</u></a></li>
                </ul>
            </div>
            <div id="bottomMenuWrapper1">
                <ul class="menu" id="nav_bottom1">
                    <li>Copyright &copy; 2003 - 2012 Coding Best Software</li>
                    <li class="lispa"><a href="../../aboutUs.asp">About Us</a></li>
                    <li class="lispa"><a href="../../contactUs.asp">Contact Us</a></li>
                    <li class="lispa"><a href="../../PrivacyPolicy.asp">Privacy Policy</a></li>
                    <li class="lispa"><a href="../../Terms.asp">Terms of Services</a></li>
                    <li class="lispa"><a href="../../blog">Blog</a></li>
                    <li class="lispa"><a href="../../SiteMap.asp">Site-Map</a></li>
                    <li class="lispa"><a href="http://www.itlogic.com.pl" target="_blank">Webpages Designed
                        by ITLogic</a></li>
                </ul>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>

    <script type="text/javascript">
function fixPng() { 
  var arVersion = navigator.appVersion.split("MSIE") 
  var version = parseFloat(arVersion[1]) 
 
  if ((version >= 5.5 && version < 7.0) && (document.body.filters)) { 
      for(var j=0; j<document.images.length; j++)
       {
          var img = document.images[j]
          var imgName = img.src.toUpperCase()
          if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
          {
             var imgID = (img.id) ? "id='" + img.id + "' " : ""
             var imgClass = (img.className) ? "class='" + img.className + "' " : ""
             var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
             var imgStyle = "display:inline-block;" + img.style.cssText
             if (img.align == "left") imgStyle = "float:left;" + imgStyle
             if (img.align == "right") imgStyle = "float:right;" + imgStyle
             if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
             var strNewHTML = "<span " + imgID + imgClass + imgTitle
             + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
             + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
             + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>"
             img.outerHTML = strNewHTML
             j = j-1
			}
		}		
	}
} 
fixPng();
    </script>

</body>
</html>
