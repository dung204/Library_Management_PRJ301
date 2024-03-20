<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@page import="java.time.format.DateTimeFormatter" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <h3 class="fw-bolder">${requestScope.user.getFullName()}</h3>
          </div>
          <div class="col-12">
            <div class="row align-items-center">
              <div class="col-2">
                <components:ClockLogo className="fs-3" />
              </div>
              <div class="col-10">Tham gia từ ngày <fmt:formatDate pattern="dd/MM/YYYY" value="${requestScope.createdDate}" /></div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-9">
        <div class="row">
          <div class="col-12" style="z-index: 100">
            <div class="row gx-5 align-items-center">
              <jsp:include page="/jsp/others/tab-item.jsp">
                <jsp:param name="url" value="${requestScope['jakarta.servlet.forward.request_uri']}?tab=favourite-books" />
                <jsp:param name="className" value="tab-item ${param.tab == 'favourite-books' ? 'tab-item-selected' : ''}" />
                <jsp:param name="logoComponent" value="<i class='bi bi-heart fs-4'></i>" />
                <jsp:param name="itemName" value="Sách yêu thích" />
                <jsp:param name="itemCount" value="${requestScope.paginatedFavouriteBooks.getTotalElements()}" />
              </jsp:include>
              <jsp:include page="/jsp/others/tab-item.jsp">
                <jsp:param name="url" value="${requestScope['jakarta.servlet.forward.request_uri']}?tab=renting-books" />
                <jsp:param name="logoComponent" value="<i class='bi bi-book fs-4'></i>" />
                <jsp:param name="className" value="tab-item ${param.tab == 'renting-books' ? 'tab-item-selected' : ''}" />
                <jsp:param name="itemName" value="Lịch sử mượn sách" />
              </jsp:include>
              <jsp:include page="/jsp/others/tab-item.jsp">
                <jsp:param name="url" value="${requestScope['jakarta.servlet.forward.request_uri']}?tab=fines" />
                <jsp:param name="logoComponent" value="<i class='bi bi-currency-exchange fs-4'></i>" />
                <jsp:param name="className" value="tab-item ${param.tab == 'fines' ? 'tab-item-selected' : ''}" />
                <jsp:param name="itemName" value="Các khoản phạt" />
              </jsp:include>
              <jsp:include page="/jsp/others/tab-item.jsp">
                <jsp:param name="url" value="/user/me/edit" />
                <jsp:param name="logoComponent" value="<i class='bi bi-person-vcard-fill fs-4'></i>" />
                <jsp:param name="className" value="tab-item ${requestScope['jakarta.servlet.forward.request_uri'] == '/user/me/edit' ? 'tab-item-selected' : ''}" />
                <jsp:param name="itemName" value="Chỉnh sửa thông tin cá nhân" />
              </jsp:include>
              <hr class="border border-1 opacity-75">
            </div>
          </div>
          <div class="col-12">
            <div class="row justify-content-around gy-5">
              <c:choose>
                <c:when test="${param.tab == 'renting-books'}">
                  <div class="col-12 text-center">
                    <c:if test="${requestScope.paginatedCheckouts.getContent().isEmpty()}">
                      <p class="mt-5">Lịch sử đặt mượn sách trống.</p>
                    </c:if>
                    <c:if test="${!requestScope.paginatedCheckouts.getContent().isEmpty()}">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>Tên sách</th>
                            <th>Thời gian đặt mượn sách</th>
                            <th>Hạn trả sách</th>
                            <th>Trạng thái</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${requestScope.paginatedCheckouts.getContent()}" var="checkout">
                            <tr>
                              <td><a href="/book/${checkout.book.id}">${checkout.book.title}</a></td>
                              <td>${checkout.checkoutTimestamp.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"))}</td>
                              <td>${checkout.dueTimestamp.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"))}</td>
                              <td>
                                <jsp:include page="/jsp/others/checkout-status-item.jsp">
                                  <jsp:param name="statusId" value="${checkout.status.id}" />
                                </jsp:include>
                              </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                      <div class="col-12">
                        <div class="row justify-content-end mt-5">
                          <div class="col-auto">
                            <jsp:include page="/jsp/others/pagination.jsp">
                              <jsp:param name="currentPage" value="${requestScope.paginatedCheckouts.getNumber() + 1}" />
                              <jsp:param name="totalPages" value="${requestScope.paginatedCheckouts.getTotalPages()}" />
                            </jsp:include>
                          </div>
                        </div>
                      </div>
                    </c:if>
                  </div>
                </c:when>
                <c:when test="${param.tab == 'favourite-books'}">
                  <c:if test="${!requestScope.paginatedFavouriteBooks.getContent().isEmpty()}">
                    <c:forEach items="${requestScope.paginatedFavouriteBooks.getContent()}" var="book">
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
                            <jsp:param name="currentPage" value="${requestScope.paginatedFavouriteBooks.getNumber() + 1}" />
                            <jsp:param name="totalPages" value="${requestScope.paginatedFavouriteBooks.getTotalPages()}" />
                          </jsp:include>
                        </div>
                      </div>
                    </div>
                  </c:if>
                  <c:if test="${requestScope.paginatedFavouriteBooks.getContent().isEmpty()}">
                    <div class="col-12 text-center">
                      <p class="mt-5">Hiện tại người dùng không có sách yêu thích nào.</p>
                    </div>
                  </c:if>
                </c:when>
                <c:when test="${param.tab == 'fines'}">
                  <div class="col-12">
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                      <div>
                        <components:ErrorLogo className="me-2" />
                        Hiện tại, hệ thống thanh toán trực tuyến đang bảo trì. Người dùng vui lòng thanh toán các khoản phạt tại quầy thủ thư của thư viện.
                      </div>
                    </div>
                  </div>
                </c:when>
                <c:when test="${param.tab == 'events'}">
                  <div class="col-12">
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                      <div>
                        <components:ErrorLogo className="me-2" />
                        Hiện tại, hệ thống thanh toán trực tuyến đang bảo trì. Người dùng vui lòng thanh toán các khoản phạt tại quầy thủ thư của thư viện.
                      </div>
                    </div>
                  </div>
                </c:when>
                <c:when test="${requestScope['jakarta.servlet.forward.request_uri'] == '/user/me/edit'}">
                  
                  <div class="col-12">
                    <form action="/user/me/edit" method="POST" id="editInfoForm">
                      <div class="row gy-4">
                        <c:if test="${param.success != null}">
                          <div class="col-12">
                            <div class="alert alert-success d-flex align-items-center" role="alert">
                              <div>
                                <components:PatchCheckLogo className="me-2" />
                                Cập nhật thông tin cá nhân thành công
                              </div>
                            </div>
                          </div>
                        </c:if>
                        <div class="col-6">
                          <label for="lastName" class="form-label">
                            Họ <span class="text-danger">*</span>
                          </label>
                          <br>
                          <input
                            type="text"
                            name="lastName"
                            id="lastName"
                            class="form-control ${requestScope.lastNameErrorMessage != null ? 'is-invalid' : ''}"
                            placeholder="Nhập họ..."
                            value="${requestScope.user.lastName}"
                          />
                          <c:if test="${requestScope.lastNameErrorMessage != null}">
                            <div class="invalid-feedback">${requestScope.lastNameErrorMessage}</div>
                          </c:if>
                        </div>
                        <div class="col-6">
                          <label for="firstName" class="form-label">
                            Tên <span class="text-danger">*</span>
                          </label>
                          <br>
                          <input
                            type="text"
                            name="firstName"
                            id="firstName"
                            class="form-control ${requestScope.firstNameErrorMessage != null ? 'is-invalid' : ''}"
                            placeholder="Nhập tên..."
                            value="${requestScope.user.firstName}"
                          />
                          <c:if test="${requestScope.firstNameErrorMessage != null}">
                            <div class="invalid-feedback">${requestScope.firstNameErrorMessage}</div>
                          </c:if>
                        </div>
                        <div class="col-12">
                          <label for="email" class="form-label">
                            Email <span class="text-danger">*</span>
                          </label>
                          <br>
                          <input
                            type="text"
                            name="email"
                            id="email"
                            class="form-control ${requestScope.emailErrorMessage != null ? 'is-invalid' : ''}"
                            placeholder="Nhập email..."
                            value="${requestScope.user.email}"
                          />
                          <c:if test="${requestScope.emailErrorMessage != null}">
                            <div class="invalid-feedback">${requestScope.emailErrorMessage}</div>
                          </c:if>
                        </div>
                        <div class="col-12">
                          <label for="password" class="form-label">
                            Mật khẩu <span class="text-danger">*</span>
                          </label>
                          <br>
                          <input
                            type="password"
                            name="password"
                            id="password"
                            class="form-control ${requestScope.passwordErrorMessage != null ? 'is-invalid' : ''}"
                            placeholder="Nhập mật khẩu..."
                            value="${requestScope.user.password}"
                          />
                          <c:if test="${requestScope.passwordErrorMessage != null}">
                            <div class="invalid-feedback">${requestScope.passwordErrorMessage}</div>
                          </c:if>
                        </div>
                        <div class="col-12">
                          <label for="confirmPassword" class="form-label">
                            Xác nhận mật khẩu <span class="text-danger">*</span>
                          </label>
                          <br>
                          <input
                            type="password"
                            name="confirmPassword"
                            id="confirmPassword"
                            class="form-control ${requestScope.confirmPasswordErrorMessage != null ? 'is-invalid' : ''}"
                            placeholder="Nhập mật khẩu..."
                            value="${requestScope.confirmPasswordRejectedValue != null ? requestScope.confirmPasswordRejectedValue : ''}"
                          />
                          <c:if test="${requestScope.confirmPasswordErrorMessage != null}">
                            <div class="invalid-feedback">${requestScope.confirmPasswordErrorMessage}</div>
                          </c:if>
                        </div>
                        <div class="col-12">
                          <label for="address" class="form-label">
                            Địa chỉ
                          </label>
                          <br>
                          <input
                            type="text"
                            name="address"
                            id="address"
                            class="form-control"
                            placeholder="Nhập địa chỉ..."
                            value="${requestScope.user.address}"
                          />
                        </div>
                        <div class="col-12 mt-5">
                          <button type="submit" class="w-100 btn btn-primary">Lưu thay đổi</button>
                        </div>
                      </div>
                    </form>
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
  console.log("${requestScope.confirmPasswordErrorMessage}")
</script>