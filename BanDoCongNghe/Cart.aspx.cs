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
    public partial class Cart : System.Web.UI.Page
    {
        public string listTick="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.HttpMethod == "GET")
            {
                if (Request.QueryString["list"] != null)
                {
                    string[] list = Request.QueryString["list"].ToString().Split(',');
                    for(int i = 0;i < list.Length; i++)
                    {
                        for(int j = ((User)Session["User"]).giohang.Count - 1;j >= 0; j--)
                        {
                            if (((User)Session["User"]).giohang[j].id == int.Parse(list[i]))
                            {
                                ((User)Session["User"]).giohang.RemoveAt(j);
                                break;
                            }
                        }
                    }
                    Response.Redirect("Success.aspx");
                }
            }
            if ((User)Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            List<Product> listCart = ((User)Session["User"]).giohang;
            rptGioHang.DataSource = listCart;
            rptGioHang.DataBind();
            
        }
        protected void txtSl_TextChanged(object sender, EventArgs e)
        {
            TextBox tb = (TextBox)sender;
            int sl = int.Parse(tb.Text);
            if(sl < 1)
            {
                tb.Text = "1";
                return;
            }
            int id = int.Parse(tb.Attributes["id"].ToString());
            foreach(Product p in ((User)Session["User"]).giohang)
            {
                if(p.id == id)
                {
                    p.soLuong = sl; break;
                }
            }
        }
        protected void Delete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            List<Product> listGioHang = ((User)Session["User"]).giohang;
            for (int i = 0; i < listGioHang.Count; i++)
            {
                if (listGioHang[i].id == id)
                {
                    listGioHang.Remove(listGioHang[i]);
                    Response.Redirect("Cart.aspx");

                }
            }
            UserService.gI().saveUsers();
        }
        protected void Buy_Click(object o,EventArgs e)
        {

        }
        protected void Minus_Click(object sender, EventArgs e)
        {

            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            List<Product> listGioHang = ((User)Session["User"]).giohang;
            for (int i = 0; i < listGioHang.Count; i++)
            {
                if (listGioHang[i].id == id)
                {

                    if (listGioHang[i].soLuong - 1 < 1)
                    {
                        
                    }
                    else
                    {
                        listGioHang[i].soLuong--;
                        Response.Redirect("Cart.aspx");
                    }
                }
            }

        }

        protected void Plus_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            List<Product> listGioHang = ((User)Session["User"]).giohang; 
            for (int i = 0; i < listGioHang.Count; i++)
            {
                if (listGioHang[i].id == id)
                {
                    listGioHang[i].soLuong++;
                    Response.Redirect("Cart.aspx");

                }
            }
        }
    }
}