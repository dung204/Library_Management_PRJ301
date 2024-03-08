<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<section class="categories">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col">
        <h1 class="text-center fw-bolder">Thể loại sách</h1>
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
          Books Maison cung cấp cho bạn đọc đa dạng các đầu sách từ mọi thể loại, 
          đáp ứng nhu cầu đọc sách của tất cả mọi người
        </p>
      </div>
    </div>
    <div class="row gy-5 gx-5 mt-5">
      <div class="col-6">
        <div class="category-item border border-2 border-black rounded-3 p-3">
          <components:MusicNoteLogo />
          Âm nhạc và Mỹ thuật
        </div>
      </div>
      <div class="col-6">
        <div class="category-item border border-2 border-black rounded-3 p-3">
          <components:GlobeLogo />
          Công nghệ
        </div>
      </div>
      <div class="col-6">
        <div class="category-item border border-2 border-black rounded-3 p-3">
          <components:CurrencyLogo />
          Kinh tế
        </div>
      </div>
      <div class="col-6">
        <div class="category-item border border-2 border-black rounded-3 p-3">
          <components:BankLogo />
          Chính trị
        </div>
      </div>
      <div class="col-12 text-center pt-3">
        <button class="btn btn-primary">Xem thêm</button>
      </div>
    </div>
  </div>
</section>

<script>
  const shadowClass = 'shadow-lg';
  const categoryItems = document.querySelectorAll('.category-item');
  categoryItems.forEach(item => {
    item.addEventListener('mouseover', (e) => {
      item.classList.add(shadowClass);
    });
    item.addEventListener('mouseout', (e) => {
      item.classList.remove(shadowClass);
    });
  });
</script>