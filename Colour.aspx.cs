using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
public partial class Colour : System.Web.UI.Page
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
        lblHead.Text = "New Color";
        btnSave.Text = "Add";

        txtID.Text = "";
        txtName.Text = "";
        txtRemarks.Text = "";

        btnCalcel.Enabled = false;

        FillList();
        ddList.Items.Insert(0, "----Select----");

        txtName.Focus();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
        
        try
        {
            con.Open();
            string sp;
            if(btnSave.Text == "Add") sp = "AddColor";
            else sp = "UpdateColor";

            SqlCommand cmd = new SqlCommand(sp, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@Name", System.Data.SqlDbType.VarChar, 50).Value = txtName.Text;
            cmd.Parameters.Add("@Remarks", System.Data.SqlDbType.VarChar, 50).Value = txtRemarks.Text;
 
            if(btnSave.Text == "Update") cmd.Parameters.Add("@ColorID", System.Data.SqlDbType.Int).Value = txtID.Text;

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

                SqlCommand cmd = new SqlCommand("SELECT ColorID, Name FROM Colors ORDER BY Name", con);
                cmd.CommandType = System.Data.CommandType.Text;

                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                ddList.DataSource = dr;
                ddList.DataBind();
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
        
        protected void ddList_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

            try
        {
            con.Open();

            string sql;
            sql = string.Format("SELECT ColorID, Name, Remarks FROM Colors WHERE ColorID={0}", ddList.SelectedValue);

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtID.Text = dr["ColorID"].ToString();
                txtName.Text = dr["Name"].ToString();
                txtRemarks.Text = dr["Remarks"].ToString();

                txtName.Focus();             
            }
        
            dr.Close();

            //  Form settings
            lblHead.Text = "Update Color";
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

                SqlCommand cmd = new SqlCommand("DeleteColor", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("ColorID", System.Data.SqlDbType.Int).Value = txtID.Text;

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


  
   
