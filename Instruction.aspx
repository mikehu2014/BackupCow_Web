<%@ Page Language="C#" MasterPageFile="RemoteGroup.Master" AutoEventWireup="true"
    CodeFile="Instruction.aspx.cs" Inherits="Instruction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="font-size: 12px; line-height: 20px">
        <div style="color: Blue">
            <strong>Backup Cow users can connect together by joining a same remote network group.</strong>
        </div>
        <div>
            <strong>Here are the steps to use this feature:</strong>
        </div>
        <div style="padding-top: 5px">
            1. Click <a href="RemoteGroup.aspx" target="_blank">here</a> to create a network
            group account. (If you already have a group account, please disregard this step.)
        </div>
        <div>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images1/Manual/Signup.jpg" /></div>
        <div style="padding-bottom: 5px">
            2. Input the group name and password, then click OK. (Remote Network - Join a Group
            )
        </div>
        <div style="padding-bottom: 10px">
            <asp:Image ID="Image5" runat="server" ImageUrl="~/images1/Manual/Joinagroup.jpg" /></div>
        <div>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/images1/Manual/120_RenoteNetwork_Input.jpg" /></div>
        <div style="padding-top: 5px">
            3. Thereafter, you just need to select the group name showing under "Remote Network"
            to join the group, no need to input the group name and password again.
        </div>
        <div>
            <asp:Image ID="Image4" runat="server" ImageUrl="~/images1/Manual/130_RemoteNetwork_Enter.jpg" /></div>
        <div>
            Notes:</div>
        <div>
            * You can also make the remote connection settings in "Settings-- Remote Network"</div>
        <div>
            * If you forget your account password, you can click here to reset the password.</div>
        <div>
            * You can set up more than one remote network group, and choose any network group
            to join.</div>
        <div>
            * Backcow Server will act as a IP/Port parser so that Backup Cow users in the same
            group can connect together automatically.</div>
        <div style="padding-top: 5px">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/images1/Manual/Remote1.jpg" /></div>
    </div>
</asp:Content>
