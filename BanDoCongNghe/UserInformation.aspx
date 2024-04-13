<%@ Page Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="UserInformation.aspx.cs" Inherits="BanDoCongNghe.UserInformation" %>



    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link rel ="stylesheet" href="./CSS/UserInformation.css"/>
        <div class="main">
            <div class="header_page">
                <p style="font-weight:bold;margin: 5px auto;font-size:18px;">Thông tin cá nhân</p>
            </div>

            <div class="content">
                <table>
                    <tr>
                        <td>
                            <p >Username : </p>
                            <asp:Label ID="nameLogin" runat="server" Text=""></asp:Label>
                            <hr>
                        </td>                
                    </tr>
                    <tr>
                        <td>
                            <p >Họ và tên : </p>
                            <asp:Label ID="name" Name="name" runat="server" Text=""></asp:Label>
                            <hr>
                        </td>                
                    </tr>
                    <tr>
                        <td>
                            <p>Mật Khẩu: </p>
                            <asp:Label ID="password" Name="nameLogin" runat="server" Text=""  ></asp:Label>
                            <hr>
                        </td>    
                    </tr>
                    <tr>
                        <td>
                            <p>Tên Đăng nhập: </p>
                            <asp:Label ID="nameLogin2" Name="nameLogin2" runat="server" Text=""></asp:Label>
                            <hr>
                        </td>    
                    </tr>
                    <tr>   
                        <td>
                            <p>Số điện thoại: </p>
                            <asp:Label ID="sdt" Name="sdt" runat="server" Text=""></asp:Label>
                            <hr>
                        </td>    
                    </tr>
                    <tr>
                        <td>
                            <p>Email</p>
                            <asp:Label ID="email" Name="email" runat="server" Text=""></asp:Label>
                            <hr />
                        </td>
                    </tr>
                </table>
            </div>  
            <div class="btn">
                <a href="UpDate_Information.aspx" style="font-weight:bold;">Đổi mật khẩu</a>
               <a id="logOut" runat="server" onclick="logOut_Click" style="font-weight:bold;">Đăng xuất</a>
            </div>
            
        </div>
        <div class="is-flex" style="justify-content:center;align-items:center;">
            <a href="index.aspx" style="color:red;text-align:center;margin:10px auto;font-size:20px;">Về trang chủ</a>
        </div>
        
    </asp:Content>


<%--</body>
</html>--%>