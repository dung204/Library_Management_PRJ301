<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
  <ul class="navbar-nav ml-auto">
    <li class="nav-item dropdown no-arrow">
      <a
        class="nav-link dropdown-toggle"
        href="/"
        id="userDropdown"
        role="button"
        data-toggle="dropdown"
        aria-haspopup="true"
        aria-expanded="false"
      >
        <span class="mr-2 d-none d-lg-inline text-gray-600 small">Quay lại trang chính</span>
        <i class="bi bi-box-arrow-right"></i>
      </a>
    </li>
    <li class="nav-item dropdown no-arrow">
      <a
        class="nav-link dropdown-toggle"
        href="/auth/logout"
        id="userDropdown"
        role="button"
        data-toggle="dropdown"
        aria-haspopup="true"
        aria-expanded="false"
      >
        <span class="mr-2 d-none d-lg-inline text-gray-600 small">Đăng xuất</span>
        <i class="bi bi-box-arrow-right"></i>
      </a>
    </li>

    <div class="topbar-divider d-none d-sm-block"></div>

    <li class="nav-item dropdown no-arrow">
      <a
        class="nav-link dropdown-toggle"
        href="#"
        id="userDropdown"
        role="button"
        data-toggle="dropdown"
        aria-haspopup="true"
        aria-expanded="false"
      >
        <span class="mr-2 d-none d-lg-inline text-gray-600 small">
          ${currentUser.firstName} ${currentUser.lastName}
        </span>
        <div class="img-profile rounded-circle bg-secondary"></div>
      </a>
    </li>
  </ul>
</nav>