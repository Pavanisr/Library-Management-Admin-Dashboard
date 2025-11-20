using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Category : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["LibraryMS"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null || string.IsNullOrEmpty(Session["Admin"].ToString()))
                Response.Redirect("Login.aspx");

            if (!IsPostBack) LoadCategories();
        }

        void LoadCategories()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Categories", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvCategories.DataSource = dt;
            gvCategories.DataBind();
        }

        protected void gvCategories_RowEditing(object sender, GridViewEditEventArgs e)
        {
            if (e.NewEditIndex < 0 || e.NewEditIndex >= gvCategories.Rows.Count) return;

            gvCategories.EditIndex = e.NewEditIndex;
            LoadCategories();
        }

        protected void gvCategories_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (e.RowIndex < 0 || e.RowIndex >= gvCategories.Rows.Count) return;
            if (gvCategories.DataKeys[e.RowIndex] == null) return;

            int id = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Value);

            GridViewRow row = gvCategories.Rows[e.RowIndex];
            TextBox txtName = row.Cells[1].Controls[0] as TextBox;
            if (txtName == null) return;

            string name = txtName.Text;

            SqlCommand cmd = new SqlCommand("UPDATE Categories SET CategoryName=@n WHERE CategoryID=@id", con);
            cmd.Parameters.AddWithValue("@n", name);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            gvCategories.EditIndex = -1;
            LoadCategories();
        }

        protected void gvCategories_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategories.EditIndex = -1;
            LoadCategories();
        }

        protected void gvCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (e.RowIndex < 0 || e.RowIndex >= gvCategories.Rows.Count) return;
            if (gvCategories.DataKeys[e.RowIndex] == null) return;

            int id = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Value);

            SqlCommand cmd = new SqlCommand("DELETE FROM Categories WHERE CategoryID=@id", con);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadCategories();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCategory.aspx");
        }
    }
}
