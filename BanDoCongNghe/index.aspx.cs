using System;
using System.IO;

namespace BanDoCongNghe
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


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
    }
}