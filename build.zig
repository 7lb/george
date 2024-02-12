const std = @import("std");
const buildFlecs = @import("vendor/flecs.zig").buildFlecs;

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const flecs = buildFlecs(b, target, optimize);

    {
        const george = b.addExecutable(.{
            .name = "george",
            .root_source_file = .{ .path = "dummy.zig" },
            .target = target,
            .optimize = optimize,
        });

        george.addCSourceFiles(.{ .files = &.{
            "george/main.cpp",
            "george/test.cpp",
        }, .flags = &.{
            "-std=c++20",
            "-Wall",
            "-Wextra",
        } });

        george.addIncludePath(.{ .path = "." });
        george.addIncludePath(b.dependency("flecs", .{}).path("include"));

        george.linkLibrary(flecs);
        george.linkLibCpp();

        b.installArtifact(george);

        const runCmd = b.addRunArtifact(george);
        runCmd.step.dependOn(b.getInstallStep());

        const runStep = b.step("run", "Run george");
        runStep.dependOn(&runCmd.step);
    }
}
