<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>
<%@taglib uri="/WEB-INF/tlds/layouts.tld" prefix="layouts" %>

<layouts:Admin title="Lịch sử mượn">
  <body id="page-top">
    <div id="wrapper">
      <jsp:include page="sidebar.jsp" />
      <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
          <jsp:include page="topbar.jsp" />

          <div class="container-fluid">
            <h1 class="h3 mb-2 text-gray-800 mb-5">Quản lý lịch sử mượn</h1>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>ISBN</th>
                  <th>Tên sách</th>
                  <th>Năm xuất bản</th>
                  <th>Ngôn ngữ</th>
                  <th>Số trang</th>
                  <th>Mô tả</th>
                  <th>Ảnh</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${requestScope.paginatedBooks.getContent()}" var="fine">
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>

        <jsp:include page="footer.jsp" />
      </div>
    </div>
  </body>
</layouts:Admin>

<style>
  svg {
    width: 12rem;
  }
</style>