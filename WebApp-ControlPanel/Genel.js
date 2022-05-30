//$("#cikisYAP").click(function () {
//  alert("Çıkıs yapıldı.");
//});
var surebaslangıc = 0;
var oturumsayacı;
function cikisYap() {
    clearInterval(oturumsayacı);
    alert("Çıkıs yapıldı.");
}

function aramatusunabas() {
    var karaktersayisi = $("#textarama").val().length;
    $("#karaktersayaci").html(karaktersayisi);
    if (karaktersayisi => 9) {
        var ilkkarakter = $("#textarama").val().substr(0, 9);
        $("#textarama").val(ilkkarakter);
    }
}

function sifregostergizle() {
    var type = $("#Sifre").attr("type");
    if (type == "password") {
        $("#Sifre").removeAttr("type");
        $("#Sifre").attr("type", "text");
        $("#btngoster").html("Gizle")
    } else {
        $("#Sifre").removeAttr("type");
        $("#Sifre").attr("type", "password");
        $("#btngoster").html("Göster")
    }
}

function duyuru() {
    alert("Yönetim Paneline Hoş Geldin.")
}

$(document).ready(function () {
    oturumsayacı = setInterval(function () {
        surebaslangıc++;
        $("#oturumsuresı").html(surebaslangıc);
    }, 1000);
    setTimeout(duyuru, 5000);
});

function KullanıcılarıGetir() {
    var content = "";
    $.ajax({
        url: 'Default.aspx/KullanıcılarıGetir',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        success: function (data) {
            $.each(jQuery.parseJSON(data.d), function () {
                content += "<tr>";
                content += "<td>" + this["Id"] + "</td>";
                content += "<td>" + this["KullanıcıAdı"] + "</td>";
                content += "<td>" + this["Sifre"] + "</td>";
                content += "<td>" + this["AdSoyad"] + "</td>";
                content += '<td><a class="btn btn-sm btn-danger" onclick="KullaniciSil(' + this["Id"] + ')">Sil</a><a class="btn btn-sm btn-primary ml-5" onclick="KullaniciDuzenlePopupAc(' + this["Id"] + ')">Düzenle</a></td>';
                content += "</tr>";
            });
            $("#tabloıcerıgı").html(content);
        },
        error: function () {

        }
    });
}

function KullanıcıKaydet() {
    $.ajax({
        url: 'Default.aspx/KullaniciEkle',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: "{kullaniciadi: '" + $("#txtkayitKullanıcıAdı").val() + "', sifre:'" + $("#txtkayitSifre").val() + "', adsoyad: '" + $("#txtkayitAdSoyad").val() + "' }",
        success: function (data) {
            if (data.d) {
                KullanıcılarıGetir();
                KullanıcıEkleGizle();
            }
            else {
                alert("ekleme sırasında bir hata olustu");
            }
        },
        error: function () {
        }
    });
}

function KullaniciSil(id) {

    if (confirm("datayi silmek istediginize eminmisiniz"));
    {
        $.ajax({
            url: 'Default.aspx/KullaniciSil',
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: "{id:" + id + "}",
            success: function (data) {
                if (data.d) {
                    KullanıcılarıGetir();
                }
                else {
                    alert("silme sırasında bir hata olustu");
                }
            },
            error: function () {

            }
        });

    }
}

function KullanıcıEkleGöster()
{
    $("#mdlAddUser").modal("show");
}

function KullanıcıEkleGizle() {
    $("#mdlAddUser").modal("hide");
}

function KullaniciDuzenlePopupAc(id) {
    $.ajax({
        url: 'Default.aspx/KullaniciDetayGetir',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: "{id:" + id + "}",
        success: function (data) {
            var resultData = jQuery.parseJSON(data.d);
            $("#mdlDuzenleTitle").html(resultData.AdSoyad);
            $("#txtDuzenleAdSoyad").val(resultData.AdSoyad);
            $("#txtDuzenleKullaniciAdi").val(resultData.KullanıcıAdı);
            $("#btnDuzenleKaydet").attr("onclick", "KullanıcıDuzenleKaydet('" + id + "')");

        },
        error: function () {

        }
    });

    $("#mdlKullaniciDuzenle").modal("show");
}

function KullaniciDuzenlePopupKapat() {
    $("#mdlKullaniciDuzenle").modal("hide");
}

function KullanıcıDuzenleKaydet(id) {
    $.ajax({
        url: 'Default.aspx/KullaniciDuzenle',
        dataType: 'json',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: "{id:'" + id + "',kullaniciadi:'" + $("#txtDuzenleKullaniciAdi").val() +"', adsoyad:'" + $("#txtDuzenleAdSoyad").val() + "'}",
        success: function (data) {
            if (data.d) {
                KullanıcılarıGetir();
                KullaniciDuzenlePopupKapat();
            }
            else {

                alert("güncelleme sırasında bir hata olustu");

            }
        },
        error: function () {

        }
    });
}