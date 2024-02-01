const std = @import("std");

fn BesttimetoBuyandSellStock(nums: []u32) u32 {
    var max_profit: u32 = 0;
    var profit: u32 = 0;
    var l: u32 = 0;
    var r: u32 = 1;
    while (r < nums.len) : (r += 1) {
        if (nums[l] < nums[r]) {
            profit = nums[r] - nums[l];
        } else {
            l = r;
        }
        max_profit = @max(profit, max_profit);
    }
    return max_profit;
}

pub fn main() void {
    var nums = [_]u32{ 7, 1, 5, 3, 6, 4 };
    std.debug.print("{any}", .{BesttimetoBuyandSellStock(&nums)});
}

// ==Solution Explanation==
// We first define max_profit as 0 and the regular profit as 0
// Next we declare l and r as 0 and 1. These will serve as pointers for the array.
// We use a while loop to iterate through the array while the right pointer r is less than the length of the array.
// Inside the while loop we check if the value at the left pointer is less than the value at the right pointer. this is the only way profit can be made.
// If it is we set the profit to the value at the right pointer minus the value at the left pointer.
// If it is not we set the left pointer to the right pointer and continue the iteration.
// Finally we set the max_profit to the max of profit and max_profit, this is because we need to change the profit value anytime we can make a profit and make sure the max_profit is updated.
// Finally we return max_profit.
