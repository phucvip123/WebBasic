<%@ Page Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BanDoCongNghe.index" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace ="Models.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link rel ="stylesheet" href="./CSS/index.css"/>
    <div id="slideShow">
        <div id="mySlide">

       <%foreach(string f in GetImageFiles())
        {
        %>
         <image src="./imgs/SlideShow/<%=Path.GetFileName(f)%>" alt="<%=Path.GetFileName(f) %>" class="imgSlide"></image>
        <%
        } %>
        </div>

        <div id="sliderNav">
            <a id="prev" onclick="nextSlide(-1)">&#10094;</a>
            <a id="next" onclick="nextSlide(1)">&#10095;</a>
        </div>
    </div>
    <div id="filter-container">
        <div></div>
    </div>
    <div id="product-container">

        <%  List<Models.Product.Product> products = App_Codez.Services.ProductService.gI().GetProducts();
            for (int i = 0; i < products.Count() ; i++)
            { %>
                <div class="item">
                    <image src="./imgs/Products/<%=products[i].id %>.png" class="item-img"></image>
                    <p class="item-title"><%=products[i].name %></p>
                    <p class="item-price"><%=products[1].price %> đ</p>
                    <div class="btnProducts">
                        <button class="btnCart">Thêm vào giỏ</button>
                        <button class="btnBuy">Mua ngay</button>
                    </div>
                </div>

        <%} %>
        <div class="item">
            <image src="./imgs/Products/0.png" class="item-img"></image>
            <p class="item-title">Galaxy Vip Pro</p>
            <p class="item-price">100.000.000đ</p>
            <div class="btnProducts">
                <button class="btnCart">Thêm vào giỏ</button>
                <button class="btnBuy">Mua ngay</button>
            </div>
        </div>
    </div>

    <script src="./Scripts/index.js"></script>
    <script>
        var slides = document.getElementsByClassName("imgSlide");
        var idSlide = 0;
        function autoShowSlide() {
            nextSlide(1);
            setTimeout(function () { autoShowSlide(1) }, 3000);
        }
        function nextSlide(n) {
            n = parseInt(n);
            if (idSlide >= slides.length) {
                idSlide = 0;
            }
            var curSlide = idSlide;
            var nextSlide = idSlide + n;
            if (nextSlide >= slides.length) {
                nextSlide = 0;
            }
            if (nextSlide < 0) {
                nextSlide = slides.length - 1;
            }
            if (n == 1) {
                slides[curSlide].style.left = "0";
                slides[nextSlide].style.left = "100%";

                slides[curSlide].setAttribute("class", "imgSlide slideOutLeft");
                slides[nextSlide].setAttribute("class", "imgSlide slideInRight");
            }
            else {
                slides[curSlide].style.left = "0";
                slides[nextSlide].style.left = "-100%";

                slides[curSlide].setAttribute("class", "imgSlide slideOutRight");
                slides[nextSlide].setAttribute("class", "imgSlide slideInRight");
            }

            idSlide = nextSlide;
        }
        autoShowSlide(1);

        
    </script>
</asp:Content>