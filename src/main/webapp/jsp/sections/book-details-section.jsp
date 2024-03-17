<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<section class="book-details bg-white py-5">
  <div class="container">
    <div class="row gx-5">
      <div class="col-4">
        <div class="row justify-content-center gy-3">
          <div class="book-image col-12 bg-secondary border border-1 border-black" style="height: 35rem"></div>
          <div class="col-12 text-center pt-4">Số lượng cuốn sách còn trống: <span class="fw-bold">10</span></div>
          <sec:authorize access="isAuthenticated()">
            <div class="col-6 text-center">
              <button class="btn btn-primary">Đặt mượn</button>
            </div>
            <div class="col-6 text-center">
                <c:if test="${!requestScope.userHasFavouredBook}">
                  <form action="/user/me/add-favourite-book?book-id=${requestScope.book.id}" method="POST">
                    <button type="submit" class="btn btn-danger">
                      <components:HeartLogo />
                      Yêu thích
                    </button>
                  </form>
                </c:if>
                <c:if test="${requestScope.userHasFavouredBook}">
                  <form action="/user/me/remove-favourite-book?book-id=${requestScope.book.id}" method="POST">
                    <button type="submit" class="btn btn-outline-danger">
                      <components:HeartLogo />
                      Bỏ yêu thích
                    </button>
                  </form>
                </c:if>
            </div>
          </sec:authorize>
          <sec:authorize access="!isAuthenticated()">
            <div class="col-8 text-center">
              <a href="/auth/login" class="btn btn-primary">Đăng nhập để đặt mượn</a>
            </div>
          </sec:authorize>
        </div>
      </div>
      <div class="col-7">
        <div class="row gy-4">
          <div class="col-12">
            <h2 class="fw-bold">${requestScope.book.title}</h2>
            <hr class="border border-1 border-secondary">
          </div>
          <div class="col-3">
            Số ISBN:
          </div>
          <div class="col-9">
            ${requestScope.book.isbn != null ? requestScope.book.isbn : "Chưa cập nhật"}
          </div>
          <div class="col-3">
            Tác giả:
          </div>
          <div class="col-9">
            <c:forEach items="${requestScope.book.authors}" var="author">
              <div class="row align-items-center">
                <div class="col-auto">
                  <a href="/author/${author.id}">
                    <div class="fw-bold">${author.name}</div>
                  </a>
                </div>
              </div>
            </c:forEach>
          </div>
          <div class="col-3">Thể loại:</div>
          <div class="col-9">
            <div class="row gy-3">
              <c:forEach items="${requestScope.book.categories}" var="category">
                <div class="col-auto">
                  <a href="/search?type=book&category=${category.id}" class="text-decoration-none text-black" title="Tìm kiếm các sách thuộc thể loại ${category.name}">
                    <div class="rounded-pill px-3 py-1 border border-2 border-black">
                      ${category.name}
                    </div>
                  </a>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="col-3">
            NXB:
          </div>
          <div class="col-9">${requestScope.book.publisher != null ? requestScope.book.publisher : 'Chưa cập nhật'}</div>
          <div class="col-3">Năm phát hành:</div>
          <div class="col-9">${requestScope.book.publishedYear != null ? requestScope.book.publishedYear : 'Chưa cập nhật'}</div>
          <div class="col-3">Mô tả:</div>
          <div class="col-9">${requestScope.book.description != null ? requestScope.book.description : 'Chưa cập nhật'}</div>
        </div>
      </div>
    </div>
  </div>
</section>

<style>
  .book-image {
    background-image: url("${requestScope.book.imageUrl != null ? requestScope.book.imageUrl : 'https://via.placeholder.com/300x400'}");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }


</style>
