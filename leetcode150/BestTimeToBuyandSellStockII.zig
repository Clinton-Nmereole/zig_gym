const std = @import("std");

fn BestTimeToBuyandSellStockII(nums: []u32) u32 {
    var profit: u32 = 0;
    for (1..nums.len) |i| {
        if (nums[i] > nums[i - 1]) {
            profit += nums[i] - nums[i - 1];
        }
    }
    return profit;
}

pub fn main() !void {
    var nums = [_]u32{ 7, 1, 5, 3, 6, 4 };
    std.debug.print("{}\n", .{BestTimeToBuyandSellStockII(&nums)});
}
