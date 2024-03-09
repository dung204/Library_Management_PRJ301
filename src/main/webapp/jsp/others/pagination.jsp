<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<div class="custom-pagination">
  <div class="row align-items-center">
    <div class="col-auto">
      <components:DoubleArrowLeftLogo className="custom-pagination-item rounded-pill fs-4 py-2 px-3" />
    </div>
    <div class="col-auto">
      <components:ArrowLeftLogo className="custom-pagination-item rounded-pill fs-4 py-2 px-3" />
    </div>

    <c:forEach 
      var="i" 
      begin="${
        param.currentPage != 2 && param.currentPage >= param.totalPages - 4 
        && param.currentPage <= param.totalPages + 0
        ? param.totalPages - 4
        : param.currentPage - 2 <= 0 
          ? 1 
          : param.currentPage - 2
      }" 
      end="${
        param.currentPage >= 1 && param.currentPage <= 3
          ? 5
          : param.currentPage + 2 > param.totalPages
            ? param.totalPages
            : param.currentPage + 2
      }"
    >
      <div class="col-auto">
        <c:choose>
          <c:when test="${param.currentPage == i}">
            <span class="custom-pagination-item fs-5 py-2 px-3 rounded-pill bg-primary text-white">${i}</span>
          </c:when>

          <c:otherwise>
            <span class="custom-pagination-item rounded-pill fs-5 py-2 px-3 rounded-pill">${i}</span>
          </c:otherwise>
        </c:choose>
      </div>
    </c:forEach>

    <div class="col-auto">
      <components:ArrowRightLogo className="custom-pagination-item rounded-pill fs-4 py-2 px-3" />
    </div>
    <div class="col-auto">
      <components:DoubleArrowRightLogo className="custom-pagination-item rounded-pill fs-4 py-2 px-3" />
    </div>
  </div>
</div>

<style>
  .custom-pagination-item {
    cursor: pointer;
    transition: all 0.2s;
  }

  .custom-pagination-item:not(:has(.bg-primary)):hover {
    background-color: var(--bs-secondary);
    color: white;
  }

  .col-auto:has(> .custom-pagination-item) {
    padding-inline: 0.2rem !important;
  }
</style>