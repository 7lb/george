What and Why
================================================================================

This is a test repo. The goal is to build a c++ program (called george) by using  
the zig build system.

Another goal is to use the zig package manager to download a C dependency  
(in this case: flecs) and also build that with the zig build system, and tie  
everything together simply and nicely.

Another goal is that no modification to the repository of the dependency should  
be needed. We should be able to provide zig with instructions on how to build  
everything without the need for a build.zig and / or a build.zig.zon to be  
added to the downloaded dependency.

The reasoning behind the above requirement is that we can't be sure it's always  
possible to contribute to upstream, for one reason or another.

How
================================================================================

Zig 0.11 won't work, zig master (or a 0.12 version when that is released) is  
needed.

To build, simply run
```sh
$ zig build
```

To run george, run
```sh
$ zig build run
```

You should see this output
```
$ zig build run
Hello, world! 5
Entity name: Bob
```

If you see the above: congratulations. You built a c++ program with a c  
dependency by using a programming language — as opposed to a DSL — to declare  
the build graph.
