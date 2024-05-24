window.addEventListener("message", function(event){
    const doc = document.getElementById("doc");
    const printer = document.getElementById("maincont")

    let data = event.data
    if (data.type === "print"){
        if (data.open){
            printer.hidden = false
            document.getElementById("btn-send").onclick = function(){
                let link = document.getElementById("text").value
                let title =document.getElementById("title").value
                let desc = document.getElementById("desc").value

                fetch(`https://nkt-printer/print`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: JSON.stringify({
                        link: link, 
                        title:title, 
                        desc:desc
                    })
                }).then(resp => resp.json());
            }
        }
    } else{
        printer.hidden = true
    }
    if (data.type === "display"){
        if (data.open){
            doc.hidden = false
            let img = new Image(800, 1000)
            img.src = data.link
            img.alt = "No valid link provided!"
            doc.appendChild(img);
        } else{
            doc.hidden = true
        }
    }
})



document.onkeydown = function(evt) {
    evt = evt
    var isEscape = false
   if ("key" in evt) {
        isEscape = (evt.key === "Escape" || evt.key === "Esc")
    } else {
        isEscape = (evt.keyCode === 27)
    }
    if (isEscape) {
        let doc = document.getElementById("doc")
        doc.hidden = true
        if (doc.firstElementChild) {
            doc.removeChild(doc.firstElementChild);
        }
        document.getElementById("maincont").hidden = true
        
        fetch(`https://nkt-printer/close`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({})
        }).then(resp => resp.json());
        return
    }
};