function showPass() {
    var afterbtn = document.getElementById("xoet");
    var input = document.getElementById("password");

    var afterbtnStyle = window.getComputedStyle(afterbtn);
    var afterbtnHeight = parseInt(afterbtnStyle.getPropertyValue("height"));

    if (afterbtnHeight == 0) {
        input.type = "text";
        afterbtn.style.height = "30px";
    } else {
        input.type = "password";
        afterbtn.style.height = "0px";
    }
}
function checkSubmit() {
    var username = document.getElementById("username");
    var password = document.getElementById("password");
    var flag = true;
    var notiErr = "";
    var thuong = 0, hoa = 0, so = 0;
    for (var i = 0; i < pass.value.length; i++) {
        var c = password.value.charCodeAt(i);
        if (c >= 'a'.charCodeAt(0) && c <= 'z'.charCodeAt(0)) {
            thuong++;
        }
        if (c >= 'A'.charCodeAt(0) && c <= 'Z'.charCodeAt(0)) {
            hoa++;
        }
        if (c >= '0'.charCodeAt(0) && c <= '9'.charCodeAt(0)) {
            so++;
        }
    }
    if (username.value == "") {
        flag = false;
        notiErr += "Tên đăng nhập không được để trống\n";
        username.focus();
        username.classList.add("invalid");
    }
    if (password.value == "") {
        flag = false;
        notiErr += "Tên đăng nhập không được để trống\n";
        password.focus();
        password.classList.add("invalid");
    }
    if (password.value.length < 8) {
        notiErr += "Mật khẩu tối thiểu 8 kí tự\n";
        flag = false;
        password.focus();
        pass.classList.add("invalid");
    }
    if (thuong == 0 || hoa == 0 || so == 0) {
        notiErr += "Mật khẩu chưa đúng định dạng\n";
        flag = false;
        password.focus();
        pass.classList.add("invalid");
    }
    if (!flag) {
        alert(notiErr);
    }
    return flag;
}
