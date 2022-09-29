var ControlUsers = false;
var ControlBarrios = false;
var ControlCiudades = false;
var ControlMedicamentos = false;
var ControlPacientes = false;

var usuarioActual = jQuery.parseJSON(sessionStorage.getItem('user'));

$(l_usu).val(usuarioActual[0].usuario);

$('#ControlPanelUser').click(function(event){
    if(!ControlUsers) {
        $('#n_img').addClass('hidden');
        ControlUsers = true;
    } else {
        ControlUsers = false;
    }
});


jQuery(document).ready(function(event) {

    $('.oculto').hide();
    $('.inf').click(function(){
        var nodo = $(this).attr("href");
        
        if ($(nodo).is(":visible")){
            $(nodo).hide();
            return false;
        }  else {
            $('.oculto').hide("slow");
            $(nodo).fadeToggle("fast");
            return false;
        }
    });
});


$('#CerrarSesion').click(function(event){
    sessionStorage.removeItem('user');
    Recargar('../../FrontEnd/PanelControl/');
});