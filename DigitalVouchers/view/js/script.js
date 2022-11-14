
function validacionLogin(){
    let contraseñaLogin = document.forms["loginPersona"]["inputContraseña"].value;
    if(contraseñaLogin==""){
        alert("Ingrese un valor para la contraseña");
        return false;
    } 
}