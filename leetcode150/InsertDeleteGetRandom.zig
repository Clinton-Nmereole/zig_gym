const std = @import("std");
const rand = std.crypto.random;

const RandomizedSet = struct {
    items: std.ArrayList(u32),

    fn init() RandomizedSet {
        return RandomizedSet{
            .items = std.ArrayList(u32).init(std.heap.page_allocator),
        };
    }

    fn Insert(self: *RandomizedSet, val: u32) !bool {
        for (self.items.items) |item| {
            if (item == val) {
                return false;
            }
        }
        try self.items.append(val);
        return true;
    }

    fn Remove(self: *RandomizedSet, val: u32) !bool {
        for (self.items.items, 0..) |item, i| {
            if (item == val) {
                var a = self.items.orderedRemove(i);
                _ = a;
                return true;
            }
        }
        return false;
    }

    fn GetRandom(self: *RandomizedSet) u32 {
        return self.items.items[rand.intRangeAtMost(usize, 0, self.items.items.len - 1)];
    }
};

pub fn main() !void {
    var s = RandomizedSet.init();
    std.debug.print("{}\n", .{try s.Insert(1)});
    std.debug.print("{}\n", .{try s.Insert(2)});
    std.debug.print("{}\n", .{try s.Insert(3)});
    std.debug.print("{}\n", .{try s.Remove(2)});
    std.debug.print("{}\n", .{try s.Insert(2)});
    std.debug.print("{}\n", .{try s.Remove(11)});
    std.debug.print("{d}", .{s.GetRandom()});
}
