<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<section class="author-details bg-white py-5">
  <div class="container">
    <div class="row gx-5 justify-content-between">
      <div class="col-3">
        <div class="row gy-3">
          <div class="col-12">
            <div class="author-avatar rounded-pill bg-secondary" style="width: 18rem; height: 18rem"></div>
          </div>
          <div class="col-12 mt-5">
            <h3 class="fw-bolder">Tên tác giả</h3>
          </div>
          <div class="col-12">
            <div class="row align-items-center">
              <div class="col-2">
                <components:GenderLogo className="fs-3" />
              </div>
              <div class="col-10">Giới tính</div>
            </div>
          </div>
          <div class="col-12">
            <div class="row align-items-center">
              <div class="col-2">
                <components:GlobeLogo className="fs-3" />
              </div>
              <div class="col-10">Quốc tịch</div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-9">
        <div class="row">
          <div class="col-12" style="z-index: 100">
            <div class="row gx-5 align-items-center">
              <jsp:include page="/jsp/others/tab-item.jsp">
                <jsp:param name="url" value="${requestScope['jakarta.servlet.forward.request_uri']}" />
                <jsp:param name="logoComponent" value="<i class='bi bi-person-lines-fill fs-4'></i>" />
                <jsp:param name="className" value="tab-item ${param.tab == null ? 'tab-item-selected' : ''}" />
                <jsp:param name="itemName" value="Tiểu sử" />
              </jsp:include>
              <jsp:include page="/jsp/others/tab-item.jsp">
                <jsp:param name="url" value="${requestScope['jakarta.servlet.forward.request_uri']}?tab=book" />
                <jsp:param name="className" value="tab-item ${param.tab == 'book' ? 'tab-item-selected' : ''}" />
                <jsp:param name="logoComponent" value="<i class='bi bi-book fs-4'></i>" />
                <jsp:param name="itemName" value="Sách" />
                <jsp:param name="itemCount" value="25" />
              </jsp:include>
              <hr class="border border-1 opacity-75">
            </div>
          </div>
          <div class="col-12">
            <div class="row justify-content-around gy-5">
              <c:choose>
                <c:when test="${param.tab == null}">
                  <div class="col-12">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint rerum, dolores ducimus exercitationem perspiciatis ut odio labore praesentium repellendus voluptas, eaque, quibusdam quisquam. Earum ab officia sed iure voluptatum rem laboriosam, adipisci aliquid repellendus quaerat! Culpa blanditiis nam modi. Quibusdam vel ullam expedita, dolor id cum dolorem rem itaque sunt laudantium commodi facilis, saepe aliquid obcaecati dignissimos esse voluptatem similique accusantium minima. A ad dolore quidem, ab eveniet ipsa veritatis fuga quaerat nisi et pariatur debitis sint laudantium doloremque culpa harum repellat quo doloribus. Tempore quo veritatis tenetur eum quam aliquam id obcaecati unde, mollitia qui odit doloribus iure ut provident quibusdam ea amet nobis recusandae quaerat temporibus rerum impedit maxime officiis. Sint itaque amet iure, assumenda minima atque vitae perspiciatis laboriosam ipsa eum deserunt sed similique earum, corporis aperiam illo voluptatem dolor necessitatibus tempore alias aliquam animi deleniti sit laudantium! At cupiditate adipisci quis perspiciatis recusandae amet tenetur quod consectetur hic voluptatem est dignissimos sit quisquam sed, inventore reprehenderit quos, dolorem eveniet. Velit officia, voluptas magni consequatur a, eum, nam distinctio molestiae magnam quisquam et perferendis odit aspernatur minus quas! Non perferendis voluptates laborum esse totam excepturi adipisci beatae, ullam sequi aut reiciendis eum expedita. Expedita, vero omnis? Odio.
                  </div>
                </c:when>
                <c:when test="${param.tab == 'book'}">
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
              </c:choose>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<style>
  .tab-item {
    cursor: pointer;
    transition: all 0.2s;
  }

  .tab-item:hover,
  .tab-item-selected {
    background-color: #e3e1e1;
  }
</style>

<script>
  console.log("${requestScope['jakarta.servlet.forward.request_uri']}")
</script>