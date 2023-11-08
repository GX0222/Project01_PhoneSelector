async function sleep(timeCount) {
    var p = new Promise(function (resolve, reject) {
        setTimeout(function () {
            resolve();
        }, timeCount)
    });
    await p;
}

async function main() {
    console.log("Flag 1");
    await sleep(3000);
    console.log("Flag 2");
}

main();
