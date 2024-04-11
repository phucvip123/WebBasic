function redirect(url) {
    window.location.href = url;
}
function isNumberKey(evt) {
    var flag = true;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    charCode = parseInt(charCode);
    if (charCode <= '9'.charCodeAt(0) && charCode >= '0'.charCodeAt(0) || charCode == '+'.charCodeAt(0)) {
        return true;
    }
    return false;
}
function checkSubmit() {
    var flag = true;
    var notiErr = "";
    var name = document.getElementById("name");
    var username = document.getElementById("username");
    var email = document.getElementById("email");
    var phone = document.getElementById("numberPhone");
    var pass = document.getElementById("password");
    var repass = document.getElementById("repass");

    var arr = [name, email, phone, pass, repass];
    for (var i = 0; i < arr.length; i++) {
        if (arr[i].value == "") {
            notiErr += arr[i].getAttribute("placeholder");
            flag = false;
            arr[i].focus();
        }
    }
    if (phone.value.charAt(0) != '0') {
        notiErr += "Số điện thoại phải bắt đầu từ 0\n";
        flag = false;
        phone.focus();
        phone.classList.add("invalid");
    } else if (phone.value.length < 10) {
        notiErr += "Số điện thoại chưa đủ 10 chữ số\n";
        flag = false;
        phone.focus();
        phone.classList.add("invalid");
    }
    if (username.value.length < 4) {
        notiErr += "Username phải tối thiểu 4 kí tự \n";
        flag = false;
        username.focus();
        username.classList.add("invalid");
    }
    var ac = 0, cham = 0;
    for (var i = 0; i < email.value.length; i++) {
        if (email.value[i] == '@') {
            ac++;
        }
        if (email.value[i] == '.' && ac > 0) {
            cham++;
        }
    }
    if (ac != 1 || cham < 1 || email.value.length - ac - cham <= 2) {
        notiErr += "Email không đúng định dạng\n";
        flag = false;
        email.focus();
        email.classList.add("invalid");
    }
    var thuong = 0, hoa = 0, so = 0;
    for (var i = 0; i < pass.value.length; i++) {
        var c = pass.value.charCodeAt(i);
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
    if (pass.value.length < 8) {
        notiErr += "Mật khẩu chưa đủ dài\n";
        flag = false;
        pass.focus();
        pass.classList.add("invalid");
    }
    if (thuong == 0 || hoa == 0 || so == 0) {
        notiErr += "Mật khẩu chưa đúng định dạng\n";
        flag = false;
        pass.focus();
        pass.classList.add("invalid");
    }
    console.log(pass.value + " vs" + repass.value);
    if (pass.value !== repass.value) {

        notiErr += "Nhập lại mật khẩu không trùng khớp\n";
        flag = false;
        repass.focus();
        repass.classList.add("invalid")
    }
    if (!document.getElementById("accept").checked) {
        notiErr += "Vui lòng đồng ý với điều khoản bảo mật\n";
        flag = false;
        document.getElementById("accept").focus();
    }
    if (!flag) {
        alert(notiErr);
    }

    return flag;
}
