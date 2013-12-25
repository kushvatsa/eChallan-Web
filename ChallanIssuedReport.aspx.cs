﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;

public partial class ChallanIssuedReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }

    }

    void FillListArea()
    {
        try
        {

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT AreaID, Name, Remarks FROM Areas ORDER BY Name", con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            ddlFillList.DataSource = dr;
            ddlFillList.DataBind();

            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }


    protected void ddlChallanReport_SelectedIndexChanged(object sender, EventArgs e)
    {

        try
        {
            if (ddlChallanReport.SelectedItem.Text == "Area")
            {
                fillArea();
            }
            else if (ddlChallanReport.SelectedItem.Text == "Operator")
            {
                fillOperator();
            }
            else if (ddlChallanReport.SelectedItem.Text == "Challan Type")
            {
                fillChallanType();
            }
            else
            {
                ddlFillList.Items.Clear();
                ddlFillList.Items.Insert(0, "-----Select-------");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

    }

    void fillArea()
    {
        try
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("ddlAreas", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();

            ddlFillList.DataSource = dr;
            ddlFillList.DataValueField = "AreaID";
            ddlFillList.DataTextField = "Name";

            ddlFillList.DataBind();

            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    void fillOperator()
    {
        try
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("ddlOperators", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();

            ddlFillList.DataSource = dr;
            ddlFillList.DataValueField = "OperatorID";
            ddlFillList.DataTextField = "Name";

            ddlFillList.DataBind();

            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    void fillChallanType()
    {
        try
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("ddlChallanTypes", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataReader dr;
            dr = cmd.ExecuteReader();

            ddlFillList.DataSource = dr;
            ddlFillList.DataValueField = "ChallanTypeID";
            ddlFillList.DataTextField = "Name";

            ddlFillList.DataBind();

            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["eChallanConnectionString2"].ToString());
            con.Open();

            SqlCommand cmd = new SqlCommand("RptIssueChallans", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("@FLD", SqlDbType.VarChar, 50).Value = ddlChallanReport.SelectedValue;
            cmd.Parameters.Add("@Val", SqlDbType.VarChar, 50).Value = ddlFillList.SelectedValue;
            cmd.Parameters.Add("@StartDate", SqlDbType.SmallDateTime).Value = txtStartDate.Text;
            cmd.Parameters.Add("@EndDate", SqlDbType.SmallDateTime).Value = txtEndDate.Text;

            SqlDataReader dr;

            dr = cmd.ExecuteReader();

            GridView1.DataSource = dr;
            GridView1.DataBind();

            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}