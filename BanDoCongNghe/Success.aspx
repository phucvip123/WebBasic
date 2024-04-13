<%@ Page Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="BanDoCongNghe.Success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #noti{
            display:block;
            background-color: #a8f8a4;
            color:green;
            font-size:18px;
            font-weight:bold;
            padding:10px;
            width:fit-content;
            margin-bottom:20px;
        }
        #cont{
            height:80vh;
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
        }
        #back{
            color:red;
            font-size:18px;

        }
    </style>
    <div id="cont">
         <p id="noti">
             Mua hàng thành công!
         </p>
         <a id="back" href="index.aspx">Mua sắm tiếp 👣👣</a>
    </div>
   
</asp:Content>
