const std = @import("std");

fn RotateArray(nums: []i32, k: u32) []i32 {
    std.mem.reverse(i32, nums);
    std.mem.reverse(i32, nums[k..]);
    std.mem.reverse(i32, nums[0..k]);
    return nums;
}

pub fn main() void {
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7 };
    const k = 3;
    std.debug.print("{any}", .{RotateArray(&nums, k)});
}

// ==Solution Explanation==
// Here we use the idea of reversing parts of the array to fit our needs.
// Using the std.mem.reverse function, we can reverse the array in place.
// We also use the std.mem.reverse function to reverse the first k elements of the array.
// Finally, we use the std.mem.reverse function to reverse the last k elements of the array.
// This completes our solution.
// Given [1, 2, 3, 4, 5, 6, 7], k = 3, return [5, 6, 7, 1, 2, 3, 4].
// We first reverse the given input, so now we have [7, 6, 5, 4, 3, 2, 1].
// next we reverse the array from index k to the end of the array. so we have [7,6,5,1,2,3,4].
// Finally, we reverse the array from index 0 to k. so we have [5,6,7,1,2,3,4].
