using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Members : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["LibraryMS"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null) Response.Redirect("Login.aspx");
            if (!IsPostBack) LoadMembers();
        }

        void LoadMembers()
        {
            SqlDataAdapter da = new SqlDataAdapter(
                @"SELECT m.MemberID, m.FullName, m.Email, m.Phone, 
                  COUNT(ib.IssueID) AS BooksBorrowed
                  FROM Members m
                  LEFT JOIN IssuedBooks ib ON m.MemberID=ib.MemberID AND ib.ReturnDate IS NULL
                  GROUP BY m.MemberID, m.FullName, m.Email, m.Phone", con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            gvMembers.DataSource = dt;
            gvMembers.DataBind();
        }

        protected void gvMembers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMembers.EditIndex = e.NewEditIndex;
            LoadMembers();
        }

        protected void gvMembers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int memberId = Convert.ToInt32(gvMembers.DataKeys[e.RowIndex].Value);

            TextBox txtName = (TextBox)gvMembers.Rows[e.RowIndex].FindControl("txtName");
            TextBox txtEmail = (TextBox)gvMembers.Rows[e.RowIndex].FindControl("txtEmail");
            TextBox txtPhone = (TextBox)gvMembers.Rows[e.RowIndex].FindControl("txtPhone");

            string name = txtName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;

            SqlCommand cmd = new SqlCommand("UPDATE Members SET FullName=@n, Email=@e, Phone=@p WHERE MemberID=@id", con);
            cmd.Parameters.AddWithValue("@n", name);
            cmd.Parameters.AddWithValue("@e", email);
            cmd.Parameters.AddWithValue("@p", phone);
            cmd.Parameters.AddWithValue("@id", memberId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            gvMembers.EditIndex = -1;
            LoadMembers();
        }

        protected void gvMembers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMembers.EditIndex = -1;
            LoadMembers();
        }

        protected void gvMembers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int memberId = Convert.ToInt32(gvMembers.DataKeys[e.RowIndex].Value);
            SqlCommand cmd = new SqlCommand("DELETE FROM Members WHERE MemberID=@id", con);
            cmd.Parameters.AddWithValue("@id", memberId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadMembers();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx"); // Redirects to dashboard
        }


        protected void btnAddMember_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddMember.aspx"); // Redirect to add member page
        }
    }
}
