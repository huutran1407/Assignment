<%-- 
    Document   : CategoryList
    Created on : Jun 21, 2023, 11:06:18 AM
    Author     : VHC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/CSS/CategoryList.css?version=1">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/assets/CSS/ConfirmBoxStyle.css">
    </head>
    <body>
        <h1 class="text-center m-t-40">Categories List</h1>
        
        <div id="Edit" class="dis-none">
            
        </div>
        
        <table class="container mx-auto mt-4 text-center">
            <tr>
                <th>Category ID</th>
                <th>Category IMG</th>
                <th>Category Name</th>
                <th>Category Edit</th>
                <th>Category Delete</th>
            </tr>
                
                <c:forEach items="${requestScope.CatList}" var="s">

                        <tr class="">
                            <td>
                                ${s.getCategory_Id()}
                            </td>
                            <td>
                                <img id="${s.getCategory_Id()}" src="${pageContext.request.contextPath}/${s.getCategory_Img()}" class="cateIMG img-fluid" alt="...">
                            </td>
                            <td>
                                ${s.getCategory()}
                            </td>
                            <td>
                                <a class="btn mr-2 w-45" onclick="EditCard('${s.getCategory_Id()}', '${s.getCategory()}')"><i class="fa fa-gear"></i> Edit</a>
                            </td>
                            <td>
                                <a style="cursor: pointer;" class="btn w-45" onclick="Confirm('Delete Category', 'Are you sure you want to delete this Category?', 'Yes', 'Cancel', '${pageContext.request.contextPath}/CategoryDelete?CategoryId=${s.getCategory_Id()}');"><i class="fa fa-trash" ></i> Delete</a>
                            </td>
                        </tr>

                </c:forEach>
        </table>
        
        <div class="Add-cart " style="width: 400px;">
                    <form class="Add_Card card" style="text-decoration: none; height: 500px;" action="${pageContext.request.contextPath}/CategoryUpload" method="post" enctype="multipart/form-data">
                        <div class="Add_Cat_IMG  inputValue">
                            <label id="imgInp" class="h-100 w-100" style="cursor: pointer;">
                                <i class="imgInp_icon fa fa-4x fa-image pos-relative"></i>
                                <img style="display: none;" class="output pos-relative top-0" src="" alt="alt"/>
                                <input type="file" accept="image/*" name="img" onchange="loadFile(event)" required>
                            </label>
                        </div>
                        <div class="inputValue text-center">
                            <input type="text" name="CategoryName" placeholder="Category Name" required>
                        </div>
                        <button style="cursor: pointer;" class="btn m-auto w-45">Add Category</button>
                    </form>
                </div>


        <script src="${pageContext.request.contextPath}/View/assets/js/ConfirmBoxScript.js"></script>
        <script>

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

                                    let box = document.querySelector('.card');
                                    let width = box.offsetWidth;
                                    let height = box.offsetHeight;
                                    let Add = document.getElementsByClassName('Add_Card');
                                    Add[0].style.height = height + 'px';

                                    var mess = "${Mess}";
                                    if (mess != '') {
                                        alert(mess);
                                    }

                                    function EditCard(Id, name) {
                                        let img = document.getElementById(Id);
                                        let card = document.getElementById("Edit");

                                        var content ="<div class='Add-cart' style='width: 400px;'>"
                                                +"<form class='Add_Card card text-center' style='text-decoration: none;' action=${pageContext.request.contextPath}/CategoryUpdate?CategoryId=" + Id + " method='post' enctype='multipart/form-data'>"
                                                + "<div class='Add_Cat_IMG inputValue'>"
                                                + "<label id='imgInp' class='card-img-top' style='cursor: pointer;'>"
                                                + "<img src=" + img.src + " class='imgInp_icon'/>"
                                                + "<img style='display: none;' class='output' src='' alt='alt'/>"
                                                + "<input type='file' accept='image/*' name='img' onchange='loadFile(event)'>"
                                                + "</label>"
                                                + "</div>"
                                                + "<div class='card-body inputValue'>"
                                                + "<input class='card-title' type='text' name='CategoryName' value='" + name + "'>"
                                                + "<div class='card-subtitle mb-2 text-muted'>" + Id + "</div>"
                                                + "<div class='card-function d-flex justify-content-between'>"
                                                + "<div style='cursor: pointer;' class='btn mr-2 w-45' onclick='location.reload();'><i class='fa fa-remove'></i> Undo Edit</div>"
                                                + "<button type='submit' style='cursor: pointer;' class='btn w-45'><i class='fa fa-share' ></i> Update</button>"
                                                + "</div>"
                                                + "</div>"
                                                + "</form>"
                                                +"</div>";

                                        card.innerHTML = content;
                                        card.style.display = "Block";
                                    }
        </script>
    </body>
</html>
