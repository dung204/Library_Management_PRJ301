<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>
<%@taglib uri="/WEB-INF/tlds/layouts.tld" prefix="layouts" %>

<layouts:Default title="Chi tiết cuốn sách">
  <jsp:include page="/jsp/sections/header.jsp">
    <jsp:param name="title" value="Chi tiết cuốn sách" />
  </jsp:include>
  
  <jsp:include page="/jsp/sections/book-details-section.jsp" />

  <jsp:include page="/jsp/sections/footer.jsp" />
</layouts:Default>