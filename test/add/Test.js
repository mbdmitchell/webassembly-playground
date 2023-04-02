const fs = require ('fs');
const bytes = fs.readFileSync (__dirname + '/Test.wasm');

(async () => {
    const obj = await WebAssembly.instantiate (
        new Uint8Array (bytes)
    );
    let val = obj.instance.exports.Test();
    console.log(val);
})();