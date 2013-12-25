<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DepositCash.aspx.cs" Inherits="Accounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div style="height: 270px">
    <div class="client_heading"><asp:label runat="server" ID="lblHead">Deposit Cash</asp:label></div>
    <div class="client_message" >
            <asp:label runat="server" ID="lblMsg"></asp:label>
     </div>
        <div class="info_cntnt">
            <div style="float:left">
                <div class="cntnt_value">AccountID:</div>
                <div class="cntnt_value">Date:</div>
                <div class="cntnt_value">Vehicle No:</div>
                <div class="cntnt_value">Amount Received:</div>
                <div class="cntnt_value">Remarks:</div>
            </div>
        </div>
        
        <div class="info_txt">
            <div style="float:left">
                <div class="cntnt_value">
                    <asp:TextBox ID="txtAccount" runat="server" width="80" Enabled="False"></asp:TextBox>
                </div>
                <div class="cntnt_value">
                    <asp:TextBox ID="txtDate" runat="server" width="80" Enabled="False"></asp:TextBox>
                </div>
                <div class="cntnt_value">
                    <asp:TextBox ID="txtVehicleNo" runat="server" width="100"></asp:TextBox>
                </div>
                <div class="cntnt_value">
                    <asp:TextBox ID="txtAmntReceived" runat="server" width="60"></asp:TextBox>
                </div>
                <div class="cntnt_value">
                    <asp:TextBox ID="txtRemarks" runat="server" width="150" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div class="btn_container">
        <asp:Button ID="btnNew" runat="server" Text="New" class="btn" 
            onclick="btnNew_Click" />
        <asp:Button ID="btnSave" runat="server" Text="Deposit" class="btn" 
            onclick="btnSave_Click" />
        <asp:Button ID="btnList" runat="server" Text="List" class="btn" 
            onclick="btnList_Click" />
    </div>
    
    <div style="margin-left:60px; margin-top:10px">
    <asp:Panel ID="Panel1" runat="server" Font-Size="9pt" Width="800px">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountID"
            CellPadding="4" ForeColor="#333333" GridLines="None"  
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="Date" HeaderText="Date" />
                <asp:TemplateField HeaderText="VehicleNo" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                Text='<%# bind("VehicleNo") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                <asp:BoundField DataField="Amount" HeaderText="Amount"  HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="Owner" HeaderText="Owner"  HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="Remarks" HeaderText="Remarks"  HeaderStyle-HorizontalAlign="Left"/>
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
        </asp:GridView>
       <input type="button" onclick='document.getElementById("<%=Panel1.ClientID %>").style.display="none"'
                         value="Close"  />
       </asp:Panel>
       </div>
</asp:Content>

