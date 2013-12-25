<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChallanIssuedDevice.aspx.cs"
    Inherits="ChallanIssuedDevice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="div" style="overflow:auto; height:524px">
            <div class="heading">
                <div style="color:#FFFFFF; padding-left: 120px; padding-top:3px;">ISSUE CHALLAN</div>
            </div>

            <div class="client_message">
                <asp:Label runat="server" ID="lblMsg" EnableViewState="False"></asp:Label>
            </div>

            <div class="info_txt">Vehicle No:
                <asp:TextBox ID="VehicleNo" runat="server" Width="103"></asp:TextBox>
                <asp:Button ID="btnRead" runat="server" Text="Read" OnClick="btnRead_Click" />
            </div>

            <asp:Panel runat="server" ID="pnlChallanInfo" Style="margin: 8px; border: solid 1px #dedede; padding:0px 8px 8px 8px; ">
                <div style="height: 96px; font-family: Arial, Helvetica, sans-serif;">
                    <div class="owner">
                        <div class="cntnt_value">Owner Name:</div>
                        <div class="cntnt_value">Engine No:</div>
                        <div class="cntnt_value">Chessie No:</div>
                    </div>

                    <div class="owner_text">
                        <div class="owner_lbl">
                            <asp:Label ID="lblOwner" runat="server" Text="Label"></asp:Label></div>
                        <div class="owner_lbl">
                            <asp:Label ID="lblEngine" runat="server" Text="Label"></asp:Label></div>
                        <div class="owner_lbl">
                            <asp:Label ID="lblChessie" runat="server" Text="Label"></asp:Label></div>
                    </div>

                    <div class="owner" style="margin-left:14px">
                        <div class="cntnt_value">Color:</div>
                        <div class="cntnt_value">Model:</div>
                        <div class="cntnt_value">No of Challans:</div>
                    </div>
                    <div class="owner_text">
                        <div class="owner_lbl">
                            <asp:Label ID="lblColor" runat="server" Text="Label"></asp:Label></div>
                        <div class="owner_lbl">
                            <asp:Label ID="lblModel" runat="server" Text="Label"></asp:Label></div>
                        <div class="owner_lbl">
                            <asp:Label ID="lblChallan" runat="server" Text="Label"></asp:Label></div>
                    </div>
                    
                    <div style="clear:both">
                    <div class="owner" style="margin-top:5px;">
                        <div class="cntnt_value">Account ID:</div>
                    </div> 
                    <div class="owner_text" style="margin-top:5px; margin-left:14px;">
                        <div class="owner_lbl">
                            <asp:Label ID="lblAccount" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div> 
                    </div>
                    
                  </div>  
                    <div style="clear:both;">
                        <asp:Button runat="server" ID="btnMoreDetails" Text="Show Details" Width="100px" OnClick="btnMoreDetails_Click" style="margin-left: 50px; margin-top:5px" />
                        <asp:Button runat="server" ID="btnHideDetails" Text="Hide Details" Width="100px" style="margin-left: 50px; margin-top:5px" onclick="btnHideDetails_Click" />
                        <asp:Button ID="IssueChallan" runat="server" Text="Issue Challan" Width="100px" style="margin-left: 10px; margin-top:5px" OnClick="IssueChallan_Click" />
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/btn_close_down_BIDI.png" 
                         onclick="ImgClose2_Click" style="height:20px; margin-left: 20px;" />
                    </div>
                  
            <asp:Panel ID="pnlMoreDetails" runat="server" Style="border: solid 1px #dedede; font-size: 10pt;font-family: Arial, Sans-Serif">
                <asp:GridView ID="GV_Challan" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GV_Challan_SelectedIndexChanged"
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="Sr">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <HeaderStyle Width="20px" />
                            <ItemStyle Width="20px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" HeaderText="Date" HeaderStyle-HorizontalAlign="Left">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Challan Type" HeaderText="Challan Type" HeaderStyle-HorizontalAlign="Left">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fine" HeaderText="Fine" HeaderStyle-HorizontalAlign="Left">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="26px" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" Height="22px" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </asp:Panel>

            <asp:Panel runat="server" ID="PnlIssue" Height="220px" Style="margin: 12px; border: solid 1px #dedede;
                padding: 12px;">
                <div style="float: right; text-align: right;">
                    <asp:ImageButton ID="ImgClose" runat="server" ImageUrl="~/images/btn_close_down_BIDI.png"
                        ImageAlign="Right" onclick="ImgClose_Click" style="height: 20px" />
                </div>
                <div style="float: left; width: 272px; font-family: Arial, Helvetica, sans-serif;">
                    <div class="owner">
                        <div class="Challan">
                            Date:</div>
                        <div class="Challan">
                            ChallanType:</div>
                        <div class="Challan">
                            Fine:</div>
                        <div class="Challan">
                            Area:</div>
                        <div class="Challan">
                            Operator:</div>
                        <div class="Challan">
                            Remarks:</div>
                    </div>
                    <div style="margin-top: 16px">
                        <div class="Challan">
                            <asp:TextBox ID="txtDate" runat="server" Enabled="False" Width="90px"></asp:TextBox></div>
                        <div class="Challan">
                            <asp:DropDownList ID="ddlChallanType" runat="server" Width="110px" DataTextField="Name"
                                DataValueField="ChallanTypeID" 
                                onselectedindexchanged="ddlChallanType_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                        <div class="Challan">
                            <asp:TextBox ID="txtFine" runat="server" Enabled="False" Width="90px"></asp:TextBox></div>
                        <div class="Challan">
                            <asp:DropDownList ID="ddlArea" runat="server" Width="110px" DataTextField="Name"
                                DataValueField="AreaID">
                            </asp:DropDownList>
                        </div>
                        <div class="Challan">
                            <asp:DropDownList ID="ddlOperator" runat="server" Width="110px" DataTextField="Name"
                                DataValueField="OperatorID">
                            </asp:DropDownList>
                        </div>
                        <div class="Challan">
                            <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine"></asp:TextBox></div>
                    </div>
                    <div style="margin-top:16px; margin-left: 70px">
                        <asp:Button ID="btnchallanIssued" runat="server" Text="Challan"
                            OnClick="btnchallanIssued_Click"></asp:Button>
                        <asp:HiddenField ID="hfID" runat="server" />
                        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click"/>
                    </div>
                </div>
            </asp:Panel>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
