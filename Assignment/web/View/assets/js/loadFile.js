/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var loadFile = function (event) {
    var reader = new FileReader();
    reader.onload = function () {
        var output = document.querySelector('.output');
        var icon = document.querySelector('.imgInp_icon');
        icon.style.display = "none";
        output.style.display = "block";
        output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
};
