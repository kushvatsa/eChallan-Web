<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Operator.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
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
<div style="height: 280px">
    <div class="client_heading">
        <asp:Label runat="server" ID="lblHead" Text="New Operator"></asp:Label>
    </div>

    <div class="client_message" >
        <asp:label runat="server" ID="lblMsg"></asp:label>
    </div>
     
    <div>
        <div style="float:right; width:180px">  
            <asp:DropDownList ID="ddlOperator" runat="server" style="width:170px" 
                    AutoPostBack="True" DataTextField="Name" DataValueField="OperatorID" 
                    onselectedindexchanged="ddlOperator_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div style="float:right; width:60px">Select:</div>
    </div>
        
    <div class="info_cntnt">
        <div class="cntnt_value">OperatorID:</div>
        <div class="cntnt_value">Name:</div>
        <div class="cntnt_value">Mobile:</div>
        <div class="cntnt_value">BeltNo:</div>
        <div class="cntnt_value">Remarks:</div>
    </div>
        
    <div class="info_txt" style="width:180px;">
        <div class="cntnt_value">
            <asp:TextBox ID="txtID" runat="server" width="60" Enabled="False"></asp:TextBox>
        </div>
        <div class="cntnt_value">
            <asp:TextBox ID="txtName" runat="server" width="150" OnKeyPress="return alpha(event)"></asp:TextBox>
        </div>
        <div class="cntnt_value">
            <asp:TextBox ID="txtContact" runat="server" width="150" 
                OnKeyPress="return digit(event)" MaxLength="10"></asp:TextBox>
        </div>
        <div class="cntnt_value">
            <asp:TextBox ID="txtBeltNo" runat="server" width="100" OnKeyPress="return digit(event)"></asp:TextBox>
        </div>
        <div class="cntnt_value" style="height:45px;">
            <asp:TextBox ID="txtRemarks" runat="server" width="150" TextMode="MultiLine"></asp:TextBox>
        </div>
     </div>    
</div>
     <div class="btn_container">
        <asp:Button ID="btnNew" runat="server" Text="New" class="btn" 
             onclick="btnNew_Click" />
        <asp:Button ID="btnSave" runat="server" Text="Add" class="btn" 
             onclick="btnSave_Click" /> 
        <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btn_right" 
             Enabled="False" onclick="btnDelete_Click" 
                onclientclick="return confirmdelete();"/>
    </div>
</asp:Content>

