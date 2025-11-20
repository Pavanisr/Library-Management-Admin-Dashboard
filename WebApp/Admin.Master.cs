using System;
using System.Web.UI;

namespace WebApp
{
    public partial class Admin : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Show admin name or other info
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session
            Session.Clear();
            Session.Abandon();

            // Redirect to home or login page
            Response.Redirect("~/"); // change to your homepage or Login.aspx
        }
    }
}
