# learn-lua-source-code

This github will record my learning notes about reading lua source code.

## Before reading

As a lua programer, you learn the coding grammar, write down your code and it works. But you never know how it works behind this "black box".
So it would be better to look into its core. How the VM machine works, how lua script code is parsed (to bytecode), how lua gc works.

## Roadmap

I plan to learn lua source code following this roadmap below:

1. Read the book \< The Implementation of Lua 5.0 \>.
2. Read the book \< A No－Frills Introduction to Lua5.1 VM Instructions \>.
3. By reading these two books, also give a cursory look at the whole architexture of lua source code, by using a top-down mode. And try to understand how lua VM works.
4. Starting a formal reading, by the following orders:
   1. Read the implementation of lua base datastruct;
   2. Read the implementation of coroutine;
   3. Read the implementation of gabarge collection;
   4. ...
5. Finally looks into lexical analysis and gramatical analysis in lua.

This roadmap is based on two answers from a Zhihu questions:
[如何学习 Lua VM 的源码？ - 冯东的回答 - 知乎](https://www.zhihu.com/question/20617406/answer/18815367)
[如何学习 Lua VM 的源码？ - codedump的回答 - 知乎](https://www.zhihu.com/question/20617406/answer/15648562)

And it may change during this studying.

## Directory
- bin: binary files (include lua.exe, luac.exe, dll, lib, ...);
- doc: reading notes (in markdown format);
- lua-5.1.5: lua source codes;
- lua-windows-vs: lua vs project;

## Others

The lua source code is based on lua 5.1.5.
After finishing my roadmap, i may also take a look in any high version. There are changes like new features, gc strategy, performance optimization and so on.