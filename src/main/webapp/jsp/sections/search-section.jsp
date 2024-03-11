<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
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
        <div class="row gy-3">
          <div class="col-12">
            <div class="form-check">
              <input type="checkbox" name="" id="music-and-art" class="form-check-input">
              <label for="music-and-art" class="form-check-label">Âm nhạc và nghệ thuật</label>
            </div>
          </div>
          <div class="col-12">
            <div class="form-check">
              <input type="checkbox" name="" id="tech" class="form-check-input">
              <label for="tech" class="form-check-label">Công nghệ</label>
            </div>
          </div>
          <div class="col-12">
            <div class="form-check">
              <input type="checkbox" name="" id="politics" class="form-check-input">
              <label for="politics" class="form-check-label">Chính trị</label>
            </div>
          </div>
          <div class="col-12">
            <div class="form-check">
              <input type="checkbox" name="" id="economy" class="form-check-input">
              <label for="economy" class="form-check-label">Kinh tế</label>
            </div>
          </div>
        </div>
        <p class="fs-5 fw-bold mt-4">
          Đánh giá
        </p>
        <hr class="border border-1 border-secondary" />
      </div>
      <div class="col-10 ps-5">
        <div class="row gy-4">
          <div class="col-12">
            <components:SearchInput />
          </div>
          <div class="col-12">
            Đang hiện kết quả cho từ khóa: <span class="fw-bold">"Hello world"</span>
          </div>
          <div class="col-12">
            <div class="row gx-5">
              <jsp:include page="/jsp/others/tab-item.jsp">
                <jsp:param name="url" value="/search?type=book" />
                <jsp:param name="className" value="result-type-item ${param.type == 'book' ? 'result-type-item-selected' : ''}" />
                <jsp:param name="logoComponent" value="<i class='bi bi-book fs-4'></i>" />
                <jsp:param name="itemName" value="Sách" />
                <jsp:param name="itemCount" value="25" />
              </jsp:include>
              <jsp:include page="/jsp/others/tab-item.jsp">
                <jsp:param name="url" value="/search?type=author" />
                <jsp:param name="className" value="result-type-item ${param.type == 'author' ? 'result-type-item-selected' : ''}" />
                <jsp:param name="logoComponent" value="<i class='bi bi-person fs-4'></i>" />
                <jsp:param name="itemName" value="Tác giả" />
                <jsp:param name="itemCount" value="4" />
              </jsp:include>
              <hr class="border border-1 opacity-75">
            </div>
          </div>
          <div class="col-12">
            <div class="row justify-content-around gy-5">
              <c:choose>
                <c:when test="${param.type == 'book'}">
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum dolor, sit amet consectetur adipisicing elit. Alias veniam provident eaque error vitae adipisci hic architecto sint, fugiat nemo." />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum dolor, sit amet consectetur adipisicing elit. Alias veniam provident eaque error vitae adipisci hic architecto sint, fugiat nemo." />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum dolor, sit amet consectetur adipisicing elit. Alias veniam provident eaque error vitae adipisci hic architecto sint, fugiat nemo." />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum dolor, sit amet consectetur adipisicing elit. Alias veniam provident eaque error vitae adipisci hic architecto sint, fugiat nemo." />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum dolor, sit amet consectetur adipisicing elit. Alias veniam provident eaque error vitae adipisci hic architecto sint, fugiat nemo." />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum dolor, sit amet consectetur adipisicing elit. Alias veniam provident eaque error vitae adipisci hic architecto sint, fugiat nemo." />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum dolor, sit amet consectetur adipisicing elit. Alias veniam provident eaque error vitae adipisci hic architecto sint, fugiat nemo." />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum dolor, sit amet consectetur adipisicing elit. Alias veniam provident eaque error vitae adipisci hic architecto sint, fugiat nemo." />
                  </jsp:include>
                </c:when>
                <c:when test="${param.type == 'author'}">
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/author-search-item.jsp">
                    <jsp:param name="authorName" value="Tên tác giả" />
                  </jsp:include>
                </c:when>
              </c:choose>
            </div>
          </div>
          <div class="col-12">
            <div class="row justify-content-end mt-5">
              <div class="col-auto">
                <jsp:include page="/jsp/others/pagination.jsp">
                  <jsp:param name="currentPage" value="2" />
                  <jsp:param name="totalPages" value="6" />
                </jsp:include>
              </div>
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