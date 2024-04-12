using System;
using System.Web;
using App_Codez.Services;
using BanDoCongNghe.App_Code.Services;
using Models.User;

namespace BanDoCongNghe
{
    public class Global : System.Web.HttpApplication
    {


        protected void Application_Start(object sender, EventArgs e)
        {
            System.Web.Routing.RouteTable.Routes.MapPageRoute("Default", "", "~/index.aspx");
            Application["Users"] = UserService.gI().getUsers();
            Application["Products"] = ProductService.gI().getProducts();

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            HttpCookie ckUser = Request.Cookies["User"];
            if (ckUser != null && ckUser["IsRemember"] != null && ckUser["IsRemember"] == "1" && ckUser["Username"] != null && ckUser["Password"] != null)
            {
                User newUser = UserService.gI().checkLogin(ckUser["Username"], ckUser["Password"]);
                if (newUser != null)
                {
                    Session["User"] = newUser;
                }
            }
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {
            //Lưu user
            UserService.gI().saveUsers();

        }
    }
}