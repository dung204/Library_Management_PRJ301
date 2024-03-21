<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<ul
  class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
  id="accordionSidebar"
>
  <a class="sidebar-brand d-flex align-items-center justify-content-center" href="">
    <div class="sidebar-brand-text mx-3">
      <components:MainLogoLight />
    </div>
  </a>
  <hr class="sidebar-divider" />
  <div class="sidebar-heading">Chung</div>
  <li class="nav-item">
    <a class="nav-link" href="/admin/books">
      <components:BookLogo />
      <span>Đầu sách</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/admin/authors">
      <components:PersonLogo />
      <span>Tác giả</span>
    </a>
  </li>
  <hr class="sidebar-divider d-none d-md-block" />
  <div class="sidebar-heading">Người dùng</div>
  <li class="nav-item">
    <a class="nav-link" href="/admin/users">
      <components:PersonLogo />
      <span>Tài khoản</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/admin/checkouts">
      <components:BookLogo />
      <span>Lịch sử mượn</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/admin/fines">
      <components:CurrencyLogo />
      <span>Các khoản phạt</span>
    </a>
  </li>
</ul>
