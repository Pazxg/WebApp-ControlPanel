<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp_ControlPanel.Default" %>

<%@ Register Src="~/UserControl/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/UserControl/LeftMenu.ascx" TagPrefix="uc1" TagName="LeftMenu" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <link href="CSS/dashboard.css" rel="stylesheet" />
    <link href="CSS/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header runat="server" ID="Header" />
        <div class="container-fluid">
            <div class="row">
                <uc1:LeftMenu runat="server" ID="LeftMenu" />
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Yönetim Paneli</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <div class="btn-group me-2">
                                <button type="button" class="btn btn-sm btn-outline-secondary" onclick="KullanıcılarıGetir()">Kullanıcıları Getir</button>
                                <button type="button" class="btn btn-sm btn-outline-primary" onclick="KullanıcıEkleGöster()">Kullanıcıları Ekle</button>

                            </div>
                        </div>
                    </div>
                    <div class="table table-table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>Id</td>
                                    <td>KullanıcıAdı</td>
                                    <td>Sifre</td>
                                    <td>AdSoyad</td>
                                    <td></td>

                                </tr>
                            </thead>
                            <tbody id="tabloıcerıgı">
                            </tbody>
                        </table>
                    </div>
                </main>
            </div>
        </div>

        <div class="modal fade" id="mdlAddUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" onclick="KullanıcıEkleGizle()" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Kullanıcı Adı Giriniz:</label>
                                    <input id="txtkayitKullanıcıAdı" class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6 mt-2">
                                <div class="form-group">
                                    <label>Şifre Giriniz:</label>
                                    <input id="txtkayitSifre" class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6 mt-2">
                                <div class="form-group">
                                    <label>Şifrenizi Tekrar Giriniz:</label>
                                    <input id="txtkayitsifretekrar" class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-12 mt-2">
                                <div class="form-group">
                                    <label>Ad Soyad Giriniz:</label>
                                    <input id="txtkayitAdSoyad" class="form-control" />
                                </div>
                            </div>
                            <div class="modal-footer">
                                 <button type="button" class="btn btn-secondary" onclick="KullanıcıEkleGizle()">Kapat</button>
                                <button type="button" class="btn btn-primary" onclick="KullanıcıKaydet()">Kaydet</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="mdlKullaniciDuzenle" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="mdlDuzenleTitle"></h5>
                        <button type="button" onclick="KullaniciDuzenlePopupKapat()" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Ad Soyad:</label>
                                    <input id="txtDuzenleAdSoyad" class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Kullanıcı Adı:</label>
                                    <input id="txtDuzenleKullaniciAdi" class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="KullaniciDuzenlePopupKapat()">Kapat</button>
                        <button type="button" class="btn btn-primary" id="btnDuzenleKaydet">Kaydet</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
        <script src="Javascript/dashboard.js"></script>
        <script src="Genel.js"></script>
        <script src="Javascript/bootstrap.bundle.min.js"></script>

        <asp:Label ID="LoggerKullanıcıAdı" runat="server"></asp:Label><br />
        You're Welcome.
        <asp:Button ID="Exit" OnClick="CıkısYap_Click" runat="server" Text="Cıkıs Yap" />
    </form>
</body>
</html>
