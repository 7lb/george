const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    {
        const george = b.addExecutable(.{
            .name = "george",
            .root_source_file = .{ .path = "george/main.cpp" },
            .target = target,
            .optimize = optimize,
        });

        george.addCSourceFiles(&.{
            "george/test.cpp",
        }, &.{
            "-std=c++20",
            "-Wall",
            "-Wextra",
        });

        george.addIncludePath(.{ .path = "." });
        george.linkLibCpp();
        b.installArtifact(george);

        const runCmd = b.addRunArtifact(george);
        runCmd.step.dependOn(b.getInstallStep());

        const runStep = b.step("run", "Run george");
        runStep.dependOn(&runCmd.step);
    }
}
