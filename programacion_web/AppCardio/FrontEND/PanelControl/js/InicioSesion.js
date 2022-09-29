var usuarioActual = jQuery.parseJSON(sessionStorage.getItem('user'));

$('#IniciarSesion').click(function(event){
    event.preventDefault();

    alerta = '';
    data = {
        username : $('#luser').val(),
        clave : $('#lpass').val()
    };

    $.post('../../ApiREST/UsuariosCtrl/Logear',
        {datos : data},
        function(res) {
            if (res.Estado == 1){
                sessionStorage.setItem('user',JSON.stringify(res.Usuario));
                Recargar('../../FrontEnd/PanelControl/');
            } else {
                console.log(res);
            }
        }
    );

});