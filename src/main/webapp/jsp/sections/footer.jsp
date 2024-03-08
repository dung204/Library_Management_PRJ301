<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<footer class="bg-dark text-white py-5">
    <div class="container">
      <div class="row">
        <div class="col-4">
          <components:MainLogoLight />
          <div class="row gx-5 mt-4">
            <div class="col-auto">
              <components:FacebookLogo className="fs-4" />
            </div>
            <div class="col-auto">
              <components:InstagramLogo className="fs-4" />
            </div>
            <div class="col-auto">
              <components:TwitterLogo className="fs-4" />
            </div>
            <div class="col-auto">
              <components:YoutubeLogo className="fs-4" />
            </div>
          </div>
          <p class="mt-4">
            © 2024 Books Maison. Đã đăng ký Bản quyền. Tất cả các quyền được bảo lưu.
          </p>
        </div>
        <div class="col-8">
          <div class="row align-items-center">
            <div class="col-4 ps-5 py-4">
              <h4>Đường dẫn</h4>
            </div>
            <div class="col-8 py-4">
              <h4>Liên hệ</h4>
            </div>
          </div>
          <div class="row">
            <div class="col-4 ps-5">
              <p><a href="/" class="text-white">Trang chủ</a></p>
              <p><a href="/" class="text-white">Sách</a></p>
              <p><a href="/" class="text-white">Tin tức</a></p>
              <p><a href="/" class="text-white">Việc làm</a></p>
            </div>
            <div class="col-8">
              <div class="row">
                <div class="col-1">
                  <components:HouseLogo />
                </div>
                <div class="col-11">Số 3, phố Phú Xá, phường Phú Thượng, quận Tây Hồ, Hà Nội</div>
              </div>
              <div class="row my-3">
                <div class="col-1">
                  <components:PhoneLogo />
                </div>
                <div class="col-11">
                  <a href="tel:+84906063598" class="text-white text-decoration-none">+84906063598</a>
                </div>
              </div>
              <div class="row my-3">
                <div class="col-1">
                  <components:MailLogo />
                </div>
                <div class="col-11">
                  <a href="mailto:dunghahe181529@fpt.edu.vn" class="text-white text-decoration-none">dunghahe181529@fpt.edu.vn</a>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <a href="" class="text-white">Gửi thông tin liên lạc</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>