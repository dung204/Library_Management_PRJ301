<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<div class="modal fade" id="register-modal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="container py-5 px-4">
        <div class="row justify-content-center gy-3">
          <div class="col-auto text-center">
            <components:MainLogoDark />
          </div>
          <div class="col-12 text-center">
            <h5>Đăng ký vào Books Maison</h5>
          </div>
          <div class="col-12 mt-5">
            <form action="">
              <div class="row gy-4">
                <div class="col-6">
                  <label for="register-first-name" class="form-label">
                    Họ <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input type="text" name="register-first-name" id="register-first-name" class="form-control" placeholder="Nhập họ...">
                </div>
                <div class="col-6">
                  <label for="register-last-name" class="form-label">
                    Tên <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input type="text" name="register-last-name" id="register-last-name" class="form-control" placeholder="Nhập tên...">
                </div>
                <div class="col-12">
                  <label for="register-email" class="form-label">
                    Email <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input type="email" name="register-email" id="register-email" class="form-control" placeholder="Nhập email...">
                </div>
                <div class="col-12">
                  <label for="register-password" class="form-label">
                    Mật khẩu <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input type="password" name="register-password" id="register-password" class="form-control" placeholder="Nhập mật khẩu...">
                </div>
                <div class="col-12">
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
            Bạn đã có tài khoản? <a href="#" data-bs-toggle="modal" data-bs-target="#login-modal" data-bs-dismiss="modal">Đăng nhập</a>
          </div>
          <div class="col-12 text-center opacity-75 mt-5" style="font-size: 0.7rem !important">
            Việc bạn tiếp tục sử dụng trang web này đồng nghĩa với việc bạn đồng ý việc với <span class="text-decoration-underline">điều khoản sử dụng</span> của chúng tôi
          </div>
        </div>
      </div>
    </div>
  </div>
</div>