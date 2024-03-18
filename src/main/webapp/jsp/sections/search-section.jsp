<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@page import="java.util.Arrays" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<section class="search bg-white py-5">
  <div class="container">
    <div class="row gx-5 justify-content-between">
      <div class="col-2">
        <p class="fs-3">
          <components:FilterLogo className="me-2" />
          Bộ lọc
        </p>
        <p class="fs-5 fw-bold mt-4">
          Thể loại
        </p>
        <hr class="border border-1 border-black" />
        <form action="" id="categories-filter">
          <div class="row gy-3">
            <c:forEach items="${requestScope.categories}" var="category">
              <div class="col-12">
                <div class="form-check">
                  <input type="checkbox" id="${category.id}" class="form-check-input" 
                  ${paramValues.category != null && Arrays.binarySearch(paramValues.category, category.id) >= 0 ? 'checked' : ''}>
                  <label for="${category.id}" class="form-check-label">${category.name}</label>
                </div>
              </div>
            </c:forEach>
            <div class="col-12">
              <button type="submit" class="btn btn-primary">Áp dụng</button>
            </div>
          </div>
        </form>
      </div>
      <div class="col-10 ps-5">
        <div class="row gy-4">
          <div class="col-12">
            <form action="" id="search-keyword-form">
              <components:SearchInput />
            </form>
          </div>
          <c:if test="${param.query != null && !param.query.isEmpty()}">
            <div class="col-12">
              Đang hiện kết quả cho từ khóa: <span class="fw-bold">"${param.query}"</span>
            </div>
          </c:if>
          <div class="col-12">
            <div class="row gx-5">
              <jsp:include page="/jsp/others/tab-item.jsp">
                <jsp:param name="className" value="book-tab result-type-item ${param.type == 'book' ? 'result-type-item-selected' : ''}" />
                <jsp:param name="logoComponent" value="<i class='bi bi-book fs-4'></i>" />
                <jsp:param name="itemName" value="Sách" />
                <jsp:param name="itemCount" value="${requestScope.totalBookCount}" />
              </jsp:include>
              <jsp:include page="/jsp/others/tab-item.jsp">
                <jsp:param name="url" value="/search?type=author" />
                <jsp:param name="className" value="author-tab result-type-item ${param.type == 'author' ? 'result-type-item-selected' : ''}" />
                <jsp:param name="logoComponent" value="<i class='bi bi-person fs-4'></i>" />
                <jsp:param name="itemName" value="Tác giả" />
                <jsp:param name="itemCount" value="${requestScope.totalAuthorCount}" />
              </jsp:include>
              <hr class="border border-1 opacity-75">
            </div>
          </div>
          <div class="col-12">
            <div class="row justify-content-around gy-5">
              <c:choose>
                <c:when test="${param.type == 'book'}">
                  <c:forEach items="${requestScope.paginatedBooks.getContent()}" var="book">
                    <jsp:include page="/jsp/others/book-search-item.jsp">
                      <jsp:param name="bookId" value="${book.id}" />
                      <jsp:param name="bookName" value="${book.title}" />
                      <jsp:param name="bookImage" value="${book.imageUrl}" />
                      <jsp:param name="firstAuthorId" value="${book.authors[0].id}" />                      
                      <jsp:param name="firstAuthorName" value="${book.authors[0].name}" />
                      <jsp:param name="description" value="${book.description}" />
                    </jsp:include>
                  </c:forEach>
                  <div class="col-12">
                    <div class="row justify-content-end mt-5">
                      <div class="col-auto">
                        <jsp:include page="/jsp/others/pagination.jsp">
                          <jsp:param name="currentPage" value="${requestScope.paginatedBooks.getNumber() + 1}" />
                          <jsp:param name="totalPages" value="${requestScope.paginatedBooks.getTotalPages()}" />
                        </jsp:include>
                      </div>
                    </div>
                  </div>
                </c:when>
                <c:when test="${param.type == 'author'}">
                  <c:forEach items="${requestScope.paginatedAuthors.getContent()}" var="author">
                    <jsp:include page="/jsp/others/author-search-item.jsp">
                      <jsp:param name="authorId" value="${author.id}" />
                      <jsp:param name="authorName" value="${author.name}" />
                      <jsp:param name="authorImageUrl" value="${author.imageUrl}" />
                    </jsp:include>
                  </c:forEach>
                  <div class="col-12">
                    <div class="row justify-content-end mt-5">
                      <div class="col-auto">
                        <jsp:include page="/jsp/others/pagination.jsp">
                          <jsp:param name="currentPage" value="${requestScope.paginatedAuthors.getNumber() + 1}" />
                          <jsp:param name="totalPages" value="${requestScope.paginatedAuthors.getTotalPages()}" />
                        </jsp:include>
                      </div>
                    </div>
                  </div>
                </c:when>
              </c:choose>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<style>
  .result-type-item {
    cursor: pointer;
    transition: all 0.2s;
  }

  .result-type-item:hover,
  .result-type-item-selected {
    background-color: #e3e1e1;
  }
</style>

<script>
  let thisURL;
  const bookTab = document.querySelector('.book-tab');

  document.querySelector('#categories-filter').onsubmit = (e) => {
    e.preventDefault();

    thisURL = new URL(location.href);
    const checkboxes = document.querySelectorAll('input[type=checkbox]');

    if (thisURL.searchParams.has('page')) {
      thisURL.searchParams.delete('page');
      thisURL.searchParams.append('page', '1');
    }

    thisURL.searchParams.delete('category')

    checkboxes.forEach(checkbox => {
      if (checkbox.checked) {
        thisURL.searchParams.append('category', checkbox.id);
      }
    })

    location.href = thisURL.href;
  }

  document.querySelector('#search-keyword-form').onsubmit = (e) => {
    e.preventDefault();
    thisURL = new URL(location.href);
    const searchInputValue = document.querySelector('#search-keyword-form input').value.trim()

    thisURL.searchParams.delete('query')
    thisURL.searchParams.delete('page')

    thisURL.searchParams.append('page', '1');
    
    if (searchInputValue !== '')
      thisURL.searchParams.append('query', searchInputValue)

    location.href = thisURL.href
  }

  
  thisURL = new URL(location.href);
  thisURL.searchParams.delete('page');
  thisURL.searchParams.append('page', '1');
  bookTab.href = thisURL.href;
</script>