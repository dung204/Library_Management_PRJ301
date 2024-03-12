<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>
<%@taglib uri="/WEB-INF/tlds/layouts.tld" prefix="layouts" %>

<layouts:Default title="Đăng nhập">
  <div class="container py-5" style="height: 100vh;">
    <div class="row justify-content-center align-items-center">
      <div class="col-5 bg-white rounded-4 shadow-lg">
        <div class="row justify-content-center gy-3 p-5">
          <div class="col-auto text-center">
            <components:MainLogoDark />
          </div>
          <div class="col-12 text-center">
            <h5>Đăng nhập vào Books Maison</h5>
          </div>
          <c:if test="${param.error != null}">
            <div class="col-12">
              <div class="alert alert-danger d-flex align-items-center" role="alert">
                <div>
                  <components:ErrorLogo className="me-2" />
                  Email hoặc mật khẩu không đúng
                </div>
              </div>
            </div>
          </c:if>
          <c:if test="${param['register-success'] != null}">
            <div class="col-12">
              <div class="alert alert-success d-flex align-items-center" role="alert">
                <div>
                  <components:PatchCheckLogo className="me-2" />
                  Đăng ký tài khoản thành công
                </div>
              </div>
            </div>
          </c:if>
          <div class="col-12 ${param.error != null || param['register-success'] != null ? '' : 'mt-5'}">
            <form action="/auth/login" method="POST">
              <div class="row gy-4">
                <div class="col-12">
                  <label for="email" class="form-label">
                    Email <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input type="email" name="email" id="email" class="form-control" placeholder="Nhập email...">
                </div>
                <div class="col-12">
                  <label for="password" class="form-label">
                    Mật khẩu <span class="text-danger">*</span>
                  </label>
                  <br>
                  <input type="password" name="password" id="password" class="form-control" placeholder="Nhập mật khẩu...">
                </div>
                <div class="col-12">
                  <button type="submit" class="w-100 btn btn-primary">Đăng nhập</button>
                </div>
              </div>
            </form>
          </div>
          <div class="col-12">
            <div class="row justify-content-center align-items-center">
              <div class="col-3">
                <hr class="border border-1 opacity-75">
              </div>
              <div class="col-6 text-center opacity-75">
                <div style="font-size: 0.8rem !important">hoặc đăng nhập bằng</div>
              </div>
              <div class="col-3">
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
            Bạn chưa có tài khoản? <a href="/auth/register">Đăng ký ngay</a>
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
</layouts:Default>

<style>
  body {
    background-image: url('/images/library-banner-2.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }
</style>

<script>
  console.log("${param.error != null}")
</script>