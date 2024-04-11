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
        protected void Page_Load(object sender, EventArgs e)
        {
            rpProducts.DataSource = ((List<Product>)HttpContext.Current.Application["Products"]);
            rpProducts.DataBind();
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
                        if(i.id == p.id)
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
    }
}