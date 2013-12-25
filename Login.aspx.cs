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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text == "challan" && txtPassword.Text == "")
        {
            FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, false);
        }
        else
        {
            lblError.Text = "Username or password is invalid!";
        }
    }
}
