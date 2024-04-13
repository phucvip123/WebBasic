<%@ Page Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BanDoCongNghe.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="./CSS/cart.css"/>
    <div class="body">
            <div class="trolai">
                <a class="motrangchu" href="index.aspx">«</a>
                <p style="margin-top:10px;"> <b>Giỏ hàng của bạn</b></p>

            </div>
        <asp:Repeater ID="rptGioHang" runat="server">
            <ItemTemplate>
                    <div class='content'>
                        <input type="checkbox" class="btncheckbox" data-id='<%#Eval("id") %>' data-price='<%#Eval("price") %>'  data-soluong='<%#Eval("soLuong") %>'/>
                        <div class='content_anhgh'>
                            
                            <img class='anh_gh' src='./imgs/Products/<%#Eval("id")%>.png' alt='Không hiện được ảnh'>
                        </div>
                        <div class='content_tengia'>
                            <p class='ten_gh'><%#Eval("name") %></p>
                            <p class='gia_gh'><%#Eval("priceFormat") %> đ</p>
                        </div>
                        <div class='content_xoathem' >
                        <asp:Button UseSubmitBehavior="false" Text="Xóa" runat="server" class="btnxoa" CommandName="xoa" CommandArgument='<%#Eval("id")%>' OnClick="Delete_Click" />
                            <div class='them_gh'>
                                <asp:Button UseSubmitBehavior="false" class="btntru" runat="server" Text="-" CommandName="tru" CommandArgument='<%#Eval("id")%>' OnClick="Minus_Click"/>
                                <p class='sl'><%# Eval("soLuong") %></p>
                                <asp:Button UseSubmitBehavior="false"  class="btncong" runat="server" Text="+" CommandName="cong" CommandArgument='<%#Eval("id")%>' OnClick="Plus_Click"/>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:Repeater>
        <input id="listTick" name="listTick" class="listTick" value="" style="display:none;"/>
            <div class="tong_tien">
                <div class="tien">
                    <p class="tamtinh">Tạm tính</p>
                    <p id="thanh_tien" class="thanh_tien">0</p>
                </div>
                <asp:Button UseSubmitBehavior="false"  class="mua" runat="server" Text="Mua ngay"  OnClick="Buy_Click"/>
            </div>
        </div>
    <script>
        var list = []
        function format(a) {
            var ans = "";
            a = parseInt(a);
            while (a > 1000) {
                var temp = a % 1000;
                temp = temp + "";
                while (temp.length < 3) {
                    temp = "0" + temp;
                }
                temp = "." + temp;
                ans = temp + ans;
                a = parseInt(parseInt(a) / 1000);
            }
            ans = a + ans;
            return ans;
        }
        var listCb = document.getElementsByClassName("btncheckbox");
        for (var i = 0; i < listCb.length; i++) {
            listCb[i].addEventListener("change", function () {
                var total = parseInt(document.getElementById("thanh_tien").innerText.replace(/\./g,""));
                var temp = parseInt(this.getAttribute("data-price")) * parseInt(this.getAttribute("data-soluong"));
                if (this.checked) {
                    total += temp;
                    list.push(parseInt(this.getAttribute("data-id")));
                } else {
                    var index = list.indexOf(parseInt(this.getAttribute("data-id")));
                    if (index !== -1) {
                        list.splice(index, 1);
                    }
                    
                    total -= temp;
                }
                document.getElementById("thanh_tien").innerText = format(total);
                <% listTick = Request.Form["listTick"];%>
                document.getElementsByClassName("listTick")[0].value = list;
            });
        }
        document.getElementsByClassName("mua")[0].addEventListener("click", function (event) {
            window.location.href = "Cart.aspx?list=" + document.getElementsByClassName("listTick")[0].value;
        });
    </script>
</asp:Content>
