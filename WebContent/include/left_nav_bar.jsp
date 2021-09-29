<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                       	 <!-- 공지사항 고정 -->
                        	<a class="nav-link" href="/cnav/notice/list.cnav">
                                <div class="sb-nav-link-icon"><i class="fas fa-exclamation-circle"></i></div>
                               	공지사항
                            </a>
                        	
                            <!--1. 근태  -->
                           <c:if test="${sessionScope.cdto.attend==1}"> 
                            <a class="nav-link" href="/cnav/attend/attend.cnav">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                              		 근태
                            </a>
                           </c:if> 
                            
                            <!--2. 결재 -->
                           <c:if test="${sessionScope.cdto.approval==1}"> 
                            <a class="nav-link collapsed" href="/cnav/approval/sendAppList.cnav" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                	결재
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/cnav/approval/appForm.cnav">새 결재</a>
                                    <a class="nav-link" href="/cnav/approval/sendAppList.cnav">보낸 결재함</a>
                                    <a class="nav-link" href="/cnav/approval/takeAppList.cnav">받은 결재함</a>
                                </nav>
                            </div>
                         	</c:if>
                           <!--3. 메일 -->
                          <c:if test="${sessionScope.cdto.mail==1}"> 
                            <a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#mailLayouts" aria-expanded="false" aria-controls="mailLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-envelope"></i></div>
                               	 메일
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="mailLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/cnav/mail/writeMailForm.cnav">메일 쓰기</a>
                                    <a class="nav-link" href="/cnav/mail/recMailList.cnav">받은 메일함</a>
                                    <a class="nav-link" href="/cnav/mail/sendMailList.cnav">보낸 메일함</a>
                                </nav>
                            </div>
                           </c:if>
                            <!--4. 예약 -->
                          <c:if test="${sessionScope.cdto.reservation==1}">  
                            <a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#reserveLayouts" aria-expanded="false" aria-controls="reserveLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                	예약
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="reserveLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/cnav/rez/allRez.cnav">전체 예약</a>
                                    <a class="nav-link" href="/cnav/rez/myRez.cnav">내 예약</a>
                                </nav>
                            </div>
                           </c:if>
                            <!--5. 일정 -->
                           <c:if test="${sessionScope.cdto.calendar==1}"> 
                            <a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#dayLayouts" aria-expanded="false" aria-controls="dayLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-calendar-alt"></i></div>
                              	  일정
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="dayLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/cnav/cal/calendar.cnav">전체 일정</a>
                                    <a class="nav-link" href="/cnav/cal/myCalendar.cnav">내 일정</a>
                                </nav>
                            </div>
                            </c:if>
							<!--6. 프로젝트  -->
							<c:if test="${sessionScope.cdto.project==1}">         
                            <a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#proLayouts" aria-expanded="false" aria-controls="proLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-calendar-alt"></i></div>
                              	 	프로젝트
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="proLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/cnav/project/proWriteForm.cnav">프로젝트 만들기</a>
                                    <a class="nav-link" href="/cnav/project/proList.cnav">프로젝트 목록</a>
                                </nav>
                            </div>
                            </c:if>
                            
                            <!-- 7. 자유 게시판 -->
                           <c:if test="${sessionScope.cdto.topic==1}"> 
                            <a class="nav-link" href="/cnav/topic/list.cnav">
                                <div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>
                                	자유 게시판
                            </a>
                           </c:if>
                           <!-- 8.투표 -->
                           <c:if test="${sessionScope.cdto.poll==1}">
                            <a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#pollLayouts" aria-expanded="false" aria-controls="pollLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-check-circle"></i></div>
                               	 투표
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pollLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/cnav/poll/pollList.cnav">투표 리스트</a>
                                    <a class="nav-link" href="/cnav/poll/pollForm.cnav">투표 만들기</a>
                                </nav>
                            </div>
                           </c:if> 
                            <!-- 9.전체 관리자 권한 =2일 경우 회사관리자권한 수정해주는 카테고리 필요 -->
                           <c:if test="${sessionScope.sauth==2}">
                            <a class="nav-link" href="/cnav/admin/adminMypage.cnav">
                                <div class="sb-nav-link-icon"><i class="fas fa-exclamation-circle"></i></div>
                               	 	관리자 권한 수정 페이지
                            </a>
                           </c:if> 
                         
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Contact :</div>
                        02-123-4567
                    </div>
                </nav>
            </div>
