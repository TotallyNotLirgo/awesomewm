local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
require("theme.colors")
local gears = require("gears")
clickable_container = require("modules.clickable-container")
local cal = require("ui.bar.calendar")
-- local markup = require("markup")

-- Create a textclock widget
mytextclock = wibox.widget {
  {
    {
      {
        widget = wibox.widget.textclock('<span font="Product Sans Bold 12">%a %b %d, %I:%M %p </span>', 1),
        align = "center",
      },
      widget = wibox.container.margin,
      left = dpi(20),
      right = dpi(15),
    },
    widget = clickable_container
  },
  widget = wibox.container.background,
  shape = gears.shape.rounded_bar,
}

mytextclock:connect_signal("button::press", function(_, _, _, button)
  if button == 1 then cal_toggle() end
end)

return mytextclock
