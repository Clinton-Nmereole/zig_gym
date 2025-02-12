const std = @import("std");

fn JumpGame(nums: []u64) bool {
    const ptr: u64 = @as(u64, nums.len - 2);
    var check: u64 = 0;
    for (1..ptr) |i| {
        if (nums[ptr - i] - check > 0) {
            check = 0;
        } else {
            check += 1;
        }
    }
    return check == 0;
}

pub fn main() !void {
    var nums = [_]u64{ 1, 1, 0, 1, 4 };
    std.debug.print("{}\n", .{JumpGame(&nums)});
}
