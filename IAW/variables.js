/*
console.log(mensaje)
console.log(numero)
var mensaje ="Texto de mensaje. "; //se puede utilizar ant
let numero = 0; //solo de puede acceder a partir de aquí.
const dni = '33493923H';
console.log(mensaje);
console.log(numero);
console.log(dni);
// Error:
dni = '22342323Z'
*/

//variables globales
const TEXTO = "un texto global";
console.log(TEXTO);
if(true)
{
    const TEXTOLOCAL = "un texto local";
    console.log(TEXTOLOCAL);
    console.log(TEXTO);

}
//error
console.log(TEXTOLOCAL);
console.log(TEXTO);
