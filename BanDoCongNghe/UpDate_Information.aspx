<%@ Page Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="UpDate_Information.aspx.cs" Inherits="BanDoCongNghe.UpDate_Information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link rel="stylesheet" href="CSS/UPdate_INforrmatinon.css"/>
        <form type="submit" method="POST">
        <div class="content is-flex"  >
            <h3 class="mkPass">Đổi mật khẩu</h3>   
          <table>
            <tr>
              <td>
                <label for="">Nhập mật khẩu cũ</label>
              </td>
            </tr>
            <tr>
            
              <td><input class="input" type="password" value="" id="old_pass" name="old_pass" placeholder="Mật khẩu cũ" /></td>
            </tr>
            <tr>
              <td>
                <label for="">Nhập mật khẩu mới</label>
              </td>
            </tr>
            <tr>
              <td>
                <input class="input" type="password" value="" id="new_pass" name="new_pass" placeholder="Nhập mật khẩu mới" />
              </td>
            </tr>
            <tr>
              <td>
                <label for="">Xác nhận lại mật khẩu</label>
              </td>
            </tr>
            <tr>
              <td>
                <input class="input" type="password" value="" id="confirm_pass" name="confirm_pass" placeholder="Xác nhận mật khẩu" />
              </td>
            </tr>
         <tr>
            <td>
                <button id="btn_confirm" class="button" type="submit">Đổi mật khẩu</button>
          
            </td>
         </tr>
            
          </table>                                  
            <a href="index.aspx" style="color:red;text-align:center;margin:10px auto;">Về trang chủ</a>
    </div>
     
    </form>
    
</asp:Content>

