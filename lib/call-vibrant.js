var Vibrant = require('node-vibrant')

const imagePath = process.argv[2];
let v = new Vibrant(imagePath, {quality: 1});
v.getPalette((err, palette) => {
  console.log('{');
  for(let swatch in palette){
    console.log(`"${swatch}" => "${toRGBAString(palette[swatch].getRgb())}",`);
  }
  console.log('}');
});

const toRGBAString = (colorArr) => {
  return 'rgba(' + 
          colorArr[0] + ', ' +
          colorArr[1] + ', ' +
          colorArr[2] + ', 1)';
}