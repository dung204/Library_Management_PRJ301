<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<div class="custom-pagination">
  <div class="row align-items-center">
    <div class="col-auto">
      <button class="first-page-btn btn btn-primary">Trang đầu</button>
    </div>
    <div class="col-auto">
      <button class="previous-page-btn btn btn-primary">Trang trước</button>
    </div>
    <div class="col-auto">
      Trang:
    </div>
    <div class="col-auto">
      <select class="pagination-select form-select">
        <c:forEach begin="1" end="${param.totalPages}" var="page">
          <option value="${page}" ${page == param.currentPage ? 'selected' : ''}>${page}</option>
        </c:forEach>
      </select>
    </div>
    <div class="col-auto">
      <button class="next-page-btn btn btn-primary">Trang sau</button>
    </div>
    <div class="col-auto">
      <button class="last-page-btn btn btn-primary">Trang cuối</button>
    </div>
  </div>
</div>

<style>
</style>

<script>
  const paginationSelect = document.querySelector('.pagination-select');
  const firstPageBtn = document.querySelector('.first-page-btn');
  const previousPageBtn = document.querySelector('.previous-page-btn');
  const nextPageBtn = document.querySelector('.next-page-btn');
  const lastPageBtn = document.querySelector('.last-page-btn');

  paginationSelect.onchange = () => {
    const currentURL = new URL(location.href);
    currentURL.searchParams.delete('page');
    currentURL.searchParams.append('page', paginationSelect.value);
    location.href = currentURL.href;
  }

  firstPageBtn.onclick = () => {
    const currentURL = new URL(location.href);
    currentURL.searchParams.delete('page');
    currentURL.searchParams.append('page', 1);
    location.href = currentURL.href;
  }

  previousPageBtn.onclick = () => {
    const currentURL = new URL(location.href);
    currentURL.searchParams.delete('page');
    currentURL.searchParams.append('page', ${param.currentPage - 1});
    location.href = currentURL.href;
  }

  nextPageBtn.onclick = () => {
    const currentURL = new URL(location.href);
    currentURL.searchParams.delete('page');
    currentURL.searchParams.append('page', ${param.currentPage + 1});
    location.href = currentURL.href;
  }

  lastPageBtn.onclick = () => {
    const currentURL = new URL(location.href);
    currentURL.searchParams.delete('page');
    currentURL.searchParams.append('page', ${param.totalPages});
    location.href = currentURL.href;
  }
</script>