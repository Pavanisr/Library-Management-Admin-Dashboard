
using System;
using System.Data.SqlClient;

namespace WebApp
{
    public partial class AddMember : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            System.Configuration.ConfigurationManager.ConnectionStrings["LibraryMS"].ConnectionString
        );

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFullName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                lblMsg.Text = "All fields are required!";
                lblMsg.CssClass = "text-danger mt-3 fw-bold";
                return;
            }

            con.Open();
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Members (FullName, Email, Phone) VALUES (@n, @e, @p)", con);

            cmd.Parameters.AddWithValue("@n", txtFullName.Text);
            cmd.Parameters.AddWithValue("@e", txtEmail.Text);
            cmd.Parameters.AddWithValue("@p", txtPhone.Text);

            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Member added successfully!";
            lblMsg.CssClass = "text-success mt-3 fw-bold";

           
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

    }
}
