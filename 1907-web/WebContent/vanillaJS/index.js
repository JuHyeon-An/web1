const title = document.getElementById("title");

function init(){
    title.addEventListener("click", handleClick);
}


const CLICKED_CLASS = "clicked";

function handleClick(){
    title.classList.toggle(CLICKED_CLASS);
}

init();
