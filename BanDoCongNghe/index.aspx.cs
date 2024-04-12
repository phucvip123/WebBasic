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
            if(Request.HttpMethod == "POST")
            {
                
                if (Request.Form["txtSearch"] != null)
                {
                    int x = 1;
                }
            }
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
                    if(flag) ((User)Session["User"]).giohang.Add(p);
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
        public List<Product> FilterItem(string minP,string maxP,string h)
        {
            
            List<Product> list = products;
            int min;
            int max;
            
            if (minP == null || !int.TryParse(minP.ToString(), out min))
            {
                min = -1;
            }

            if (maxP == null || !int.TryParse(maxP.ToString(), out max))
            {
                max = int.MaxValue;

            }
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
            
            products = ((List<Product>)Application["Products"]);
            if (Request.Form["txtSearch"] != null)
            {
                string search = Request.Form["txtSearch"].ToString();
                for(int i = products.Count-1;i >= 0; i--)
                {
                    if (!products[i].name.ToLower().Contains(search.ToLower()))
                    {
                        products.RemoveAt(i);
                    }
                }

            }
            if (Request.QueryString["minPrice"] != null || Request.QueryString["maxPrice"] != null || (Request.QueryString["hang"] != null && Request.QueryString["hang"].ToString() != "All"))
            {

                int min; int max;
                if (int.TryParse(Request.QueryString["minPrice"].ToString(), out min) && min != -1)
                {
                    minPrice.Value = min.ToString();
                }
                if (int.TryParse(Request.QueryString["maxPrice"].ToString(), out max) && max != 2123456789)
                {
                    maxPrice.Value = max.ToString();
                }
                ddlFilterHang.SelectedItem.Value = Request.QueryString["hang"].ToString();
                ddlFilterHang.SelectedItem.Text = Request.QueryString["hang"].ToString();
                products = FilterItem(Request.QueryString["minPrice"], Request.QueryString["maxPrice"], Request.QueryString["hang"]);
            }
            else
            {
                products = ((List<Product>)Application["Products"]);
            }
        }
    }
}