<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-header {
            background-color: #0d6efd;
            color: white;
            padding: 15px;
            border-radius: 5px 5px 0 0;
            margin: -20px -20px 20px -20px;
        }
        .required-field::after {
            content: " *";
            color: red;
        }
        .form-buttons {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container card">
            <div class="form-header">
                <h2>
                    <c:if test="${user != null}">
                        Chỉnh sửa người dùng
                    </c:if>
                    <c:if test="${user == null}">
                        Thêm người dùng mới
                    </c:if>
                </h2>
            </div>

            <c:if test="${errorMessage != null}">
                <div class="alert alert-danger" role="alert">
                    ${errorMessage}
                </div>
            </c:if>

            <form method="post" action="<%=request.getContextPath()%>/user" novalidate>
                <c:if test="${user != null}">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<c:out value='${user.id}' />">
                </c:if>
                <c:if test="${user == null}">
                    <input type="hidden" name="action" value="insert">
                </c:if>

                <div class="mb-3">
                    <label for="name" class="form-label required-field">Tên</label>
                    <input type="text" class="form-control" id="name" name="name"
                           value="<c:out value='${user.name}' />" required>
                    <div class="invalid-feedback">
                        Vui lòng nhập tên.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label required-field">Email</label>
                    <input type="email" class="form-control" id="email" name="email"
                           value="<c:out value='${user.email}' />" required>
                    <div class="invalid-feedback">
                        Vui lòng nhập email hợp lệ.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="country" class="form-label">Quốc gia</label>
                    <select class="form-select" id="country" name="country">
                        <option value="Việt Nam" ${user.country == 'Việt Nam' ? 'selected' : ''}>Việt Nam</option>
                        <option value="Mỹ" ${user.country == 'Mỹ' ? 'selected' : ''}>Mỹ</option>
                        <option value="Anh" ${user.country == 'Anh' ? 'selected' : ''}>Anh</option>
                        <option value="Pháp" ${user.country == 'Pháp' ? 'selected' : ''}>Pháp</option>
                        <option value="Đức" ${user.country == 'Đức' ? 'selected' : ''}>Đức</option>
                        <option value="Nhật Bản" ${user.country == 'Nhật Bản' ? 'selected' : ''}>Nhật Bản</option>
                        <option value="Hàn Quốc" ${user.country == 'Hàn Quốc' ? 'selected' : ''}>Hàn Quốc</option>
                        <option value="Trung Quốc" ${user.country == 'Trung Quốc' ? 'selected' : ''}>Trung Quốc</option>
                        <option value="Singapore" ${user.country == 'Singapore' ? 'selected' : ''}>Singapore</option>
                        <option value="Khác" ${user.country != null && !user.country.isEmpty() &&
                                              user.country != 'Việt Nam' && user.country != 'Mỹ' &&
                                              user.country != 'Anh' && user.country != 'Pháp' &&
                                              user.country != 'Đức' && user.country != 'Nhật Bản' &&
                                              user.country != 'Hàn Quốc' && user.country != 'Trung Quốc' &&
                                              user.country != 'Singapore' ? 'selected' : ''}>Khác</option>
                    </select>
                </div>

                <div class="form-buttons">
                    <button type="submit" class="btn btn-primary">Lưu</button>
                    <a href="<%=request.getContextPath()%>/user" class="btn btn-secondary ms-2">Hủy</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Form validation
        (function() {
            'use strict';

            var forms = document.querySelectorAll('form');

            Array.prototype.slice.call(forms).forEach(function(form) {
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</qodoArtifact>