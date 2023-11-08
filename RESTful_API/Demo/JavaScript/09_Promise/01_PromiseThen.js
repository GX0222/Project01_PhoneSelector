function longTimeWork(workFine = true, errorMessage = "test") {
    return new Promise( (resolve, reject) => {
        setTimeout( () => {
            (workFine) ? resolve(200) : reject(errorMessage);
        }, 1000);
    })
    
}

function usingLongTimeWork() {
    var p = longTimeWork(true, "test")  // try true/false
    p.then(function (e) {
        console.log(e);
    })
    p.catch(function (e) {
        console.log(e);
    })
}

usingLongTimeWork();
