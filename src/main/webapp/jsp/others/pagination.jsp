<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<div class="custom-pagination">
  <div class="row align-items-center">
    <div class="col-auto">
      Page:
    </div>
    <div class="col-auto">
      <select class="pagination-select form-select">
        <c:forEach begin="1" end="${param.totalPages}" var="page">
          <option value="${page}" ${page == param.currentPage ? 'selected' : ''}>${page}</option>
        </c:forEach>
      </select>
    </div>
  </div>
</div>

<style>
</style>

<script>
  const paginationSelect = document.querySelector('.pagination-select');

  paginationSelect.onchange = () => {
    const currentURL = new URL(location.href);
    currentURL.searchParams.delete('page');
    currentURL.searchParams.append('page', paginationSelect.value);
    location.href = currentURL.href;
  }
</script>