const std = @import("std"); // Import the standard library
const heap = std.sort.heap; // Import the heap sort algorithm from std

// ==Solution Explanation==
// We first find the larger array so as not to have an out of bounds error when replacing values.
// Merge two sorted arrays. It loops over each array using m and n respectively to know when to stop.
// The values of the 2 arrays are put into a new array which is sorted with heap sort. We return the new array.
// Space complexity: O(m + n) //size of the new array
// Time complexity : O(m + n)log(m + n) where m + n is the maximum number of elements to sort using heap sort.
fn MergeSortedArray(nums1: []u8, m: u8, nums2: []u8, n: u8) []u8 {
    var larger_arr: []u8 = undefined;
    if (nums1.len > nums2.len) {
        larger_arr = nums1;
    } else {
        larger_arr = nums2;
    }
    var new_arr = larger_arr;
    for (0..m) |i| {
        new_arr[i] = nums1[i];
    }
    for (0..n) |j| {
        new_arr[m + j] = nums2[j];
    }
    heap(u8, new_arr, {}, std.sort.asc(u8));
    return new_arr;
}

pub fn main() void {
    var nums1 = [_]u8{ 1, 2, 3, 0, 0, 0 };
    var nums2 = [_]u8{ 2, 5, 6 };
    const m = 3;
    const n = 3;
    std.debug.print("{any}", .{MergeSortedArray(&nums1, m, &nums2, n)});
}

//Unit test for MergeSortedArray
test "MergeSortedArray" {
    try std.testing.expectEqualSlices(u8, &[_]u8{ 1, 2, 2, 3, 5, 6 }, MergeSortedArray(&[_]u8{ 1, 2, 3, 0, 0, 0 }, 3, &[_]u8{ 2, 5, 6 }, 3));
    try std.testing.expectEqualSlices(u8, &[_]u8{1}, MergeSortedArray(&[_]u8{1}, 1, &[_]u8{}, 0));
}
