using BanDoCongNghe.App_Code.Services;
using Models.User;
using System;
using System.Web;
namespace BanDoCongNghe
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                string username = Request.Form["username"];
                string password = Request.Form["password"];

                bool isRemember = Request.Form["remember"] == "on";
                if (username != null && password != null)
                {
                    User newUser = UserService.gI().checkLogin(username, password);
                    if (newUser != null)
                    {
                        Session["User"] = newUser;
                        if (isRemember)
                        {
                            HttpCookie user = new HttpCookie("User");
                            user["Username"] = username;
                            user["Password"] = password;
                            user["IsRemember"] = "1";
                            user.Expires = DateTime.Now.AddDays(30);
                            Response.Cookies.Add(user);
                        }
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        contentErr.InnerText = "Tài khoản hoặc mật khẩu không chính xác!";
                        errContainer.Style["display"] = "flex";
                    }
                }

            }
        }
    }
}