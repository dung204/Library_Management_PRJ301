<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<header class="pt-3 pb-5">
    <nav class="container">
      <div class="row align-items-center">
        <div class="col-3">
          <a href="/">
            <components:MainLogoLight />
          </a>
        </div>
        <div class="col-9">
          <div class="row gx-5 justify-content-end align-items-center">
            <div class="col-auto">
              <a href="/" class="text-decoration-none text-white">Về chúng tôi</a>
            </div>
            <div class="col-auto">
              <a href="/" class="text-decoration-none text-white">Thể loại</a>
            </div>
            <div class="col-auto">
              <a href="/" class="text-decoration-none text-white">Sách nổi bật</a>
            </div>
            <div class="col-auto">
              <a href="/" class="text-decoration-none text-white">Sự kiện</a>
            </div>
            <div class="col-auto">
              <a href="/" class="text-decoration-none text-white">Tìm kiếm</a>
            </div>
            <div class="col-auto">
              <button type="button" class="col btn btn-primary">Đăng nhập/đăng ký</button>
            </div>
          </div>
        </div>
      </div>
    </nav>
    <section class="container">
      <div class="row justify-content-center mt-5 pt-5">
        <div class="col-8">
          <h1 class="text-center text-white fw-bolder">Hãy cùng khám phá kho tàng tri thức nhân loại với hơn 362.832 đầu sách tại nơi đây</h1>
          <div class="row justify-content-center mt-4">
            <div class="col-6">
              <hr class="border border-1" />
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="container my-5">
      <div class="row justify-content-center">
        <div class="col-5">
          <components:SearchInput />
        </div>
      </div>
    </section>
  </header>