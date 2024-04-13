using App_Codez.Services;
using BanDoCongNghe.App_Code.Services;
using Models.Product;
using Models.User;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace BanDoCongNghe
{
    public partial class index : System.Web.UI.Page
    {
        public static List<Product> products = new List<Product>();
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowListProduct();
            rpProducts.DataSource =products;
            rpProducts.DataBind();

            ddlFilterHang.DataSource = ProductService.gI().GetHangs();
            ddlFilterHang.DataBind();
            ddlFilterHang.Items.Add(new ListItem("All"));
            ddlFilterHang.SelectedIndex = ddlFilterHang.Items.Count-1;

        }
        public string[] GetImageFiles()
        {
            string slideshowFolderPath = Server.MapPath("~/imgs/SlideShow");
            if (Directory.Exists(slideshowFolderPath))
            {
                return Directory.GetFiles(slideshowFolderPath);
            }
            else
            {
                return new string[0];
            }
        }
        protected void btnAddItemToCart_Click(object sender,EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            Button btn = (Button)sender;
            int id = int.Parse(btn.CommandArgument);
            Product p = ProductService.gI().GetProduct(id);
            if(p != null)
            {
                if(p.soLuong > 0)
                {
                    bool flag = true;
                    foreach(Product i in ((User)Session["User"]).giohang)
                    {
                        if(i.id == id)
                        {
                            i.soLuong += 1;
                            flag = false;
                            break;
                        }
                    }
                    if (flag)
                    {
                        p.soLuong = 1;
                        ((User)Session["User"]).giohang.Add(p);
                    }    
                    UserService.gI().saveUsers();
                }
                else
                {
                    Response.Write("<script>alert('Sản phẩm đang hết hàng')</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Sản phẩm không tồn tại')</script>");
            }

        }
        public List<Product> FilterItem(int min,int max,string h)
        {
            
            List<Product> list = products;
           
            
            string hang = h;
            for (int i = list.Count - 1; i >= 0; i--)
            {
                Product p = list[i];
                if (p.price < min || p.price > max || (!string.IsNullOrEmpty(hang) && p.hang != hang && hang != "All"))
                {
                    list.RemoveAt(i);
                }
            }
            return list;
        }
        public void ShowListProduct()
        {
            
            if (Request.Form["txtSearch"] != null)
            {
                products = new List<Product>((List<Product>)Application["Products"]);
                string search = Request.Form["txtSearch"].ToString();
                for(int i = products.Count-1;i >= 0; i--)
                {
                    if (!products[i].name.ToLower().Contains(search.ToLower()))
                    {
                        products.RemoveAt(i);
                    }
                }
                ddlFilterHang.SelectedItem.Value = Request.Form["txtSearch"].ToString();
                ddlFilterHang.SelectedItem.Text = Request.Form["txtSearch"].ToString();
                return;

            }
            products = new List<Product>((List<Product>)Application["Products"]);
            if (Request.QueryString["minPrice"] != null || Request.QueryString["maxPrice"] != null || (Request.QueryString["hang"] != null && Request.QueryString["hang"].ToString() != "All"))
            {

                int min; int max;
                if (int.TryParse(Request.QueryString["minPrice"].ToString(), out min) && min != -1)
                {
                    minPrice.Value = min.ToString();
                }
                else
                {
                    min = -1;
                    minPrice.Value = min.ToString();
                }
                if (int.TryParse(Request.QueryString["maxPrice"].ToString(), out max) && max != 2123456789)
                {
                    maxPrice.Value = max.ToString();
                }
                else
                {
                    max = 2123456789;
                    maxPrice.Value = max.ToString();
                }
                products = new List<Product>(FilterItem(min, max, Request.QueryString["hang"]));
            }
            else
            {
                products = new List<Product>(ProductService.gI().GetProducts());
            }
        }
    }
}