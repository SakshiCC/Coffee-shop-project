/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



const wrapper = document.querySelector('.wrapper');
const loginLink = document.querySelector('.login-link');
const regLink = document.querySelector('.register-link');

const btnPopup = document.querySelector('.btnlogin-pop');
const iconClose = document.querySelector('.icon-close');


regLink.addEventListener('click',()=>{
    wrapper.classList.add('active');

});


loginLink.addEventListener('click',()=>{
    wrapper.classList.remove('active');
    
});

btnPopup.addEventListener('click',()=>{
    wrapper.classList.add('active-popup');

});
iconClose.addEventListener('click',()=>{
    wrapper.classList.remove('active-popup');

});

function logout() {
    window.location.href = "userlogcheck.jsp?logout=true";
}

