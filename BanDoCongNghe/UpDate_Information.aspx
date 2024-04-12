<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpDate_Information.aspx.cs" Inherits="BanDoCongNghe.UpDate_Information" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đổi mật khẩu</title>
     <link rel ="stylesheet" href="./CSS/UPdate_INforrmatinon.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="content">
        <h3 class="mkPass">Tạo mật khẩu mới</h3>   
      <table>
        <tr>
          <td>
            <label for="">Nhập mật khẩu cũ</label>
          </td>
        </tr>
        <tr>
            
          <td><input type="text" value="" id="old_pass" name="old_pass" placeholder="Mật khẩu cũ" /></td>
        </tr>
        <tr>
          <td>
            <label for="">Nhập mật khẩu mới</label>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" value="" id="new_pass" name="new_pass" placeholder="Nhập mật khẩu mới" />
          </td>
        </tr>
        <tr>
          <td>
            <label for="">Xác nhận lại mật khẩu</label>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" value="" id="confirm_pass" name="confirm_pass" placeholder="Xác nhận mật khẩu" />
          </td>
        </tr>
     <tr>
        <td>
            <asp:Button ID="btn_confirm" runat="server" class="button" Text="Cập nhật mật khẩu" OnClick="btn_confirm_Click" />
          
        </td>
     </tr>
            
      </table>
    </div>

        </div>
    </form>
</body>
</html>

