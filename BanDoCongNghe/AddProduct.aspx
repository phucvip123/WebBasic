<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="BanDoCongNghe.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thêm sản phẩm</title>
    <style>
        input{
            display:block;
            margin:auto;
            margin-bottom:10px;
        }
        .inputTxt{
            
            margin-bottom:10px;
            border:none;
            font-size:14px;
            border:1px solid #808080;
            border-radius:3px;
            height:14px;
            padding:3px;
            
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <input id="txtName" name ="txtName" type="text" placeholder="Nhập tên sản phẩm" class="inputTxt"/>
        <input id="txtLoai" name ="txtLoai" type="text" placeholder="Nhập loại sản phẩm" class="inputTxt"/>
        <input id="nbPrice" name ="nbPrice" type="number" min="0" placeholder="Nhập giá sản phẩm" class="inputTxt"/>
        <input id="nbSoLuong" name ="nbSoLuong" type="number" min="0" placeholder="Nhập số lượng sản phẩm" class="inputTxt"/>
        <input id="nbRam" name ="nbRam" type="number" min="0" placeholder="Nhập RAM sản phẩm" class="inputTxt"/>
        <input id="nbRom" name ="nbRom" type="number"  min="0" placeholder="Nhập ROM sản phẩm" class="inputTxt"/>
        <input id="txtHang" name ="txtHang" type="text" placeholder="Nhập hãng sản phẩm" class="inputTxt" />
        <input id="nbNam" name ="nbNam" type="number" min="0" placeholder="Nhập năm sản xuất sản phẩm" class="inputTxt"/>
        <input id="txtCPU" name ="txtCPU" type="text" placeholder="Nhập CPU sản phẩm" class="inputTxt"/>
        <input id="nbMH" name ="nbMH" type="number" min="1" step="any" placeholder="Nhập kích thước màn hình sản phẩm" class="inputTxt"/>
        <input id="nbPhanGiai" name ="nbPhanGiai" type="text"  placeholder="Nhập độ phân giải màn hình của sản phẩm" class="inputTxt"/>
        <input id="nbPin" name ="nbPin" type="number" min="0" placeholder="Nhập Pin" class="inputTxt"/>
        <input id="nbDoSang" name ="nbDoSang" type="number" min="0" placeholder="Nhập Độ sáng" class="inputTxt"/>
        <input id="txtMauSac" name ="txtMauSac" type="text" placeholder="Nhập Màu Sắc" class="inputTxt"/>
        <input id="txtDes" name ="txtDes" placeholder="Nhập mô tả sản phẩm" class="inputTxt"/>
        <input id="img" name ="img" type="file" accept=".png, .jpg, .jpeg" runat="server" placeholder="Nhập hình ảnh sản phẩm" class="inputFile"/>
        <button id="btnAc">Thêm</button>
    </form>
</body>
</html>
