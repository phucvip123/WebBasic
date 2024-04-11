<%@ Page Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true" CodeBehind="Registry.aspx.cs" Inherits="BanDoCongNghe.Registry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel ="stylesheet" href="./CSS/regis.css"/>
    <div id ="errContainer"  runat="server">
        <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm-1.5-5.009c0-.867.659-1.491 1.491-1.491.85 0 1.509.624 1.509 1.491 0 .867-.659 1.509-1.509 1.509-.832 0-1.491-.642-1.491-1.509zM11.172 6a.5.5 0 0 0-.499.522l.306 7a.5.5 0 0 0 .5.478h1.043a.5.5 0 0 0 .5-.478l.305-7a.5.5 0 0 0-.5-.522h-1.655z" fill="red"/></svg>
        <p id="contentErr" runat="server">Đăng kí thất bại: </p>
    </div>
    <div id="contentRegis" runat="server">
        <div>
            <svg id="btnLog" width="30px" height="30px" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"><path fill="black" d="M224 480h640a32 32 0 1 1 0 64H224a32 32 0 0 1 0-64z"/>
                <path fill="black" d="m237.248 512 265.408 265.344a32 32 0 0 1-45.312 45.312l-288-288a32 32 0 0 1 0-45.312l288-288a32 32 0 1 1 45.312 45.312L237.248 512z"/>
            </svg>
        </div>
        <div class ="titleRegis">
            <image src ="imgs/icons/linhthu.png"/>
            <h1>Đăng ký tài khoản CellMember</h1>
        </div>
        <form action="Registry.aspx" method="POST" onsubmit="return checkSubmit();">
            <div class="form-container">
                <input class ="inputText" type ="text" placeholder="Nhập họ và tên" id="name" name="name" maxlength="255" autocomplete="off" pattern="\S+.*"/>
                <label id="lbName" class="labelInput">HỌ VÀ TÊN(*)</label>
                <div id="lineName" class="inputLine"></div>
            </div>
            <div>
                 <div class="form-container">
                     <input class ="inputText" type ="text"  placeholder="Nhập username" id="username" name="username"  maxlength="100" autocomplete="off" pattern="\S+.*"/>
                     <label id="lbUsername" class="labelInput">Username(*)</label>
                     <div id="lineUsername" class="inputLine"></div>
     
                 </div>
                <p class="des">Username phải tối thiểu 4 kí tự</p>
            </div>
           
            <div class="form-container">
                <input class ="inputText" type ="tel" onkeypress="return isNumberKey(event)" placeholder="Nhập số điện thoại" id="numberPhone" name="numberPhone" maxlength="10" autocomplete="off" pattern="\S+.*"/>
                <label id="lbPhone" class="labelInput">Số điện thoại(*)</label>
                <div id="linePhone" class="inputLine"></div>
            </div>
            <div>
                <div class="form-container">
                    <input class ="inputText" type ="text" placeholder="Nhập Email" id="email" name="email"  maxlength="50" autocomplete="off">
                    <label id="lbEmail" class="labelInput">Email(*)</label>
                    <div id="lineEmail" class="inputLine"></div>
                </div>
            </div>
            <div>
                <div class="form-container">
                    <input class ="inputText" type ="password" placeholder="Mật khẩu" id="password" name="password" maxlength="255" autocomplete="off" pattern="\S+.*">
                    <label id="lbPassword" class="labelInput">Mật khẩu(*)</label>
                    <div id="linePassword" class="inputLine"></div>
                </div>
                <p class="des">(*)Mật khẩu tối thiếu 8 kí tự và có tối thiểu 1 chữ thường, 1 chữ hoa và 1 số</p>
            </div>
            <div>
                <div class="form-container">
                    <input class ="inputText" type ="password" placeholder="Nhập lại mật khẩu" id="repass" name="repass" maxlength="255" autocomplete="off" pattern="\S+.*">
                    <label id="lbRepass" class="labelInput">Nhập lại mật khẩu(*)</label>
                    <div id="lineRepass" class="inputLine"></div>
                </div>
            </div>
            <div class ="group-option is-flex">
                <input type ="checkbox" class ="option" name ="accept" checked/>
                <label class="option-text">Tôi đồng ý với các điều khoản bảo mật cá nhân</label>
            </div>
            <button id="btnDangKy" type="submit">Đăng ký</button>
        </form>
        <hr />
        <div class ="is-flex-wrap" id="haveAccount">
            <p>Bạn đã có tài khoản? </p>
            <a href="Login.aspx">Đăng nhập ngay</a>
         </div>
    </div>

    <%--Sucess--%>
    <div id="sucess" class="container" runat="server">
        <div class="notification">
            <h2>Đăng kí thành công!</h2>
            <p>Cảm ơn bạn đã đăng kí tài khoản.</p>
        </div>
        <button id="btnBack"  onclick="redirect('Login.aspx')">Đăng nhập ngay</button>
    </div>
    <%--Failed--%>
    <div id="fail" class="containerFail" runat="server">
        <div class="notificationFail">
            <h2>Đăng kí không thành công!</h2>
            <p>Hãy kiểm tra lại thông tin bạn vừa đăng ký</p>
            <button id="btnTry" onclick="redirect('Registry.aspx')">Thử lại</button>
        </div>
        
    </div>
    <script src="./Scripts/regis.js"></script>
</asp:Content>



