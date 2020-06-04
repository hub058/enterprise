<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/modern/common/common.jsp" %>
<body>
<%@include file="/modern/common/navigation.jsp" %>
<%@include file="/modern/common/indexSlide.jsp" %>

<main id="main">
    <%@include file="/modern/common/service-card.jsp" %>
    <!-- ======= Portfolio Section ======= -->
    <section class="portfolio">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <ul id="portfolio-flters">
                        <li data-filter="*" class="filter-active">全部产品</li>
                    </ul>
                </div>
            </div>

            <div class="row portfolio-container" data-aos="fade-up" data-aos-easing="ease-in-out"
                 data-aos-duration="500">

                <c:forEach var="item" items="${data}">
                    <div class="col-lg-4 col-md-6 filter-web">
                        <div class="portfolio-item">
                            <img src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${item.image}"
                                 class="img-fluid" alt="">
                            <div class="portfolio-info">
                                <h3>
                                    <a href="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${item.image}"
                                       data-gall="portfolioGallery" class="venobox"
                                       title="${item.title}">${item.title}</a></h3>
                                <a href="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${item.image}"
                                   data-gall="portfolioGallery" class="venobox" title="${item.title}"><i
                                        class="icofont-plus"></i></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>

        </div>
    </section><!-- End Portfolio Section -->

    <!-- ======= Why Us Section ======= -->
    <section class="why-us section-bg" data-aos="fade-up" date-aos-delay="200">
        <div class="container">

            <div class="row">
                <div class="col-lg-6 video-box">
                    <img src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${homeData.image}"
                         class="img-fluid" alt="">
                </div>

                <div class="col-lg-6 d-flex flex-column justify-content-center p-5">

                    <div class="icon-box">
                        <div class="icon"><i class="bx bx-fingerprint"></i></div>
                        <h4 class="title"><a href="">${homeData.title1}</a></h4>
                        <p class="description">${homeData.content1}</p>
                    </div>

                    <div class="icon-box">
                        <div class="icon"><i class="bx bx-gift"></i></div>
                        <h4 class="title"><a href="">${homeData.title2}</a></h4>
                        <p class="description">${homeData.content2}</p>
                    </div>

                </div>
            </div>

        </div>
    </section><!-- End Why Us Section -->

    <!-- ======= Features Section ======= -->
    <section class="features">
        <div class="container">

            <div class="section-title">
                <h2>${homeData.feature_title}</h2>
                <p>${homeData.feature_content}</p>
            </div>

            <c:forEach var="item" items="${homeFeatureData}" varStatus="xh">
                <c:if test="${xh.index % 2 eq 0}">
                    <div class="row" data-aos="fade-up">
                        <div class="col-md-5">
                            <img src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${item.image}"
                                 class="img-fluid" alt="">
                        </div>
                        <div class="col-md-7 pt-4">
                            <h3>${item.title}</h3>
                                ${item.content}
                        </div>
                    </div>
                </c:if>
                <c:if test="${xh.index % 2 eq 1}">
                    <div class="row" data-aos="fade-up">
                        <div class="col-md-5 order-1 order-md-2">
                            <img src="<%=SystemManage.getInstance().getSystemSetting().getImageRootPath()%>/${item.image}"
                                 class="img-fluid" alt="">
                        </div>
                        <div class="col-md-7 pt-5 order-2 order-md-1">
                            <h3>${item.title}</h3>
                                ${item.content}
                        </div>
                    </div>
                </c:if>
            </c:forEach>


        </div>
    </section><!-- End Features Section -->

</main><!-- End #main -->

<%@include file="/modern/common/foot.jsp" %>

