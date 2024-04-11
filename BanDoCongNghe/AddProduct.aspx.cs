using Models.Product;
using BanDoCongNghe.App_Code.Services;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using App_Codez.Services;
namespace BanDoCongNghe
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                int id = ((List<Product>)HttpContext.Current.Application["Products"]).Count;
                string name = Request.Form["txtName"];
                string loai = Request.Form["txtLoai"];
                int price = int.Parse(Request.Form["nbPrice"]);
                int sl = int.Parse(Request.Form["nbSoLuong"]);
                int ram = int.Parse(Request.Form["nbRam"]);
                int rom = int.Parse(Request.Form["nbRom"]);
                string hang = Request.Form["txtHang"];
                int nam = int.Parse(Request.Form["nbNam"]);
                string cpu = Request.Form["txtCPU"];
                float sizeMH = float.Parse(Request.Form["nbMH"]);
                int[] phanGiai = { int.Parse(Request.Form["nbPhanGiai"].ToString().Split('x')[0]), int.Parse(Request.Form["nbPhanGiai"].ToString().Split('x')[1]) };
                int pin = int.Parse(Request.Form["nbPin"]);
                int doSang = int.Parse(Request.Form["nbDoSang"]);
                string mauSac = Request.Form["txtMauSac"];
                string des = Request.Form["txtDes"];
                HttpPostedFile p = img.PostedFile;
                string filePath = Server.MapPath("~/imgs/Products/ " + id + Path.GetExtension(p.FileName));
                p.SaveAs(filePath);

                Product product = new Product(id, loai, name, price, sl, ram, rom, hang, nam, cpu, sizeMH, phanGiai, pin, doSang, mauSac, des, id);

                ((List<Product>)HttpContext.Current.Application["Products"]).Add(product);
                ProductService.gI().saveProducts();
            }
        }
    }
}