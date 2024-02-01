const std = @import("std");
const heap = std.sort.heap;

fn MajorityElement(nums: []u32) u32 {
    heap(u32, nums, {}, std.sort.asc(u32));
    return nums[nums.len / 2];
}

pub fn main() void {
    var nums = [_]u32{ 3, 2, 3 };
    std.debug.print("{any}", .{MajorityElement(&nums)});
}

// ==Solution Explanation==
// We want to return the majority element in the array.
// The majority element is the element that appears more than ⌊ n/2 ⌋ times. so it appears more than half of the time.
// So we can find the majority element by sorting the array. If the array is sorted then the element at position n/2 will be the majority element.
// This is because if it appears more than half the time then when sorted it will occupy the middle position.
// Example:
// Input: [3, 2, 3]
// Output: 3
// if we sort the array we get [2, 3, 3] and since 3 is at position n/2 it is the majority element.
// In this case we sort the array using heap sort and then return the element at position n/2
