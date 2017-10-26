<%-- 
    Document   : AddProduct
    Created on : Oct 7, 2017, 1:38:35 AM
    Author     : snail
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="../images/logo.png">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <title>Add product</title>
    </head>
    <body>

        <%@include file="Header.jsp"%>

        <div class="container well-lg">
            <c:if test="${sessionScope.message!= null}">
                <div class="alert alert-danger">
                    <strong>${sessionScope.message}</strong> 
                </div>
            </c:if>
                
           
            <form class="form-horizontal"  action="../upload" method="post" enctype = "multipart/form-data" id="myform">
                <!--NAME AND DETAILS-->
                <div class="container col-sm-12">
                    <!--Product name-->
                    <div class="form-group">
                        <label for="name">Product name</label>
                        <input class="form-control"type="text"  name="txtName" value="">
                    </div>
                    <!--Product descriptions-->
                    <div class="form-group">
                        <label for="details">Details</label>
                        <textarea class="form-control" rows="5"  name="txtDetail" ></textarea>
                    </div>
                </div>
                <!--PRICE, QUANTITY AND CATEGORY-->
                <div class="form-group">
                    <!--Price-->
                    <div class="container col-sm-4">
                        <label for="price">Price</label>
                        <input class="form-control"type="number"  name="txtPrice" value="">
                    </div>
                    <!--Quantity-->
                    <div class="container col-sm-4">
                        <label for="quantity">Quantity</label>
                        <input class="form-control"type="number"  name="txtQuantity" value="">
                    </div>
                    <!--Select category-->
                    <div class="container col-sm-4">
                        <label for="category">Category</label>
                        <select class="form-control"  name="txtCategory">
                            <c:forEach var="p" items="${categoryBean.categories}">
                                <option value="${p.id}"> ${p.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                -->
                <br>
                <!--Choose detail images button & file path label-->
                <label for="selectAva">Product detail images</label>
                <div class="input-group" id="selectAva">
                    <span class="input-group-btn">
                        <label for="files1" class="btn-info btn">Browse</label>
                        <input type="file" class="form-control-file" id="files1" aria-describedby="fileHelp" style="display: none" accept="image/*" multiple name="myFile"  size = "50" />
                    </span>
                    <input type="text" class="form-control" placeholder="Pick images" disabled>
                </div>
                <div class="preAll row input-group "></div>
                <!--CLEAR AND ADD PRODUCT BUTTONS-->
                <br>
                <div class="row">
                    <!--Clear all button-->
                    <div class="col-sm-6 text-left">
                        <a href="#" class="btn btn-block btn-warning">Clear all</a>
                    </div>
                    <!--Add product button-->
                    <div class="col-sm-6 text-right">   
                        <input type="submit" value="Add Product" name="btnAdd"  class="btn btn-success btn-block" id="btnSubmit"/>
                    </div>
                </div>
            </form>
        </div>


        <%@include file="Footer.jsp"%>

        <script>
            function readURL(input) {

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#blah').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }


            function PreViewImages(input) {

                if (input.files) {
                    for (var i = 0; i < input.files.length; i++) {
                        var file = input.files[i];
                        var reader = new FileReader();
                        console.log(i);
                        reader.onload = function (e) {
                            $('.preAll').append('<img class="img-rounded imageChooser" src="' + e.target.result + '"/>');
                        }

                        reader.readAsDataURL(input.files[i]);
                    }

                }
            }

            $("#files1").change(function () {
                PreViewImages(this);
            });

           window.onload= function (){
               document.getElementById("myForm").reset();
           }

        </script>
    </body>
</html>
