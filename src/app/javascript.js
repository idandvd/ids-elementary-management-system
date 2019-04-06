function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
    //console.log(ev.target.id); 
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    var newNode = document.getElementById(data);
    if (ev.target.id == "trash") {
        if (newNode.id.includes("$")) {
            var oldNode = document.getElementById(data);
            oldNode.parentElement.removeChild(oldNode);
        }
        return;
    }
    var target = ev.target;
    while (target.nodeName != "TD")
        target = target.parentElement;
    if (!newNode.id.includes("$")) {
        newNode = newNode.cloneNode(true);
        newNode.id = newNode.id + '$' + ev.target.id; /* We cannot use the same ID */
    }
    else {
        var last = newNode.parentElement;
    }
    newNode.classList.remove("border");
    newNode.classList.remove("col-2");
    newNode.classList.add("text-center");
    if (target.childElementCount > 0) {
        if (event.ctrlKey)
            target.removeChild(target.children[0]);
        else
            last.appendChild(target.children[0]);
    }
    target.appendChild(newNode);
}