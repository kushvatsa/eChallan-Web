<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Area.aspx.cs" Inherits="Area" Title="Untitled Page" %>

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
        });
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div style="height: 218px">
    <div class="client_heading">
      <asp:label runat="server" ID="lblHead">New Area</asp:label>
    </div>
    <div class="client_message" style="color:green" >
            <asp:label runat="server" ID="lblMsg"></asp:label>
     </div>
        <div>
        <div style="float:right; width:180px">
                <asp:DropDownList ID="ddList" runat="server" style="width:170px" 
                    AutoPostBack="True" DataTextField="Name" DataValueField="AreaID" 
                    onselectedindexchanged="ddList_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        <div style="float:right; width:60px">Select:</div>
     </div>
        <div class="info_cntnt">
            <div style="float:left">
                <div class="cntnt_value">AreaID:</div>
                <div class="cntnt_value">Area:</div>
                <div class="cntnt_value">Remarks:</div>
            </div>
        </div>
        
        <div class="info_txt">
            <div style="float:left">
             <div class="cntnt_value">
                    <asp:TextBox ID="txtID" runat="server" Width="60" Enabled="False"></asp:TextBox>
                </div>
                <div class="cntnt_value">
                    <asp:TextBox ID="txtName" runat="server" OnKeyPress="return alpha(event)"></asp:TextBox>
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
        <asp:Button ID="btnSave" runat="server" Text="Add" class="btn" onclick="btnSave_Click" /> 
        <asp:Button ID="btnCalcel" runat="server" Text="Delete" class="btn_right" Enabled="False"  onclick="btnDelete_Click" 
                onclientclick="return confirmdelete();" />
    </div>
</asp:Content>

