<%@ page import="ssemi.ssemibucks.PRODUCT.ProductDao" %>
<%@ page import="ssemi.ssemibucks.PRODUCT.Product" %>
<%@ page import="java.util.Vector" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Ssemibucks_AdminPage</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet" />

    <link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script src="/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet" />

    <title>Document</title>

    <script>
        $(function () {
            $("#dataTable").DataTable({
                ordering: false
            });

            $("#navbar").load("/navbar");
        });
    </script>
</head>

<body>
    <%
        ProductDao dao = new ProductDao();
        Vector<Product> list = dao.selectAllProduct();
    %>

    <div id="navbar"></div>

    <header class="py-5" style="background-color: rgb(167, 193, 55); height: 100px;">
        <h1 class=" display-4 fw-bolder" style="line-height: 0px; text-align: center; color: white">
            Product Management
        </h1>
    </header>

    <div class="py-0">
        <div class="text-center " style="
              background-image: linear-gradient(
                  rgba(0, 0, 0, 0.3),
                  rgba(0, 0, 0, 0.3)
                ),
                url(https://images.unsplash.com/photo-1580933073521-dc49ac0d4e6a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80);
            ">
            <img class="rounded-circle mt-sm-4" src="/img/user.JPG" alt="..." width="120px" height="120px"
                style="margin-top: 2rem;" />
            <h1 class="text-white fs-3 fw-bolder" style="margin-top: 0px;">ADMIN</h1>
            <p class=" text-white-50 mb-0">관리자 계정</p>
        </div>
    </div>

    <!-- Content section-->
    <div class="container-fluid py-5 col-10">
        <div class="row">
            <div class="col-12">
                <div class="card my-4">
                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                        <div class="bg-primary shadow-primary border-radius-lg pt-4 pb-3">
                            <h6 class="text-white text-capitalize ps-3">Products table</h6>
                        </div>
                    </div>
                    <div class="card-body px-0 pb-2">
                        <div class="table-responsive p-3">
                            <table class="table align-items-center mb-0" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th
                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                            Product
                                        </th>
                                        <th
                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                            Option
                                        </th>
                                        <th
                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                            Category
                                        </th>
                                        <th
                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                            Price
                                        </th>
                                        <th
                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                            Stock
                                        </th>
                                        <th
                                            class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                            Edit
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>

                                <%
                                    for(int i =0; i <list.size(); i++) {
                                        Product product = list.get(i);
                                %>
                                    <tr>
                                        <td>
                                            <a href="location.href='/product_detail?pId=<%= product.getpId()%>.html'">
                                                <div class=" d-flex px-2 py-1">
                                                    <div>
                                                        <img src="<%=product.getpImage() %>" class="avatar avatar-sm me-3 border-radius-lg"
                                                            alt="image" width="60px" height="60px">
                                                    </div>
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm"><%=product.getpName() %></h6>
                                                        <p class="text-xs text-secondary mb-0"><%=product.getpId() %></p>
                                                    </div>
                                                </div>
                                            </a>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span><%=product.getpOption() %></span>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span><%=product.getCategory() %></span>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span>￦<%=product.getPrice() %></span>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span><%=product.getpStock() %></span>
                                        </td>
                                        <td class="align-middle text-center text-sm" style="width: 300px;">
                                            <button class="btn" onclick="location.href='/product/product_insert'"><i class="bi bi-plus-circle"></i>
                                                add</button>
                                            <button class="btn" onclick="location.href='/product/product_update'"><i class="bi bi-pencil"></i>
                                                update</button>
                                            <button class="btn" onclick="location.href='/product/product_delete'"><i class="bi bi-trash"></i>
                                                delete</button>
                                        </td>
                                    </tr>
                                <%
                                    }
                                %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>