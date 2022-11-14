/*function mensaje(){
    let email = document.forms[loginPersona][inputEMail].value;
    if (email == "") {
      alert("Name must be filled out");
      return false;
    }
}

if (document.getElementById("ButtonModal")){
    var modal = document.getElementById("okLogin");
    var span = document.getElementsByClassName("close")[0];
    var body = document.getElementsByTagName("body");
    var button = document.getElementById("ButtonModal");

    button.onclick = function() {
        modal.style.display = "block";
        body.style.position = "static";
        body.style.height = "100%";
        body.style.overflow = "hidden";
        }

    span.onclick = function(){
        modal.style.display = "none";
        body.style.position = "inherit";
        body.style.height = "auto";
        body.style.overflow = "visible";
    }

}*/

function validarContraseñas(){
    var pass1 = document.getElementById("inputContraseña").value;
    var pass2 = document.getElementById("inputConfirmaContraseña").value;
    if(pass1 != "" && pass2 != ""){
        if(pass1 != pass2){
                alert("Las contraseñas ingresadas deben ser iguales");
        }
    }
}


(function() {
    //a partir de que punto del scroll vertical de la ventana mostrará el botón
    const ishow = 115
    const $divtop = document.getElementById("div-totop")
    window.addEventListener("scroll", function() {
        if(document.documentElement.scrollTop > ishow){
            $divtop.style.display = "inherit"
        }
        else {
            $divtop.style.display = "none"
        }
    })
})()