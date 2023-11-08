// const puppeteer = require('puppeteer');

// async function main () {
//     const browser = await puppeteer.launch({headless: false});
//     const page = await browser.newPage();
//     await page.goto('https://example.com');
// }

// main();

//=================================================================

// const puppeteer = require('puppeteer');

// async function main () {
//     const browser = await puppeteer.launch({headless: true});
//     const page = await browser.newPage();
//     await page.goto('https://example.com');
//     await page.screenshot({path: 'example.png'});
//     await browser.close();
// }

// main();

//=================================================================

// const puppeteer = require('puppeteer');

// async function main () {
//     const browser = await puppeteer.launch({headless: false});
//     const page = await browser.newPage();
//     await page.setViewport({ width: 1366, height: 768});
//     await page.goto('https://en.wikipedia.org/wiki/Wiki', {waitUntil: 'networkidle2'});
//     await page.focus("input[name='search']");
//     await page.keyboard.type('earth');
// }

// main();

//=================================================================

// const puppeteer = require('puppeteer');

// async function main () {
//     const browser = await puppeteer.launch({headless: false});
//     const page = await browser.newPage();
//     await page.setViewport({ width: 1366, height: 768});
//     await page.goto('https://en.wikipedia.org/wiki/Wiki', {waitUntil: 'networkidle2'});
//     await page.focus("input[name='search']");
//     await page.keyboard.type('earth');
//     await page.keyboard.press('\n');
// }

// main();

//=================================================================

// const puppeteer = require('puppeteer');

// function delay(time) {
//     return new Promise(function(resolve) { 
//         setTimeout(resolve, time)
//     });
// }

// async function main () {
//     const browser = await puppeteer.launch({headless: false});
//     const page = await browser.newPage();
//     await page.setViewport({ width: 1366, height: 768});
//     await page.goto('https://en.wikipedia.org/wiki/Wiki', {waitUntil: 'networkidle2'});
//     await page.focus("input[name='search']");
//     await page.keyboard.type('earth');
//     await delay(3000);
//     await page.keyboard.press('\n');
// }

// main();

//=================================================================

// const puppeteer = require('puppeteer');

// // function delay(time) {
// //     return new Promise(function(resolve) { 
// //         setTimeout(resolve, time)
// //     });
// // }

// async function main () {
//     const browser = await puppeteer.launch({headless: false});
//     const page = await browser.newPage();
//     await page.setViewport({ width: 1366, height: 768});
//     await page.goto('https://en.wikipedia.org/wiki/Wiki', {waitUntil: 'networkidle2'});
//     await page.focus("input[name='search']");
//     await page.keyboard.type('earth');
//     //await delay(1000);
//     //await page.keyboard.press('\n');
//     (await page.$("#searchform button")).click();
// }

// main();

//=================================================================

// const puppeteer = require('puppeteer');

// async function main () {
//     const browser = await puppeteer.launch({headless: false});
//     const page = await browser.newPage();
//     await page.goto('https://www.taipower.com.tw/TC/news2.aspx?mid=225', {waitUntil: 'networkidle2'});

//     var dataList = await page.evaluate( () => {
//         let result = [];
//         result.push({x: 100, y:200});
//         result.push({x: 300, y:400});
//         return result;
//     })
//     await browser.close();

//     console.log(dataList);

// }

// main();

//==================================================================

const puppeteer = require('puppeteer');

async function main () {
    const browser = await puppeteer.launch({headless: false});
    const page = await browser.newPage();
    await page.goto('https://www.taipower.com.tw/TC/news2.aspx?mid=225', {waitUntil: 'networkidle2'});

    await page.addScriptTag({url: 'https://code.jquery.com/jquery-3.2.1.min.js'})

    var dataList = await page.evaluate( () => {
        let result = [];
        const $ = window.$;
        let liList = $("#news_box3 > div.box_list > ul > li");
        liList.each(function (index, element) {
            var newsItem = {
                newsUrl: $(element).find("a").prop("href"),
                newsTitle: $(element).find("a div h3").text(),
                newsTime: $(element).find("a div span").text()
            };
            result.push(newsItem);
        })
        return result;
    })
    await browser.close();

    console.log(dataList);
}

main();
























