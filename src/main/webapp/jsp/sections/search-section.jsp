<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
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
          <div class="col-12 author-search-result">
            <div class="row gx-5">
              <div class="col-6 fw-bold fs-4">
                Tác giả (4)
              </div>
              <div class="col-6 text-end">
                <components:ArrowDownLogo className="fs-3" />
              </div>
              <div class="col-12">
                <hr class="border border-1 border-dark">
              </div>
              <jsp:include page="/jsp/others/author-search-item.jsp">
                <jsp:param name="authorName" value="Tác giả 1" />
              </jsp:include>
              <jsp:include page="/jsp/others/author-search-item.jsp">
                <jsp:param name="authorName" value="Tác giả 2" />
              </jsp:include>
              <jsp:include page="/jsp/others/author-search-item.jsp">
                <jsp:param name="authorName" value="Tác giả 3" />
              </jsp:include>
              <jsp:include page="/jsp/others/author-search-item.jsp">
                <jsp:param name="authorName" value="Tác giả 4" />
              </jsp:include>
            </div>
          </div>
          <div class="col-12 book-search-result">
            <div class="row">
              <div class="col-6 fw-bold fs-4">
                Sách (25)
              </div>
              <div class="col-6 text-end">
                <components:ArrowDownLogo className="fs-3" />
              </div>
              <div class="col-12">
                <hr class="border border-1 border-dark">
              </div>
              <div class="col-12">
                <div class="row justify-content-around gy-5">
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách 1" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum, dolor sit amet consectetur adipisicing elit. Optio, officia!" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách 1" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum, dolor sit amet consectetur adipisicing elit. Optio, officia!" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách 1" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum, dolor sit amet consectetur adipisicing elit. Optio, officia!" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách 1" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum, dolor sit amet consectetur adipisicing elit. Optio, officia!" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách 1" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum, dolor sit amet consectetur adipisicing elit. Optio, officia!" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách 1" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum, dolor sit amet consectetur adipisicing elit. Optio, officia!" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách 1" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum, dolor sit amet consectetur adipisicing elit. Optio, officia!" />
                  </jsp:include>
                  <jsp:include page="/jsp/others/book-search-item.jsp">
                    <jsp:param name="bookName" value="Tên sách 1" />
                    <jsp:param name="authorName" value="Tên tác giả" />
                    <jsp:param name="description" value="Lorem ipsum, dolor sit amet consectetur adipisicing elit. Optio, officia!" />
                  </jsp:include>
                </div>
              </div>
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
  .book-description {
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }
</style>