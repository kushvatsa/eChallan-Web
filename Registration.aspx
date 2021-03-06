﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="JScript.js" type="text/javascript"></script>
    <script src="jquery-1.5.1.js" type="text/javascript"></script>
    <script type="text/javascript">

        // clear the label message
        $('html').mousedown(function () {
            $('#<%=lblMsg.ClientID%>').html('');
        });
        $('html').keydown(function () {
            $('#<%=lblMsg.ClientID%>').html('');
        });</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div class="client_heading">
            <asp:Label ID="lblHead" runat="server" Text="Vehicle Registration"></asp:Label>
        </div>
    <div class="client_message" >
        <asp:label runat="server" ID="lblMsg"></asp:label>
     </div>
    
        <div style="height: 229px;">
        <div class="info_group">
            Owner Information
        </div>
        <div class="info_cntnt">
            <div class="cntnt_value">RegdID:</div>
            <div class="cntnt_value">Date:</div>
            <div class="cntnt_value">Name:</div>
            <div class="cntnt_value">Address:</div>
        </div>
        
        <div class="info_txt">
        <div class="cntnt_value">
                <asp:TextBox ID="txtID" runat="server" width="60" Enabled="False"></asp:TextBox>
            </div>
            <div class="cntnt_value">
                <asp:TextBox ID="txtDate" runat="server" width="80" Enabled="False"></asp:TextBox>
            </div>
            <div class="cntnt_value">
                <asp:TextBox ID="txtName" runat="server" width="150" OnKeyPress="return alpha(event)"></asp:TextBox>
            </div>
            <div class="cntnt_value" style="height:45px;">
                <asp:TextBox ID="txtAddress" runat="server" width="150" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        
        <div class="info_cntnt">
            <div class="cntnt_value">Email:</div>    
            <div class="cntnt_value">Mobile:</div>
            <div class="cntnt_value">Landline:</div>    
            <div class="cntnt_value">Licence No:</div>
            <div class="cntnt_value">Gender:</div>
        </div>
        
        <div class="info_txt" style="width:180px">  
            <div class="cntnt_value">
                <asp:TextBox ID="txtmail" runat="server" width="150"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtmail" ErrorMessage="*" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="cntnt_value">
                <asp:TextBox ID="txtMobile" runat="server" width="150" MaxLength="10" OnKeyPress="return digit(event)"></asp:TextBox>
            </div>
            <div class="cntnt_value">
                <asp:TextBox ID="txtLandline" runat="server" width="150" OnKeyPress="return digit(event)"></asp:TextBox>
            </div>
            <div class="cntnt_value">
                <asp:TextBox ID="txtLicence" runat="server" width="150" OnKeyPress="return digit(event)"></asp:TextBox>
            </div>
            <div class="cntnt_value" style="font-size:9pt">
                <asp:RadioButtonList ID="rdlGender" runat="server">
                       <asp:ListItem Value="1" Selected="True">Male</asp:ListItem>
                       <asp:ListItem Value="2">Female</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
    </div>
    
    <div style="height: 224px; margin-top: 24px;">
        <div class="info_group">
            Vehicle Information
         </div>
        <div class="info_cntnt">
            <div class="cntnt_value">Vehicle No:</div>
            <div class="cntnt_value">Engine No:</div>
            <div class="cntnt_value">Chessie No:</div>
            <div class="cntnt_value">Dealer:</div>
            <div class="cntnt_value">City:</div>
        </div>
                    
        <div class="info_txt">
            <div class="cntnt_value">
                <asp:TextBox ID="txtVehicle" runat="server" width="150" OnKeyPress="return digit(event)"></asp:TextBox>
            </div>
            <div class="cntnt_value">
                <asp:TextBox ID="txtEngine" runat="server" width="150" OnKeyPress="return alphanumeric(event)"></asp:TextBox>
            </div>
            <div class="cntnt_value">
                <asp:TextBox ID="txtChessie" runat="server" width="150" OnKeyPress="return alphanumeric(event)"></asp:TextBox>
            </div>
            <div class="cntnt_value">
                <asp:DropDownList ID="ddlDealer" runat="server" Width="170px" 
                    DataTextField="Name" DataValueField="DealerID">
                </asp:DropDownList>
            </div>
            <div class="cntnt_value">
                <asp:DropDownList ID="ddlCity" runat="server" Width="170px" 
                    DataTextField="Name" DataValueField="CityID">
                </asp:DropDownList>
            </div>
        </div>
        
        <div class="info_cntnt">
            <div>
                <div class="cntnt_value">Series</div>
                <div class="cntnt_value">Manufacturer:</div>
                <div class="cntnt_value">Color:</div>
                <div class="cntnt_value">Vehicle Type:</div>
                <div class="cntnt_value">Model No:</div>   
            </div>
        </div>
            
        <div class="info_txt" style="width:180px">
            <div class="cntnt_value">
                <asp:TextBox ID="txtSeries" runat="server" width="80" OnKeyPress="return alpha(event)"></asp:TextBox>
            </div>
            <div class="cntnt_value">
                <asp:DropDownList ID="ddlmanufctr" runat="server" Width="170px" 
                    DataTextField="Name" DataValueField="ManufacturerID">
                </asp:DropDownList>
            </div>
            <div class="cntnt_value">
                <asp:DropDownList ID="ddlColor" runat="server" Width="170px" 
                    DataTextField="Name" DataValueField="ColorID">
                </asp:DropDownList>
            </div>            
            <div class="cntnt_value">
                <asp:DropDownList ID="ddlType" runat="server" Width="170px" 
                    DataTextField="Name" DataValueField="VehicleTypeID">
                </asp:DropDownList>
            </div>
            <div class="cntnt_value">
                <asp:DropDownList ID="ddlModel" runat="server" Width="170px" 
                    DataTextField="Name" DataValueField="ModelID">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="info_cntnt">
        <div class="cntnt_value">Remarks:</div>
    </div>
    <div class="info_txt">
        <div class="cntnt_value">
            <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
        </div>
    </div>

    <div class="btn_container" style="clear:both; margin-top:40px">
         <asp:Button ID="btnNew" runat="server" Text="New" class="btn" 
             onclick="btnNew_Click" />
        <asp:Button ID="btnSave" runat="server" Text="Add" class="btn" 
             onclick="btnSave_Click" /> 
             <asp:Button ID="btnList" runat="server" Text="List" class="btn" OnClick="btnList_Click" />
        <asp:Button ID="btnCalcel" runat="server" Text="Delete" class="btn_right" 
             Enabled="False" OnClick="btnDelete_Click" />
    </div>

   
    <asp:Panel ID="Panel_grid" runat="server" Style="position: absolute; top: 217px;
        left: 281px; height: 253px; width: 565px; overflow: auto; margin-right: 0px;
        background-color: #F0F0F0; z-index: 999; padding: 8px; border: solid 1px #ccdcdd;
        font-size: 9pt; font-family: Arial, Helvetica, sans-serif;">
        <div style="background-color: #F0F0F0">
            <div style="height: 60px">
                <div style="width: 148px; height: 19px; font-family: Arial, Helvetica, sans-serif;
                    font-size: 9pt;">
                    <strong>Select</strong></div>
                <div style="margin-left: 30px; margin-top: 5px; padding: 4px; height: 25px; width: 501px;
                    border: solid 1px #cdcdcd">
                    <div style="float: left; width: 44px; height: 19px; padding-top: 4px;">
                        Find:
                    </div>
                    <div style="float: left; height: 23px; width: 131px; padding-top:2px;">
                        <asp:DropDownList ID="ddlRegd" runat="server" Height="22px" Width="107px" 
                            onselectedindexchanged="ddlRegd_SelectedIndexChanged">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>RegdID</asp:ListItem>
                            <asp:ListItem Value="Name">Name</asp:ListItem>
                            <asp:ListItem>VehicleNo</asp:ListItem>
                            <asp:ListItem>Mobile</asp:ListItem>
                            <asp:ListItem>EngineNo</asp:ListItem>
                            <asp:ListItem>ChessieNo</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="float: left; height: 23px; width: 178px;">
                        <asp:TextBox ID="txtSearchGrid" runat="server"></asp:TextBox>
                    </div>
                    <div style="float: left; height: 23px; width: 144px;">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" 
                            onclick="btnSearch_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top: 11px">
            <asp:GridView ID="GV_List" runat="server" AutoGenerateColumns="False" DataKeyNames="RegdID"
                Width="100%" OnSelectedIndexChanged="GV_List_SelectedIndexChanged" CellPadding="4"
                ForeColor="#333333" GridLines="None" BorderWidth ="1px" BorderColor="DarkGray">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="RegdID" HeaderText="RegdID" InsertVisible="False" ReadOnly="True"
                        SortExpression="RegdID" HeaderStyle-HorizontalAlign="Left" />
                    <asp:TemplateField HeaderText="Name" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                Text='<%# bind("Name") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <Columns>
                    <asp:BoundField DataField="VehicleNo" HeaderText="VehicleNo" InsertVisible="False" ReadOnly="True"
                        SortExpression="VehicleNo" HeaderStyle-HorizontalAlign="Left" />
                </Columns>
                <Columns>
                    <asp:BoundField DataField="EngineNo" HeaderText="EngineNo" InsertVisible="False"
                        ReadOnly="True" SortExpression="EngineNo" HeaderStyle-HorizontalAlign="Left" />
                </Columns>
                <Columns>
                    <asp:BoundField DataField="ChessieNo" HeaderText="ChessieNo" InsertVisible="False"
                        ReadOnly="True" SortExpression="ChessieNo" HeaderStyle-HorizontalAlign="Left" />
                </Columns>
                <Columns>
                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" InsertVisible="False"
                        ReadOnly="True" SortExpression="Mobile" HeaderStyle-HorizontalAlign="Left" />
                </Columns>
                <Columns>
                    <asp:BoundField DataField="Address" HeaderText="Address" InsertVisible="False"
                        ReadOnly="True" SortExpression="Address" HeaderStyle-HorizontalAlign="Left" />
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
        <div><input type="button" onclick='document.getElementById("<%=Panel_grid.ClientID %>").style.display="none"'
                        style="margin-top: 8px; float:right" value="Close"  /></div>
    </asp:Panel>
    <asp:HiddenField ID="hfName" runat="server" />
</asp:Content>
          