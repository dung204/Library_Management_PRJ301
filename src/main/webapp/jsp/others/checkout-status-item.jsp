<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
  <c:when test="${param.statusId == 1}">
    <span class="btn btn-primary">Đang mượn sách</span>
  </c:when>
  <c:when test="${param.statusId == 2}">
    <span class="btn btn-danger">Quá hạn trả sách</span>
  </c:when>
  <c:when test="${param.statusId == 3}">
    <span class="btn btn-success">Đã trả sách</span>
  </c:when>
  <c:when test="${param.statusId == 4}">
    <span class="btn btn-secondary">Đã hủy đặt mượn</span>
  </c:when>
</c:choose>