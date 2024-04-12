using Models.Product;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.IO;
using System.Web;

namespace App_Codez.Services
{
    public class ProductService
    {
        public static ProductService Instance;

        public static ProductService gI()
        {
            if (Instance == null)
            {
                Instance = new ProductService();
            }
            return Instance;
        }
        public List<Product> getProducts()
        {
            List<Product> products;
            string pathUserJson = string.Empty;
            if (HttpContext.Current != null)
            {
                pathUserJson = HttpContext.Current.Server.MapPath("~/App_Data/Json/Products.json");
            }
            //Đọc user
            string jsonContent = File.ReadAllText(pathUserJson);
            products = JsonConvert.DeserializeObject<List<Product>>(jsonContent);
            
            return products ?? new List<Product>();
        }
        public void saveProducts()
        {
            List<Product> products = (List<Product>)(HttpContext.Current.Application["Products"]);
            string pathUserJson = string.Empty;
            if (HttpContext.Current != null)
            {
                pathUserJson = HttpContext.Current.Server.MapPath("~/App_Data/Json/Products.json");
            }
            string jsonContent = JsonConvert.SerializeObject(products);
            File.WriteAllText(pathUserJson, jsonContent);
        }
        public List<Product> GetProducts() {
            return ((List<Product>)HttpContext.Current.Application["Products"]);
        }
        public Product GetProduct(int id)
        {
            foreach(Product p in ((List<Product>)HttpContext.Current.Application["Products"]))
            {
                if(p.id == id) return p;
            }
            return null;
        }
        public void SubQuantityItem(int id,int quantity)
        {
            foreach (Product p in ((List<Product>)HttpContext.Current.Application["Products"]))
            {
                if (p.id == id)
                {
                    p.soLuong-= quantity;
                }
            }
        }
        public List<string> GetHangs()
        {
            List<string> hangs = new List<string>();
            foreach(Product p in GetProducts())
            {
                if (!hangs.Contains(p.hang))
                {
                    hangs.Add(p.hang);
                }
            }
            return hangs;
        }
    }
}