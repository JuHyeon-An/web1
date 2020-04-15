const toDoForm = document.querySelector(".js-toDoForm"),
      toDoInput = toDoForm.querySelector("input"),
      toDoList = document.querySelector(".js-toDoList");

const TODOS_LS = "toDos";
let toDos = [];


function deleteToDo(event){
    const btn = event.target;
    const li = btn.parentNode;
    // 버튼이 눌린 해당 list

    toDoList.removeChild(li);
    const cleanToDos = toDos.filter(function(toDo){
        // 버튼이 눌린 곳의 id와 toDo가 담긴 array의 id가 같지 않은 것만 cleanToDos에 담는다.
        return toDo.id !== parseInt(li.id);
    });

    toDos = cleanToDos;
    console.log(toDos);
    saveToDos();
}


function saveToDos(){
    localStorage.setItem(TODOS_LS, JSON.stringify(toDos));
}

function paintToDo(text){
    const li = document.createElement("li");
    const delBtn = document.createElement("button");
    const span = document.createElement("span");
    const newId = toDos.length + 1;
    delBtn.innerText = "❌";
    delBtn.addEventListener("click", deleteToDo);
    span.innerText = text;
    li.appendChild(delBtn);
    li.appendChild(span);
    li.id = newId;
    toDoList.appendChild(li);
    const toDoObj = {
        text: text,
        id  : newId
    }
    toDos.push(toDoObj);
    saveToDos();
}

//엔터 누르는 순간 event
function handleSubmit(event){
    event.preventDefault();
    const currentValue = toDoInput.value;
    paintToDo(currentValue);
    toDoInput.value = "";
}

function loadToDos(){
    const loadedToDos = localStorage.getItem(TODOS_LS);
    // String 상태

    if(loadedToDos !== null){
        // 로컬에 저장된 todo가 있으면
        const parsedTodos = JSON.parse(loadedToDos);
        parsedTodos.forEach(function(toDo){
            paintToDo(toDo.text);
        })
    }
}

function init(){
    loadToDos();
    toDoForm.addEventListener("submit", handleSubmit)
}

init();