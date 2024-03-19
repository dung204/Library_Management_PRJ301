<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<section class="about-us" id="about-us">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col">
          <h1 class="text-center fw-bolder">Về chúng tôi</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-4 mt-3">
          <hr class="border border-1 border-black">
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-6 mt-3">
          <p class="text-center">
            Xin chào, chúng tôi là Books Maison, ngôi nhà của những quyển sách. 
            Sứ mệnh của chúng tôi là cung cấp cho cộng đồng một không gian cởi mở 
            để khám phá tri thức và nuôi dưỡng niềm đam mê đọc sách.
          </p>
        </div>
      </div>
      <div class="row mt-5 pt-5">
        <div class="col-7">
          <div class="row">
            <div class="col-9">
              <p>
                Chúng tôi không ngừng cải thiện dịch vụ nhằm mang đến cho bạn đọc
                trải nghiệm đọc sách tốt nhất. Một số những điểm nổi bật của thư viện
                chúng tôi bao gồm:
              </p>
            </div>
          </div>
          <div class="row gx-5 mt-5">
            <div class="col">
              <div class="d-flex align-items-center">
                <components:PersonBadgeLogo className="fs-1" />
                <div class="border border-1 border-black ms-2" style="width: 10rem; height: 0"></div>
              </div>
              <div class="mt-2">
                <h4>Thẻ thành viên</h4>
              </div>
              <div class="mt-5">
                <p>
                  Bạn đọc có thể đăng ký thẻ thành viên để được hưởng những chính
                  sách ưu đãi có một không hai từ Books Maison.
                </p>
              </div>
            </div>
            <div class="col">
              <div class="d-flex align-items-center">
                <components:ArrowRepeatLogo className="fs-1" />
                <div class="border border-1 border-black ms-2" style="width: 10rem; height: 0"></div>
              </div>
              <div class="mt-2">
                <h4>Luôn cập nhật</h4>
              </div>
              <div class="mt-5">
                <p>
                  Chúng tôi luôn cố gắng nhập về những đầu sách mới nhất, 
                  bám sát với kiến thức, và tình hình thế giới hiện tại.
                </p>
              </div>
            </div>
          </div>
          <div class="row gx-5 mt-5">
            <div class="col">
              <div class="d-flex align-items-center">
                <components:PatchCheckLogo className="fs-1" />
                <div class="border border-1 border-black ms-2" style="width: 10rem; height: 0"></div>
              </div>
              <div class="mt-2">
                <h4>Uy tín</h4>
              </div>
              <div class="mt-5">
                <p>
                  Chúng tôi tự hào là một nhà phân phối tiên phong của những 
                  NXB uy tín trên thế giới nhằm mang đến cho bạn những đầu sách 
                  uy tín nhất.
                </p>
              </div>
            </div>
            <div class="col">
              <div class="d-flex align-items-center">
                <components:HeadsetLogo className="fs-1" />
                <div class="border border-1 border-black ms-2" style="width: 10rem; height: 0"></div>
              </div>
              <div class="mt-2">
                <h4>Chăm sóc khách hàng</h4>
              </div>
              <div class="mt-5">
                <p>
                  Đội ngũ chăm sóc khách hàng chuyên nghiệp, thân thiện, hoạt động 
                  24/7 sẽ giúp bạn giải đáp những thắc mắc trong quá trình sử dụng 
                  thư viện.
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-5 align-self-center">
          <div class="row justify-content-center">
            <div class="col-10">
              <div class="about-us-banner bg-dark rounded-4" style="height: 600px"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

<style>
  .about-us-banner {
    background-image: url("/images/library-banner-3.jpg");
    background-size: cover;
    background-position: center;
  }
</style>