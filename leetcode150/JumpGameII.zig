const std = @import("std");

fn JumpGameII(nums: []usize) usize {
    var jump: usize = 0;
    var l: usize = 0;
    var r: usize = 0;
    while (r < nums.len - 1) {
        var farthest: usize = 0;
        for (l..r + 1) |i| {
            farthest = @max(farthest, i + nums[i]);
        }
        l = r + 1;
        r = farthest;
        jump += 1;
    }
    return jump;
}

pub fn main() !void {
    var nums = [_]usize{ 2, 3, 1, 1, 4 };
    std.debug.print("{}\n", .{JumpGameII(&nums)});
}
