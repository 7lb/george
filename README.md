This is a test repo. The goal is to build a c++ program (called george) by using
the zig build system.

Another goal is to use the zig package manager to download a C dependency
(in this case: flecs) and also build that with the zig build system, and tie
everything together simply and nicely.

Another goal is that no modification to the repository of the dependency should
be needed. We should be able to provide zig with instructions on how to build
everything without the need for a build.zig and / or a build.zig.zon to be
added to the downloaded dependency. Because we can't be sure the dependency
authors might approve of that, so we just assume we can't do that.
