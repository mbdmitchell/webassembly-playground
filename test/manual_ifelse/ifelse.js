const fs = require ('fs');
const bytes = fs.readFileSync (__dirname + '/ifelse.wasm');

const node_1_direction = parseInt (process.argv[2]);

(async () => {
    const obj = await WebAssembly.instantiate (
        new Uint8Array (bytes)
    );
    let square_value = obj.instance.exports.OutputPath( node_1_direction );
    console.log('The path is represented as a binary number, with each node being a digit. 1->3->4 is 1101') // Change to array
    console.log('if "0" %3 (1->3->4 / 1011), else %2 (1->2->4 / 1101),')
    console.log(`PATH: ${square_value.toString(2)}`);
})();