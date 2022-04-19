## 1. Introduction

Main novalties of Lua 5.0 :

- Register-based virtual machine;
- New algorithm for optimizing tables used as arrays;
- The implementation of closures;
- The addition of coroutines;



## 2. An overview of lua's design and implementation

Goals in the implementation of Lua :

- Simplicity;
- Efficiency;
- Portability;
- Embeddability;
- Low embedding cost;



## 3. The representation of values

> Lua represents values as **tagged unions** (tagged → tag for type).

Data struct defined as following:

```C
typedef struct {
  int t;
  Value v;
} TObject;

typedef union {
  GCObject* gc;
  void* p;
  lua_Number n;
  int b;
} Value;
```



## 4. Tables

In Lua 5.0, tables are implemented as hybrid data structures → they contains a **hash part** and an **array part**.

> Tables automatically and dynamically adapt their two parts according to their contents: the array part tries to store the values corresponding to **integer keys** from 1 to some limit n. Values corresponding to **non-integer keys** or to integer keys outside the array range are
stored in the hash part.

Advantages compared with old implementation:

- Access to value with interger keys is fast (no hashing);
- Less memory use (arrays use half memory than hash);



## 5. Functions and closures

- Compile time → Generate a **prototype** → Store opcode (instructions), its constant values and some debug information.
- Runtime → Generate a **closure** → Has reference to prototype, reference to its environment and an array of references to upvalues.

PS: Using **upvalues** to access outer local variables.



## 6. Threads and coroutines

Lua 5.0 implements **Asymmetric coroutines**.

- Synmetric coroutine: Symmetric coroutine facilities provide a **single control-transfer operation** that allows coroutines to explicitly pass control between themselves
- Asynmetric coroutine: Asymmetric coroutine mechanisms provide **two control-transfer operations**: one for invoking a coroutine and one for suspending it, the latter returning control to the coroutine invoker.

So synmetric is more for concurrency, while asynmetric is more for produce sequences of values (e.g. iteractor and generator).

Reference: [What is the difference between asymmetric and symmetric coroutines?](https://stackoverflow.com/questions/41891989/what-is-the-difference-between-asymmetric-and-symmetric-coroutines)



> Coroutines in Lua are **stackful**, in the sense that we can suspend a coroutine from inside any number of nested calls.

> The interpreter cannot use its internal C stack to implement calls in the interpreted code.

- Resume → Use the coroutine stack to perform calls and returns.
- Yield → Retrun to the previous interpreter invocation, leaving the coroutine stack with any pending calls.



## 7. The virtual machine

The Lua VM compiles lua code into "opcodes", and build a **prototype** (typedef struct Proto), which contains an array with the opcodes for the function and an array of Lua values with all constants used by the function.



The VM is a **register-based virtual machine**.

Pros:

- Avoid "Push" and "Pop" → Avoid copy and reduce the number of instructions →  **High preformance**.

Cons:

- Code size → Large size of instruction (4 bytes for lua)
- Decoding overhead → Decode instruction's operands



35 instructions in Lua VM.

32 bits for one instruction:

- OP field: 6 bits
- Field A: 8 bits → register that hold the result
- Field B and C: 9 bits * 2 → register for operands



> Lua uses two parallel stacks for function calls.

- One stack has one entry for each active function. This entry stores the function being called, the return address when the function does a call, and a base index, which points to the activation record of the function. 
- The other stack is simply a large array of Lua values that keeps those activation records. Each activation record keeps all temporary values of the function (parameters, local variables, etc.).

In short, one stack for function entry points, one stack for all paramaters.

## 8. Conclusion



