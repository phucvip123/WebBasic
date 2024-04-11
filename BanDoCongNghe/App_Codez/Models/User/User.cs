using System.Collections.Generic;

namespace Models.User
{
    public class User
    {
        public int id { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public bool isAdmin { get; set; }
        public List<Product.Product> giohang { get; set; }

        public User() { }
        public User(int id, string username, string password, string name, string email, string phone)
        {
            this.id = id;
            this.username = username;
            this.password = password;
            this.name = name;
            this.email = email;
            this.phone = phone;
            this.giohang = new List<Product.Product>();
        }

    }
}