# ATJS COMPILER
<img width="250" height="250" alt="logo" src="https://github.com/user-attachments/assets/c88957c0-94c2-4947-b1da-150bb359ae9c" />
#This is *Again Translator to Java Script*
####Example code
```rust
create var x = 5
if (->x is val 5) {
  printvar([:x:])
} else {
  printlog(["ooh"])
}
```
this lang is translates to javascript
### How to Run

1. Clone this repository and compile the translator (or use the precompiled binary):
```bash
pp -o atjs translator.pl
```

2. Create your script file `main.atjs` and run the compiler:
```bash
./atjs main.atjs main.js
```

3. Run the compiled JavaScript code with Node.js:
```bash
node main.js
```
