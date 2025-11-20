using System;
using System.Web.UI;

namespace WebApp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get current page file name
            string currentPage = System.IO.Path.GetFileName(Request.Path);

            // Show navbar only on Default.aspx (home page)
            if (currentPage.Equals("Default.aspx", StringComparison.OrdinalIgnoreCase))
            {
                phNavbar.Visible = true;
            }
            else
            {
                phNavbar.Visible = false; // Hide navbar on all other pages
            }
        }
    }
}
