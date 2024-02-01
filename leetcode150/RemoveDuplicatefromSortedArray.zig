const std = @import("std");

fn RemoveDuplicate(nums: []u32) u32 {
    if (nums.len == 0) return 0;
    var result: u32 = 0;
    for (1..nums.len) |i| {
        if (nums[i] != nums[result]) {
            result += 1;
            nums[result] = nums[i];
        }
    }
    return result + 1;
}

pub fn main() void {
    var nums = [_]u32{ 0, 0, 1, 1, 1, 2, 2, 3, 3, 4 };
    std.debug.print("{d}", .{RemoveDuplicate(&nums)});
    std.debug.print("{any}", .{nums});
}

test "RemoveDuplicate" {
    try std.testing.expectEqual(@as(u32, 2), RemoveDuplicate(&[_]u32{ 3, 2, 2, 3 }));
    try std.testing.expectEqual(@as(u32, 5), RemoveDuplicate(&[_]u32{ 0, 1, 2, 2, 3, 0, 4, 2 }));
    try std.testing.expectEqual(@as(u32, 2), RemoveDuplicate(&[_]u32{ 1, 1, 2 }));
}

// ==Solution Explanation==
// We make a result variable and initialize it to 0 to keep track of the elements we don't want removed.
// We iterate through the array starting at position 1.
// We check if the element at position 1 is not equal to the element at position 0.
// If it isn't equal to the element at position 0, we increment the result variable by 1.
// We then set the element at position result to the element at position of the loop
// So in essence we start with two pointers at position 0 and 1, we then move the pointer at position 1 until we find an element that isn't equal to the element at position 0.
// Once we find an element that isn't equal to the element at position 0, we increment the result variable by 1. so the first pointer now points to position 1.
// We then set the element at the first pointer to the element at the second pointer.
// when we finish we return the result + 1. This is because result represents the index of the last element after we delete duplicates.
// so to get the number of unique elements we return result + 1.
