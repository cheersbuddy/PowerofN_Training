console.log(5 +6);

const person = {
    name: 'John',
    age: 30,
    isMarried: false,
};
const person2 = {...person, name : "jack"}// the ... takes everything from the person and create person2 object with only change in name as jack
// you can do the same with arrays
const arr = [1,2,3,4,5];
const arr1=[...arr,7,8];
console.log(arr1);

 /*
 imp functions -  .map(), .filter(), .reduce()
 */
// to add 1 at the end of each names 
let names = ["aa","bb","cc"];
console.log(names.map((name)=> name + "1"));// it maps all the values in names and maps it with +1 at the end and print that in console.
// to filter out the names which are not starting with a
console.log(names.filter((name)=> name[1] === "a"));// [ 'aa' ]

console.log( names.filter((name)=>{
    return name!=="aa";

})) //[ 'bb', 'cc' ] - 