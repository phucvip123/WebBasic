using Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanDoCongNghe
{
    public partial class UserInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            if (Session["User"] != null)
            {

                User user = (User)Session["User"];

                //ID.Text = "#" + user.id.ToString();
                password.Text = user.password.ToString();
                nameLogin.Text = user.username.ToString();
                name.Text = user.name.ToString();
                nameLogin2.Text = user.username.ToString();
                sdt.Text = user.phone.ToString();
                email.Text = user.email.ToString();

                string pw = password.Text;
                string hide = new string('*', pw.Length);
                password.Text = hide;

            }
            else
            {
                Response.Redirect("index.aspx");
            }
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

    }
}