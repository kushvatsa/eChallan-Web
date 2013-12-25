using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Drawing;
using System.Data.SqlClient;

public partial class Manufacturer : System.Web.UI.Page
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
        lblHead.Text = "New Manufacturer";
        btnSave.Text = "Add";

        txtID.Text = "";
        txtName.Text = "";
        txtRemarks.Text = "";

        btnCalcel.Enabled = false;

        FillList();
        ddlManufacturer.Items.Insert(0, "----Select----");

        txtName.Focus();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
        
        try
        {
            con.Open();
            string sp;
            if(btnSave.Text == "Add") sp = "AddManufacturer";
            else sp = "UpdateManufacturer";

            SqlCommand cmd = new SqlCommand(sp, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@Name", System.Data.SqlDbType.VarChar, 50).Value = txtName.Text;
            cmd.Parameters.Add("@Remarks", System.Data.SqlDbType.VarChar, 50).Value = txtRemarks.Text;
 
            if(btnSave.Text == "Update") cmd.Parameters.Add("@ManufacturerID", System.Data.SqlDbType.Int).Value = txtID.Text;

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

                SqlCommand cmd = new SqlCommand("SELECT ManufacturerID, Name, Remarks FROM Manufacturers ORDER BY Name", con);
                cmd.CommandType = System.Data.CommandType.Text;

                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                ddlManufacturer.DataSource = dr;
                ddlManufacturer.DataBind();
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
        
        protected void ddlManufacturer_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

            try
        {
            con.Open();

            string sql;
            sql = string.Format("SELECT ManufacturerID, Name, Remarks FROM Manufacturers WHERE ManufacturerID={0}", ddlManufacturer.SelectedValue);

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtID.Text = dr["ManufacturerID"].ToString();
                txtName.Text = dr["Name"].ToString();
                txtRemarks.Text = dr["Remarks"].ToString();

                txtName.Focus();             
            }
        
            dr.Close();

            //  Form settings
            lblHead.Text = "Update Manufacturer";
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

                SqlCommand cmd = new SqlCommand("DeleteManufacturer", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("ManufacturerID", System.Data.SqlDbType.Int).Value = txtID.Text;

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
   




       

