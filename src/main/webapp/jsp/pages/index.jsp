<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>
<%@taglib uri="/WEB-INF/tlds/layouts.tld" prefix="layouts" %>

<layouts:Default title="Trang chủ">
  <jsp:include page="/jsp/sections/header.jsp">
    <jsp:param name="title" value="Hãy cùng khám phá kho tàng tri thức nhân loại với hơn 362.832 đầu sách tại nơi đây" />
  </jsp:include>
  
  <jsp:include page="/jsp/sections/about-us-section.jsp" />
  <jsp:include page="/jsp/sections/categories-section.jsp" />
  <jsp:include page="/jsp/sections/featured-books-section.jsp" />
  <jsp:include page="/jsp/sections/events-section.jsp" />
  <jsp:include page="/jsp/sections/email-subscription-section.jsp" />

  <jsp:include page="/jsp/sections/footer.jsp" />
</layouts:Default>