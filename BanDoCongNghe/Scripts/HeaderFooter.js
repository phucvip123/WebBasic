document.getElementById("btn-close-search").addEventListener("click", function () {
    document.getElementById("txtSearch").value = "";
});
document.getElementById("btnClosePopup").addEventListener("click", function () {
    document.getElementById("background-popup").classList.remove("show");
    document.getElementById("background-popup").classList.add("hide");
});
document.getElementById("background-popup").addEventListener("click", function (event) {
    event.preventDefault();
    document.getElementById("background-popup").classList.remove("show");
    document.getElementById("background-popup").classList.add("hide");
});
if (document.getElementById("login-container")) {
    document.getElementById("login-container").addEventListener("click", function () {
        document.getElementById("background-popup").classList.remove("hide");
        document.getElementById("background-popup").classList.add("show");
    });
}

function openGoogleMap() {
    var latitude = 40.7128; // Vĩ độ
    var longitude = -74.0060; //Kinh độ
    var zoomLevel = 15; // Độ phóng to của bản đồ
    var mapUrl = "https://www.google.com/maps?q=" + latitude + "," + longitude + "&z=" + zoomLevel;
    window.open(mapUrl);
}