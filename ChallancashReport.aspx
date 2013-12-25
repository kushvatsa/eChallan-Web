<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChallancashReport.aspx.cs" Inherits="ChallancashReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <style type="text/css">
      .client_heading
        {
	        font-size:16pt;
	        margin-top:24px;
	     margin-left:24px;
        }
        
        .find
        {
           float:left; 
           margin-top:31px; 
           margin-left:24px; 
           width:50px; 
           font-size:11pt; 
        }
        
        .ddl
        {
            float:left; 
            margin-top:31px; 
            width:100px;   
        }
        
        .txt
        {
            float:left; 
            margin-top:30px;
        }
        
        .btn
        {
            float:left; 
            margin-top:30px; 
            margin-left:10px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server"> <div class="client_heading">Revenue Collected through Challans</div>
    <div style="height: 80px; width: 349px">
        <div class="find"><asp:Label ID="lblFrom" runat="server" Text="">From:</asp:Label></div>
        <div class="txt"> <asp:TextBox ID="txtStartDate" runat="server" Width="66" ></asp:TextBox></div>
        <div class="find" style="width:32px"> <asp:Label ID="lblTo" runat="server" Text="">To:</asp:Label></div>
        <div class="txt"><asp:TextBox ID="txtEndDate" runat="server" Width="66"></asp:TextBox> </div>
        <div class="btn"> <asp:Button ID="btnSubmit" runat="server" Text="Read" onclick="btnSubmit_Click" /></div>
    </div>
    <div style="margin-left:26px; font-size:10pt">
  <asp:Label ID="lblCash" runat="server"></asp:Label>
    <asp:Label ID="lblMoney" runat="server"></asp:Label></div>
</asp:Content>

