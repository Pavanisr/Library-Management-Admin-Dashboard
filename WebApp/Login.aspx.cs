// Login.aspx.cs
using System;
using System.Data.SqlClient;

namespace WebApp
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            System.Configuration.ConfigurationManager.ConnectionStrings["LibraryMS"].ConnectionString);

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Admins WHERE Username=@u AND Password=@p", con);
            cmd.Parameters.AddWithValue("@u", txtUsername.Text);
            cmd.Parameters.AddWithValue("@p", txtPassword.Text);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            if (count > 0)
            {
                Session["Admin"] = txtUsername.Text;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid Username or Password!";
            }
        }
    }
}
