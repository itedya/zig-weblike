const std = @import("std");
const c = @cImport({
    @cInclude("raylib.h");
});

const WINDOW_WIDTH: u32 = 800;
const WINDOW_HEIGHT: u32 = 600;

const ClockwiseSpacing = struct {
    top: u32,
    right: u32,
    bottom: u32,
    left: u32,

    pub fn totalWidth(self: ClockwiseSpacing) u32 {
        return self.left + self.right;
    }

    pub fn totalHeight(self: ClockwiseSpacing) u32 {
        return self.top + self.bottom;
    }
};

const LayoutSettings = struct {
    direction: LayoutDirection,
    gap: u32,
};

const LayoutDirection = enum {
    ROW,
    COLUMN,
};

const Color = struct {
    red: u8,
    green: u8,
    blue: u8,
};

const Styling = struct {
    margin: ClockwiseSpacing,
    padding: ClockwiseSpacing,
    layout: LayoutSettings,
    backgroundColor: Color,
};

const Component = struct {
    styling: Styling,
    component: *Component,
};

pub fn main() void {
    c.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "Genius Gate");

    while (!c.WindowShouldClose()) {
        c.BeginDrawing();
        defer c.EndDrawing();

        c.ClearBackground(c.WHITE);
    }

    c.CloseWindow();
}
