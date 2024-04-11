using App_Codez.Services;
using Models.Product;
using Models.User;
using System;
using System.Web;
using System.Web.UI.WebControls;

namespace BanDoCongNghe
{
    public partial class HeaderFooter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            logOut.ServerClick += logOut_Click;
        }
        protected void logOut_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            HttpCookie c = new HttpCookie("User");
            c.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(c);
            Response.Redirect("index.aspx");
        }
        protected void btnRegis_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registry.aspx");
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        
    }
}