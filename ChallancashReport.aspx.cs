using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ChallancashReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
         {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
        con.Open();

        SqlCommand cmd = new SqlCommand("RptChallanCash", con);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        //string dt = txtStartDate.Text;
        //string[] arr = dt.Split('/');


        cmd.Parameters.Add("@StartDate", System.Data.SqlDbType.SmallDateTime).Value = txtStartDate.Text;
        cmd.Parameters.Add("@EndDate", System.Data.SqlDbType.SmallDateTime).Value = txtEndDate.Text;
        SqlParameter prm;
        prm = cmd.Parameters.Add("@TotalDeposit", System.Data.SqlDbType.Int);
        prm.Direction = System.Data.ParameterDirection.InputOutput;
        cmd.ExecuteNonQuery();
 
        lblCash.Text = "Cash Collected:";
        lblMoney.Text = cmd.Parameters["@TotalDeposit"].Value.ToString();
        SqlDataReader dr;

        dr = cmd.ExecuteReader();
        lblMoney.DataBind();


        con.Close();
    }
}
    }
