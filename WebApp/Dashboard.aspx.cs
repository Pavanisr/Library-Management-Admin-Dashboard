using System;
using System.Data.SqlClient;
using System.Text;

namespace WebApp
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["LibraryMS"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null) Response.Redirect("Login.aspx");

            if (!IsPostBack) LoadDashboard();
        }

        void LoadDashboard()
        {
            con.Open();

            // Labels
            lblBooks.Text = new SqlCommand("SELECT COUNT(*) FROM Books", con).ExecuteScalar().ToString();
            lblMembers.Text = new SqlCommand("SELECT COUNT(*) FROM Members", con).ExecuteScalar().ToString();
            lblIssued.Text = new SqlCommand("SELECT COUNT(*) FROM IssuedBooks", con).ExecuteScalar().ToString();

            // Category-wise Books
            SqlCommand cmd = new SqlCommand(
                "SELECT c.CategoryName, COUNT(b.BookID) FROM Categories c LEFT JOIN Books b ON c.CategoryID=b.CategoryID GROUP BY c.CategoryName", con);
            SqlDataReader dr = cmd.ExecuteReader();
            blCategoryBooks.Items.Clear();
            while (dr.Read())
                blCategoryBooks.Items.Add($"{dr[0]} : {dr[1]}");
            dr.Close();

            con.Close();
        }

        // Chart Data
        public string GetCategoryLabels()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT CategoryName FROM Categories", con);
            SqlDataReader dr = cmd.ExecuteReader();
            StringBuilder sb = new StringBuilder();
            while (dr.Read()) sb.Append("'" + dr[0] + "',");
            dr.Close();
            con.Close();
            return sb.ToString().TrimEnd(',');
        }

        public string GetBooksPerCategory()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(
                "SELECT COUNT(b.BookID) FROM Categories c LEFT JOIN Books b ON c.CategoryID=b.CategoryID GROUP BY c.CategoryName", con);
            SqlDataReader dr = cmd.ExecuteReader();
            StringBuilder sb = new StringBuilder();
            while (dr.Read()) sb.Append(dr[0] + ",");
            dr.Close();
            con.Close();
            return sb.ToString().TrimEnd(',');
        }

        public string GetIssuedPerCategory()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(
                @"SELECT COUNT(ib.IssueID) 
                  FROM Categories c 
                  LEFT JOIN Books b ON c.CategoryID=b.CategoryID 
                  LEFT JOIN IssuedBooks ib ON b.BookID=ib.BookID 
                  GROUP BY c.CategoryName", con);
            SqlDataReader dr = cmd.ExecuteReader();
            StringBuilder sb = new StringBuilder();
            while (dr.Read()) sb.Append(dr[0] + ",");
            dr.Close();
            con.Close();
            return sb.ToString().TrimEnd(',');
        }

        public string GetMonthlyBooks()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(
                @"SELECT ISNULL(MONTH(AddedDate),0), COUNT(*) 
                  FROM Books 
                  GROUP BY MONTH(AddedDate) 
                  ORDER BY MONTH(AddedDate)", con);
            SqlDataReader dr = cmd.ExecuteReader();
            int[] data = new int[12];
            while (dr.Read()) data[Convert.ToInt32(dr[0]) - 1] = Convert.ToInt32(dr[1]);
            dr.Close(); con.Close();
            return string.Join(",", data);
        }

        public string GetMonthlyMembers()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(
                @"SELECT ISNULL(MONTH(RegDate),0), COUNT(*) 
                  FROM Members 
                  GROUP BY MONTH(RegDate) 
                  ORDER BY MONTH(RegDate)", con);
            SqlDataReader dr = cmd.ExecuteReader();
            int[] data = new int[12];
            while (dr.Read()) data[Convert.ToInt32(dr[0]) - 1] = Convert.ToInt32(dr[1]);
            dr.Close(); con.Close();
            return string.Join(",", data);
        }
    }
}
