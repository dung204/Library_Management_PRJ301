<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8" %> 
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri="/WEB-INF/tlds/components.tld" prefix="components" %>
<%@taglib uri="/WEB-INF/tlds/layouts.tld" prefix="layouts" %>

<layouts:Default title="${requestScope.user.getFullName()}">
  <jsp:include page="/jsp/sections/header.jsp">
    <jsp:param name="title" value="Trang cá nhân" />
  </jsp:include>
  
  <jsp:include page="/jsp/sections/user-details-section.jsp" />
  
  <jsp:include page="/jsp/sections/footer.jsp" />
</layouts:Default>