<%@page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<div class="modal fade" id="confirm-renting-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Xác nhận đặt mượn sách</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row gy-3 justify-content-start">
          <div class="col-12 text-start">Bạn có chắc chắn muốn đặt mượn sách này?</div>
          <div class="col-12 text-start">Thời gian mượn sách là <strong>14 ngày kể từ khi bạn nhấn nút "Đồng ý"</strong></div>
          <div class="col-12">
            <div class="alert alert-danger text-start" role="alert">
              <components:ErrorLogo className="me-1" />
              Chú ý: Thao tác này không thể hoàn tác. Nếu bạn đã đặt mượn sách và muốn hủy, bạn cần tới thư viện trực tiếp để tiến hành thủ tục hủy mượn sách.
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Hủy</button>
        <form action="/checkout/add/${param.bookId}" method="POST">
          <button type="submit" class="btn btn-success">Đồng ý</button>
        </form>
      </div>
    </div>
  </div>
</div>