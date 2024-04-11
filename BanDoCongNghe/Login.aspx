<%@ Page Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BanDoCongNghe.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel ="stylesheet" href="./CSS/login.css"/>
     <div id ="errContainer"  runat="server">
         <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm-1.5-5.009c0-.867.659-1.491 1.491-1.491.85 0 1.509.624 1.509 1.491 0 .867-.659 1.509-1.509 1.509-.832 0-1.491-.642-1.491-1.509zM11.172 6a.5.5 0 0 0-.499.522l.306 7a.5.5 0 0 0 .5.478h1.043a.5.5 0 0 0 .5-.478l.305-7a.5.5 0 0 0-.5-.522h-1.655z" fill="red"/></svg>
         <p id="contentErr" runat="server">Đăng nhập thất bại: </p>
     </div>
    <form id ="formLogin" method ="POST" onsubmit="return checkSubmit();">
        <image id="imgTitle" src ="./imgs/icons/linhthu.png"></image>
        <h1 id="title">Đăng nhập tài khoản CellMember</h1>
        <div class ="group">
            <input id="username" name ="username" type ="text" placeholder="Nhập username" maxlength="255" pattern="\S+.*"/>
            <label id="lbUsername">Username</label>
            <div id="lineUsername"></div>
        </div>
        <div class="group">
            <input id="password" name ="password" type ="password" placeholder="Nhập mật khẩu" maxlength="255" pattern="\S+.*"/>
            <label id="lbPassword">Mật khẩu</label>
            <div id="linePassword"></div>
            <button id="btnShow" type="button" onclick="showPass()">
                <svg width="30px" height="30px" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" >
                <path d="M0 0h48v48H0z" fill="white"/>
                <g id="Shopicon">
	                <circle cx="24" cy="24" r="4"/>
	                <path d="M24,38c12,0,20-14,20-14s-8-14-20-14S4,24,4,24S12,38,24,38z M24,16c4.418,0,8,3.582,8,8s-3.582,8-8,8s-8-3.582-8-8
		                S19.582,16,24,16z"/>
                </g>
                </svg>
                <div id="xoet"></div>
            </button>
        </div>
        <div class ="group-option is-flex">
            <input type ="checkbox" class ="option" id="remember" name ="remember" checked/>
            <label class="option-text">Nhớ tôi cho lần đăng nhập tiếp theo</label>
        </div>
        <button id="btnLogin2">Đăng nhập</button>
    </form>
    <hr />
    <div class="gr-regis is-flex">
        <p>Bạn chưa có tài khoản?</p>
        <a href="Registry.aspx">Đăng kí ngay</a>
    </div>
    <script src="./Scripts/login.js"></script>
</asp:Content>
