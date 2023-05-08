
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="pagination-wrap">
    <nav aria-label="Page navigation example" class="text-center" style="margin-left: 40%;">
        <ul class="pagination">
            <c:if test="${sessionScope.page.getCurrentPage()>1&&sessionScope.page.getCurrentPage()<sessionScope.page.getTotalPage()}">
                <li class="page-item"><a class="page-link" href="PostList?cp=1">First</a></li>
                <li class="page-item"><a  class="page-link" href="PostList?cp=${sessionScope.page.getCurrentPage()-1}">${sessionScope.page.getCurrentPage()-1}</a></li>
                <li class="page-item active"><a class="page-link" href="PostList?cp=${sessionScope.page.getCurrentPage()}">${sessionScope.page.getCurrentPage()}</a></li>
                <li class="page-item"><a  class="page-link" href="PostList?cp=${sessionScope.page.getCurrentPage()+1}">${sessionScope.page.getCurrentPage()+1}</a></li>
                <li class="page-item"><a class="page-link" href="PostList?cp=${sessionScope.page.getTotalPage()}">Last</a></li>
            </c:if>
            <c:if test="${sessionScope.page.getCurrentPage()==1}">
                <li class="page-item active"><a class="page-link" href="PostList?cp=${sessionScope.page.getCurrentPage()}">${sessionScope.page.getCurrentPage()}</a></li>
                <li class="page-item"><a  class="page-link" href="PostList?cp=${sessionScope.page.getCurrentPage()+1}">${sessionScope.page.getCurrentPage()+1}</a></li>
                <li class="page-item"><a class="page-link" href="PostList?cp=${sessionScope.page.getTotalPage()}">Last</a></li>
            </c:if>
            <c:if test="${sessionScope.page.getCurrentPage()==sessionScope.page.getTotalPage()}">
                <li class="page-item"><a class="page-link" href="PostList?cp=1">First</a></li>
                <li class="page-item"><a  class="page-link" href="PostList?cp=${sessionScope.page.getCurrentPage()-1}">${sessionScope.page.getCurrentPage()-1}</a></li>
                <li class="page-item active"><a class="page-link" href="PostList?cp=${sessionScope.page.getCurrentPage()}">${sessionScope.page.getCurrentPage()}</a></li>
            </c:if>
        </ul>
    </nav>
</div>
