const std = @import("std");

fn RemoveDuplicatesII(nums: []u32) u32 {
    if (nums.len == 0) return 0;
    var result: u32 = 0;
    for (nums) |i| {
        if (result == 0 or result == 1 or nums[result - 2] != i) {
            nums[result] = i;
            result += 1;
        }
    }
    return result;
}

pub fn main() !void {
    var nums = [_]u32{ 1, 1, 1, 2, 2, 3 };
    std.debug.print("{}\n", .{RemoveDuplicatesII(&nums)});
}

// ==Solution Explanation==
// This is a similar problem to Remove Duplicates from Sorted Array I, however this time instead of just unique values,
// We need to keep at least one duplicate pair. That is in [1,1,1,2,2,3], we need to keep the pair [1,1] and [2,2].
// So we should have [1,1,2,2,3].
// We can use a similar approach as Remove Duplicates from Sorted Array I using two pointers.
// In this case we initialize a result variable to 0, then we iterate over the array.
// If the value of result is 0 or 1 then we increment result by 1. This way we always include the first 2 elements of the array.
// Next if we check if the current value we are at is not equal to the value 2 positions back. This means anytime we see 3 repetitions do not increase result.
// Finally we return result.
