<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>
<%@taglib uri="/WEB-INF/tlds/layouts.tld" prefix="layouts" %>

<layouts:Default title="Đăng ký">
  <div class="container py-5" style="height: 100vh;">
    <div class="row justify-content-center align-items-center">
      <div class="col-5 bg-white rounded-4 shadow-lg">
        <div class="row justify-content-center gy-3 p-5">
          <div class="col-auto text-center">
            <jsp:include page="/jsp/others/main-logo-dark.jsp" />
          </div>
          <div class="col-12 text-center">
            <h5>Đăng ký vào Books Maison</h5>
          </div>
          <div class="col-12 mt-5">
            <form action="/auth/register" method="POST" id="registerForm">
              <div class="row gy-4">
                <div class="col-6">
                  <label for="lastName" class="form-label">
                    Họ <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input 
                    type="text" 
                    name="lastName" 
                    id="lastName" 
                    class="form-control ${requestScope.lastNameErrorMessage != null ? 'is-invalid' : ''}" 
                    placeholder="Nhập họ..."
                    value="${requestScope.lastNameRejectedValue != null ? requestScope.lastNameRejectedValue : ''}"
                  />
                  <c:if test="${requestScope.lastNameErrorMessage != null}">
                    <div class="invalid-feedback">${requestScope.lastNameErrorMessage}</div>
                  </c:if>
                </div>
                <div class="col-6">
                  <label for="firstName" class="form-label">
                    Tên <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input 
                    type="text" 
                    name="firstName" 
                    id="firstName" 
                    class="form-control ${requestScope.firstNameErrorMessage != null ? 'is-invalid' : ''}" 
                    placeholder="Nhập tên..."
                    value="${requestScope.firstNameRejectedValue != null ? requestScope.firstNameRejectedValue : ''}"
                  />
                  <c:if test="${requestScope.firstNameErrorMessage != null}">
                    <div class="invalid-feedback">${requestScope.firstNameErrorMessage}</div>
                  </c:if>
                </div>
                <div class="col-12">
                  <label for="email" class="form-label">
                    Email <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input 
                    type="text" 
                    name="email" 
                    id="email" 
                    class="form-control ${requestScope.emailErrorMessage != null ? 'is-invalid' : ''}" 
                    placeholder="Nhập email..."
                    value="${requestScope.emailRejectedValue != null ? requestScope.emailRejectedValue : ''}"
                  />
                  <c:if test="${requestScope.emailErrorMessage != null}">
                    <div class="invalid-feedback">${requestScope.emailErrorMessage}</div>
                  </c:if>
                </div>
                <div class="col-12">
                  <label for="password" class="form-label">
                    Mật khẩu <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input 
                    type="password" 
                    name="password" 
                    id="password" 
                    class="form-control ${requestScope.passwordErrorMessage != null ? 'is-invalid' : ''}" 
                    placeholder="Nhập mật khẩu..."
                    value="${requestScope.passwordRejectedValue != null ? requestScope.passwordRejectedValue : ''}"
                  />
                  <c:if test="${requestScope.passwordErrorMessage != null}">
                    <div class="invalid-feedback">${requestScope.passwordErrorMessage}</div>
                  </c:if>
                </div>
                <div class="col-12">
                  <label for="confirmPassword" class="form-label">
                    Xác nhận mật khẩu <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input 
                    type="password" 
                    name="confirmPassword" 
                    id="confirmPassword" 
                    class="form-control ${requestScope.confirmPasswordErrorMessage != null ? 'is-invalid' : ''}" 
                    placeholder="Nhập mật khẩu..."
                    value="${requestScope.confirmPasswordRejectedValue != null ? requestScope.confirmPasswordRejectedValue : ''}"
                  />
                  <c:if test="${requestScope.confirmPasswordErrorMessage != null}">
                    <div class="invalid-feedback">${requestScope.confirmPasswordErrorMessage}</div>
                  </c:if>
                </div>
                <div class="col-12">
                  <label for="address" class="form-label">
                    Địa chỉ
                  </label>
                  <br>
                  <input 
                    type="text" 
                    name="address" 
                    id="address" 
                    class="form-control" 
                    placeholder="Nhập địa chỉ..."
                  />
                </div>
                <div class="col-12 mt-5">
                  <button type="submit" class="w-100 btn btn-primary">Đăng ký</button>
                </div>
              </div>
            </form>
          </div>
        <div class="col-12">
          <div class="row justify-content-center align-items-center">
            <div class="col-4">
              <hr class="border border-1 opacity-75">
            </div>
            <div class="col-4 text-center opacity-75">
              <div style="font-size: 0.8rem !important">hoặc đăng ký bằng</div>
            </div>
            <div class="col-4">
              <hr class="border border-1 opacity-75">
            </div>
          </div>
        </div>
        <div class="col-3 text-center" style="font-size: 3rem !important;">
          <components:GoogleLogo />
        </div>
        <div class="col-3 text-center" style="font-size: 3rem !important;">
          <components:FacebookLogo />
        </div>
        <div class="col-12 text-center">
          Bạn đã có tài khoản? <a href="/auth/login">Đăng nhập</a>
        </div>
        <div class="col-12 text-center opacity-75 mt-5" style="font-size: 0.7rem !important">
          Việc bạn tiếp tục sử dụng trang web này đồng nghĩa với việc bạn đồng ý việc với <span class="text-decoration-underline">điều khoản sử dụng</span> của chúng tôi
        </div>
      </div>
    </div>
  </div>
</layouts:Default>

<style>
  body {
    background-image: url('/images/library-banner-2.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }
</style>