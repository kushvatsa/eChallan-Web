using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class slip : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDate.Text = System.DateTime.Today.ToShortDateString();
        if (!IsPostBack)
        {
            printReceipt();
        }
    }

    protected void btnReceipt_Click(object sender, EventArgs e)
    {

    }

    void printReceipt()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
        try
        {

            con.Open();

            SqlCommand cmd = new SqlCommand("Receipt", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@IssueChallanID", System.Data.SqlDbType.Int).Value = Request.QueryString["IssueChallanID"].ToString();

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            dr.Read();

            lblVehicleNo.Text = dr["VehicleNo"].ToString();
            lblReceiptNo.Text = dr["ReceiptNo"].ToString();
            lblName.Text = dr["Name"].ToString();
            lblPlace.Text = dr["Place"].ToString();
            lblOperator.Text = dr["Operator"].ToString();
            lblChallan.Text = dr["Challan"].ToString();
            lblFine.Text = dr["Fine"].ToString();
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}
