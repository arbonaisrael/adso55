if (sessionStorage.getItem('user') != null){
    var usuarioActual = jQuery.parseJSON(sessionStorage.getItem('user'));
    if (usuarioActual[0].rol> 1){
        console.log('Inicio usuario');
    } else {
        $('#contenido').load('pag/menu.html');
    }
} else {
    $('#contenido').load('pag/login.html');
}

function Recargar(url) {
    location.href = url;
}