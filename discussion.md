# Discussion and Reflection


The bulk of this project consists of a collection of five
questions. You are to answer these questions after spending some
amount of time looking over the code together to gather answers for
your questions. Try to seriously dig into the project together--it is
of course understood that you may not grasp every detail, but put
forth serious effort to spend several hours reading and discussing the
code, along with anything you have taken from it.

Questions will largely be graded on completion and maturity, but the
instructors do reserve the right to take off for technical
inaccuracies (i.e., if you say something factually wrong).

Each of these (six, five main followed by last) questions should take
roughly at least a paragraph or two. Try to aim for between 1-500
words per question. You may divide up the work, but each of you should
collectively read and agree to each other's answers.

[ Question 1 ] 

For this task, you will three new .irv programs. These are
`ir-virtual?` programs in a pseudo-assembly format. Try to compile the
program. Here, you should briefly explain the purpose of ir-virtual,
especially how it is different than x86: what are the pros and cons of
using ir-virtual as a representation? You can get the compiler to to
compile ir-virtual files like so: 

racket compiler.rkt -v test-programs/sum1.irv 

(Also pass in -m for Mac)

Answer:  
The purpose of IR-Virtual is to provide a language that possesses some racket-like syntax while functionally being very close to assembly. This makes it a good intermediate language for translation from a racket or racket-like language into assembly. Some of the cons of the implementation is that it isn't very efficcent, by the virtue that it restricts all data to be in a register for it to be used in some way. This also has the upside of requiring less forms to translate to.


[ Question 2 ] 

For this task, you will write three new .ifa programs. Your programs
must be correct, in the sense that they are valid. There are a set of
starter programs in the test-programs directory now. Your job is to
create three new `.ifa` programs and compile and run each of them. It
is very much possible that the compiler will be broken: part of your
exercise is identifying if you can find any possible bugs in the
compiler.

For each of your exercises, write here what the input and output was
from the compiler. Read through each of the phases, by passing in the
`-v` flag to the compiler. For at least one of the programs, explain
carefully the relevance of each of the intermediate representations.

For this question, please add your `.ifa` programs either (a) here or
(b) to the repo and write where they are in this file.

Answer:  
Here is the first .ifa program, test-programs/newProg1.ifa in the repo

```
Terminal Input:
racket compiler.rkt -v test-programs/newProg1.ifa

Terminal Output:
2024/05/07 22:13:55.426641 cmd_run.go:1081: WARNING: cannot start document portal: dial unix /run/user/1000/bus: connect: no such file or directory
Input source tree in IfArith:
'(if 0 (print (* (+ 4 6) (* 2 8))) (print (+ 1 1)))
ifarith-tiny:
'(if 0 (print (* (+ 4 6) (* 2 8))) (print (+ 1 1)))
'(if 0 (print (* (+ 4 6) (* 2 8))) (print (+ 1 1)))
0
'(print (* (+ 4 6) (* 2 8)))
'(* (+ 4 6) (* 2 8))
'(+ 4 6)
4
6
'(* 2 8)
2
8
'(print (+ 1 1))
'(+ 1 1)
1
1
anf:
'(let ((x1261 0))
   (if x1261
     (let ((x1262 4))
       (let ((x1263 6))
         (let ((x1264 (+ x1262 x1263)))
           (let ((x1265 2))
             (let ((x1266 8))
               (let ((x1267 (* x1265 x1266)))
                 (let ((x1268 (* x1264 x1267))) (print x1268))))))))
     (let ((x1269 1))
       (let ((x1270 1)) (let ((x1271 (+ x1269 x1270))) (print x1271))))))
ir-virtual:
'(((label lab1272) (mov-lit x1261 0))
  ((label lab1273) (mov-lit zero1286 0))
  (cmp x1261 zero1286)
  (jz lab1274)
  (jmp lab1282)
  ((label lab1274) (mov-lit x1262 4))
  ((label lab1275) (mov-lit x1263 6))
  ((label lab1276) (mov-reg x1264 x1262))
  (add x1264 x1263)
  ((label lab1277) (mov-lit x1265 2))
  ((label lab1278) (mov-lit x1266 8))
  ((label lab1279) (mov-reg x1267 x1265))
  (imul x1267 x1266)
  ((label lab1280) (mov-reg x1268 x1264))
  (imul x1268 x1267)
  ((label lab1281) (print x1268))
  (return 0)
  ((label lab1282) (mov-lit x1269 1))
  ((label lab1283) (mov-lit x1270 1))
  ((label lab1284) (mov-reg x1271 x1269))
  (add x1271 x1270)
  ((label lab1285) (print x1271))
  (return 0))
x86:
section .data
        int_format db "%ld",10,0


        global _main
        extern printf
section .text


_start: call main
        mov rax, 60
        xor rdi, rdi
        syscall


main:   push rbp
        mov rbp, rsp
        sub rsp, 224
        mov esi, 0
        mov [rbp-96], esi
        mov esi, 0
        mov [rbp-8], esi
        mov edi, [rbp-8]
        mov eax, [rbp-96]
        cmp eax, edi
        mov [rbp-96], eax
        jz lab1274
        jmp lab1282
lab1274:        mov esi, 4
        mov [rbp-88], esi
        mov esi, 6
        mov [rbp-80], esi
        mov esi, [rbp-88]
        mov [rbp-72], esi
        mov edi, [rbp-80]
        mov eax, [rbp-72]
        add eax, edi
        mov [rbp-72], eax
        mov esi, 2
        mov [rbp-64], esi
        mov esi, 8
        mov [rbp-32], esi
        mov esi, [rbp-64]
        mov [rbp-56], esi
        mov edi, [rbp-32]
        mov eax, [rbp-56]
        imul eax, edi
        mov [rbp-56], eax
        mov esi, [rbp-72]
        mov [rbp-48], esi
        mov edi, [rbp-56]
        mov eax, [rbp-48]
        imul eax, edi
        mov [rbp-48], eax
        mov esi, [rbp-48]
        lea rdi, [rel int_format]
        mov eax, 0
        call printf
        mov rax, 0
        jmp finish_up
lab1282:        mov esi, 1
        mov [rbp-40], esi
        mov esi, 1
        mov [rbp-16], esi
        mov esi, [rbp-40]
        mov [rbp-112], esi
        mov edi, [rbp-16]
        mov eax, [rbp-112]
        add eax, edi
        mov [rbp-112], eax
        mov esi, [rbp-112]
        lea rdi, [rel int_format]
        mov eax, 0
        call printf
        mov rax, 0
        jmp finish_up
finish_up:      add rsp, 224
        leave 
        ret 

The file has now been written to test-programs/newProg1.asm. You must now assemble and link it.
(Assemble on Linux, requires nasm)
        nasm test-programs/newProg1.asm
(Link on Mac, hopefully)
        ld test-programs/newProg1.o -o test-programs/newProg1
```

The first representation is the code that is in the .ifa file. The next representation shows ifArith-tiny simplifying and evaluating the code. The importance of this step doesn't really show itself for the kind of code in newProg1.ifa, but the desired output is to have a simpler version of ifArith that is easier to translate further.
With the conversion to ANF, the code becomes primarily lets and ifs. The value of this step is similar to the last one, but the translations here are less so for the purpose of code simplification and more so for getting the code to be comprised of simpler instructions, which will be easier to work with when translating further.
The next representation is IR-Virtual. The purpose of this translation layer was discussed in question 1, but the general idea is that it turns the ANF code into something that maintains some syntactical similarity to ifArith or racket, while also being similar to assembly in the types of instructions used.
The last representation is assembly, which is the desired output of the compiler, so its relevance should be obvious.

Second ifa program: test-programs/newProg2.ifa
```
Terminal Input:
racket compiler.rkt -v test-programs/newProg2.ifa

Terminal Output
2024/05/09 14:36:27.341010 cmd_run.go:1081: WARNING: cannot start document portal: dial unix /run/user/1000/bus: connect: no such file or directory
Input source tree in IfArith:
'(let* ((x (+ 2 4)) (y (* x 8))) (let* ((z (+ y 2))) (print z)))
ifarith-tiny:
'(let ((x (+ 2 4))) (let ((y (* x 8))) (let ((z (+ y 2))) (print z))))
'(let ((x (+ 2 4))) (let ((y (* x 8))) (let ((z (+ y 2))) (print z))))
'(+ 2 4)
2
4
'(let ((y (* x 8))) (let ((z (+ y 2))) (print z)))
'(* x 8)
'x
8
'(let ((z (+ y 2))) (print z))
'(+ y 2)
'y
2
'(print z)
'z
anf:
'(let ((x1261 2))
   (let ((x1262 4))
     (let ((x1263 (+ x1261 x1262)))
       (let ((x x1263))
         (let ((x1264 8))
           (let ((x1265 (* x x1264)))
             (let ((y x1265))
               (let ((x1266 2))
                 (let ((x1267 (+ y x1266)))
                   (let ((z x1267)) (print z)))))))))))
ir-virtual:
'(((label lab1268) (mov-lit x1261 2))
  ((label lab1269) (mov-lit x1262 4))
  ((label lab1270) (mov-reg x1263 x1261))
  (add x1263 x1262)
  ((label lab1271) (mov-reg x x1263))
  ((label lab1272) (mov-lit x1264 8))
  ((label lab1273) (mov-reg x1265 x))
  (imul x1265 x1264)
  ((label lab1274) (mov-reg y x1265))
  ((label lab1275) (mov-lit x1266 2))
  ((label lab1276) (mov-reg x1267 y))
  (add x1267 x1266)
  ((label lab1277) (mov-reg z x1267))
  ((label lab1278) (print z))
  (return 0))
x86:
section .data
        int_format db "%ld",10,0


        global _main
        extern printf
section .text


_start: call main
        mov rax, 60
        xor rdi, rdi
        syscall


main:   push rbp
        mov rbp, rsp
        sub rsp, 160
        mov esi, 2
        mov [rbp-80], esi
        mov esi, 4
        mov [rbp-72], esi
        mov esi, [rbp-80]
        mov [rbp-64], esi
        mov edi, [rbp-72]
        mov eax, [rbp-64]
        add eax, edi
        mov [rbp-64], eax
        mov esi, [rbp-64]
        mov [rbp-16], esi
        mov esi, 8
        mov [rbp-40], esi
        mov esi, [rbp-16]
        mov [rbp-24], esi
        mov edi, [rbp-40]
        mov eax, [rbp-24]
        imul eax, edi
        mov [rbp-24], eax
        mov esi, [rbp-24]
        mov [rbp-32], esi
        mov esi, 2
        mov [rbp-8], esi
        mov esi, [rbp-32]
        mov [rbp-56], esi
        mov edi, [rbp-8]
        mov eax, [rbp-56]
        add eax, edi
        mov [rbp-56], eax
        mov esi, [rbp-56]
        mov [rbp-48], esi
        mov esi, [rbp-48]
        lea rdi, [rel int_format]
        mov eax, 0
        call printf
        mov rax, 0
        jmp finish_up
finish_up:      add rsp, 160
        leave 
        ret 

The file has now been written to test-programs/newProg2.asm. You must now assemble and link it.
(Assemble on Linux, requires nasm)
        nasm test-programs/newProg2.asm
(Link on Mac, hopefully)
        ld test-programs/newProg2.o -o test-programs/newProg2
```

Third ifa program: test-programs/newProg3.ifa
```
Terminal Input:
racket compiler.rkt -v test-programs/newProg3.ifa

Terminal Output:
2024/05/09 14:51:03.212205 cmd_run.go:1081: WARNING: cannot start document portal: dial unix /run/user/1000/bus: connect: no such file or directory
Input source tree in IfArith:
'(let* ((a 6) (b 12) (c (* a b))) (print (+ c (+ a (- b 1)))))
ifarith-tiny:
'(let ((a 6)) (let ((b 12)) (let ((c (* a b))) (print (+ c (+ a (- b 1)))))))
'(let ((a 6)) (let ((b 12)) (let ((c (* a b))) (print (+ c (+ a (- b 1)))))))
6
'(let ((b 12)) (let ((c (* a b))) (print (+ c (+ a (- b 1))))))
12
'(let ((c (* a b))) (print (+ c (+ a (- b 1)))))
'(* a b)
'a
'b
'(print (+ c (+ a (- b 1))))
'(+ c (+ a (- b 1)))
'c
'(+ a (- b 1))
'a
'(- b 1)
'b
1
anf:
'(let ((x1261 6))
   (let ((a x1261))
     (let ((x1262 12))
       (let ((b x1262))
         (let ((x1263 (* a b)))
           (let ((c x1263))
             (let ((x1264 1))
               (let ((x1265 (- b x1264)))
                 (let ((x1266 (+ a x1265)))
                   (let ((x1267 (+ c x1266))) (print x1267)))))))))))
ir-virtual:
'(((label lab1268) (mov-lit x1261 6))
  ((label lab1269) (mov-reg a x1261))
  ((label lab1270) (mov-lit x1262 12))
  ((label lab1271) (mov-reg b x1262))
  ((label lab1272) (mov-reg x1263 a))
  (imul x1263 b)
  ((label lab1273) (mov-reg c x1263))
  ((label lab1274) (mov-lit x1264 1))
  ((label lab1275) (mov-reg x1265 b))
  (sub x1265 x1264)
  ((label lab1276) (mov-reg x1266 a))
  (add x1266 x1265)
  ((label lab1277) (mov-reg x1267 c))
  (add x1267 x1266)
  ((label lab1278) (print x1267))
  (return 0))
x86:
section .data
        int_format db "%ld",10,0


        global _main
        extern printf
section .text


_start: call main
        mov rax, 60
        xor rdi, rdi
        syscall


main:   push rbp
        mov rbp, rsp
        sub rsp, 160
        mov esi, 6
        mov [rbp-56], esi
        mov esi, [rbp-56]
        mov [rbp-64], esi
        mov esi, 12
        mov [rbp-48], esi
        mov esi, [rbp-48]
        mov [rbp-72], esi
        mov esi, [rbp-64]
        mov [rbp-40], esi
        mov edi, [rbp-72]
        mov eax, [rbp-40]
        imul eax, edi
        mov [rbp-40], eax
        mov esi, [rbp-40]
        mov [rbp-80], esi
        mov esi, 1
        mov [rbp-32], esi
        mov esi, [rbp-72]
        mov [rbp-24], esi
        mov edi, [rbp-32]
        mov eax, [rbp-24]
        sub eax, edi
        mov [rbp-24], eax
        mov esi, [rbp-64]
        mov [rbp-16], esi
        mov edi, [rbp-24]
        mov eax, [rbp-16]
        add eax, edi
        mov [rbp-16], eax
        mov esi, [rbp-80]
        mov [rbp-8], esi
        mov edi, [rbp-16]
        mov eax, [rbp-8]
        add eax, edi
        mov [rbp-8], eax
        mov esi, [rbp-8]
        lea rdi, [rel int_format]
        mov eax, 0
        call printf
        mov rax, 0
        jmp finish_up
finish_up:      add rsp, 160
        leave 
        ret 

The file has now been written to test-programs/newProg3.asm. You must now assemble and link it.
(Assemble on Linux, requires nasm)
        nasm test-programs/newProg3.asm
(Link on Mac, hopefully)
        ld test-programs/newProg3.o -o test-programs/newProg3
```


[ Question 3 ] 

Describe each of the passes of the compiler in a slight degree of
detail, using specific examples to discuss what each pass does. The
compiler is designed in series of layers, with each higher-level IR
desugaring to a lower-level IR until ultimately arriving at x86-64
assembler. Do you think there are any redundant passes? Do you think
there could be more?

In answering this question, you must use specific examples that you
got from running the compiler and generating an output.

Answer:  
The first part of this question, describing the compiler steps, was discussed a lot in the answer to the previous question. As for the second part, the only passes I might consider redundant is the ifArith-tiny step, as all it does is simplify the number of forms the language has. In some instances, it won't even change anything (see below). This step could probably be combined into the ANF step. As for additional passes, I think there really isn't anything that makes sense to split up. The conversion to x86-64 is quite large code-wise, but IR-virtual already produces code that looks very similar to assembly (see below), so there probably isn't a way to get around that.

Here's an instance of nothing really changing between ifArith and ifArith-tiny:
```
Input source tree in IfArith:
'(if 0 (print (* (+ 4 6) (* 2 8))) (print (+ 1 1)))
ifarith-tiny:
'(if 0 (print (* (+ 4 6) (* 2 8))) (print (+ 1 1)))
'(if 0 (print (* (+ 4 6) (* 2 8))) (print (+ 1 1)))
0
'(print (* (+ 4 6) (* 2 8)))
...
```

And here is an example of things changing:
```
Input source tree in IfArith:
'(let* ((x (+ 2 4)) (y (* x 8))) (let* ((z (+ y 2))) (print z)))
ifarith-tiny:
'(let ((x (+ 2 4))) (let ((y (* x 8))) (let ((z (+ y 2))) (print z))))
'(let ((x (+ 2 4))) (let ((y (* x 8))) (let ((z (+ y 2))) (print z))))
'(+ 2 4)
2
4
'(let ((y (* x 8))) (let ((z (+ y 2))) (print z)))
...
```

Here is what some IRV code looks like:
```
'(((label lab1272) (mov-lit x1261 0))
  ((label lab1273) (mov-lit zero1286 0))
  (cmp x1261 zero1286)
  (jz lab1274)
  (jmp lab1282)
  ((label lab1274) (mov-lit x1262 4))
  ((label lab1275) (mov-lit x1263 6))
  ((label lab1276) (mov-reg x1264 x1262))
  (add x1264 x1263)
  ((label lab1277) (mov-lit x1265 2))
  ((label lab1278) (mov-lit x1266 8))
  ((label lab1279) (mov-reg x1267 x1265))
  (imul x1267 x1266)
  ((label lab1280) (mov-reg x1268 x1264))
  (imul x1268 x1267)
  ((label lab1281) (print x1268))
  (return 0)
  ((label lab1282) (mov-lit x1269 1))
  ((label lab1283) (mov-lit x1270 1))
  ((label lab1284) (mov-reg x1271 x1269))
  (add x1271 x1270)
  ((label lab1285) (print x1271))
  (return 0))
```

And here is the assembly it was compiled to:
```
section .data
        int_format db "%ld",10,0


        global _main
        extern printf
section .text


_start: call main
        mov rax, 60
        xor rdi, rdi
        syscall


main:   push rbp
        mov rbp, rsp
        sub rsp, 224
        mov esi, 0
        mov [rbp-96], esi
        mov esi, 0
        mov [rbp-8], esi
        mov edi, [rbp-8]
        mov eax, [rbp-96]
        cmp eax, edi
        mov [rbp-96], eax
        jz lab1274
        jmp lab1282
lab1274:        mov esi, 4
        mov [rbp-88], esi
        mov esi, 6
        mov [rbp-80], esi
        mov esi, [rbp-88]
        mov [rbp-72], esi
        mov edi, [rbp-80]
        mov eax, [rbp-72]
        add eax, edi
        mov [rbp-72], eax
        mov esi, 2
        mov [rbp-64], esi
        mov esi, 8
        mov [rbp-32], esi
        mov esi, [rbp-64]
        mov [rbp-56], esi
        mov edi, [rbp-32]
        mov eax, [rbp-56]
        imul eax, edi
        mov [rbp-56], eax
        mov esi, [rbp-72]
        mov [rbp-48], esi
        mov edi, [rbp-56]
        mov eax, [rbp-48]
        imul eax, edi
        mov [rbp-48], eax
        mov esi, [rbp-48]
        lea rdi, [rel int_format]
        mov eax, 0
        call printf
        mov rax, 0
        jmp finish_up
lab1282:        mov esi, 1
        mov [rbp-40], esi
        mov esi, 1
        mov [rbp-16], esi
        mov esi, [rbp-40]
        mov [rbp-112], esi
        mov edi, [rbp-16]
        mov eax, [rbp-112]
        add eax, edi
        mov [rbp-112], eax
        mov esi, [rbp-112]
        lea rdi, [rel int_format]
        mov eax, 0
        call printf
        mov rax, 0
        jmp finish_up
finish_up:      add rsp, 224
        leave 
        ret 
```

[ Question 4 ] 

This is a larger project, compared to our previous projects. This
project uses a large combination of idioms: tail recursion, folds,
etc.. Discuss a few programming idioms that you can identify in the
project that we discussed in class this semester. There is no specific
definition of what an idiom is: think carefully about whether you see
any pattern in this code that resonates with you from earlier in the
semester.

Answer:  
One of the programming idioms that we identified in the code was lambda calculus. It is used as the groundwork for ifArith and ifArith-tiny. Much of the compiler program was also tail-recursive, which makes more efficent use of memory by avoiding pushing work to the stack. Another idiom we identified was pattern matching, which is used extensively in the compiler code. Pattern matching is a very neat thing, it can serve a simlar purpose as to what a novice programmer might use an if-else-if block for, but avoids needing to have large conditional statements and is generally cleaner code.

[ Question 5 ] 

In this question, you will play the role of bug finder. I would like
you to be creative, adversarial, and exploratory. Spend an hour or two
looking throughout the code and try to break it. Try to see if you can
identify a buggy program: a program that should work, but does
not. This could either be that the compiler crashes, or it could be
that it produces code which will not assemble. Last, even if the code
assembles and links, its behavior could be incorrect.

To answer this question, I want you to summarize your discussion,
experiences, and findings by adversarily breaking the compiler. If
there is something you think should work (but does not), feel free to
ask me.

Your team will receive a small bonus for being the first team to
report a unique bug (unique determined by me).

Answer:  
I found a compilation bug with the program if2. When compiling, it throws some errors if you try and compile it as a 32-bit program, so it needs to be compiled as a 64-bit program. When doing this, it causes a bad output from the program when running it. It prints 4294967290 to the console, which is what it looks like as a 64-bit integer, but it would be -6 if it is to represent a 32-bit integer. -6 is likely the intended output, so there must be an error somewhere within the compilation process that causes the 32-bit output to be printed in a 64-bit format.

Some other problematic programs include the two bool programs. They fail to compile properly, as the compiler cannot recognize `#t` or `#f`. This could be an issue with the compiler, the way the program is written, or something else completely.

[ High Level Reflection ] 

In roughly 100-500 words, write a summary of your findings in working
on this project: what did you learn, what did you find interesting,
what did you find challenging? As you progress in your career, it will
be increasingly important to have technical conversations about the
nuts and bolts of code, try to use this experience as a way to think
about how you would approach doing group code critique. What would you
do differently next time, what did you learn?

Answer:  
We generally found the compiler code quite interesting, just by the nature of what it is trying to accomplish and the fact that it is written in racket, a functional programming language. We also learned that console commands for compiling and linking programs can be quite finicky at times. We had problems in the beginning with building the test programs on linux but eventually figured it out (see compilation-procedure.txt), so this was probably the most difficult part of the project. Another thing we learned from doing question 5 is that when something breaks and the compiler is potentially at fault, it is very difficult to think of what the problem could be.