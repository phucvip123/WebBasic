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
        }%>
        </div>

        <div id="sliderNav">
            <a id="prev" onclick="nextSlide(-1)">&#10094;</a>
            <a id="next" onclick="nextSlide(1)">&#10095;</a>
        </div>
    </div>
    <div id="filter-container" class="is-flex">
        <p>Chọn theo nhu cầu</p>
        <div id="filter-option" class="is-flex">
        <asp:DropDownList ID="ddlFilterHang" runat="server" class="ddl"></asp:DropDownList>
        <p style="margin:auto 10px auto 20px">Giá: </p>
        <input runat="server"  id="minPrice"  type="number" placeholder="Tối thiểu" class="ifilter filterPrice"/>
        <p style="margin: auto 10px;"> → </p>
         <input runat="server" id="maxPrice" type="number" placeholder="Tối đa" class="ifilter filterPrice"/>
        <button class="btnFilter" onclick="btnFilter_Click()" type="button">Lọc</button>
        </div>
        
    </div>
    <div id="product-container">
        <script>
            function redirect(link) {
                window.location.href = link;
            }
        </script>
        <asp:Repeater ID="rpProducts" runat="server">
            <ItemTemplate>
                <div class="item"  >
                    <image onclick="redirect('ProductDetails.aspx?id=<%# Eval("id") %>')" src="./imgs/Products/<%# Eval("id") %>.png" class="item-img"></image>
                    <p class="item-title"><%# Eval("name") %></p>
                    <p class="item-price"><%#Eval("priceFormat")%>đ</p>
                    <div class="btnProducts">
                        <asp:Button class="btnCart" UseSubmitBehavior="false"  Text="Thêm vào giỏ" runat="server" onClick="btnAddItemToCart_Click" CommandArgument='<%# Eval("id") %>'/>
                        <button type="button" onclick="btnBuy()" class="btnBuy">Mua ngay</button>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <a href="#" id="back-to-top">
        <img src="./imgs/icons/backtotop.png" alt="Back to Top">
    </a>
    <script>
        function btnBuy() {
        <%if (Session["User"] == null)
        { %>
            window.location.href = "Login.aspx";
             <%}
        else
        { %>
             window.location.href = "Success.aspx?"
             <% }%>
        }
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
        function btnFilter_Click() {
            var hang = document.getElementsByClassName("ddl")[0].value;
            var minPrice = document.getElementsByClassName("filterPrice")[0] == null ? -1 : document.getElementsByClassName("filterPrice")[0].value;
            var maxPrice = document.getElementsByClassName("filterPrice")[1] == null ? 2123456789 : document.getElementsByClassName("filterPrice")[1].value;
            
            window.location.href = "index.aspx?minPrice=" + minPrice + "&maxPrice=" + maxPrice + "&hang=" + hang;
        }
        document.addEventListener('DOMContentLoaded', function () {
            var backToTopButton = document.getElementById('back-to-top');

            window.addEventListener('scroll', function () {
                if (window.scrollY > 0 || document.documentElement.scrollTop > 0) {
                    backToTopButton.style.display = 'block';
                } else {
                    backToTopButton.style.display = 'none';
                }
            });

            backToTopButton.addEventListener('click', function (e) {
                e.preventDefault();
                window.scrollTo({ top: 0, behavior: 'smooth' });
            });
        });
        
    </script>
</asp:Content>