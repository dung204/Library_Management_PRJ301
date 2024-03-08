<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<section class="featured-books" id="featured-books">
  <div class="container-fluid">
    <div class="row">
      <div class="featured-books-p-custom col-6 bg-primary">
        <%-- TODO: books carousel here --%>
      </div>
      <div class="featured-books-p-custom col-6 bg-black text-white">
        <div class="row gy-4">
          
          <div class="col-12">
            <h1 class="fw-bolder">Sách nổi bật</h1>
            <div class="row">
              <div class="col-6 mt-4">
                <hr class="border border-1">
              </div>
            </div>
          </div>

          <div class="col-12">
            <p>Tiêu đề</p>
            <p class="fs-3 fw-lighter">Tên tiêu đề</p>
          </div>

          <div class="col-12">
            <p>Thể loại</p>
            <p class="fs-5">Tên thể loại</p>
          </div>

          <div class="col-6">
            <p>Tác giả</p>
            <div class="row align-items-center ps-3">
              <div class="col-auto bg-secondary p-4 rounded-2">
              </div>
              <div class="col-auto align-self-center">
                <div class="fs-5">Tên tác giả</div>
              </div>
            </div>
          </div>

          <div class="col-6">
            <p>Số trang</p>
            <p class="fs-5">100 trang</p>
          </div>

          <div class="col-12 mt-5">
            <p>Mô tả:</p>
            <div class="row">
              <div class="col-10">
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Dicta fugit distinctio vitae nisi voluptas accusamus quis ipsam
                consectetur tempora sapiente. Nam, unde debitis optio nemo veritatis
                expedita delectus eaque magnam eligendi eius, assumenda corrupti?
                Illum aperiam voluptas iusto minima facere a, recusandae reiciendis
                animi accusamus? Et veniam officiis, ratione magni natus aspernatur
                laborum repellendus ipsa ab odio consequatur fugiat at voluptas quia
                quis dolores suscipit autem rerum? Impedit tempora, atque optio est enim
                debitis cum unde inventore facere? Velit, quaerat fugiat, nemo natus libero
                quod voluptates distinctio, magni laboriosam sint vitae? Maxime, excepturi
                repellat repellendus saepe distinctio ducimus dolorem enim?
              </div>
            </div>
          </div>

          <div class="col-12 mt-5">
            <button class="btn btn-light fw-bold px-4">Xem chi tiết</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<style>
  .featured-books-p-custom {
    padding-block: 6rem;
  }
</style>