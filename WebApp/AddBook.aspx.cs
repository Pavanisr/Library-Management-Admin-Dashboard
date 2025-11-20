using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApp
{
    public partial class AddBook : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            System.Configuration.ConfigurationManager.ConnectionStrings["LibraryMS"].ConnectionString
        );

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        void LoadCategories()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT CategoryID, CategoryName FROM Categories", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryID";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Category --", "0"));
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedValue == "0")
            {
                lblMsg.Text = "Please select a category.";
                lblMsg.CssClass = "text-danger mt-3 fw-bold";
                return;
            }

            con.Open();
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Books (Title, Author, CategoryID, Quantity) VALUES (@t, @a, @c, @q)", con);

            cmd.Parameters.AddWithValue("@t", txtTitle.Text);
            cmd.Parameters.AddWithValue("@a", txtAuthor.Text);
            cmd.Parameters.AddWithValue("@c", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@q", txtQty.Text);

            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Book added successfully!";
            lblMsg.CssClass = "text-success mt-3 fw-bold";

            // Clear inputs
            txtTitle.Text = "";
            txtAuthor.Text = "";
            txtQty.Text = "";
            ddlCategory.SelectedIndex = 0;
        }
    }
}
