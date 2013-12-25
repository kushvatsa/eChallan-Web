using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitForNew();
        }
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        InitForNew();
        lblMsg.Text = "";
    }
    void InitForNew()
    {
        lblHead.Text = "New Operator";
        btnSave.Text = "Add";

        txtID.Text = "";
        txtName.Text = "";
        txtContact.Text = "";
        txtBeltNo.Text = "";
        txtRemarks.Text = "";

        btnDelete.Enabled = false;

        FillList();
        ddlOperator.Items.Insert(0, "----Select----");

        txtName.Focus();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

        try
        {
            con.Open();

            string sp;
            if (btnSave.Text == "Add") sp = "AddOperator";
            else sp = "UpdateOperator";

            SqlCommand cmd = new SqlCommand(sp, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@Name", System.Data.SqlDbType.VarChar, 25).Value = txtName.Text;
            cmd.Parameters.Add("@Contact", System.Data.SqlDbType.VarChar,25).Value = txtContact.Text;
            cmd.Parameters.Add("@BeltNo", System.Data.SqlDbType.VarChar,25).Value = txtBeltNo.Text;
            cmd.Parameters.Add("@REmarks", System.Data.SqlDbType.VarChar,100).Value = txtRemarks.Text;

            if (btnSave.Text == "Update") cmd.Parameters.Add("@OpeartorID", System.Data.SqlDbType.Int).Value = txtID.Text;

            SqlParameter prm;
            prm = cmd.Parameters.Add("@ErrorMsg", System.Data.SqlDbType.VarChar, 250);
            prm.Direction = System.Data.ParameterDirection.InputOutput;

            cmd.ExecuteNonQuery();

            string err;
            err = (string)cmd.Parameters["@ErrorMsg"].Value;
            if (err.Length == 0)
            {
                lblMsg.Text = (btnSave.Text == "Add") ? "Added successfully!" : "Updated successfully!";
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
            if (con.State == System.Data.ConnectionState.Open) con.Close();
        }
    }

    void FillList()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT OperatorID, Name,Contact,BeltNo,Remarks FROM Operators ORDER BY Name", con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            ddlOperator.DataSource = dr;
            ddlOperator.DataBind();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

        finally
        {
            if (con.State == System.Data.ConnectionState.Open) con.Close();
        }
    }

    protected void ddlOperator_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

        try
        {
            con.Open();

            string sql;
            sql = string.Format("SELECT OperatorID, Name, Contact,BeltNO,Remarks FROM Operators WHERE OperatorID={0}", ddlOperator.SelectedValue);

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {                                                                       // While start
                txtID.Text = dr["OperatorID"].ToString();
                txtName.Text = dr["Name"].ToString();

                txtContact.Text = dr["Contact"].ToString();
                txtBeltNo.Text = dr["BeltNo"].ToString();
                txtRemarks.Text = dr["Remarks"].ToString();

                txtName.Focus();                                                    // focus
            }                                                                       // while end

            dr.Close();

            //  Form settings
            lblHead.Text = "Update Operator";
            btnSave.Text = "Update";
            btnDelete.Enabled = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

        finally
        {
            if (con.State == System.Data.ConnectionState.Open) con.Close();
        }
    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("DeleteOperator", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("OperatorID", System.Data.SqlDbType.Int).Value = txtID.Text;

            SqlParameter prm;
            prm = cmd.Parameters.Add("@ErrorMsg", System.Data.SqlDbType.VarChar, 250);
            prm.Direction = System.Data.ParameterDirection.InputOutput;

            cmd.ExecuteNonQuery();

            string err;
            err = (string)cmd.Parameters["@ErrorMsg"].Value;
            if (err.Length == 0)
            {
                lblMsg.Text = "Deleted successfully!";
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
            if (con.State == System.Data.ConnectionState.Open) con.Close();
        }

    }
}

  