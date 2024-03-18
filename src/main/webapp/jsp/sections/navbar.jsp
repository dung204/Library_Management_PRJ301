<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
            <a href="/search?type=book" class="text-decoration-none text-white">Tìm kiếm</a>
          </div>
          <div class="col-auto">
            <sec:authorize access="!isAuthenticated()">
              <a href="/auth/login">
                <button type="button" class="col btn btn-primary">Đăng nhập/đăng ký</button>
              </a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
              <div class="dropdown">
                <div class="row align-items-center text-white" data-bs-toggle="dropdown" data-bs-offset="0,40" aria-expanded="false" style="cursor: pointer">
                  <div class="col-auto">
                    <div class="rounded-pill bg-secondary" style="width: 2.4rem; height: 2.4rem"></div>
                  </div>
                  <div class="col-auto" style="padding-left: 0">
                    <sec:authentication property="principal.firstName" /> <sec:authentication property="principal.lastName" />
                  </div>
                  <div class="col-auto" style="padding-left: 0">
                    <components:ArrowDownLogo />
                  </div>
                </div>
                <ul class="dropdown-menu dropdown-menu-end animate slideIn text-end">
                  <li>
                    <a class="dropdown-item" href="/user/me?tab=favourite-books">
                      Trang cá nhân
                      <components:PersonLogo />
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="/user/me?tab=renting-books">
                      Lịch sử mượn sách
                      <components:BookLogo />
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="/user/me?tab=favourite-books">
                      Sách yêu thích
                      <components:HeartLogo />
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="/auth/logout">
                      Đăng xuất
                      <components:ExitLogo />
                    </a>
                  </li>
                </ul>
              </div>
            </sec:authorize>
          </div>
        </div>
      </div>
    </div>
  </nav>
</div>

<style>
@media (min-width: 768px) {
  .animate {
    animation-duration: 0.3s;
    -webkit-animation-duration: 0.3s;
    animation-fill-mode: both;
    -webkit-animation-fill-mode: both;
  }
}

@keyframes slideIn {
  0% {
    transform: translateY(4rem);
    opacity: 0;
  }

  100% {
    transform: translateY(3rem);
    opacity: 1;
  }

  0% {
    transform: translateY(4rem);
    opacity: 0;
  }
}

@-webkit-keyframes slideIn {
  0% {
    -webkit-transform: transform;
    -webkit-opacity: 0;
  }

  100% {
    -webkit-transform: translateY(3rem);
    -webkit-opacity: 1;
  }

  0% {
    -webkit-transform: translateY(4rem);
    -webkit-opacity: 0;
  }
}

.slideIn {
  -webkit-animation-name: slideIn;
  animation-name: slideIn;
}
</style>