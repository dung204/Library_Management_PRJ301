<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<div class="col-2">
  <a href="/author/${param.authorId}" title="Chi tiết tác giả ${param.authorName}">
    <div class="row gy-3 justify-content-center">
      <div class="col-12" style="display: flex; justify-content: center;">
        <div class="author-avatar-${param.authorId} rounded-pill bg-secondary" style="width: 7rem; height: 7rem;"></div>
      </div>
      <div class="col-12 fw-bold text-center">
        ${param.authorName}
      </div>
    </div>
  </a>
</div>

<style>
  .author-avatar-${param.authorId} {
    background-image: url('${param.authorImageUrl}');
    background-size: cover;
    background-position: center;
  }
</style>