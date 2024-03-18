<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<div class="col-5 shadow-lg rounded-3 overflow-hidden">
  <div class="row gx-4 py-4 px-2">
    <div class="book-${param.bookId}-img col-6"></div>
    <div class="col-6">
      <div class="row gy-3">
        <div class="book-title col-12 fw-bold">
          ${param.bookName}
        </div>
        <div class="col-12">
          <components:PersonLogo />: <a href="/author/${param.firstAuthorId}" title="Chi tiết tác giả ${param.firstAuthorName}">${param.firstAuthorName}</a>
        </div>
        <div class="col-12">
          <components:InfoLogo /> Mô tả:
          <br>
          <p class="book-${param.bookId}-description mt-2"></p>
        </div>
        <div class="col-12">
          <a href="/book/${param.bookId}">
            <button class="btn btn-primary">Chi tiết</button>
            </a>
        </div>
      </div>
    </div>
  </div>
</div>

<style>
  .book-${param.bookId}-description {
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }

  .book-title {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }

  .book-${param.bookId}-img {
    height: 15rem;
    background-image: url("${param.bookImage != null ? param.bookImage : 'https://via.placeholder.com/150'}");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }
</style>

<script>
  document.querySelector('.book-${param.bookId}-description').innerHTML = "${param.description}";
</script>