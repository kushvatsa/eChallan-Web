<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegisteredVehicleReport.aspx.cs" Inherits="Vehicle_Report" %>

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
    <div class="client_heading">Registered Vehicles</div>
    <div style="height: 60px; margin-top: 5px">
        <div class="find">
            <asp:Label ID="Label1" runat="server" Text="">Find:</asp:Label>
        </div>
        <div class="ddl">
            <asp:DropDownList ID="ddlVehicleReport" runat="server">
                <asp:ListItem Value="VehicleNo">Vehicle No</asp:ListItem>
                <asp:ListItem Value="EngineNo">Engine No</asp:ListItem>
                <asp:ListItem Value="ChessieNo">Chessie No</asp:ListItem>
                <asp:ListItem Value="LicenceNo">Licence No</asp:ListItem>
                <asp:ListItem Value="Mobile">Mobile No</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="txt">
            <asp:TextBox ID="txtVehicleValue" runat="server"></asp:TextBox>
        </div>

        <div class="btn">
            <asp:Button ID="btnSubmit" runat="server" Text="Read" />
        </div>
    </div>

    <div style="clear:both; margin-left:26px; margin-top:20px; font-size:9pt;">
        <asp:SqlDataSource ID="vehiclereport" runat="server" 
            ConnectionString="<%$ ConnectionStrings:eChallanConnectionString2 %>" 
            SelectCommand="RptRegdVehicle" SelectCommandType="StoredProcedure" 
            onselecting="vehiclereport_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlVehicleReport" Name="FLD" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtVehicleValue" Name="VAL" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="vehiclereport" 
            Width="800px" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Sr">
	                <ItemTemplate>
                  	    <%# Container.DataItemIndex + 1 %>
             	    </ItemTemplate>
             	    <HeaderStyle HorizontalAlign="Left" /> 
             	    <ItemStyle HorizontalAlign="Left" />               
                </asp:TemplateField>
                <asp:BoundField HeaderText="Vehicle No" DataField="Vehicle No" HeaderStyle-HorizontalAlign="Left" >
                </asp:BoundField>
                <asp:BoundField HeaderText="Engine No" DataField="EngineNo" HeaderStyle-HorizontalAlign="Left">
                </asp:BoundField>
                <asp:BoundField HeaderText="Chessie No" DataField="ChessieNo"  HeaderStyle-HorizontalAlign="Left" >
                </asp:BoundField>
                <asp:BoundField DataField="Model" HeaderText="Model" HeaderStyle-HorizontalAlign="Left" >
                </asp:BoundField>
                <asp:BoundField DataField="Color" HeaderText="Color" HeaderStyle-HorizontalAlign="Left" >
                </asp:BoundField>
                <asp:BoundField DataField="Vehicle Type" HeaderText="Vehicle Type" HeaderStyle-HorizontalAlign="Left" >
                </asp:BoundField>
                <asp:BoundField HeaderText="Owner" DataField="Owner" HeaderStyle-HorizontalAlign="Left" >
                </asp:BoundField>
                 <asp:BoundField HeaderText="Mobile" DataField="Mobile" HeaderStyle-HorizontalAlign="Left" >
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D"  ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" ForeColor="White" Height="26px"/>
            <PagerStyle BackColor="#284775" ForeColor="White"  />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="22px" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
    
</asp:Content>

