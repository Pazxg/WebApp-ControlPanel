<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApp_ControlPanel.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/signin.css" rel="stylesheet" />
</head>
<body class="text-center">
<main class="form-signin">
<form id="form1" runat="server">
    <img class="mb-4" src="Images/Logo.jpg" alt="logo" width="100" height="100"/>
    <h1 class="h3 mb-3 fw-normal">Giriş Yapın</h1>
    <div class="form-floating">
      <asp:TextBox ID="KullanıcıAdı" CssClass="form-control" runat="server"></asp:TextBox>
      <label for="floatingInput">Kullanıcı Adı</label>
    </div>
    <div class="form-floating">
        <div class ="input-group mb-3"> 
          <asp:TextBox ID="Sifre" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
            <div class="input-group-append">
                <span onclick="sifregostergizle()" id="btngoster">Göster</span>
            </div>
        </div>
    </div>
    <asp:Button ID="GirisYap" OnClick="GirisYap_Click" class="w-100 btn btn-lg btn-primary" runat="server" Text="Giris Yap" />
    <asp:Label ID="Labelx" runat="server" ></asp:Label>

    <p class="mt-5 mb-3 text-muted">&copy; Batuhan Ulukan Logın Page 2022</p>
</form>
</main>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="Genel.js"></script>
</body>
</html>
