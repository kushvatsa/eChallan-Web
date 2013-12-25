<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChallanReceipt.aspx.cs" Inherits="slip" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title></title>
    <style type="text/css">
        .event
        {
                height:26px;
            	font-size:10pt;
        }
    </style>
</head>
<body style=" margin:0px; font-family: Arial, helvetica Sans-Serif;">
    <form id="form1" runat="server">
    <div style="background-color:#eeeeee;height:360px;width:300px; margin-left:450px; margin-top:100px; border:1px solid #ADB9CD;">
           <div style="height:30px;font-size:16pt;"> 
               <center style="background-color: #2B579A; color: #FFFFFF;">Challan Receipt</center>  </div>
           <div style="float:right; font-size:10pt"><asp:Label ID="lblDate" runat="server" Enabled="false" ></asp:Label></div>
            <div style=" margin-top: 24px; margin-left: 15px; float: left; font-size: 10pt;"> 
                <div class="event"> ReceiptNo :</div>
                <div class="event"> VehicleNo :</div>
                <div class="event"> Name :</div>
                <div class="event"> Challan :</div>
                <div class="event"> Fine :</div>
                <div class="event"> Place :</div>
                <div class="event"> Operator :</div>
            </div>
            <div style=" margin-top:24px; float: left;" >
                <div class="event"><asp:Label ID="lblReceiptNo" runat="server"></asp:Label></div>
                <div class="event"><asp:Label ID="lblVehicleNo" runat="server" ></asp:Label>   </div>
                <div class="event"><asp:Label ID="lblName" runat="server"></asp:Label>  </div>
                <div class="event"><asp:Label ID="lblChallan" runat="server"></asp:Label></div>
                <div class="event"><asp:Label ID="lblFine" runat="server"></asp:Label> </div>
                <div class="event"><asp:Label ID="lblPlace" runat="server"></asp:Label></div>
                <div class="event"><asp:Label ID="lblOperator" runat="server"></asp:Label></div> 
            </div>
        
            <div class="event" style="clear:both ; margin-top:20px;margin-left:15px"> Sign:</div>
    </div>
    </form>
</body>
</html>
