<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<div class="nav-container fixed-top py-1">
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
            <a href="/#about-us" class="text-decoration-none text-white">Về chúng tôi</a>
          </div>
          <div class="col-auto">
            <a href="/#categories" class="text-decoration-none text-white">Thể loại</a>
          </div>
          <div class="col-auto">
            <a href="/#featured-books" class="text-decoration-none text-white">Sách nổi bật</a>
          </div>
          <div class="col-auto">
            <a href="/#events" class="text-decoration-none text-white">Sự kiện</a>
          </div>
          <div class="col-auto">
            <a href="/search?type=book" class="text-decoration-none text-white">Tìm kiếm</a>
          </div>
          <div class="col-auto">
            <button type="button" class="col btn btn-primary" data-bs-toggle="modal" data-bs-target="#login-modal">Đăng nhập/đăng ký</button>
          </div>
        </div>
      </div>
    </div>
  </nav>
</div>

<jsp:include page="/jsp/sections/login-popup.jsp" />
<jsp:include page="/jsp/sections/register-popup.jsp" />

<header class="py-5">
  <section class="container">
    <div class="row justify-content-center mt-5 pt-5">
      <div class="col-8">
        <h1 class="text-center text-white fw-bolder">${param.title}</h1>
        <div class="row justify-content-center mt-4">
          <div class="col-6">
            <hr class="border border-1" />
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="container my-5">
    <c:if test="${requestScope['jakarta.servlet.forward.request_uri'] == '/'}">
      <div class="row justify-content-center">
        <div class="col-5">
          <components:SearchInput />
        </div>
      </div>
    </c:if>
  </section>
</header>


<script>
  document.querySelector('header').style.marginTop = document.querySelector('.nav-container').offsetHeight + 'px'

  document.body.onscroll = () => {
    document.querySelector('.nav-container').style.backgroundColor = 
      window.scrollY > 0 
      ? 'rgba(0, 0, 0, 0.9)' 
      : 'rgba(0, 0, 0, 0.6)'
  }
</script>

<style>
  svg {
    width: 70%;
  }

  .nav-container {
    background-color: rgba(0, 0, 0, 0.6);
    transition: background-color 0.3s;
  }
</style>