<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>
<%@taglib uri="/WEB-INF/tlds/layouts.tld" prefix="layouts" %>

<layouts:Default title="Trang chủ">
  <jsp:include page="header.jsp" />
  
  <jsp:include page="about-us-section.jsp" />
  <jsp:include page="categories-section.jsp" />

  <jsp:include page="footer.jsp" />
</layouts:Default>