<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<div class="col-5 border border-1 border-black rounded-3 overflow-hidden">
  <div class="row gx-4 py-4 px-2">
    <div class="col-6 bg-primary"></div>
    <div class="col-6">
      <div class="row gy-3">
        <div class="col-12 fw-bold">
          ${param.bookName}
        </div>
        <div class="col-12">
          <components:PersonLogo />: ${param.authorName}
        </div>
        <div class="col-12">
          <components:InfoLogo /> Mô tả:
          <br>
          <p class="book-description mt-2">${param.description}</p>
        </div>
        <div class="col-12">
          <button class="btn btn-primary">Chi tiết</button>
        </div>
      </div>
    </div>
  </div>
</div>