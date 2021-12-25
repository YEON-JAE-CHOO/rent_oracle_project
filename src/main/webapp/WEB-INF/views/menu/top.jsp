<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <nav class="navbar sticky-top navbar-expand-md navbar-dark fixed-top bg-dark" margin-bottom = 30px>
    <div class="container-fluid">
      <a class="navbar-brand" href='/index.do'>HOME</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link" href='/cargrp/cargrplist.do'>예약</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href='/cargrp/cargrplist.do'>이벤트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href='/notice/list.do'>공지사항</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href='/cate/list_all.do'>고객센터</a>
          </li>
        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>