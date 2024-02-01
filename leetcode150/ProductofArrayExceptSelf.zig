const std = @import("std");

fn ProductofArrayExceptSelf(nums: []i64) !std.ArrayList(i64) {
    var ans = std.ArrayList(i64).init(std.heap.page_allocator);
    for (nums) |num| {
        try ans.append(num);
    }
    for (0..nums.len) |i| {
        var prod: i64 = 1;
        for (0..nums.len) |j| {
            if (j == i) {
                continue;
            }
            prod *= nums[j];
        }
        ans.items[i] = prod;
    }
    return ans;
}

pub fn main() !void {
    var nums = [_]i64{ 0, 2, 3, 4 };
    var nums2 = nums;
    nums2[0] = 0;
    std.debug.print("{any}\n", .{ProductofArrayExceptSelf(&nums)});
    //std.debug.print("{any}\n", .{nums2});
    //std.debug.print("{any}\n", .{nums});
}
