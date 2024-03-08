<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<section class="email-subscription bg-black text-white">
  <div class="container">
    <div class="row align-items-center gx-5">
      <div class="col-5">
        <h1 class="fw-bold">Đăng ký nhận thông báo qua email</h1>
        <p>
          Nhận thông báo về những đầu sách mới, những ưu đãi, 
          những sự kiện sắp tới đến từ Books Maison qua email
        </p>
      </div>
      <div class="col-7">
        <form action="">
          <div class="row">
            <div class="col-10">
              <input type="email" class="form-control py-2 px-3" placeholder="Nhập email ...">
            </div>
            <div class="col-2">
              <button type="submit" class="btn btn-primary py-2 px-3">Đăng ký</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<style>
  .email-subscription {
    padding-block: 6rem;
  }
</style>