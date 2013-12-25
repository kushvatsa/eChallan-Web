<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChallanIssuedReport.aspx.cs" Inherits="ChallanIssuedReport" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div class="client_heading">Challan Issued</div>
   
    <div style="height: 76px; margin-top: 5px">
        <div class="find">
            <asp:Label ID="Label1" runat="server" Text="">Find:</asp:Label>
        </div>
        <div class="ddl">
            <asp:DropDownList ID="ddlChallanReport" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlChallanReport_SelectedIndexChanged" 
               >
                 <asp:ListItem Selected="True">---Select---</asp:ListItem>
                <asp:ListItem Value="Area">Area</asp:ListItem>
                <asp:ListItem Value="Operator">Operator</asp:ListItem>
                <asp:ListItem Value="ChallanType">Challan Type</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="txt" style="margin-left:12px">
            <asp:DropDownList ID="ddlFillList" runat="server">
            </asp:DropDownList>
        </div>

        <div class="find">
            <asp:Label ID="Label2" runat="server" Text="">From:</asp:Label>
        </div>

        <div class="txt">
            <asp:TextBox ID="txtStartDate" runat="server" Width="66" ></asp:TextBox>
        </div>

        <div class="find" style="width:32px">
            <asp:Label ID="Label3" runat="server" Text="">To:</asp:Label>
        </div>

        <div class="txt">
            <asp:TextBox ID="txtEndDate" runat="server" Width="66"></asp:TextBox>
        </div>

        <div class="btn">
            <asp:Button ID="btnSubmit" runat="server" Text="Read" 
                onclick="btnSubmit_Click" />
        </div>
    </div>
    <div style="clear:both; margin-left:26px; margin-top:20px; font-size:9pt;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            CellPadding="4" ForeColor="#333333"   BorderWidth = "1px" BorderColor ="DarkGray"
            DataKeyNames="IssueChallanID"  GridLines="None" Width="700px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="IssueChallanID" HeaderText="IssueChallanID" SortExpression="IssueChallanID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Date" HeaderText="Challan Date" SortExpression="Date" ReadOnly="True" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="Owner" HeaderText="Owner" SortExpression="Owner" HeaderStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="Operator" HeaderText="Operator" SortExpression="Operator" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="Challan Type" HeaderText="Challan Type" SortExpression="Challan Type" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" HeaderStyle-HorizontalAlign="Left" />
            </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>
                <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>
                <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>
                <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
        </asp:GridView>
    </div>
</asp:Content>
