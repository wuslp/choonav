<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <div id="layoutSidenav_nav">
      <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
          <div class="sb-sidenav-menu">

              <div class="nav">
              	<a class="nav-link" href="">
                   <div class="sb-nav-link-icon"><i class="fas fa-exclamation-circle"></i></div>
                     	공지사항
                  </a>
              	
                  <!-- 근태  -->
                <c:if test="${cdto.attend==1}">  
              <div class="nav">  
	                  <a class="nav-link" href="/cnav/attend/attend.cnav">
	                      <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
	                      근태
	                  </a>
               </div>  
                  </c:if>
                  <!-- 결재 -->
                 <c:if test="${cdto.approval==1}">  
                  <a class="nav-link collapsed" href="/cnav/approval/sendAppList.cnav" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                      <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                      결재
                      <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                  </a>
                  <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                      <nav class="sb-sidenav-menu-nested nav">
                          <a class="nav-link" href="/cnav/approval/sendAppList.cnav">보낸 결재함</a>
                          <a class="nav-link" href="layout-sidenav-light.html">받은 결재함</a>
                      </nav>
                  </div>
               </c:if>
               
                 
              <c:if test="${cdto.mail==1}">
                  <a class="nav-link collapsed" href="/cnav/mail/recMailList.cnav" data-bs-toggle="collapse" data-bs-target="#mailLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                      <div class="sb-nav-link-icon"><i class="fas fa-envelope"></i></div>
                      메일
                      <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                  </a>
                  <div class="collapse" id="mailLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                      <nav class="sb-sidenav-menu-nested nav">
                          <a class="nav-link" href="/cnav/approval/sendAppList.cnav">보낸 메일함</a>
                          <a class="nav-link" href="layout-sidenav-light.html">받은 메일함</a>
                      </nav>
                  </div>
                </c:if>
                  
                  
                  
				<c:if test="${cdto.project==1}">
                  <a class="nav-link" href="charts.html">
                      <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                      프로젝트
                  </a>
                </c:if>
                <c:if test="${cdto.reservation==1}">
                  <a class="nav-link" href="/cnav/rez/allRez.cnav">
                      <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                    	예약
                  </a>
                </c:if> 
                <c:if test="${cdto.calendar==1}">
                  <a class="nav-link" href="/cnav/cal/calendar.cnav">
                      <div class="sb-nav-link-icon"><i class="fas fa-calendar-alt"></i></div>
                      스케쥴
                  </a>
                </c:if> 
                <c:if test="${cdto.topic==1}">
                  <a class="nav-link" href="tables.html">
                      <div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>
                      게시판
                  </a>
                </c:if> 
                <c:if test="${cdto.poll==1}">
                  <a class="nav-link" href="/cnav/poll/pollList.cnav">
                      <div class="sb-nav-link-icon"><i class="fas fa-check-circle"></i></div>
                      투표
                  </a>
                </c:if> 
                  
                  <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                      <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                      참고용
                      <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                  </a>
                  <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                      <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                              Authentication
                              <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                          </a>
                          <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                              <nav class="sb-sidenav-menu-nested nav">
                                  <a class="nav-link" href="login.html">Login</a>
                                  <a class="nav-link" href="register.html">Register</a>
                                  <a class="nav-link" href="password.html">Forgot Password</a>
                              </nav>
                          </div>
                          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                              Error
                              <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                          </a>
                          <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                              <nav class="sb-sidenav-menu-nested nav">
                                  <a class="nav-link" href="401.html">401 Page</a>
                                  <a class="nav-link" href="404.html">404 Page</a>
                                  <a class="nav-link" href="500.html">500 Page</a>
                              </nav>
                          </div>
                      </nav>
                  </div>
                  
                  
                  
              </div>
          </div>
          <div class="sb-sidenav-footer">
              <div class="small">Contact :</div>
              02-123-4567
          </div>
      </nav>
  </div>
