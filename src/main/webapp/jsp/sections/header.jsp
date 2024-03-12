<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>

<jsp:include page="navbar.jsp" />

<header class="py-5">
  <section class="container">
    <div class="row justify-content-center mt-5 pt-5">
      <div class="col-8">
        <h1 class="text-center text-white fw-bolder">${param.title}</h1>
        <div class="row justify-content-center mt-4">
          <div class="col-6">
            <hr class="border border-1" />
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="container my-5">
    <c:if test="${requestScope['jakarta.servlet.forward.request_uri'] == '/'}">
      <div class="row justify-content-center">
        <div class="col-5">
          <components:SearchInput />
        </div>
      </div>
    </c:if>
  </section>
</header>


<script>
  document.querySelector('header').style.marginTop = document.querySelector('.nav-container').offsetHeight + 'px'

  document.body.onscroll = () => {
    document.querySelector('.nav-container').style.backgroundColor = 
      window.scrollY > 0 
      ? 'rgba(0, 0, 0, 0.9)' 
      : 'rgba(0, 0, 0, 0.6)'
  }
</script>

<style>
  svg {
    width: 70%;
  }

  .nav-container {
    background-color: rgba(0, 0, 0, 0.6);
    transition: background-color 0.3s;
  }
</style>