<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            
                            <!-- 계정정보 -->
                            <a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                	계정정보
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/cnav/my/modifyForm.cnav">계정정보 수정</a>
                                    <a class="nav-link" href="/cnav/my/pwChangeForm.cnav">비밀번호 변경</a>
                                    <a class="nav-link" href="/cnav/my/deleteForm.cnav">회원탈퇴</a>
                                </nav>
                            </div>
                            
                           <!-- 나의 활동 -->
                            <a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#mailLayouts" aria-expanded="false" aria-controls="mailLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>
                               	 나의 활동
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="mailLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/cnav/my/myTopicList.cnav">내 게시물</a>
                                    <a class="nav-link" href="/cnav/my/myPjList.cnav">내 프로젝트</a>
                                    <a class="nav-link" href="/cnav/my/myCommentsList.cnav">내 댓글</a>
                                </nav>
                            </div>
                            
                             <!-- 사원 정보 : 관리자권한 가지고 있는 아이디만 보임-->
                            <c:if test="${sauth==1}"> 
                             <a class="nav-link collapsed"  data-bs-toggle="collapse" data-bs-target="#dayLayouts" aria-expanded="false" aria-controls="dayLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-check-circle"></i></div>
                              	  사원 정보
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="dayLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/cnav/my/userManagement.cnav">사원 정보 수정</a>
                                </nav>
                            </div>
                           </c:if>
                         
                            
                            
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Contact :</div>
                        02-123-4567
                    </div>
                </nav>
            </div>
