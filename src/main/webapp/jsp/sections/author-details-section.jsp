<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<section class="author-details bg-white py-5">
  <div class="container">
    <div class="row gx-5 justify-content-between">
      <div class="col-3">
        <div class="row gy-3">
          <div class="col-12">
            <div class="author-avatar rounded-pill bg-secondary shadow-lg border border-black border-2"></div>
          </div>
          <div class="col-12 mt-5">
            <h3 class="fw-bolder">${requestScope.author.name}</h3>
          </div>
          <div class="col-12">
            <div class="row align-items-center">
              <div class="col-2" title="Năm sinh">
                <components:BirthdayCakeLogo className="fs-3" />
              </div>
              <div class="col-10">${requestScope.author.yearOfBirth}</div>
            </div>
          </div>
          <c:if test="${requestScope.author.yearOfDeath != null}">
            <div class="col-12">
              <div class="row align-items-center">
                <div class="col-2" title="Năm mất">
                  <components:ChristianCrossLogo className="fs-3" />
                </div>
                <div class="col-10">${requestScope.author.yearOfDeath}</div>
              </div>
            </div>
          </c:if>
          <div class="col-12">
            <div class="row align-items-center">
              <div class="col-2" title="Quốc tịch">
                <components:GlobeLogo className="fs-3" />
              </div>
              <div class="col-10">${requestScope.author.nationality}</div>
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
                <jsp:param name="itemCount" value="${requestScope.author.getTotalBookCount()}" />
              </jsp:include>
              <hr class="border border-1 opacity-75">
            </div>
          </div>
          <div class="col-12">
            <div class="row justify-content-around gy-5">
              <c:choose>
                <c:when test="${param.tab == null}">
                  <div class="col-12">
                    ${requestScope.author.biography}
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
  .author-avatar {
    height: 18rem;
    width: 18rem;
    background-image: url('${requestScope.author.imageUrl}');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }

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