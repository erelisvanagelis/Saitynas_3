function collapse(e) {
    var sender = (e && e.target) || (window.event && window.event.srcElement);
    var id = sender.id + 1;
    var x = document.getElementById(id);
    
    clearContainer();
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

function collapseAchievement(e) {
    var sender = (e && e.target) || (window.event && window.event.srcElement);
    var id = sender.id + 1;
    var x = document.getElementById(id);
    
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

function clearContainer() {
    var childDivs = document.getElementById('container').getElementsByTagName('div');

    for (i = 0; i < childDivs.length; i++)
    {
        childDivs[i].style.display = "none";
    }
}
