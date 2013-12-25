<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <center>
        <div style="background-color:#2B579A;width:417px; padding:32px">
        <div style="background-color:#E9E9E9; height:139px; padding:32px">
            <div style="float:left; font-family: Arial, Helvetica, sans-serif; text-align: right; font-size: 8pt; font-weight: 700;">
                <div style="height:30px; width:120px;">User Name:</div>
                <div style="height:30px; width:120px;">Password:</div>
            </div>
            <div style="float:left; text-align: left; margin-left: 10px;">
                <div style="height:30px; width:180px;">
                    <asp:TextBox runat="server" ID="txtUserName">challan</asp:TextBox>
                </div>
                <div style="height:30px; width:180px;">
                     <asp:TextBox runat="server" ID="txtPassword" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div style="clear:both;float:left;margin-top: 17px; width: 314px;">
                <asp:Button runat="server" ID="btnLogin" Text="Login" onclick="btnLogin_Click"/>
            </div>
            <div style="clear:both;float:left;margin-top: 17px; width: 314px;">
                <asp:Label runat="server" ID="lblError" EnableViewState="False" style="font-size: 8pt; color: #CC0000"/>
            </div>
        </div>
    </div>
    </center>
    </form>
</body>
</html>
