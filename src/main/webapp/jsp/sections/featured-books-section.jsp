<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<section class="featured-books" id="featured-books">
  <div class="container-fluid">
    <div class="row">
      <div class="featured-books-p-custom featured-books-image col-6 bg-secondary">
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
            <p class="featured-book-title fs-3 fw-lighter">Tên tiêu đề</p>
          </div>

          <div class="col-12">
            <p>Thể loại</p>
            <p class="fs-5 feature-book-categories">Tên thể loại</p>
          </div>

          <div class="col-6">
            <p>Tác giả</p>
            <div class="row align-items-center ps-3">
              <div class="col-auto bg-secondary p-4 rounded-2 featured-book-first-author-image-url">
              </div>
              <div class="col-auto align-self-center">
                <div class="featured-book-first-author-name fs-5">Tên tác giả</div>
              </div>
            </div>
          </div>

          <div class="col-6">
            <p>Số trang</p>
            <p class="featured-books-number-of-pages fs-5">100 trang</p>
          </div>

          <div class="col-12 mt-5">
            <p>Mô tả:</p>
            <div class="row">
              <div class="featured-books-description col-10">
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
            <a href="" class="featured-books-url"><button class="btn btn-light fw-bold px-4">Xem chi tiết</button></a>
          </div>
          <div class="prev-book-btn col-auto align-self-center mt-5">
            <div class="row align-items-center">
              <div class="col-auto">
                <components:ArrowLeftLogo className="fs-4" />
              </div>
              <div class="col-auto ps-0">Trước</div>
            </div>
          </div>
          <div class="next-book-btn col-auto align-self-center ms-5 mt-5">
            <div class="row align-items-center">
              <div class="col-auto pe-0">Sau</div>
              <div class="col-auto">
                <components:ArrowRightLogo className="fs-4" />
              </div>
            </div>
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

  .featured-books-image {
    background-size: cover;
    background-position: center;
  }

  .featured-book-first-author-image-url {
    background-size: cover;
    background-position: center;
  }

  .prev-book-btn,
  .next-book-btn {
    opacity: 1;
    cursor: pointer;
    transition: all 0.3s;
  }

  .prev-book-btn:hover,
  .next-book-btn:hover {
    opacity: 0.7;
  }
</style>

<script>
  const featuredBooksTitle = document.querySelector('.featured-book-title');
  const featuredBooksCategories = document.querySelector('.feature-book-categories');
  const featuredBooksFirstAuthorName = document.querySelector('.featured-book-first-author-name');
  const featuredBooksFirstAuthorImageUrl = document.querySelector('.featured-book-first-author-image-url');
  const featuredBooksNumberOfPages = document.querySelector('.featured-books-number-of-pages');
  const featuredBooksDescription = document.querySelector('.featured-books-description');
  const featuredBooksUrl = document.querySelector('.featured-books-url');
  const featuredBooksImage = document.querySelector('.featured-books-image');
  const featuredBooksData = [
    <c:forEach items="${requestScope.featuredBooks}" var="book">
      {
        id: "${book.id}",
        title: "${book.title}",
        firstAuthorName: "${book.authors[0].name}",
        firstAuthorImageUrl: "${book.authors[0].imageUrl == null ? 'https://via.placeholder.com/300x400' : book.authors[0].imageUrl}",
        numberOfPages: "${book.numberOfPages}",
        description: "${book.description}",
        categories: [
          <c:forEach items="${book.categories}" var="category">
            "${category.name}",
          </c:forEach>
        ],
        imageUrl: "${book.imageUrl == null ? 'https://via.placeholder.com/300x400' : book.imageUrl}",
      },
    </c:forEach>
  ];

  const prevBookBtn = document.querySelector('.prev-book-btn');
  const nextBookBtn = document.querySelector('.next-book-btn');

  let currentBookIndex = 0;
  const updateFeaturedBook = () => {
    const currentBook = featuredBooksData[currentBookIndex];
    featuredBooksTitle.textContent = currentBook.title;
    featuredBooksCategories.textContent = currentBook.categories.join(', ');
    featuredBooksFirstAuthorName.textContent = currentBook.firstAuthorName;
    featuredBooksFirstAuthorImageUrl.style.backgroundImage = "url(" + currentBook.firstAuthorImageUrl + ")";
    featuredBooksNumberOfPages.textContent = currentBook.numberOfPages === '' ? "Đang cập nhật" : currentBook.numberOfPages + " trang";
    featuredBooksDescription.innerHTML = currentBook.description;
    featuredBooksUrl.href = "/book/" + currentBook.id;
    featuredBooksImage.style.backgroundImage = "url(" + currentBook.imageUrl + ")";
  }

  updateFeaturedBook();

  prevBookBtn.addEventListener('click', () => {
    currentBookIndex = (currentBookIndex - 1 + featuredBooksData.length) % featuredBooksData.length;
    updateFeaturedBook();
    console.log(currentBookIndex);
  });

  nextBookBtn.addEventListener('click', () => {
    currentBookIndex = (currentBookIndex + 1) % featuredBooksData.length;
    updateFeaturedBook();
    console.log(currentBookIndex);
  });
</script>