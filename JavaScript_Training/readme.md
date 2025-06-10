#JS
**NOTE** - Javascript is a dynamic language.
- It is a scripting language.

**Node** - It is a c++ program, Node.js is a runtime environment that allows you to execute JavaScript code outside of a web browser, on the server-side. 
- It provides various APIs for file system access, network communication, and more.

#### Naming a variable in javascript:

- [Variables with examples](https://www.w3schools.com/js/js_variables.asp)

- cant be reserved keyword
- cant start with a number eg; 1name
- cant contain space or hypen and first letter of variable should be small letter. eg first_name 1 its should be firstNmae1
- if a variable is not initialised or declared its default is 'undefined' 

### Keywords

**const**
- const is used to declare a constant variable. when you change or update the vlaue again in the code it shows an error.

### Variable Declaration in JavaScript:

> var a=10,b=13; // we can asiign more than one variable in a single assignment

1.  var age = 25;console.log(age); // Output: 25
    
    *   The var keyword declares a variable globally or locally to an entire function, regardless of block scope.
        
2.  let name = "John";console.log(name); // Output: John
    
    *   The let keyword declares a block-scoped variable, which means it is only accessible within the block or statement where it is defined.
        
3.  const PI = 3.14;console.log(PI); // Output: 3.14
    
    *   The const keyword declares a block-scoped variable that cannot be reassigned. It is a constant once assigned.
        
---
### Strings: Note read original file instead of preview for this alone.

> var str="double"inside out" hello "inside out" double";
```
var st1="double"inside out" hello "inside out" double";
                ^^^^^^
SyntaxError: Unexpected identifier 'inside'
```
- output: since string only takes the data inside the " " when the compiler sees a closed quote it thinks this is the last data in the variable so to print with multiple " " in a var
>  var str="double\"inside out\" hello \"inside out\" double";
```
//output

double"inside out" hello "inside out" double
```
###  or use ' ' codes for the string then " " inside the string 

> var str='double"inside out" hello "inside out" double';
---

### Notes:

*   **Variable Naming:**
    
    *   Variable names should be meaningful and follow camelCase convention (e.g., myVariable, totalAmount).
        
*   **Dynamic Typing:**
    
    *   JavaScript is a dynamically-typed language, so you don't need to explicitly mention the type of the variable; it is determined at runtime.
        
*   let greeting = "Hello, World!";
    
    *   You can declare and initialize a variable in a single step.

### String slicing
- String slicing in JavaScript involves extracting a portion of a string by specifying the starting and ending indices.
- You can achieve this using the slice() method. Here are a few examples:

## slice() method:
```
var originalString = "Hello, World!";
var slicedString = originalString.slice(7, 12);

console.log(slicedString); 
```
- Output: "World"

## Omitting the End Index:
- If you omit the end index, the slice will go until the end of the string:
```
let originalString = "Hello, World!";
let slicedString = originalString.slice(7);

console.log(slicedString);
```
- Output: "World!"

- In this case, it extracts from index 7 to the end of the string.

## Negative Indices:
- You can use negative indices to count from the end of the string:
```
let originalString = "Hello, World!";
let slicedString = originalString.slice(-6, -1);

console.log(slicedString); 
```
- Output : World
- This extracts from the 6th character from the end to the 1st character from the end.

#### **Comparison Operators**

*   `==` (equality): Checks if two values are equal.
*   `!=` (inequality): Checks if two values are not equal.
*   `===` (strict equality): Checks if two values are equal without type conversion.
*   `!==` (strict inequality): Checks if two values are not equal without type conversion.
*   `>` (greater than), `<` (less than), `>=` (greater than or equal to), `<=` (less than or equal to): Compare numeric values.

//Some examples:
```
var adultAge = 18;
var age = 11;
if(age >= adultAge){ // condition is false
  console.log("Adult");
} else {
  console.log("Minor"); // Minor will be printed
}


if (10 === '10') {  // condition is false (strict equality)
  console.log("Types are equal");
} else{
  console.log("Types are not equal"); // this would be the output
}


if(10 == '10'){  // true
  console.log("Values are equal"); // this would be the output
} else {
  console.log("Not equal");
}
```

- If notice the last example, the the condition (10 == '10) is true.
- The **\==** operator performs type coercion if the operands are of different types. Meaning, it compares values after attempting to convert them to a common type. In this example, JavaScript converts the string to a number before making the comparison.

### Shortcuts

- ctrl+L - to clear the contents in the console
- ctrl+alt+i - to open inspect in browser page
- 

## Arrays:
### Displaying elements

Write a program which does the following

*   Create a `string array` for the following values `"Monday", "Tuesday", "Wednesday", and "Thursday"`.
*   Name the list as per your choice
*   Output the last two elements of the array on separate lines

// your code goes here
```
var days=["Monday", "Tuesday", "Wednesday","Thursday"];

console.log(days[days.length-2]);

console.log(days[days.length-1]);
```
  

### Your Output

Wednesday

Thursday

### Slicing in Array:

### Slicing a list

Similar to what we saw in slicing of `strings`, you can slice arrays as well.

You can specify a range of consecutive indexes by specifying where to start and where to end the range in this manner - `console.log(arr.slice(1, 4));`.

This will print elements from `index number` `**1**` to `**3**`.

**Note**:

*   Indexing starts from 0.
*   Item on index no `**4**` will not be printed as the end index is excluded.

For eg -
```
arr = ["Juke", "King", "Hearts", "68", "Kite"\];
console.log(arr.slice(1, 4));
```
The output will be

> ["King", "Hearts", "68"]
---
## Getting input from user

### Taking user input

There are multiple ways to take user input in JavaScript, depending on the context in which your script is running. Here is the most common one:

  

`**Standard input (stdin) stream**`**:**

*   This is used almost everywhere because of its simplicity and ease of use.
*   Example:
```
process.stdin.setEncoding('utf8');

process.stdin.on('data', function (input) {
       console.log(input);
    });
```
Let's break down the code:

1.  `**process.stdin.setEncoding('utf8')**`: This line sets the encoding for the standard input to UTF-8. It ensures that the input is treated as a UTF-8 encoded string, which is a common character encoding.
2.    
    
3.  `**process.stdin.on('data', function (input) {**`: This line sets up an event listener for the 'data' event on the standard input stream. The provided [callback function](https://www.codechef.com/learn/course/javascript/LEARNJS22/problems/LEARNJSP129B) will be executed whenever data is received on the standard input.
4.    
    
5.  `**console.log(input)**`: This line prints the input on the console.

### Sample 1:

Input

> Hello  

Output

> Hello
---

### Calculator

**Taking multi-line inputs**

  

Let's look at how multiple lines of inputs are taken in JavaScript. Please take a look at the code in the IDE.
```
process.stdin.setEncoding('utf8');
process.stdin.on('data', function(input) {
    const nums = input.trim().split('\\n');
    let x = parseInt(nums\[0\]);
    let y = parseInt(nums\[1\]);
    // Complete the code
});
```
You might be wondering, what does the following line of code do. Let's break it down.

>    const nums = input.trim().split('\\n');

Here, the `input` received from the user is first trimmed using the inbuilt JavaScript string method `**trim()**` to remove any leading or trailing whitespace. Then, it is split into an array using `**split('\n')**` (another string method in JavaScript). This assumes that the input contains two newline-separated values (perhaps entered as two separate lines). Note that, the character sequence **'\\n'** represents a newline character. It is an escape sequence that is used to denote the end of a line in a string.

The resulting array, `nums`, will contain two elements, where `nums[0]` is the first entered value, and `nums[1]` is the second entered value.

### Task

Complete the given program which should do the following:

*   Take two integer inputs, each on a separate line.
*   Calculate their sum and difference.
*   Output `sum` and `difference` to the console on **separate** lines.

### Sample 1:

Input
35

58

Output

 23

 12

```
process.stdin.setEncoding('utf8');

process.stdin.on('data', function(input) {

  const nums = input.trim().split('\\n');

  let x = parseInt(nums\[0\]);

  let y = parseInt(nums\[1\]);

  // Complete the code

  console.log(x+y);

  console.log(nums\[0\]-nums\[1\]);

});
```
**String Concatenation:** When you use `console.log(nums[0] + nums[1]);`, `nums[0]` and `nums[1]` are still strings (even though they look like numbers). The `+` operator, when applied to strings, concatenates them. So, `"5" + "10"` results in `"510"`.

**Numerical Operations:** When you use `console.log(nums[0] - nums[1]);`, JavaScript implicitly converts the strings to numbers because the `-` operator is not defined for strings. So, `"5" - "10"` results in `-5`.

**Addition with Numbers:** When you use `console.log(x + y);`, `x` and `y` are already parsed as numbers using `parseInt`. Therefore, the `+` operator performs numerical addition, so `5 + 10` results in `15`.
---
## Terneray operaor:
```
let age=10;
let name=age>=10 ? "pedrp" : "ppppp"; //pedro
```
---
## Output snippet
```
process.stdin.setEncoding('utf8');
process.stdin.on('data', function(input) {
    const nums = input.trim().split('\n');
    let x = parseInt(nums[0]), y = parseInt(nums[1]);
    console.log(x, y, x + y);
});
```
- Explanation:

- a = 5, b = 9 and a + b = 14. 
By default - output on a single line is space separated.
---
## Output snippet
*   Accepts 5 inputs given on 5 separate lines. Each input is an integer 𝑁
*   _N_
*   **For each test cases, prints out the integer** 𝑁
*   _N_ to console on a separate line (our [**Input mirror**](https://www.codechef.com/learn/BP00BP01/problems/GS05) problem)

### Sample 1:

Input

11 123 34 22 45

  

Output

  

11 123 34 22 45

### Explanation:

  

Since the count of test cases is 5 -> we accept 5 inputs and print 5 outputs

  

*   using while loop

  

```

process.stdin.setEncoding('utf8');

process.stdin.on('data', function(input) {

  const lines = input.trim().split('\\n');

  var i=0;

  while(i<lines.length){

  console.log(lines\[i\]);

  i++;

  }

});

```

using for loop

  
```

// Complete the code

process.stdin.setEncoding('utf8');
process.stdin.on('data', function(input) {
    // Split the input into lines
    const lines = input.trim().split('\\n');
    
    // Loop through each line and print it out
    for (let i = 0; i < lines.length; i++) {
        console.log(lines\[i\]);
    }

});

```
---
### Test cases with multiple lines of input

In the previous problem, we had 𝑡

_t_ test cases and each test case had 1 line of input.

However, each test case can have multiple lines of input as well.

### Task

Lets write a program in the IDE which performs the following

*   The 1st line of input is an **integer** 𝑡
*   _t_ - the count of test cases
*   Each test case consists of 2 lines of input
*   The 1st line of input has 2 space separated integers - accept them as variables 𝐴
*   _A_ and 𝐵
*   _B_
*   The 2nd line of input has 3 space separated integers - accept them as variables 𝐶
*   _C_, 𝐷
*   _D_ and 𝐸
*   _E_
*   For each test case - output all integers on a single line

### Sample 1:

Input

3 

1 2 

3 4 5

11 22

33 44 55 

1 23 

456 789 101112

  

Output

  

1 2 3 4 5 

11 22 33 44 55 

1 23 456 789 101112

### Explanation:

2 lines of input in test case 1:

1 2

3 4 5

Output 1: 1 2 3 4 5

2 lines of input in test case 2:

11 22

33 44 55

Output 2: 11 22 33 44 55

2 lines of input in test case 3:

1 23

456 789 101112

Output 3: 1 23 456 789 101112

// your code goes here
```
process.stdin.setEncoding('utf8');

process.stdin.on('data', function(input){

  const lines= input.split('\\n');  

  const t= lines\[0\];

  for(let i=1; i<=2\*t;i++){

   let inputs=lines\[i\];

   console.log(inputs);

  }

});
```
---
### String mirror - Double strings

Write a program in the IDE which does the following

*   Accepts the count of test cases - 𝑡
*   _t_ - in the 1st line
*   First line of each test case consists of a string 𝑆
*   _S_
*   You need to perform the following operation
*   Create a variable 𝑋
*   _X_ which contains the string 𝑆
*   _S_ concatenated with the string 𝑆
*   _S_
*   Output 𝑋
*   _X_ for each test case

### Sample 1:

Input:
3 

ab 

bc 

cd

Output:
abab
 
bcbc 

cdcd

```
process.stdin.setEncoding('utf8');

process.stdin.on('data', function(input){

  var lines = input.trim().split('\\n');

  var mun = parseInt(lines\[0\]);

  for(let i=1;i<=mun;i++){

    console.log(lines\[i\]+lines\[i\]);

  }

});
```
---

