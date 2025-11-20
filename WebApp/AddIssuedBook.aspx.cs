using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApp
{
    public partial class AddIssuedBook : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["LibraryMS"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
                LoadMembers();
            }
        }

        void LoadBooks()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT BookID, Title, Quantity FROM Books WHERE Quantity > 0", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlBook.DataSource = dt;
            ddlBook.DataTextField = "Title";
            ddlBook.DataValueField = "BookID";
            ddlBook.DataBind();
            ddlBook.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Book --", "0"));
        }

        void LoadMembers()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT MemberID, FullName FROM Members", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlMember.DataSource = dt;
            ddlMember.DataTextField = "FullName";
            ddlMember.DataValueField = "MemberID";
            ddlMember.DataBind();
            ddlMember.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Member --", "0"));
        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {
            if (ddlBook.SelectedValue == "0" || ddlMember.SelectedValue == "0")
            {
                lblMsg.Text = "Please select both book and member.";
                lblMsg.CssClass = "text-danger mt-3 fw-bold";
                return;
            }

            DateTime? returnDate = null;
            if (!string.IsNullOrEmpty(txtReturnDate.Text))
            {
                if (DateTime.TryParse(txtReturnDate.Text, out DateTime dt))
                    returnDate = dt;
                else
                {
                    lblMsg.Text = "Invalid return date format.";
                    lblMsg.CssClass = "text-danger mt-3 fw-bold";
                    return;
                }
            }

            con.Open();
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO IssuedBooks (BookID, MemberID, IssueDate, ReturnDate) VALUES (@b, @m, GETDATE(), @r)", con);
            cmd.Parameters.AddWithValue("@b", ddlBook.SelectedValue);
            cmd.Parameters.AddWithValue("@m", ddlMember.SelectedValue);
            cmd.Parameters.AddWithValue("@r", (object)returnDate ?? DBNull.Value);
            cmd.ExecuteNonQuery();

            // Reduce book quantity by 1
            SqlCommand cmdUpdate = new SqlCommand("UPDATE Books SET Quantity = Quantity - 1 WHERE BookID=@b", con);
            cmdUpdate.Parameters.AddWithValue("@b", ddlBook.SelectedValue);
            cmdUpdate.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "Book issued successfully!";
            lblMsg.CssClass = "text-success mt-3 fw-bold";

            // Reset form and reload books
            ddlBook.SelectedIndex = 0;
            ddlMember.SelectedIndex = 0;
            txtReturnDate.Text = "";
            LoadBooks();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}
