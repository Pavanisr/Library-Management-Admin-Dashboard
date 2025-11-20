
using System;
using System.Data.SqlClient;

namespace WebApp
{
    public partial class AddCategory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            System.Configuration.ConfigurationManager.ConnectionStrings["LibraryMS"].ConnectionString
        );

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCategoryName.Text))
            {
                lblMsg.Text = "Category name is required!";
                lblMsg.CssClass = "text-danger mt-3 fw-bold";
                return;
            }

            con.Open();
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Categories (CategoryName) VALUES (@n)", con);

            cmd.Parameters.AddWithValue("@n", txtCategoryName.Text);
            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Category added successfully!";
            lblMsg.CssClass = "text-success mt-3 fw-bold";

            
            txtCategoryName.Text = "";
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

    }
}
