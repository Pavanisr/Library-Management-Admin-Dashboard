using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Books : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["LibraryMS"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null || string.IsNullOrEmpty(Session["Admin"].ToString()))
                Response.Redirect("Login.aspx");

            if (!IsPostBack) LoadBooks();
        }

        void LoadBooks()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT b.BookID, b.Title, b.Author, b.CategoryID, c.CategoryName, b.Quantity FROM Books b LEFT JOIN Categories c ON b.CategoryID=c.CategoryID", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvBooks.DataSource = dt;
            gvBooks.DataBind();
        }

        protected void gvBooks_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvBooks.EditIndex = e.NewEditIndex;
            LoadBooks();

            DropDownList ddl = gvBooks.Rows[e.NewEditIndex].FindControl("ddlCategory") as DropDownList;
            if (ddl != null)
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Categories", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddl.DataSource = dt;
                ddl.DataTextField = "CategoryName";
                ddl.DataValueField = "CategoryID";
                ddl.DataBind();

                // Select current category
                DataRow row = ((DataTable)gvBooks.DataSource).Rows[e.NewEditIndex];
                if (row != null && row["CategoryID"] != DBNull.Value)
                    ddl.SelectedValue = row["CategoryID"].ToString();
            }
        }

        protected void gvBooks_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (gvBooks.DataKeys[e.RowIndex] == null) return;

            int bookId = Convert.ToInt32(gvBooks.DataKeys[e.RowIndex].Value);

            GridViewRow row = gvBooks.Rows[e.RowIndex];
            if (row == null) return;

            TextBox txtTitle = row.Cells[0].Controls[0] as TextBox;
            TextBox txtAuthor = row.Cells[1].Controls[0] as TextBox;
            DropDownList ddlCategory = row.FindControl("ddlCategory") as DropDownList;
            TextBox txtQty = row.Cells[3].Controls[0] as TextBox;

            if (txtTitle == null || txtAuthor == null || ddlCategory == null || txtQty == null) return;

            string title = txtTitle.Text;
            string author = txtAuthor.Text;
            int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
            int quantity = int.TryParse(txtQty.Text, out int q) ? q : 0;

            SqlCommand cmd = new SqlCommand("UPDATE Books SET Title=@t, Author=@a, CategoryID=@c, Quantity=@q WHERE BookID=@id", con);
            cmd.Parameters.AddWithValue("@t", title);
            cmd.Parameters.AddWithValue("@a", author);
            cmd.Parameters.AddWithValue("@c", categoryId);
            cmd.Parameters.AddWithValue("@q", quantity);
            cmd.Parameters.AddWithValue("@id", bookId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            gvBooks.EditIndex = -1;
            LoadBooks();
        }

        protected void gvBooks_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvBooks.EditIndex = -1;
            LoadBooks();
        }

        protected void gvBooks_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (gvBooks.DataKeys[e.RowIndex] == null) return;

            int bookId = Convert.ToInt32(gvBooks.DataKeys[e.RowIndex].Value);
            SqlCommand cmd = new SqlCommand("DELETE FROM Books WHERE BookID=@id", con);
            cmd.Parameters.AddWithValue("@id", bookId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadBooks();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx"); // Back to dashboard
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBook.aspx");
        }
    }
}
