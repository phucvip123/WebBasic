using BanDoCongNghe.App_Code.Services;
using Models.User;
using System;
using System.Collections.Generic;
namespace BanDoCongNghe
{

    public partial class Registry : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                int id = ((List<User>)Application["Users"]).Count;
                string name = Request.Form["name"];
                string username = Request.Form["username"];
                string phone = Request.Form["numberPhone"];
                string password = Request.Form["password"];
                string rePassword = Request.Form["repass"];
                string email = Request.Form["email"];



                string ans = "";
                if (!checkStringEmpty(name) || !checkStringEmpty(username) || !checkStringEmpty(phone) || !checkStringEmpty(password) || !checkStringEmpty(email))
                {
                    ans += "Hãy điền đầy đủ các mục\n";
                    errContainer.Style["display"] = "flex";
                    contentErr.InnerText = "Lỗi\n" + ans;
                    contentRegis.Style["display"] = "none";
                    fail.Style["display"] = "flex";
                    sucess.Style["display"] = "none";

                }
                else
                {
                    if (password != rePassword)
                    {
                        ans += "Mật khẩu không trùng khớp\n";
                    }
                    User newUser = new User(id, username, password, name, email, phone);
                    ans += checkUserValid(newUser);
                    if (ans.Length > 0)
                    {
                        errContainer.Style["display"] = "flex";
                        contentErr.InnerText = "Lỗi\n" + ans;
                        contentRegis.Style["display"] = "none";
                        fail.Style["display"] = "flex";
                        sucess.Style["display"] = "none";
                    }
                    else
                    {
                        errContainer.Style["display"] = "none";
                        contentErr.InnerText = "Lỗi\n" + ans;
                        contentRegis.Style["display"] = "none";
                        fail.Style["display"] = "none";
                        sucess.Style["display"] = "flex";

                        ((List<User>)Application["Users"]).Add(newUser);
                        UserService.gI().saveUsers();
                    }
                }
            }
        }
        public bool checkStringEmpty(string str)
        {
            return str != null && str.Length > 0;
        }
        private string checkUserValid(User user)
        {
            string flag = "";
            List<User> users = ((List<User>)Application["Users"]);
            foreach (User u in users)
            {
                if (u.username == user.username)
                {
                    flag += "Tên đăng nhập đã tồn tại\n";
                    break;
                }
            }
            foreach (User u in users)
            {
                if (u.phone == user.phone)
                {
                    flag += "Số điện thoại đã tồn tại\n";
                    break;
                }
            }
            foreach (User u in users)
            {
                if (u.email == user.email)
                {
                    flag += "Email đã tồn tại\n";
                    break;
                }
            }
            if (user.username.Length < 4)
            {
                flag += "Username phải tối thiểu 4 kí tự\n";
            }

            if (user.phone.ToString()[0] != '0')
            {
                flag += "Số điện thoại phải bắt đầu từ 0\n";
            }
            else if (user.phone.ToString().Length < 10)
            {
                flag += "Số điện thoại chưa đủ 10 chữ số\n";
            }
            int ac = 0, cham = 0;
            for (int i = 0; i < user.email.ToString().Length; i++)
            {
                if (user.email.ToString()[i] == '@')
                {
                    ac++;
                }
                if (user.email.ToString()[i] == '.' && ac > 0)
                {
                    cham++;
                }
            }
            if (ac != 1 || cham < 1 || user.email.ToString().Length - ac - cham <= 2)
            {
                flag += "Email không đúng định dạng\n";
            }
            int thuong = 0, hoa = 0, so = 0;
            for (var i = 0; i < user.password.ToString().Length; i++)
            {
                int c = user.password.ToString()[i];
                if (c >= 'a' && c <= 'z')
                {
                    thuong++;
                }
                if (c >= 'A' && c <= 'Z')
                {
                    hoa++;
                }
                if (c >= '0' && c <= '9')
                {
                    so++;
                }
            }
            if (user.password.ToString().Length < 8)
            {
                flag += "Mật khẩu chưa đủ dài\n";
            }
            if (thuong == 0 || hoa == 0 || so == 0)
            {
                flag += "Mật khẩu chưa đúng định dạng\n";
            }
            return flag;
        }
    }
}