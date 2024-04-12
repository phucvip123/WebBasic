<%@ Page Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="UserInformation.aspx.cs" Inherits="BanDoCongNghe.UserInformation" %>



    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link rel ="stylesheet" href="./CSS/UserInformation.css"/>
        <div class="main">
            <div class="header_page">
                <div class="left">
                    <table>
                        <tr>
                            <td><img src="./image/btl.png" alt="" /></td>
                        </tr>
                        <tr>    
                            <td>
                                <asp:Label ID="ID" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="nameLogin" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="content">
                <table>
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
                <a href="UpDate_Information.aspx">Đổi mật khẩu</a>
               <a id="logOut" runat="server" onclick="logOut_Click">Đăng xuất</a>
            </div>
        </div>
    </asp:Content>


<%--</body>
</html>--%>