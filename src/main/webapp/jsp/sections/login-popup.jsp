<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<div class="modal fade" id="login-modal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="container py-5 px-4">
        <div class="row justify-content-center gy-3">
          <div class="col-auto text-center">
            <components:MainLogoDark />
          </div>
          <div class="col-12 text-center">
            <h5>Đăng nhập vào Books Maison</h5>
          </div>
          <div class="col-12 mt-5">
            <form action="">
              <div class="row gy-5">
                <div class="col-12">
                  <label for="login-email" class="form-label">
                    Email <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input type="email" name="login-email" id="login-email" class="form-control" placeholder="Nhập email...">
                </div>
                <div class="col-12">
                  <label for="login-password" class="form-label">
                    Mật khẩu <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input type="password" name="login-password" id="login-password" class="form-control" placeholder="Nhập mật khẩu...">
                </div>
                <div class="col-12">
                  <button type="submit" class="w-100 btn btn-primary">Đăng nhập</button>
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
                <div style="font-size: 0.8rem !important">hoặc đăng nhập bằng</div>
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
            Bạn chưa có tài khoản? <a href="#" data-bs-toggle="modal" data-bs-target="#register-modal" data-bs-dismiss="modal">Đăng ký ngay</a>
          </div>
          <div class="col-12 text-center">
            <a href="#" data-bs-toggle="modal" data-bs-target="#forgot-password-modal" data-bs-dismiss="modal">Quên mật khẩu?</a>
          </div>
          <div class="col-12 text-center opacity-75 mt-5" style="font-size: 0.7rem !important">
            Việc bạn tiếp tục sử dụng trang web này đồng nghĩa với việc bạn đồng ý việc với <span class="text-decoration-underline">điều khoản sử dụng</span> của chúng tôi
          </div>
        </div>
      </div>
    </div>
  </div>
</div>