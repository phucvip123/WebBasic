﻿<%@ Page Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BanDoCongNghe.index" %>
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
    <div id="filter-container" class="is-flex">
        <p>Chọn theo nhu cầu</p>
        <div id="filter-option" class="is-flex">
        <asp:DropDownList ID="ddlFilterHang" runat="server" class="ddl"></asp:DropDownList>
        <p style="margin:auto 10px auto 20px">Giá: </p>
        <input runat="server" id="minPrice"  type="number" placeholder="Tối thiểu" class="ifilter"/>
        <p style="margin: auto 10px;"> → </p>
         <input runat="server" id="maxPrice" type="number" placeholder="Tối đa" class="ifilter"/>
        <button class="btnFilter" onclick="btnFilter_Click()" type="button">Lọc</button>
        </div>
        
    </div>
    <div id="product-container">
        <asp:Repeater ID="rpProducts" runat="server">
            <ItemTemplate>
                <div class="item">
                    <image src="./imgs/Products/<%# Eval("id") %>.png" class="item-img"></image>
                    <p class="item-title"><%# Eval("name") %></p>
                    <p class="item-price"><%#Eval("priceFormat")%>đ</p>
                    <div class="btnProducts">
                        <asp:Button class="btnCart" UseSubmitBehavior="false"  Text="Thêm vào giỏ" runat="server" onClick="btnAddItemToCart_Click" CommandArgument="1"/>
                        <button type="submit" class="btnBuy">Mua ngay</button>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div  class="item">
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
        function btnFilter_Click() {
            var hang = document.getElementsByClassName("ddl")[0].value;
            var minPrice = document.getElementById("minPrice") == null ? -1 : document.getElementById("minPrice").value;
            var maxPrice = document.getElementById("maxPrice") == null ? 2123456789 : document.getElementById("maxValue").value;
            if (window.location.href.includes('search')) {
                window.location.href += "&minPrice=" + minPrice + "&maxPrice=" + maxPrice + "&hang=" + hang;
            } else {
                window.location.href = "index.aspx?minPrice=" + minPrice + "&maxPrice=" + maxPrice + "&hang=" + hang;
            }
        }
        
        
    </script>
</asp:Content>