<%@ Page Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="BanDoCongNghe.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .container {
            display: flex;
            flex-direction: column;
            height: 80vh;
        }

        .top-frames {
            display: flex; 
            justify-content: space-between; 
            margin-bottom: 10px;
            flex-wrap: wrap;
        }

        .frame1,
        .frame2 {
            flex: 1; 
            border: rgb(207, 207, 207) solid 1px;
            width:fit-content;
            border-radius: 5px;
            box-shadow: 2px rgba(0, 0, 0, 0.5);
            padding: 20px;
            margin-right: 10px; 
        }

        .frame1 img {
            width: 50%; 
            height: auto;
            display: block;
            margin: 0 auto; 
        }


        .frame3 {
            flex: 1;
            display: flex;
            border: none;
            border-radius: 5px;
            box-shadow: 2px rgba(0, 0, 0, 0.5);
            padding: 20px;
            margin-right: 10px;
            overflow-y: auto;
            flex-wrap: wrap;
        }

        .frame3 p {
            flex-basis: 50%;
            margin: 0;
        }
        .btnMuaNgay {
            border:none;
            background-color: red;
            color: #fff;
            border: 2px solid #d70018;
            padding: 10px 20px;
        }
        .btnThemVaoGioHang {
            background-color: white;
            color: #d70018;
            border: 1px solid #d70018;
            padding: 10px 20px;
        }
        .btnMuaNgay, .btnThemVaoGioHang{
            border-radius:5px;
            cursor:pointer;
            font-weight:bold;
            margin:auto 5px;
        }
        #lblGiaSanPham {
            color: #d70018;
        }

    </style>
    <%Models.Product.Product p = null;
    bool flag = false;
    foreach(Models.Product.Product x in ((List<Models.Product.Product>)Application["Products"]))
    {
        if(Request.QueryString["id"] != null && x.id == int.Parse(Request.QueryString["id"].ToString()) || p==null)
        {
            flag = true;
                p = x;
                id = p.id;
        }
    } %>
    <%if (Request.QueryString["id"] == null || !flag || p == null)
        {
%>
        <div style="height:80vh;display:flex;justify-content:center;align-items:center;">
            <p style="font-size:21px;color:red;font-weight:bold;">Lỗi không tìm thấy sản phẩm</p>
        </div>



     <%}
    else
    { %>
        
        <div class="container">
            <div class="top-frames">
                <div class="frame1">
                    <h2></h2>
                    <image src="./imgs/products/<%=p.id %>.png"></image>
                </div>
                
                <div class="frame2">
                    <p style="font-size:21px;color:black;font-weight:bold;margin-bottom:20px;"> <%=p.name %></p>
                    <p style="font-size:24px;color:red;font-weight:bold;margin-bottom:20px;"><%=p.priceFormat %>đ</p>
                    <h2 style="margin-left:20px;">Thông tin chi tiết</h2>
                    <div class="frame3">
                        <p>Hãng <%=p.hang %></p>
                        <p>Còn lại: <%=p.soLuong %> </p>
                        <p>RAM: <%=p.ram %>GB</p>
                        <p>ROM: <%=p.rom %>GB</p>
                        <p>Năm sản xuất: <%=p.namSX %></p>
                        <p>CPU: <%=p.cpu %></p>
                        <p>Kích thước màn hình: <%=p.sizeMH %> inch</p>
                        <p>Độ phân giải màn hình: <%=p.phanGiai[0] %>x<%=p.phanGiai[1] %></p>
                        <p>Pin: <%=p.pin%>mAh</p>
                        <p>Độ sáng màn hình: <%=p.doSang %>nits</p>
                        <p>Màu sắc: <%=p.mauSac %></p>
                        <p >Mô tả: <%=p.description %></p>
                    </div>
                    
                    

                    <asp:Button CommandArgument='<%=p.id %>' ID="btnThemVaoGioHang" UseSubmitBehavior="false" runat="server" Text="Thêm vào giỏ hàng" CssClass="btnThemVaoGioHang" OnClick="btnThemVaoGioHang_Click"/>
                    <asp:Button CommandArgument='<%=p.id %>' ID="btnMuaNgay" UseSubmitBehavior="false" runat="server" Text="Mua ngay" CssClass="btnMuaNgay" OnClick="btnThanhToan_Click" />
                </div>
            </div>
            <a href="index.aspx" style="color:red;text-align:center;text-decoration:none;font-size:18px;margin-top:70px;">Về trang chủ</a>
            
        </div>




    <%} %>
</asp:Content>