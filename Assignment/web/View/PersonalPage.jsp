<%-- 
    Document   : PersonalPage
    Created on : Jul 5, 2023, 8:36:17 PM
    Author     : VHC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/assets/CSS/PersonalPageStyle.css?version=1"/>
    </head>
    <body>
        <c:set var="u" value="${requestScope.User}"></c:set>
        <c:set var="rate" value="${requestScope.Rating}"></c:set>
        <c:set var="numRate" value="${requestScope.NumRate}"></c:set>
        <c:set var="Follower" value="${requestScope.Follower}"></c:set>
        <c:set var="Following" value="${requestScope.Following}"></c:set>
        <c:set var="dateDiff" value="${requestScope.JoinDateDiff}"></c:set>
        <c:set var="Products" value="${requestScope.Products}"></c:set>
        <c:set var="SoldOut" value="${requestScope.SoldOut}"></c:set>
            <div class="px-4 mt-4">
                <!-- Account page navigation-->
                <div class="row">
                    <div class="col-xl-4">
                        <!-- Profile picture card-->
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">User Profile</div>
                            <div class="card-body">
                                <!-- Profile picture image-->
                                <img style="width: 100px; height: 100px" class="img-account-profile rounded-circle mb-2" src="${pageContext.request.contextPath}/${u.getAvatar()!=null?u.getAvatar():'http://bootdey.com/img/Content/avatar/avatar1.png'}" alt="">
                            <div>
                                <div class="font-weight-bold" style="font-size: 18px;">${u.getDisplayName()}</div>
                            </div>
                            <!--rating field-->
                            <div class="rating">
                                <b class="font-weight-normal" style="font-size: ">${rate}</b>
                                <span class="rate_stars">
                                    <c:forEach begin="1" end="${rate}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="orange" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                    </c:forEach>
                                    <c:if test="${rate%1!=0}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="orange" class="bi bi-star-half" viewBox="0 0 16 16">
                                        <path d="M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z"/>
                                        </svg>
                                    </c:if>
                                    <c:forEach begin="1" end="${5-rate}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="orange" class="bi bi-star" viewBox="0 0 16 16">
                                        <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                        </svg>
                                    </c:forEach>
                                </span>
                                <a style="text-decoration: none" href="#">( ${numRate} rate total )</a>
                            </div>
                            <!--Follow field-->
                            <div class="follow text-black">
                                <a style="text-decoration: none; color: black;" href="#" class="follower">Followers: ${Follower}</a>
                                |
                                <a style="text-decoration: none; color: black;" href="#" class="follower">Following: ${Following}</a>
                            </div>
                            <div>
                                <div>
                                    <i class="fa fa-calendar"></i>
                                    Đã tham gia:
                                    <span>${dateDiff}</span>
                                </div>
                                <div>
                                    <i class="fa fa-envelope"></i>
                                    Email:
                                    <span>${u.getEmail()}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4 group-tabs p-0">
                        <div class="card-header p-0">
                            <!-- Tabs navs -->
                            <ul class="nav nav-pills nav-fill nav-tabs" role="tablist">
                                <li role="presentation" class="nav-item"><a class="nav-link active" href="#home" aria-controls="home" aria-selected="true" role="tab" data-toggle="tab">Products</a></li>
                                <li role="presentation" class="nav-item"><a class="nav-link" href="#profile" aria-controls="profile" aria-selected="true" role="tab" data-toggle="tab">Sold Out</a></li>
                            </ul>
                            <!-- Tabs navs -->
                        </div>
                        <div class="card-body text-center tab-content p-0" style="min-height: 344px; min-height: 70vh;">

                            <!-- User's Selling Products -->
                            <div role="tabpanel" class="p-0 tab-pane active card-body_content" id="home">
                                <c:if test="${Products.isEmpty()}">
                                    <div class="p-t-50 p-b-50">
                                        <svg width="320" height="120" viewBox="0 0 320 120" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0_4662_5060)"><g opacity="0.4"><path d="M78.3819 66.6753H54.6267C53.2371 66.6753 51.9673 66.1714 50.9839 65.3387C49.7696 64.3096 49 62.7723 49 61.0557C49 59.5056 49.6285 58.1008 50.6461 57.0845C51.6637 56.0681 53.0704 55.4404 54.6224 55.4404H78.3776C79.9296 55.4404 81.3363 56.0681 82.3539 57.0845C83.3715 58.1008 84 59.5056 84 61.0557C84 62.6058 83.3715 64.0107 82.3539 65.027C81.3363 66.0433 79.9296 66.671 78.3776 66.671L78.3819 66.6753Z" fill="#E2EDF7"></path><path d="M72.756 59.2295C73.8472 54.655 71.0187 50.0631 66.4383 48.9733C61.858 47.8835 57.2603 50.7085 56.1691 55.283C55.0779 59.8575 57.9065 64.4494 62.4868 65.5392C67.0671 66.629 71.6648 63.8041 72.756 59.2295Z" fill="#E2EDF7"></path></g><path d="M144.033 0.848633H177.998C182.722 0.848633 186.558 4.45219 186.558 8.89083V79.9996H135.473V8.89083C135.473 4.45219 139.308 0.848633 144.033 0.848633Z" fill="#FCFDFF"></path><path d="M186.111 80C185.62 80 185.223 79.6126 185.223 79.1326V9.08165C185.223 5.0309 181.846 1.73479 177.695 1.73479H144.305C140.154 1.73479 136.777 5.0309 136.777 9.08165V76.0736C136.777 76.5536 136.38 76.941 135.889 76.941C135.397 76.941 135 76.5536 135 76.0736V9.08165C135 4.07387 139.174 0 144.305 0H177.695C182.826 0 187 4.07387 187 9.08165V79.1326C187 79.6126 186.603 80 186.111 80Z" fill="#E0E9F3"></path><path d="M144.343 7.39627C144.343 8.26531 143.592 8.96734 142.67 8.96734C141.748 8.96734 140.998 8.26248 140.998 7.39627C140.998 6.53006 141.748 5.8252 142.67 5.8252C143.592 5.8252 144.343 6.53006 144.343 7.39627Z" fill="#04b0ec"></path><rect x="150.15" y="24.15" width="64.7" height="13.7" rx="0.85" fill="white"></rect><path d="M204.783 35.0091H212.003C212.168 35.0091 212.316 34.9427 212.424 34.8341C212.533 34.7255 212.599 34.5778 212.599 34.4119V27.1855C212.599 27.0648 212.563 26.9532 212.503 26.8627C212.397 26.6999 212.214 26.5913 212.003 26.5913H204.783C204.638 26.5913 204.503 26.6426 204.4 26.73C204.271 26.8386 204.189 27.0015 204.189 27.1855V34.4119C204.189 34.5778 204.256 34.7255 204.364 34.8341C204.473 34.9427 204.62 35.0091 204.786 35.0091H204.783Z" fill="#04b0ec"></path><path d="M158.383 28.4943H198.832C199.094 28.4943 199.332 28.3888 199.503 28.2169C199.675 28.0449 199.781 27.8067 199.781 27.5443C199.781 27.2909 199.681 27.0587 199.519 26.8898C199.344 26.7058 199.1 26.5942 198.829 26.5942H158.383C158.121 26.5942 157.883 26.6998 157.711 26.8717C157.539 27.0436 157.434 27.2819 157.434 27.5443C157.434 27.7313 157.488 27.9062 157.581 28.054C157.75 28.3194 158.048 28.4974 158.386 28.4974L158.383 28.4943Z" fill="#D0DAED"></path><path d="M158.383 32.0442H198.832C199.139 32.0442 199.413 31.8995 199.588 31.6702C199.711 31.5104 199.784 31.3083 199.784 31.0912C199.784 30.9042 199.729 30.7292 199.636 30.5815C199.467 30.316 199.172 30.1411 198.832 30.1411H158.383C158.124 30.1411 157.889 30.2437 157.72 30.4126C157.542 30.5845 157.434 30.8258 157.434 31.0942C157.434 31.3566 157.539 31.5948 157.711 31.7668C157.883 31.9387 158.121 32.0442 158.383 32.0442Z" fill="#D0DAED"></path><rect x="150.15" y="24.15" width="64.7" height="13.7" rx="0.85" stroke="#F2F6FC" stroke-width="0.3"></rect><rect x="109.15" y="40.15" width="64.7" height="17.7" rx="0.85" fill="white"></rect><path d="M119.679 50.6677H112.46C112.294 50.6677 112.147 50.6014 112.038 50.4928C111.93 50.3842 111.863 50.2365 111.863 50.0706V42.8442C111.863 42.7235 111.899 42.6119 111.96 42.5214C112.065 42.3586 112.249 42.25 112.46 42.25H119.679C119.824 42.25 119.96 42.3013 120.062 42.3887C120.192 42.4973 120.273 42.6602 120.273 42.8442V50.0706C120.273 50.2365 120.207 50.3842 120.098 50.4928C119.99 50.6014 119.842 50.6677 119.676 50.6677H119.679Z" fill="#04b0ec"></path><path d="M166.078 44.153H125.629C125.367 44.153 125.129 44.0475 124.957 43.8756C124.785 43.7036 124.68 43.4654 124.68 43.203C124.68 42.9496 124.779 42.7174 124.942 42.5485C125.117 42.3645 125.361 42.2529 125.632 42.2529H166.081C166.343 42.2529 166.581 42.3585 166.753 42.5304C166.924 42.7023 167.03 42.9406 167.03 43.203C167.03 43.39 166.976 43.5649 166.882 43.7127C166.713 43.9781 166.415 44.156 166.078 44.156V44.153Z" fill="#D0DAED"></path><path d="M153.151 47.7024H125.626C125.319 47.7024 125.044 47.5577 124.87 47.3284C124.746 47.1686 124.674 46.9665 124.674 46.7494C124.674 46.5624 124.728 46.3874 124.821 46.2397C124.99 45.9743 125.286 45.7993 125.626 45.7993H153.151C153.41 45.7993 153.645 45.9019 153.814 46.0708C153.992 46.2427 154.1 46.484 154.1 46.7524C154.1 47.0148 153.995 47.253 153.823 47.425C153.651 47.5969 153.413 47.7024 153.151 47.7024Z" fill="#D0DAED"></path><circle cx="126" cy="54" r="1" fill="#D0DAED"></circle><path d="M130.765 52.3971V52.7297H130.032V55.1886H129.733V52.7297H129V52.3971H130.765Z" fill="#D0DAED"></path><path d="M131.669 54.9587C131.793 54.9587 131.897 54.8922 131.978 54.7591C132.061 54.6249 132.103 54.4247 132.103 54.1587C132.103 53.9965 132.085 53.8572 132.048 53.7406C131.979 53.5164 131.853 53.4043 131.669 53.4043C131.484 53.4043 131.358 53.5227 131.29 53.7596C131.254 53.8863 131.235 54.0472 131.235 54.2423C131.235 54.3994 131.254 54.533 131.29 54.6432C131.359 54.8535 131.485 54.9587 131.669 54.9587ZM130.979 53.1629H131.238V53.4328C131.292 53.3403 131.35 53.2687 131.413 53.2181C131.503 53.142 131.608 53.104 131.73 53.104C131.909 53.104 132.062 53.1927 132.187 53.3701C132.312 53.5462 132.375 53.7983 132.375 54.1264C132.375 54.5698 132.285 54.8865 132.104 55.0765C131.99 55.1968 131.857 55.257 131.705 55.257C131.585 55.257 131.485 55.2234 131.404 55.1563C131.357 55.1183 131.304 55.053 131.246 54.9606V56H130.979V53.1629Z" fill="#D0DAED"></path><path d="M132.751 54.7743H133.061V55.1886H132.751V54.7743Z" fill="#D0DAED"></path><path d="M133.574 52.3971H133.872V53.5506H135.003V52.3971H135.3V55.1886H135.003V53.8831H133.872V55.1886H133.574V52.3971Z" fill="#D0DAED"></path><path d="M136.351 54.9682C136.528 54.9682 136.649 54.8827 136.714 54.7116C136.78 54.5394 136.813 54.3481 136.813 54.1378C136.813 53.9477 136.79 53.7932 136.742 53.6741C136.667 53.4866 136.538 53.3929 136.354 53.3929C136.191 53.3929 136.073 53.4727 135.999 53.6323C135.925 53.7919 135.888 53.9845 135.888 54.21C135.888 54.4266 135.925 54.6071 135.999 54.7515C136.073 54.896 136.19 54.9682 136.351 54.9682ZM136.362 53.0945C136.566 53.0945 136.739 53.1819 136.88 53.3568C137.021 53.5316 137.091 53.7888 137.091 54.1283C137.091 54.4564 137.029 54.7275 136.905 54.9416C136.781 55.1557 136.588 55.2627 136.326 55.2627C136.108 55.2627 135.935 55.1683 135.807 54.9796C135.678 54.7895 135.614 54.5349 135.614 54.2157C135.614 53.8736 135.682 53.6013 135.817 53.3986C135.952 53.1959 136.134 53.0945 136.362 53.0945ZM136.496 52.3667L136.798 52.9159H136.556L136.356 52.5511L136.156 52.9159H135.915L136.215 52.3667H136.496ZM136.067 52.5492H135.864L135.468 52H135.798L136.067 52.5492Z" fill="#D0DAED"></path><path d="M139.205 52.3211C139.481 52.3211 139.694 52.4143 139.846 52.6005C139.998 52.7867 140.083 52.9983 140.1 53.2352H139.812C139.78 53.0553 139.715 52.9127 139.617 52.8076C139.52 52.7025 139.384 52.6499 139.208 52.6499C138.994 52.6499 138.821 52.7468 138.689 52.9406C138.558 53.1332 138.492 53.429 138.492 53.828C138.492 54.1549 138.551 54.4203 138.67 54.6242C138.789 54.8269 138.967 54.9283 139.202 54.9283C139.42 54.9283 139.585 54.8212 139.698 54.6071C139.759 54.4944 139.803 54.3462 139.833 54.1625H140.12C140.095 54.4564 140.01 54.7028 139.866 54.9017C139.693 55.1411 139.46 55.2608 139.167 55.2608C138.914 55.2608 138.702 55.1626 138.53 54.9663C138.304 54.7066 138.191 54.3056 138.191 53.7634C138.191 53.3517 138.276 53.0141 138.446 52.7506C138.63 52.4643 138.883 52.3211 139.205 52.3211Z" fill="#D0DAED"></path><path d="M140.444 52.3876H140.711V53.429C140.774 53.3264 140.831 53.2542 140.881 53.2124C140.967 53.1401 141.074 53.104 141.202 53.104C141.432 53.104 141.588 53.2073 141.67 53.4138C141.715 53.5265 141.737 53.683 141.737 53.8831V55.1886H141.463V53.9059C141.463 53.7565 141.448 53.6469 141.419 53.5772C141.37 53.4657 141.279 53.41 141.146 53.41C141.036 53.41 140.935 53.4587 140.846 53.5563C140.756 53.6538 140.711 53.8382 140.711 54.1093V55.1886H140.444V52.3876Z" fill="#D0DAED"></path><path d="M142.216 53.1629H142.487V55.1886H142.216V53.1629ZM142.689 52.3344L142.293 52.8836H142.089L142.36 52.3344H142.689Z" fill="#D0DAED"></path><path d="M143.848 52.3971H144.27L144.894 54.7572L145.515 52.3971H145.932V55.1886H145.652V53.5411C145.652 53.4841 145.653 53.3897 145.655 53.258C145.657 53.1262 145.658 52.985 145.658 52.8342L145.038 55.1886H144.746L144.122 52.8342V52.9197C144.122 52.9881 144.123 53.0926 144.125 53.2333C144.128 53.3726 144.129 53.4752 144.129 53.5411V55.1886H143.848V52.3971Z" fill="#D0DAED"></path><path d="M146.345 53.1629H146.616V55.1886H146.345V53.1629ZM146.345 52.3971H146.616V52.7848H146.345V52.3971Z" fill="#D0DAED"></path><path d="M147.02 53.1534H147.273V53.4423C147.348 53.3232 147.428 53.2377 147.512 53.1857C147.595 53.1338 147.689 53.1078 147.791 53.1078C148.016 53.1078 148.168 53.2086 148.247 53.41C148.291 53.5202 148.312 53.6779 148.312 53.8831V55.1886H148.042V53.9059C148.042 53.7818 148.027 53.6817 147.999 53.6057C147.951 53.479 147.865 53.4157 147.741 53.4157C147.678 53.4157 147.626 53.4239 147.586 53.4404C147.513 53.4683 147.448 53.524 147.393 53.6076C147.349 53.6747 147.32 53.7444 147.306 53.8166C147.293 53.8876 147.287 53.9895 147.287 54.1226V55.1886H147.02V53.1534Z" fill="#D0DAED"></path><path d="M148.708 52.3876H148.974V53.429C149.037 53.3264 149.094 53.2542 149.144 53.2124C149.23 53.1401 149.337 53.104 149.466 53.104C149.696 53.104 149.851 53.2073 149.933 53.4138C149.978 53.5265 150 53.683 150 53.8831V55.1886H149.726V53.9059C149.726 53.7565 149.711 53.6469 149.682 53.5772C149.633 53.4657 149.543 53.41 149.409 53.41C149.299 53.41 149.199 53.4587 149.109 53.5563C149.019 53.6538 148.974 53.8382 148.974 54.1093V55.1886H148.708V52.3876Z" fill="#D0DAED"></path><rect x="109.15" y="40.15" width="64.7" height="17.7" rx="0.85" stroke="#F2F6FC" stroke-width="0.3"></rect><path d="M269.161 33.7162H231.839C229.4 33.7162 227.187 32.7263 225.589 31.1302C223.991 29.5341 223 27.3242 223 24.8879C223 23.1498 223.503 21.5269 224.371 20.161C225.939 17.694 228.697 16.0596 231.839 16.0596H269.161C271.6 16.0596 273.813 17.0494 275.411 18.6455C277.009 20.2416 278 22.4516 278 24.8879C278 27.163 277.139 29.2349 275.726 30.8003C274.108 32.592 271.765 33.7162 269.161 33.7162Z" fill="#F7F8FC"></path><path d="M256.756 28.3725C261.986 23.1493 261.986 14.6808 256.756 9.45762C251.526 4.23443 243.047 4.23443 237.817 9.45762C232.587 14.6808 232.587 23.1493 237.817 28.3725C243.047 33.5957 251.526 33.5957 256.756 28.3725Z" fill="#F7F8FC"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M120.364 9.40486C120.552 9.35878 120.741 9.4736 120.787 9.66133C120.989 10.4841 121.085 11.7268 120.823 13.0517C120.457 14.8958 119.391 16.9144 116.943 18.1576C116.771 18.2451 116.56 18.1764 116.473 18.004C116.385 17.8317 116.454 17.621 116.626 17.5335C118.657 16.5021 119.631 14.8965 120.037 13.3463C118.947 13.4321 117.08 13.932 115.883 15.4684C115.124 16.4425 114.07 16.9002 113.062 17.0777C112.316 17.2092 111.582 17.1898 110.98 17.1074C111.363 17.6575 111.892 18.2606 112.516 18.7764C113.328 19.4483 114.27 19.9472 115.236 20.0223C116.472 20.1182 117.851 19.8409 118.961 18.9859C120.061 18.1375 120.937 16.6886 121.118 14.3571C121.133 14.1644 121.301 14.0203 121.494 14.0353C121.686 14.0502 121.83 14.2186 121.815 14.4113C121.622 16.9053 120.671 18.5511 119.388 19.5403C118.113 20.523 116.551 20.8264 115.182 20.7202C114.019 20.6298 112.943 20.0385 112.069 19.3157C111.193 18.591 110.49 17.7089 110.07 16.9823C109.855 16.6092 110.218 16.2401 110.566 16.3211C111.161 16.4597 112.047 16.5458 112.941 16.3884C113.832 16.2314 114.707 15.8378 115.331 15.0381C116.762 13.2017 118.994 12.6867 120.186 12.6364C120.363 11.5239 120.273 10.5011 120.108 9.82821C120.062 9.64048 120.176 9.45094 120.364 9.40486Z" fill="#E0E9F3"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M193.813 65.8604C193.686 65.8056 193.539 65.8639 193.484 65.9906C193.24 66.5555 193.021 67.4344 193.049 68.4157C193.087 69.7813 193.606 71.3566 195.21 72.5438C195.321 72.626 195.477 72.6026 195.56 72.4917C195.642 72.3807 195.618 72.2241 195.507 72.142C194.172 71.1535 193.669 69.8799 193.567 68.7163C194.338 68.9086 195.622 69.4937 196.298 70.7454C196.714 71.5173 197.391 71.9698 198.076 72.2224C198.614 72.4208 199.165 72.4995 199.621 72.5129C199.27 72.8718 198.801 73.2527 198.273 73.5524C197.618 73.9243 196.895 74.1583 196.205 74.096C195.306 74.0149 194.349 73.6485 193.657 72.9C192.969 72.1571 192.517 71.0106 192.67 69.3158C192.682 69.1782 192.581 69.0567 192.443 69.0443C192.306 69.0319 192.184 69.1333 192.172 69.2708C192.008 71.0817 192.49 72.3758 193.29 73.2396C194.084 74.0978 195.166 74.5043 196.16 74.594C196.988 74.6687 197.815 74.3873 198.52 73.9872C199.227 73.586 199.834 73.0525 200.231 72.5866C200.448 72.3319 200.222 71.9986 199.944 72.0111C199.492 72.0314 198.857 71.9773 198.249 71.7533C197.644 71.5301 197.081 71.1441 196.738 70.5081C195.933 69.0171 194.393 68.3781 193.546 68.1988C193.554 67.3774 193.743 66.6528 193.943 66.1891C193.998 66.0623 193.94 65.9152 193.813 65.8604Z" fill="#E0E9F3"></path><path opacity="0.8" d="M251.408 59.8002C241 64 221.452 71.2928 215 59C211.678 52.6711 216.998 49.1729 220.288 50.3804C223.579 51.588 227.195 55.2738 226.745 57.2328C224.5 67 206 57.2328 200.5 61.5" stroke="#D0DAED" stroke-width="0.6" stroke-linecap="round" stroke-dasharray="2 2"></path><ellipse cx="159" cy="141.5" rx="152" ry="64.5" fill="url(#paint0_linear_4662_5060)" fill-opacity="0.6"></ellipse></g><defs><linearGradient id="paint0_linear_4662_5060" x1="147" y1="71.5" x2="149.494" y2="124.547" gradientUnits="userSpaceOnUse"><stop offset="0.00335686" stop-color="#DDE1F0"></stop><stop offset="1" stop-color="white" stop-opacity="0"></stop></linearGradient><clipPath id="clip0_4662_5060"><rect width="320" height="120" fill="white"></rect></clipPath></defs></svg>
                                        <h5>Chưa đăng bán gì</h5>
                                        <a href="${pageContext.request.contextPath}/View/Home.jsp?Content=AddProduct.jsp" class="AddButt font-weight-bold text-uppercase">đăng bán ngay</a>
                                    </div>
                                </c:if>
                                <c:if test="${!Products.isEmpty()}">
                                    <div class="row m-r-0 m-l-0">
                                        <c:forEach var="p" items="${Products}">
                                            <div class="col-md-3 item" onclick="window.location.href = '${pageContext.request.contextPath}/pdetail?PID=${p.getProId()}';">
                                                <div class="item_img">
                                                    <img src="${pageContext.request.contextPath}/${p.getPro_img()}" alt="alt"/>
                                                </div>
                                                <div class="item_detail text-left m-l-15">
                                                    <div class="item_detail-name">${p.getPro_Name()}</div>
                                                    <div class="item_detail-price text-danger">${p.getPro_Price()}</div>
                                                    <div class="" style="font-size: 12px">
                                                        <i class="fa fa-user-circle"></i>
                                                        ${p.getDateDiff()}
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>

                            <!-- User's Sold Products -->
                            <div role="tabpanel" class="p-0 tab-pane card-body_content" id="profile">
                                <c:if test="${SoldOut.isEmpty()}">
                                    <div class="p-t-50 p-b-50">
                                        <svg width="320" height="120" viewBox="0 0 320 120" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0_4662_5060)"><g opacity="0.4"><path d="M78.3819 66.6753H54.6267C53.2371 66.6753 51.9673 66.1714 50.9839 65.3387C49.7696 64.3096 49 62.7723 49 61.0557C49 59.5056 49.6285 58.1008 50.6461 57.0845C51.6637 56.0681 53.0704 55.4404 54.6224 55.4404H78.3776C79.9296 55.4404 81.3363 56.0681 82.3539 57.0845C83.3715 58.1008 84 59.5056 84 61.0557C84 62.6058 83.3715 64.0107 82.3539 65.027C81.3363 66.0433 79.9296 66.671 78.3776 66.671L78.3819 66.6753Z" fill="#E2EDF7"></path><path d="M72.756 59.2295C73.8472 54.655 71.0187 50.0631 66.4383 48.9733C61.858 47.8835 57.2603 50.7085 56.1691 55.283C55.0779 59.8575 57.9065 64.4494 62.4868 65.5392C67.0671 66.629 71.6648 63.8041 72.756 59.2295Z" fill="#E2EDF7"></path></g><path d="M144.033 0.848633H177.998C182.722 0.848633 186.558 4.45219 186.558 8.89083V79.9996H135.473V8.89083C135.473 4.45219 139.308 0.848633 144.033 0.848633Z" fill="#FCFDFF"></path><path d="M186.111 80C185.62 80 185.223 79.6126 185.223 79.1326V9.08165C185.223 5.0309 181.846 1.73479 177.695 1.73479H144.305C140.154 1.73479 136.777 5.0309 136.777 9.08165V76.0736C136.777 76.5536 136.38 76.941 135.889 76.941C135.397 76.941 135 76.5536 135 76.0736V9.08165C135 4.07387 139.174 0 144.305 0H177.695C182.826 0 187 4.07387 187 9.08165V79.1326C187 79.6126 186.603 80 186.111 80Z" fill="#E0E9F3"></path><path d="M144.343 7.39627C144.343 8.26531 143.592 8.96734 142.67 8.96734C141.748 8.96734 140.998 8.26248 140.998 7.39627C140.998 6.53006 141.748 5.8252 142.67 5.8252C143.592 5.8252 144.343 6.53006 144.343 7.39627Z" fill="#04b0ec"></path><rect x="150.15" y="24.15" width="64.7" height="13.7" rx="0.85" fill="white"></rect><path d="M204.783 35.0091H212.003C212.168 35.0091 212.316 34.9427 212.424 34.8341C212.533 34.7255 212.599 34.5778 212.599 34.4119V27.1855C212.599 27.0648 212.563 26.9532 212.503 26.8627C212.397 26.6999 212.214 26.5913 212.003 26.5913H204.783C204.638 26.5913 204.503 26.6426 204.4 26.73C204.271 26.8386 204.189 27.0015 204.189 27.1855V34.4119C204.189 34.5778 204.256 34.7255 204.364 34.8341C204.473 34.9427 204.62 35.0091 204.786 35.0091H204.783Z" fill="#04b0ec"></path><path d="M158.383 28.4943H198.832C199.094 28.4943 199.332 28.3888 199.503 28.2169C199.675 28.0449 199.781 27.8067 199.781 27.5443C199.781 27.2909 199.681 27.0587 199.519 26.8898C199.344 26.7058 199.1 26.5942 198.829 26.5942H158.383C158.121 26.5942 157.883 26.6998 157.711 26.8717C157.539 27.0436 157.434 27.2819 157.434 27.5443C157.434 27.7313 157.488 27.9062 157.581 28.054C157.75 28.3194 158.048 28.4974 158.386 28.4974L158.383 28.4943Z" fill="#D0DAED"></path><path d="M158.383 32.0442H198.832C199.139 32.0442 199.413 31.8995 199.588 31.6702C199.711 31.5104 199.784 31.3083 199.784 31.0912C199.784 30.9042 199.729 30.7292 199.636 30.5815C199.467 30.316 199.172 30.1411 198.832 30.1411H158.383C158.124 30.1411 157.889 30.2437 157.72 30.4126C157.542 30.5845 157.434 30.8258 157.434 31.0942C157.434 31.3566 157.539 31.5948 157.711 31.7668C157.883 31.9387 158.121 32.0442 158.383 32.0442Z" fill="#D0DAED"></path><rect x="150.15" y="24.15" width="64.7" height="13.7" rx="0.85" stroke="#F2F6FC" stroke-width="0.3"></rect><rect x="109.15" y="40.15" width="64.7" height="17.7" rx="0.85" fill="white"></rect><path d="M119.679 50.6677H112.46C112.294 50.6677 112.147 50.6014 112.038 50.4928C111.93 50.3842 111.863 50.2365 111.863 50.0706V42.8442C111.863 42.7235 111.899 42.6119 111.96 42.5214C112.065 42.3586 112.249 42.25 112.46 42.25H119.679C119.824 42.25 119.96 42.3013 120.062 42.3887C120.192 42.4973 120.273 42.6602 120.273 42.8442V50.0706C120.273 50.2365 120.207 50.3842 120.098 50.4928C119.99 50.6014 119.842 50.6677 119.676 50.6677H119.679Z" fill="#04b0ec"></path><path d="M166.078 44.153H125.629C125.367 44.153 125.129 44.0475 124.957 43.8756C124.785 43.7036 124.68 43.4654 124.68 43.203C124.68 42.9496 124.779 42.7174 124.942 42.5485C125.117 42.3645 125.361 42.2529 125.632 42.2529H166.081C166.343 42.2529 166.581 42.3585 166.753 42.5304C166.924 42.7023 167.03 42.9406 167.03 43.203C167.03 43.39 166.976 43.5649 166.882 43.7127C166.713 43.9781 166.415 44.156 166.078 44.156V44.153Z" fill="#D0DAED"></path><path d="M153.151 47.7024H125.626C125.319 47.7024 125.044 47.5577 124.87 47.3284C124.746 47.1686 124.674 46.9665 124.674 46.7494C124.674 46.5624 124.728 46.3874 124.821 46.2397C124.99 45.9743 125.286 45.7993 125.626 45.7993H153.151C153.41 45.7993 153.645 45.9019 153.814 46.0708C153.992 46.2427 154.1 46.484 154.1 46.7524C154.1 47.0148 153.995 47.253 153.823 47.425C153.651 47.5969 153.413 47.7024 153.151 47.7024Z" fill="#D0DAED"></path><circle cx="126" cy="54" r="1" fill="#D0DAED"></circle><path d="M130.765 52.3971V52.7297H130.032V55.1886H129.733V52.7297H129V52.3971H130.765Z" fill="#D0DAED"></path><path d="M131.669 54.9587C131.793 54.9587 131.897 54.8922 131.978 54.7591C132.061 54.6249 132.103 54.4247 132.103 54.1587C132.103 53.9965 132.085 53.8572 132.048 53.7406C131.979 53.5164 131.853 53.4043 131.669 53.4043C131.484 53.4043 131.358 53.5227 131.29 53.7596C131.254 53.8863 131.235 54.0472 131.235 54.2423C131.235 54.3994 131.254 54.533 131.29 54.6432C131.359 54.8535 131.485 54.9587 131.669 54.9587ZM130.979 53.1629H131.238V53.4328C131.292 53.3403 131.35 53.2687 131.413 53.2181C131.503 53.142 131.608 53.104 131.73 53.104C131.909 53.104 132.062 53.1927 132.187 53.3701C132.312 53.5462 132.375 53.7983 132.375 54.1264C132.375 54.5698 132.285 54.8865 132.104 55.0765C131.99 55.1968 131.857 55.257 131.705 55.257C131.585 55.257 131.485 55.2234 131.404 55.1563C131.357 55.1183 131.304 55.053 131.246 54.9606V56H130.979V53.1629Z" fill="#D0DAED"></path><path d="M132.751 54.7743H133.061V55.1886H132.751V54.7743Z" fill="#D0DAED"></path><path d="M133.574 52.3971H133.872V53.5506H135.003V52.3971H135.3V55.1886H135.003V53.8831H133.872V55.1886H133.574V52.3971Z" fill="#D0DAED"></path><path d="M136.351 54.9682C136.528 54.9682 136.649 54.8827 136.714 54.7116C136.78 54.5394 136.813 54.3481 136.813 54.1378C136.813 53.9477 136.79 53.7932 136.742 53.6741C136.667 53.4866 136.538 53.3929 136.354 53.3929C136.191 53.3929 136.073 53.4727 135.999 53.6323C135.925 53.7919 135.888 53.9845 135.888 54.21C135.888 54.4266 135.925 54.6071 135.999 54.7515C136.073 54.896 136.19 54.9682 136.351 54.9682ZM136.362 53.0945C136.566 53.0945 136.739 53.1819 136.88 53.3568C137.021 53.5316 137.091 53.7888 137.091 54.1283C137.091 54.4564 137.029 54.7275 136.905 54.9416C136.781 55.1557 136.588 55.2627 136.326 55.2627C136.108 55.2627 135.935 55.1683 135.807 54.9796C135.678 54.7895 135.614 54.5349 135.614 54.2157C135.614 53.8736 135.682 53.6013 135.817 53.3986C135.952 53.1959 136.134 53.0945 136.362 53.0945ZM136.496 52.3667L136.798 52.9159H136.556L136.356 52.5511L136.156 52.9159H135.915L136.215 52.3667H136.496ZM136.067 52.5492H135.864L135.468 52H135.798L136.067 52.5492Z" fill="#D0DAED"></path><path d="M139.205 52.3211C139.481 52.3211 139.694 52.4143 139.846 52.6005C139.998 52.7867 140.083 52.9983 140.1 53.2352H139.812C139.78 53.0553 139.715 52.9127 139.617 52.8076C139.52 52.7025 139.384 52.6499 139.208 52.6499C138.994 52.6499 138.821 52.7468 138.689 52.9406C138.558 53.1332 138.492 53.429 138.492 53.828C138.492 54.1549 138.551 54.4203 138.67 54.6242C138.789 54.8269 138.967 54.9283 139.202 54.9283C139.42 54.9283 139.585 54.8212 139.698 54.6071C139.759 54.4944 139.803 54.3462 139.833 54.1625H140.12C140.095 54.4564 140.01 54.7028 139.866 54.9017C139.693 55.1411 139.46 55.2608 139.167 55.2608C138.914 55.2608 138.702 55.1626 138.53 54.9663C138.304 54.7066 138.191 54.3056 138.191 53.7634C138.191 53.3517 138.276 53.0141 138.446 52.7506C138.63 52.4643 138.883 52.3211 139.205 52.3211Z" fill="#D0DAED"></path><path d="M140.444 52.3876H140.711V53.429C140.774 53.3264 140.831 53.2542 140.881 53.2124C140.967 53.1401 141.074 53.104 141.202 53.104C141.432 53.104 141.588 53.2073 141.67 53.4138C141.715 53.5265 141.737 53.683 141.737 53.8831V55.1886H141.463V53.9059C141.463 53.7565 141.448 53.6469 141.419 53.5772C141.37 53.4657 141.279 53.41 141.146 53.41C141.036 53.41 140.935 53.4587 140.846 53.5563C140.756 53.6538 140.711 53.8382 140.711 54.1093V55.1886H140.444V52.3876Z" fill="#D0DAED"></path><path d="M142.216 53.1629H142.487V55.1886H142.216V53.1629ZM142.689 52.3344L142.293 52.8836H142.089L142.36 52.3344H142.689Z" fill="#D0DAED"></path><path d="M143.848 52.3971H144.27L144.894 54.7572L145.515 52.3971H145.932V55.1886H145.652V53.5411C145.652 53.4841 145.653 53.3897 145.655 53.258C145.657 53.1262 145.658 52.985 145.658 52.8342L145.038 55.1886H144.746L144.122 52.8342V52.9197C144.122 52.9881 144.123 53.0926 144.125 53.2333C144.128 53.3726 144.129 53.4752 144.129 53.5411V55.1886H143.848V52.3971Z" fill="#D0DAED"></path><path d="M146.345 53.1629H146.616V55.1886H146.345V53.1629ZM146.345 52.3971H146.616V52.7848H146.345V52.3971Z" fill="#D0DAED"></path><path d="M147.02 53.1534H147.273V53.4423C147.348 53.3232 147.428 53.2377 147.512 53.1857C147.595 53.1338 147.689 53.1078 147.791 53.1078C148.016 53.1078 148.168 53.2086 148.247 53.41C148.291 53.5202 148.312 53.6779 148.312 53.8831V55.1886H148.042V53.9059C148.042 53.7818 148.027 53.6817 147.999 53.6057C147.951 53.479 147.865 53.4157 147.741 53.4157C147.678 53.4157 147.626 53.4239 147.586 53.4404C147.513 53.4683 147.448 53.524 147.393 53.6076C147.349 53.6747 147.32 53.7444 147.306 53.8166C147.293 53.8876 147.287 53.9895 147.287 54.1226V55.1886H147.02V53.1534Z" fill="#D0DAED"></path><path d="M148.708 52.3876H148.974V53.429C149.037 53.3264 149.094 53.2542 149.144 53.2124C149.23 53.1401 149.337 53.104 149.466 53.104C149.696 53.104 149.851 53.2073 149.933 53.4138C149.978 53.5265 150 53.683 150 53.8831V55.1886H149.726V53.9059C149.726 53.7565 149.711 53.6469 149.682 53.5772C149.633 53.4657 149.543 53.41 149.409 53.41C149.299 53.41 149.199 53.4587 149.109 53.5563C149.019 53.6538 148.974 53.8382 148.974 54.1093V55.1886H148.708V52.3876Z" fill="#D0DAED"></path><rect x="109.15" y="40.15" width="64.7" height="17.7" rx="0.85" stroke="#F2F6FC" stroke-width="0.3"></rect><path d="M269.161 33.7162H231.839C229.4 33.7162 227.187 32.7263 225.589 31.1302C223.991 29.5341 223 27.3242 223 24.8879C223 23.1498 223.503 21.5269 224.371 20.161C225.939 17.694 228.697 16.0596 231.839 16.0596H269.161C271.6 16.0596 273.813 17.0494 275.411 18.6455C277.009 20.2416 278 22.4516 278 24.8879C278 27.163 277.139 29.2349 275.726 30.8003C274.108 32.592 271.765 33.7162 269.161 33.7162Z" fill="#F7F8FC"></path><path d="M256.756 28.3725C261.986 23.1493 261.986 14.6808 256.756 9.45762C251.526 4.23443 243.047 4.23443 237.817 9.45762C232.587 14.6808 232.587 23.1493 237.817 28.3725C243.047 33.5957 251.526 33.5957 256.756 28.3725Z" fill="#F7F8FC"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M120.364 9.40486C120.552 9.35878 120.741 9.4736 120.787 9.66133C120.989 10.4841 121.085 11.7268 120.823 13.0517C120.457 14.8958 119.391 16.9144 116.943 18.1576C116.771 18.2451 116.56 18.1764 116.473 18.004C116.385 17.8317 116.454 17.621 116.626 17.5335C118.657 16.5021 119.631 14.8965 120.037 13.3463C118.947 13.4321 117.08 13.932 115.883 15.4684C115.124 16.4425 114.07 16.9002 113.062 17.0777C112.316 17.2092 111.582 17.1898 110.98 17.1074C111.363 17.6575 111.892 18.2606 112.516 18.7764C113.328 19.4483 114.27 19.9472 115.236 20.0223C116.472 20.1182 117.851 19.8409 118.961 18.9859C120.061 18.1375 120.937 16.6886 121.118 14.3571C121.133 14.1644 121.301 14.0203 121.494 14.0353C121.686 14.0502 121.83 14.2186 121.815 14.4113C121.622 16.9053 120.671 18.5511 119.388 19.5403C118.113 20.523 116.551 20.8264 115.182 20.7202C114.019 20.6298 112.943 20.0385 112.069 19.3157C111.193 18.591 110.49 17.7089 110.07 16.9823C109.855 16.6092 110.218 16.2401 110.566 16.3211C111.161 16.4597 112.047 16.5458 112.941 16.3884C113.832 16.2314 114.707 15.8378 115.331 15.0381C116.762 13.2017 118.994 12.6867 120.186 12.6364C120.363 11.5239 120.273 10.5011 120.108 9.82821C120.062 9.64048 120.176 9.45094 120.364 9.40486Z" fill="#E0E9F3"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M193.813 65.8604C193.686 65.8056 193.539 65.8639 193.484 65.9906C193.24 66.5555 193.021 67.4344 193.049 68.4157C193.087 69.7813 193.606 71.3566 195.21 72.5438C195.321 72.626 195.477 72.6026 195.56 72.4917C195.642 72.3807 195.618 72.2241 195.507 72.142C194.172 71.1535 193.669 69.8799 193.567 68.7163C194.338 68.9086 195.622 69.4937 196.298 70.7454C196.714 71.5173 197.391 71.9698 198.076 72.2224C198.614 72.4208 199.165 72.4995 199.621 72.5129C199.27 72.8718 198.801 73.2527 198.273 73.5524C197.618 73.9243 196.895 74.1583 196.205 74.096C195.306 74.0149 194.349 73.6485 193.657 72.9C192.969 72.1571 192.517 71.0106 192.67 69.3158C192.682 69.1782 192.581 69.0567 192.443 69.0443C192.306 69.0319 192.184 69.1333 192.172 69.2708C192.008 71.0817 192.49 72.3758 193.29 73.2396C194.084 74.0978 195.166 74.5043 196.16 74.594C196.988 74.6687 197.815 74.3873 198.52 73.9872C199.227 73.586 199.834 73.0525 200.231 72.5866C200.448 72.3319 200.222 71.9986 199.944 72.0111C199.492 72.0314 198.857 71.9773 198.249 71.7533C197.644 71.5301 197.081 71.1441 196.738 70.5081C195.933 69.0171 194.393 68.3781 193.546 68.1988C193.554 67.3774 193.743 66.6528 193.943 66.1891C193.998 66.0623 193.94 65.9152 193.813 65.8604Z" fill="#E0E9F3"></path><path opacity="0.8" d="M251.408 59.8002C241 64 221.452 71.2928 215 59C211.678 52.6711 216.998 49.1729 220.288 50.3804C223.579 51.588 227.195 55.2738 226.745 57.2328C224.5 67 206 57.2328 200.5 61.5" stroke="#D0DAED" stroke-width="0.6" stroke-linecap="round" stroke-dasharray="2 2"></path><ellipse cx="159" cy="141.5" rx="152" ry="64.5" fill="url(#paint0_linear_4662_5060)" fill-opacity="0.6"></ellipse></g><defs><linearGradient id="paint0_linear_4662_5060" x1="147" y1="71.5" x2="149.494" y2="124.547" gradientUnits="userSpaceOnUse"><stop offset="0.00335686" stop-color="#DDE1F0"></stop><stop offset="1" stop-color="white" stop-opacity="0"></stop></linearGradient><clipPath id="clip0_4662_5060"><rect width="320" height="120" fill="white"></rect></clipPath></defs></svg>
                                        <h5>Chưa bán được gì</h5>
                                        <a href="${pageContext.request.contextPath}/View/Home.jsp?Content=AddProduct.jsp" class="AddButt font-weight-bold text-uppercase">đăng bán ngay</a>
                                    </div>
                                </c:if>
                                <c:if test="${!SoldOut.isEmpty()}">
                                    <div class="row m-r-0 m-l-0">
                                        <c:forEach var="p" items="${SoldOut}">
                                            <div class="col-md-3 item" onclick="window.location.href = '${pageContext.request.contextPath}/pdetail?PID=${p.getProId()}';">
                                                <div class="item_img">
                                                    <img src="${pageContext.request.contextPath}/${p.getPro_img()}" alt="alt"/>
                                                </div>
                                                <div class="item_detail text-left m-l-15">
                                                    <div class="item_detail-name">${p.getPro_Name()}</div>
                                                    <div class="item_detail-price text-danger">${p.getPro_Price()}</div>
                                                    <div class="" style="font-size: 12px">
                                                        <i class="fa fa-user-circle"></i>
                                                        ${p.getDateDiff()}
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
        </script>
    </body>
</html>
