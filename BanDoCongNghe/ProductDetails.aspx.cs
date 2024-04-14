using App_Codez.Services;
using BanDoCongNghe.App_Code.Services;
using Models.Product;
using Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanDoCongNghe
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        public int id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                id = int.Parse(Request.QueryString["id"].ToString());
            }
        }
        protected void btnThemVaoGioHang_Click(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            Button btn = (Button)sender;
            Product p = ProductService.gI().GetProduct(id);
            if (p != null) p.soLuong = 1;
            if (UserService.gI().addItemToCart(((User)Session["User"]), p))
            {
                Response.Redirect("Cart.aspx");
            }
            else
            {

            }
            
        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            Response.Redirect("Success.aspx");
        }
    }
}