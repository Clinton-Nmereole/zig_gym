const std = @import("std");

fn RemoveElement(nums: []u32, val: u32) u8 {
    var result: u8 = 0;
    for (nums, 0..) |_, i| {
        if (nums[i] != val) {
            result += 1;
        }
    }
    return result;
}

pub fn main() void {
    var nums = [_]u32{ 3, 2, 2, 3 };
    const val = 3;
    std.debug.print("{any}", .{RemoveElement(&nums, val)});
}

test "RemoveElement" {
    try std.testing.expectEqual(@as(u8, 2), RemoveElement(&[_]u32{ 3, 2, 2, 3 }, 3));
    try std.testing.expectEqual(@as(u8, 5), RemoveElement(&[_]u32{ 0, 1, 2, 2, 3, 0, 4, 2 }, 2));
}

// ==Solution Explanation==
// We make a result variable and initialize it to 0 to keep track of the elements we don't want removed.
// We simply iterate through the array and check if the element is not equal to the value we want to remove.
// If it isn't equal to the value we want to remove, we increment the result variable by 1.
// Finally, we return the result variable.
