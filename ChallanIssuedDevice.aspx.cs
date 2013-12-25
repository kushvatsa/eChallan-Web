using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;

public partial class ChallanIssuedDevice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtDate.Text = System.DateTime.Today.Date.ToShortDateString();
        if (!IsPostBack)
        {
            pnlChallanInfo.Visible = false;
            pnlMoreDetails.Visible = false;
            PnlIssue.Visible = false;
            FillListArea();
            FillListChallanType();
            FillListOperator();
            ddlArea.Items.Insert(0, "----Select----");
            ddlChallanType.Items.Insert(0, "----Select----");
            ddlOperator.Items.Insert(0, "----Select----");
            btnHideDetails.Visible = false;
        }
    }
    protected void GV_Challan_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnRead_Click(object sender, EventArgs e)
    {
        pnlChallanInfo.Visible = true;
        pnlMoreDetails.Visible = false;
        btnHideDetails.Visible = false;
        btnMoreDetails.Visible = true;
        PnlIssue.Visible = false;
        ReadDetail();
        if (lblMsg.Text == "")
        {
            CountChallan();
        }
    }

    protected void btnMoreDetails_Click(object sender, EventArgs e)
    {
        pnlMoreDetails.Visible = true;
        btnMoreDetails.Visible = false;
        btnHideDetails.Visible = true;
        lblViewStateTrue();
        FillDetails();
    }

    protected void IssueChallan_Click(object sender, EventArgs e)
    {
        PnlIssue.Visible = true;
    }

    protected void btnchallanIssued_Click(object sender, EventArgs e)
    {
        IssueChallans();
        txtRemarks.Text = "";
        txtFine.Text = "";
        ddlArea.ClearSelection();
        ddlChallanType.ClearSelection();
        ddlOperator.ClearSelection();
    }

    protected void ImgClose_Click(object sender, ImageClickEventArgs e)
    {
        PnlIssue.Visible = false;
    }
    
    protected void btnHideDetails_Click(object sender, EventArgs e)
    {
        pnlMoreDetails.Visible = false;
        btnHideDetails.Visible = false;
        btnMoreDetails.Visible = true;
    }

    protected void ImgClose2_Click(object sender, ImageClickEventArgs e)
    {
        pnlChallanInfo.Visible = false;
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChallanReceipt.aspx?IssueChallanID=" +hfID.Value);
    }

    void ReadDetail()
    {
        try
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
            con.Open();

            SqlCommand cmd = new SqlCommand("DvcReadVehicles", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;


            cmd.Parameters.Add("@VehicleNo", System.Data.SqlDbType.VarChar).Value = VehicleNo.Text;

            SqlParameter prm;
            prm = cmd.Parameters.Add("@ErrorMsg", System.Data.SqlDbType.VarChar, 250);
            prm.Direction = System.Data.ParameterDirection.InputOutput;

            cmd.ExecuteNonQuery();

            string err;
            err = (string)cmd.Parameters["@ErrorMsg"].Value;

            if (err.Length == 0)
            {
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                dr.Read();

                lblOwner.Text = dr["Name"].ToString();
                lblAccount.Text = dr["AccountID"].ToString();
                lblChessie.Text = dr["ChessieNo"].ToString();
                lblEngine.Text = dr["EngineNo"].ToString();
                lblColor.Text = dr["Color"].ToString();
                lblModel.Text = dr["Model"].ToString();
                con.Close();
            }
            else
            {
                lblMsg.Text = err;
                pnlChallanInfo.Visible = false;
                lblMsg.ForeColor = Color.BlueViolet;
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.ForeColor = Color.Red;
        }
    }

    void lblViewStateTrue()
    {
        lblOwner.EnableViewState = true;
        lblAccount.EnableViewState = true;
        lblChessie.EnableViewState = true;
        lblEngine.EnableViewState = true;
    }

    void lblViewStateFalse()
    {
        lblOwner.EnableViewState = false;
        lblAccount.EnableViewState = false;
        lblChessie.EnableViewState = false;
        lblEngine.EnableViewState = false;
    }

    void CountChallan()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("DvcTotalChallans", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("@VehicleNo", System.Data.SqlDbType.VarChar).Value = VehicleNo.Text;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            dr.Read();

            lblChallan.Text = dr["Challans"].ToString();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.ForeColor = Color.Red;
        }
    }

    void FillDetails()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("DvcChallanDetails", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("@VehicleNo", System.Data.SqlDbType.VarChar, 50).Value = VehicleNo.Text;

            GV_Challan.DataSource = cmd.ExecuteReader();
            GV_Challan.DataBind();
            con.Close();

        }

        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.ForeColor = Color.Red;
        }
    }

    void IssueChallans()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("DvcIssueChallan", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            string des = string.Format("Challan for {0} by {1} in area {2} of Vehicle No {3} has been charged Rs. {4}", ddlChallanType.SelectedItem.Text, ddlOperator.SelectedItem.Text, ddlArea.SelectedItem.Text, VehicleNo.Text, txtFine.Text);

            cmd.Parameters.Add("@VehicleNo", System.Data.SqlDbType.VarChar, 10).Value = VehicleNo.Text;
            cmd.Parameters.Add("@Date", System.Data.SqlDbType.DateTime).Value = txtDate.Text;
            cmd.Parameters.Add("@ChallanTypeID", System.Data.SqlDbType.VarChar, 50).Value = ddlChallanType.SelectedValue;
            cmd.Parameters.Add("@AreaID", System.Data.SqlDbType.VarChar, 50).Value = ddlArea.SelectedValue;
            cmd.Parameters.Add("@OperatorID", System.Data.SqlDbType.VarChar, 50).Value = ddlOperator.SelectedValue;
            cmd.Parameters.Add("@Remarks", System.Data.SqlDbType.VarChar, 50).Value = txtRemarks.Text;
            cmd.Parameters.Add("@des", System.Data.SqlDbType.VarChar, 500).Value = des;

            SqlParameter prm;
            prm = cmd.Parameters.Add("@IssueChallanID", System.Data.SqlDbType.Int);
            prm.Direction = System.Data.ParameterDirection.InputOutput;
            //cmd.Parameters.Add(prm);

              cmd.ExecuteNonQuery();

            lblMsg.Text = "Challan Issued Successfully!";
            lblMsg.ForeColor = Color.Green;

            hfID.Value = cmd.Parameters["@IssueChallanID"].Value.ToString();
          
            con.Close();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.ForeColor = Color.Red;
        }
    }

    void FillListArea()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT AreaID, Name FROM Areas ORDER BY Name", con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            ddlArea.DataSource = dr;
            ddlArea.DataBind();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.ForeColor = Color.Red;
        }

        finally
        {
            if (con.State == System.Data.ConnectionState.Open) con.Close();
        }
    }

    void FillListChallanType()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT ChallanTypeID, Name FROM ChallanTypes ORDER BY Name", con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            ddlChallanType.DataSource = dr;
            ddlChallanType.DataBind();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.ForeColor = Color.Red;
        }

        finally
        {
            if (con.State == System.Data.ConnectionState.Open) con.Close();
        }
    }

    void FillListOperator()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT OperatorID, Name FROM Operators ORDER BY Name", con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            ddlOperator.DataSource = dr;
            ddlOperator.DataBind();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.ForeColor = Color.Red;
        }

        finally
        {
            if (con.State == System.Data.ConnectionState.Open) con.Close();
        }
    }

    protected void ddlChallanType_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
        try
        {
            con.Open();

            string sr = string.Format("SELECT Format(Fine,'0.00') Fine FROM ChallanTypes WHERE ChallanTypeID = {0}",ddlChallanType.SelectedValue);
            SqlCommand cmd = new SqlCommand(sr, con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
           dr.Read();
           txtFine.Text = dr["Fine"].ToString();
           dr.Close();

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.ForeColor = Color.Red;
        }
    }
}