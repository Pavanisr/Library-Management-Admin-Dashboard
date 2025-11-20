using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApp
{
    public partial class IssuedBooks : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["LibraryMS"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null) Response.Redirect("Login.aspx");
            if (!IsPostBack) LoadIssuedBooks();
        }

        void LoadIssuedBooks()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                @"SELECT ib.IssueID, b.BookID, b.Title AS BookTitle, m.FullName AS MemberName, m.Phone, 
                         ib.IssueDate, ib.ReturnDate, ib.Status
                  FROM IssuedBooks ib
                  LEFT JOIN Books b ON ib.BookID=b.BookID
                  LEFT JOIN Members m ON ib.MemberID=m.MemberID", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvIssued.DataSource = dt;
            gvIssued.DataBind();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnAddIssued_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddIssuedBook.aspx");
        }

        protected void gvIssued_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ReturnBook")
            {
                int issueID = Convert.ToInt32(e.CommandArgument);

                SqlCommand cmd = new SqlCommand("UPDATE IssuedBooks SET Status='Returned', ReturnDate=GETDATE() WHERE IssueID=@id", con);
                cmd.Parameters.AddWithValue("@id", issueID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                LoadIssuedBooks(); // Refresh GridView
            }
        }
    }
}
