const std = @import("std");

pub fn buildFlecs(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode) *std.Build.Step.Compile {
    const flecs = b.addStaticLibrary(.{
        .name = "flecs",
        .target = target,
        .optimize = optimize,
    });

    flecs.defineCMacro("flecs_EXPORTS", "");

    const flecsDep = b.dependency("flecs", .{});
    flecs.addCSourceFiles(.{ .dependency = flecsDep, .files = &.{
        "src/bootstrap.c",
        "src/entity.c",
        "src/entity_filter.c",
        "src/entity_name.c",
        "src/filter.c",
        "src/iter.c",
        "src/misc.c",
        "src/observable.c",
        "src/observer.c",
        "src/os_api.c",
        "src/poly.c",
        "src/query.c",
        "src/search.c",
        "src/stage.c",
        "src/value.c",
        "src/world.c",

        "src/addons/alerts.c",
        "src/addons/app.c",
        "src/addons/coredoc.c",
        "src/addons/doc.c",
        "src/addons/flecs_cpp.c",
        "src/addons/http.c",
        "src/addons/journal.c",
        "src/addons/log.c",
        "src/addons/meta_c.c",
        "src/addons/metrics.c",
        "src/addons/module.c",
        "src/addons/monitor.c",
        "src/addons/parser.c",
        "src/addons/plecs.c",
        "src/addons/rest.c",
        "src/addons/snapshot.c",
        "src/addons/stats.c",
        "src/addons/timer.c",
        "src/addons/units.c",

        "src/addons/expr/deserialize.c",
        "src/addons/expr/serialize.c",
        "src/addons/expr/utils.c",
        "src/addons/expr/vars.c",

        "src/addons/meta/api.c",
        "src/addons/meta/cursor.c",
        "src/addons/meta/meta.c",
        "src/addons/meta/serialized.c",

        "src/addons/os_api_impl/os_api_impl.c",

        "src/addons/pipeline/pipeline.c",
        "src/addons/pipeline/worker.c",

        "src/addons/rules/api.c",
        "src/addons/rules/compile.c",
        "src/addons/rules/engine.c",
        "src/addons/rules/trav_cache.c",
        "src/addons/rules/trav_down_cache.c",
        "src/addons/rules/trav_up_cache.c",
        "src/addons/rules/trivial_iter.c",

        "src/addons/system/system.c",

        "src/addons/json/deserialize.c",
        "src/addons/json/json.c",
        "src/addons/json/serialize.c",
        "src/addons/json/serialize_iter_rows.c",
        "src/addons/json/serialize_type_info.c",

        "src/datastructures/allocator.c",
        "src/datastructures/bitset.c",
        "src/datastructures/block_allocator.c",
        "src/datastructures/hash.c",
        "src/datastructures/hashmap.c",
        "src/datastructures/map.c",
        "src/datastructures/name_index.c",
        "src/datastructures/sparse.c",
        "src/datastructures/stack_allocator.c",
        "src/datastructures/strbuf.c",
        "src/datastructures/switch_list.c",
        "src/datastructures/vec.c",

        "src/storage/entity_index.c",
        "src/storage/id_index.c",
        "src/storage/table.c",
        "src/storage/table_cache.c",
        "src/storage/table_graph.c",
    }, .flags = &.{
        "-std=gnu99",
        "-fvisibility=hidden",
    } });

    flecs.linkLibC();
    flecs.addIncludePath(flecsDep.path("/include"));

    return flecs;
}
