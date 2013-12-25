using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class Accounts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtDate.Text = System.DateTime.Today.Date.ToShortDateString();
        if (!IsPostBack)
        {
            InitForNew();
            Panel1.Visible = false;
        }

    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        InitForNew();
        lblMsg.Text = "";
        Panel1.Visible = false;
    }

    void InitForNew()
    {
        lblHead.Text = "Deposit Cash";
        btnSave.Text = "Deposit";

        txtVehicleNo.Text = "";
        txtAmntReceived.Text = "0.00";
        txtRemarks.Text = "";


        txtVehicleNo.Focus();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
        
        try
        {
            con.Open();
            string sp;
            if (btnSave.Text == "Deposit") sp = "CashDeposit";
            else sp = "UpdateCash";

            SqlCommand cmd = new SqlCommand(sp, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@Date", System.Data.SqlDbType.SmallDateTime,50).Value = txtDate.Text;
            cmd.Parameters.Add("@VehicleNo", System.Data.SqlDbType.VarChar, 10).Value = txtVehicleNo.Text;
            cmd.Parameters.Add("@Amount", System.Data.SqlDbType.Money).Value = txtAmntReceived.Text;
            cmd.Parameters.Add("@Remarks", System.Data.SqlDbType.VarChar, 50).Value = txtRemarks.Text;

            if (btnSave.Text == "Update") cmd.Parameters.Add("@TranID", System.Data.SqlDbType.Int).Value = GridView1.SelectedRow.Cells[0].Text;

            SqlParameter prm;
            prm = cmd.Parameters.Add("@ErrorMsg", System.Data.SqlDbType.VarChar, 250);
            prm.Direction = System.Data.ParameterDirection.InputOutput;

            cmd.ExecuteNonQuery();
            Panel1.Visible = false;

            string err;
            err = (string)cmd.Parameters["@ErrorMsg"].Value;
            if(err.Length == 0)
            {
                lblMsg.Text = (btnSave.Text == "Deposit") ? "Deposited Successfully!" :"Updated Successfully!";
                lblMsg.ForeColor = Color.Green;
                InitForNew();
            }
            else
            {
                lblMsg.Text = err;
                lblMsg.ForeColor = Color.Red;
            }
        }
            catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

        finally
        {
            if(con.State == System.Data.ConnectionState.Open) con.Close();
        }

    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        try
        {

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
            con.Open();

            SqlCommand cmd = new SqlCommand("ReadAmountReceived", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();

            GridView1.DataSource = dr;
            GridView1.DataBind();

            Panel1.Visible = true;

            con.Close();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
            con.Open();

            SqlCommand cmd = new SqlCommand("FillDepositCash", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("@TEAccountID", System.Data.SqlDbType.Int).Value = GridView1.SelectedDataKey.Value;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            dr.Read();

            txtAccount.Text = dr["AccountID"].ToString();
            txtVehicleNo.Text = dr["VehicleNo"].ToString();
            txtAmntReceived.Text = dr["Amount"].ToString();
            txtRemarks.Text = dr["Remarks"].ToString();

            btnSave.Text = "Update";
            lblHead.Text = "Update Cash";

            Panel1.Visible = false;

            con.Close();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
   

  