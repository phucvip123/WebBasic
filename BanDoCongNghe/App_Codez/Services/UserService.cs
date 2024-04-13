using Models.Product;
using Models.User;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Web;

namespace BanDoCongNghe.App_Code.Services
{
    public class UserService
    {
        private static UserService instance;

        public static UserService gI()
        {
            if (instance == null)
            {
                instance = new UserService();
            }
            return instance;
        }
        public User checkLogin(string username, string password)
        {
            foreach (User u in (List<User>)(HttpContext.Current.Application["Users"]))
            {
                if (u.username == username && u.password == password)
                {
                    return u;
                }
            }
            return null;
        }
        public List<User> getUsers()
        {
            List<User> users;
            string pathUserJson = string.Empty;
            if (HttpContext.Current != null)
            {
                pathUserJson = HttpContext.Current.Server.MapPath("~/App_Data/Json/Users.json");
            }
            //Đọc user
            string jsonContent = File.ReadAllText(pathUserJson);
            users = JsonConvert.DeserializeObject<List<User>>(jsonContent);
            return users ?? new List<User>();
        }
        public void saveUsers()
        {
            string pathUserJson = string.Empty;
            if (HttpContext.Current != null)
            {
                pathUserJson = HttpContext.Current.Server.MapPath("~/App_Data/Json/Users.json");
            }
            if(HttpContext.Current != null)
            {
                List<User> userList = ((List<User>)HttpContext.Current.Application["Users"]);
                string jsonContent = JsonConvert.SerializeObject(userList);
                File.WriteAllText(pathUserJson, jsonContent);
            }
            
        }
        public bool addItemToCart(User u,Product p)
        {
            bool flag = false;
            if (u == null || p == null) return false;
            foreach (Product x in u.giohang)
            {
                if(x.id ==  p.id)
                {
                    x.soLuong += p.soLuong;
                    flag = true;
                }
            }
            if (!flag)
            {
                u.giohang.Add(p);
            }
            return true;
        }
    }
}