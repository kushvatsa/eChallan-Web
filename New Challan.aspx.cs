using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;

public partial class challan_type : System.Web.UI.Page
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
        lblHead.Text = "New Challan Type";
        btnSave.Text = "Add";

        txtID.Text = "";
        txtChallan.Text = "";
        txtFine.Text = "0.00";
        txtDescription.Text = "";
        txtRemarks.Text = "";

        btnCalcel.Enabled = false;

        FillList();
        ddlChallan.Items.Insert(0, "----Select----");

        txtChallan.Focus();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
        
        try
        {
            con.Open();
            string sp;
            if(btnSave.Text == "Add") sp = "AddChallanType";
            else sp = "UpdateChallan";

            SqlCommand cmd = new SqlCommand(sp, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@Name", System.Data.SqlDbType.VarChar, 250).Value = txtChallan.Text;
            cmd.Parameters.Add("@Fine", System.Data.SqlDbType.VarChar, 50).Value = txtFine.Text;
            cmd.Parameters.Add("@Description", System.Data.SqlDbType.VarChar, 50).Value = txtDescription.Text;
            cmd.Parameters.Add("@Remarks", System.Data.SqlDbType.VarChar, 50).Value = txtRemarks.Text;
 
            if(btnSave.Text == "Update") cmd.Parameters.Add("@ChallanTypeID", System.Data.SqlDbType.Int).Value = txtID.Text;

            SqlParameter prm;
            prm = cmd.Parameters.Add("@ErrorMsg", System.Data.SqlDbType.VarChar, 250);
            prm.Direction = System.Data.ParameterDirection.InputOutput;

            cmd.ExecuteNonQuery();

            string err;
            err = (string)cmd.Parameters["@ErrorMsg"].Value;
            if(err.Length == 0)
            {
                lblMsg.Text = (btnSave.Text == "Add") ? "Added Successfully!" : "Updated Successfully!";
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

    void FillList()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT ChallanTypeID, Name, STR(Fine, 10, 2) [Fine], Description, Remarks FROM ChallanTypes ORDER BY Name", con);
                cmd.CommandType = System.Data.CommandType.Text;

                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                ddlChallan.DataSource = dr;
                ddlChallan.DataBind();
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
        
        protected void ddlChallan_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

            try
        {
            con.Open();

            string sql;
            sql = string.Format("SELECT ChallanTypeID, Name, Fine, Description, Remarks FROM ChallanTypes WHERE ChallanTypeID={0}", ddlChallan.SelectedValue);

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtID.Text = dr["ChallanTypeID"].ToString();
                txtChallan.Text = dr["Name"].ToString();
                txtFine.Text = string.Format("{0:0.00}", dr["Fine"]);
                txtDescription.Text  = dr["Description"].ToString();
                txtRemarks.Text = dr["Remarks"].ToString();

                txtChallan.Focus();             
            }
        
            dr.Close();

            //  Form settings
            lblHead.Text = "Update Challan Type";
            lblMsg.Text = "";
            btnSave.Text = "Update";
            btnCalcel.Enabled = true;
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

                SqlCommand cmd = new SqlCommand("DeleteChallanType", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("ChallanTypeID", System.Data.SqlDbType.Int).Value = txtID.Text;

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
    
