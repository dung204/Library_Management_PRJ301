<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<a class="col-auto ${param.className}" href="${param.url}">
  <div class="row align-items-center">
    <c:if test="${param.logoComponent != null}">
      <div class="col-auto" style="padding: 0.4rem">
        ${param.logoComponent}
      </div>
    </c:if>
    <div class="col-auto" style="padding: 0.4rem">${param.itemName}</div>
    <c:if test="${param.itemCount != null}">
      <div class="col-auto" style="padding: 0.4rem">
        <span class="badge rounded-pill bg-secondary">
          ${param.itemCount}
        </span>
      </div>
    </c:if>
  </div>
</a>

<style>
  .result-type-item {
    color: var(--bs-body-color);
    text-decoration: none;
  }
</style>