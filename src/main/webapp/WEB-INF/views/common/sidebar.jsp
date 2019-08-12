<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="./adminIndex">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">관리자페이지</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" href="buttons.html">Buttons</a>
            <a class="collapse-item" href="cards.html">Cards</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="utilities-color.html">Colors</a>
            <a class="collapse-item" href="utilities-border.html">Borders</a>
            <a class="collapse-item" href="utilities-animation.html">Animations</a>
            <a class="collapse-item" href="utilities-other.html">Other</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMemberPages" aria-expanded="true" aria-controls="collapseMemberPages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Member</span>
        </a>
        <div id="collapseMemberPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">MEMBER:</h6>
            <a class="collapse-item" href="./memberNormal">일반 회원 관리</a>
            <a class="collapse-item" href="./memberUnserviceability">차단 회원 관리</a>
            <a class="collapse-item" href="./memberAccessInfo">회원 접근 정보 리스트</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">DOCTOR MEMBER:</h6>
            <a class="collapse-item" href="#">의사 리스트 관리</a>
            <a class="collapse-item" href="#">등록하기</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBoardPages" aria-expanded="true" aria-controls="collapseBoardPages">
          <i class="fas fa-fw fa-folder"></i>
          <span>BOARD</span>
        </a>
        <div id="collapseBoardPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">RESERVE:</h6>
            <a class="collapse-item" href="#">일반진료 예약 관리</a>
            <a class="collapse-item" href="#">건강검진 예약 관리</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">NEWS:</h6>
            <a class="collapse-item" href="#">질환 정보 관리</a>
            <a class="collapse-item" href="#">영양 정보 관리</a>
            <a class="collapse-item" href="#">운동 정보 관리</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">NOTICE:</h6>
            <a class="collapse-item" href="../admin/noticeList">공지사항 관리</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">QNA:</h6>
            <a class="collapse-item" href="../admin/complaint">건의합니다 관리</a>
            <a class="collapse-item" href="../admin/praise">칭찬합니다 관리</a>
            <a class="collapse-item" href="../admin/qnaList">질문과답변 관리</a>
            <div class="collapse-divider"></div>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseErrorPages" aria-expanded="true" aria-controls="collapseErrorPages">
          <i class="fas fa-fw fa-folder"></i>
          <span>ERROR</span>
        </a>
        <div id="collapseErrorPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="#">404 Page 관리</a>
            <a class="collapse-item" href="#">500 Page 관리</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
<!-- End of Sidebar -->