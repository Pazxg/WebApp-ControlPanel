<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="WebApp_ControlPanel.UserControl.Header" %>
   <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Firma İsmi</a>
       <div class="text-light" id="oturumsuresı">0</div>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input onkeypress="aramatusunabas()" id="textarama" class="form-control form-control-dark w-100" type="text" placeholder="Ara" aria-label="Ara">
       <div class="text-light" id="karaktersayaci">0</div>
  <div class="navbar-nav cikisYap" id="cikisYAP">
    <div class="nav-item text-nowrap">
      <a onclick="cikisYap()" class="nav-link px-3" href="#">Çıkış Yap</a>
    </div>
  </div>
</header>f