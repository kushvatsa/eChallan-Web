using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class cash_deposit_by_owner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("RptCashDeposit", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@StartDate", System.Data.SqlDbType.SmallDateTime, 50).Value = txtStartDate.Text;
            cmd.Parameters.Add("@EndDate", System.Data.SqlDbType.SmallDateTime, 50).Value = txtEndDate.Text;

            SqlParameter prm;
            prm = cmd.Parameters.Add("@TotalDeposit", System.Data.SqlDbType.Int);
            prm.Direction = System.Data.ParameterDirection.InputOutput;

            cmd.ExecuteNonQuery();

            txtLbl.Text = "Cash Collected :";
            txtMoney.Text = cmd.Parameters["@TotalDeposit"].Value.ToString();
        }
        catch (Exception ex)
        {
           txtMoney.Text = ex.Message;
        }

        finally
        {
            if (con.State == System.Data.ConnectionState.Open) con.Close();
        }

    }
}