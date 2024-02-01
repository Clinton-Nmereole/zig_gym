const std = @import("std");

fn canCompleteCircuit(gas: []i64, cost: []i64) i64 {
    var sum_gas: i64 = 0;
    var sum_cost: i64 = 0;
    for (gas) |g| {
        sum_gas += g;
    }
    for (cost) |c| {
        sum_cost += c;
    }
    if (sum_gas < sum_cost) return -1;
    var total: i64 = 0;
    var start: i64 = 0;
    for (gas, 0..) |g, i| {
        total += g - cost[i];
        if (total < 0) {
            var pseudo_start: i64 = @intCast(i);
            start = pseudo_start + 1;
            total = 0;
        }
    }
    return start;
}

pub fn main() !void {
    var gas = [_]i64{ 1, 2, 3, 4, 5 };
    var cost = [_]i64{ 3, 4, 5, 1, 2 };
    std.debug.print("{any}\n", .{canCompleteCircuit(&gas, &cost)});
}
