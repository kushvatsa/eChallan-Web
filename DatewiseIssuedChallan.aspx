<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DatewiseIssuedChallan.aspx.cs" Inherits="Challan_Report" %>

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
    <div class="client_heading">Challan Issued Datewise</div>

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
            <asp:Button ID="btnSubmit" runat="server" Text="Read" />
        </div> 
    </div>

    <div style="clear:both; margin-left:26px; margin-top:20px; font-size:9pt;">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:eChallanConnectionString2 %>" 
            SelectCommand="RptChallan" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtStartDate" Name="StartDate" 
                    PropertyName="Text" DbType="Date"/>
                <asp:ControlParameter ControlID="txtEndDate" Name="EndDate" 
                    PropertyName="Text" DbType="Date" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
            Width="500px" CellPadding="4" ForeColor="#333333" 
            GridLines="None" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Sr">
	                <ItemTemplate>
                  	    <%# Container.DataItemIndex + 1 %>
             	    </ItemTemplate>
             	    <HeaderStyle HorizontalAlign="Left" /> 
             	    <ItemStyle HorizontalAlign="Left" />               
                </asp:TemplateField>
                <asp:BoundField DataField="Date" HeaderText="Date" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="Challan Type" HeaderText="Challan Type" HeaderStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="Owner" HeaderText="Owner" HeaderStyle-HorizontalAlign="Left"/>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="26px" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="22px" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
</asp:Content>

