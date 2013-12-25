<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RevenueCollected.aspx.cs" Inherits="cash_deposit_by_owner" %>

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
           font-size:11pt 
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div class="client_heading">Security Deposited</div>

    <div style="height: 66px; margin-top: 5px">
        <div class="find">
            <asp:Label ID="Label2" runat="server" Text="">From:</asp:Label>
        </div>

        <div class="txt">
            <asp:TextBox ID="txtStartDate" runat="server" Width="66" Text="20/3/2013"></asp:TextBox>
        </div>

        <div class="find" style="width:32px">
            <asp:Label ID="Label3" runat="server" Text="">To:</asp:Label>
        </div>

        <div class="txt">
            <asp:TextBox ID="txtEndDate" runat="server" Width="66" Text="20/3/2013"></asp:TextBox>
        </div>

       <div class="btn">
            <asp:Button ID="btnSubmit" runat="server" Text="Read" 
                onclick="btnSubmit_Click" />
        </div> 
    </div>

    <div style="clear:both; margin-left:31px; margin-top:14px; font-size:10pt; height: 21px; margin-bottom: 0px;">
        <asp:Label ID="txtLbl" runat="server" Text=""></asp:Label>
        <asp:Label ID="txtMoney" runat="server" Text=""></asp:Label>

    </div>
</asp:Content>





