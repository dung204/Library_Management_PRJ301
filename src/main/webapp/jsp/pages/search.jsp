<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>
<%@taglib uri="/WEB-INF/tlds/layouts.tld" prefix="layouts" %>

<layouts:Default title="Tìm kiếm">
  <jsp:include page="/jsp/sections/header.jsp">
    <jsp:param name="title" value="Tìm kiếm" />
  </jsp:include>
  
  <jsp:include page="/jsp/sections/search-section.jsp" />

  <jsp:include page="/jsp/sections/footer.jsp" />
</layouts:Default>