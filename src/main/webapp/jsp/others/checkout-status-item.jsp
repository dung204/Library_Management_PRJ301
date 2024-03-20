<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
  <c:when test="${param.statusId == 1}">
    <span class="btn btn-primary">Đang mượn</span>
  </c:when>
  <c:when test="${param.statusId == 2}">
    <span class="btn btn-error">Quá hạn trả</span>
  </c:when>
  <c:when test="${param.statusId == 3}">
    <span class="btn btn-error">Đã trả</span>
  </c:when>
</c:choose>