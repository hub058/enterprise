<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/manage/system/pageBase.jsp" %>
<%@ page info="服务领域" %>

<form action="<%=path%>/manage/service" method="post">
    <div style="height:auto!important;height:550px;min-height:550px;">
        <h3 style="border-bottom: 1px solid #D7D7D7;color: #666666;font-size: 28px;padding-bottom: 20px;margin-bottom: 30px;">
            <%=getServletInfo()%>
            <a href="toAdd" class="btn btn-primary"
               style="padding: 2px 15px;float:right;">
                <i class="icon-plus "></i>添加服务
            </a>
        </h3>
        <div class="filter">
            <button method="deletes" class="btn btn-danger" style="padding:0px 5px;margin-top: -4px;"
                    onclick="return submitIDs(this,'确定删除选择的服务信息?');">
                <i class="icon-trash"></i>删除
            </button>
            <div style="float: right">

                <input type="text" value="${e.title}" class="input-medium search-query" name="title" placeholder="标题"/>
                <button method="selectList" class="btn btn-info" style="padding:0px 5px;margin-top: -4px;"
                        onclick="selectList(this)">
                    <i class="icon-search"></i>查询
                </button>
            </div>
        </div>
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <th width="50"><input type="checkbox" id="firstCheckbox"/></th>
                <th>服务标题</th>
                <th>状态</th>
                <th>排序</th>
                <th width="200">操作</th>
            </tr>
            <c:forEach var="item" items="${pager.list}">
                <tr>
                    <td><input type="checkbox" name="ids"
                               value="${item.id}"/></td>
                    <td>${item.title}</td>
                    <td>${item.status}</td>
                    <td>${item.orders}</td>
                    <td><a href="toEdit?id=${item.id}">编辑</a> | <a href="delete?id=${item.id}">删除</a></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="71" style="text-align: center;">
                    <%@ include file="/manage/system/page.jsp" %>
                </td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">
    $(function () {
        $("#firstCheckbox").on("click", function () {
            if ($(this).prop("checked")) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }
        });
    });
    function submitIDs(obj, tip) {
        if ($("input:checked").size() == 0) {
            alert("请先选择要操作的内容！");
            return false;
        }

        if (confirm(tip)) {
            //createMark();
            var _form = $("form");
            _form.attr("action", $(obj).attr("method"));
            _form.submit();
        }
        return false;
    }
    //查询
    function selectList(obj) {

        var _form = $("form");
        _form.attr("action", $(obj).attr("method"));
        _form.submit();
    }
</script>

<%@ include file="/manage/system/baseFoot.jsp" %>
