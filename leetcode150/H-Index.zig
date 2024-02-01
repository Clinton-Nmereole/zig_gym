const std = @import("std");

fn HIndex(nums: []u64) u64 {
    var max_hindex: u64 = 0;
    for (0..nums.len) |i| {
        var papers_with_equalorgreater_citations: u64 = 1;
        if (nums[i] == 0) continue;
        var hindex: u64 = 0;
        for (i + 1..nums.len) |j| {
            if (nums[j] >= nums[i]) {
                papers_with_equalorgreater_citations += 1;
            }
        }
        if (papers_with_equalorgreater_citations == nums[i]) {
            hindex = nums[i];
        }
        max_hindex = @max(max_hindex, hindex);
    }
    return max_hindex;
}

pub fn main() !void {
    var nums = [_]u64{ 3, 0, 6, 1, 5 };
    std.debug.print("{}\n", .{HIndex(&nums)});
}
