<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<section class="book-details bg-white py-5">
  <div class="container">
    <div class="row gx-5">
      <div class="col-4">
        <div class="row justify-content-center gy-3">
          <div class="col-12 bg-primary" style="height: 35rem"></div>
          <div class="col-12 text-center">Số lượng cuốn sách còn trống: <span class="fw-bold">10</span></div>
          <div class="col-4 text-center">
            <button class="btn btn-primary">Đặt mượn</button>
          </div>
          <div class="col-4 text-center">
            <button class="btn btn-danger">
              <components:HeartLogo />
              Yêu thích
            </button>
          </div>
        </div>
      </div>
      <div class="col-7">
        <div class="row gy-4">
          <div class="col-12">
            <h2 class="fw-bold">Tên sách</h2>
            <hr class="border border-1 border-secondary">
          </div>
          <div class="col-3">
            Số ISBN:
          </div>
          <div class="col-9">
            9781234567897
          </div>
          <div class="col-3">
            Tác giả:
          </div>
          <div class="col-9">
            <div class="row align-items-center">
              <div class="col-auto">
                <div class="rounded-pill bg-secondary" style="width: 2rem; height: 2rem"></div>
              </div>
              <div class="col-auto">
                <div class="fw-bold">Tên tác giả</div>
              </div>
            </div>
          </div>
          <div class="col-3">Thể loại:</div>
          <div class="col-9">
            <div class="row gy-3">
              <div class="col-auto">
                <div class="rounded-pill px-3 py-1 border border-2 border-black">
                  Âm nhạc và Mỹ thuật
                </div>
              </div>
              <div class="col-auto">
                <div class="rounded-pill px-3 py-1 border border-2 border-black">
                  Chính trị
                </div>
              </div>
              <div class="col-auto">
                <div class="rounded-pill px-3 py-1 border border-2 border-black">
                  Pháp luật
                </div>
              </div>
              <div class="col-auto">
                <div class="rounded-pill px-3 py-1 border border-2 border-black">
                  Công nghệ
                </div>
              </div>
            </div>
          </div>
          <div class="col-3">
            NXB:
          </div>
          <div class="col-9">Tên NXB</div>
          <div class="col-3">Năm phát hành:</div>
          <div class="col-9">2021</div>
          <div class="col-3">Mô tả:</div>
          <div class="col-9">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam quisquam eum mollitia doloribus iste in veniam aspernatur quae sed blanditiis dolores sit ratione, a nostrum ipsum rem neque? Sunt quo animi pariatur earum tenetur maiores voluptatum repellat impedit recusandae. Aspernatur, earum? Repellat qui atque obcaecati velit assumenda? Architecto neque nihil doloribus molestiae maiores laudantium officiis voluptate facere ipsam corrupti. Quam porro facere, quia eveniet numquam incidunt repellendus error quis qui iste aperiam vero harum quas laboriosam, amet id debitis similique necessitatibus corrupti nostrum sed enim! Aliquam nobis expedita illum minus ea impedit, praesentium eaque cumque optio laudantium a suscipit vitae.</div>
        </div>
      </div>
    </div>
    <div class="row mt-5 pt-5 gy-4 justify-content-center">
      <div class="col-12 fs-4">
        Một số cuốn sách khác của "Tên tác giả"
      </div>
      <div class="col-auto">
        <div class="bg-secondary" style="width: 9rem; height: 12rem"></div>
        <p class="fw-bold text-center mt-3">Tên sách 1</p>
      </div>
      <div class="col-auto">
        <div class="bg-secondary" style="width: 9rem; height: 12rem"></div>
        <p class="fw-bold text-center mt-3">Tên sách 2</p>
      </div>
      <div class="col-auto">
        <div class="bg-secondary" style="width: 9rem; height: 12rem"></div>
        <p class="fw-bold text-center mt-3">Tên sách 3</p>
      </div>
      <div class="col-auto">
        <div class="bg-secondary" style="width: 9rem; height: 12rem"></div>
        <p class="fw-bold text-center mt-3">Tên sách 4</p>
      </div>
      <div class="col-auto">
        <div class="bg-secondary" style="width: 9rem; height: 12rem"></div>
        <p class="fw-bold text-center mt-3">Tên sách 5</p>
      </div>
      <div class="col-auto">
        <div class="bg-secondary" style="width: 9rem; height: 12rem"></div>
        <p class="fw-bold text-center mt-3">Tên sách 6</p>
      </div>
      <div class="col-auto">
        <div class="bg-secondary" style="width: 9rem; height: 12rem"></div>
        <p class="fw-bold text-center mt-3">Tên sách 7</p>
      </div>
      <div class="col-auto">
        <div class="bg-secondary" style="width: 9rem; height: 12rem"></div>
        <p class="fw-bold text-center mt-3">Tên sách 8</p>
      </div>
      <div class="col-auto">
        <div class="bg-secondary" style="width: 9rem; height: 12rem"></div>
        <p class="fw-bold text-center mt-3">Tên sách 9</p>
      </div>
    </div>
  </div>
</section>