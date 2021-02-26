-------------------------------------------------
-- Thermal Widget for Awesome Window Manager
-- Shows the Temperature of the CPU

-- @author Andreas Gschossmann 
-- @copyright 2019 Andreas Gschossmann
-------------------------------------------------

local wibox = require("wibox")
local watch = require("awful.widget.watch")
local spawn = require("awful.spawn")

local THEME = "tick"

local HOME = os.getenv("HOME")
local PATH_TO_ICON = HOME .. "/.config/awesome/themes/" .. THEME .. "/icons/thermal/thermal.svg"

--local GET_BRIGHTNESS_CMD = "light -G"   -- "xbacklight -get"
--local INC_BRIGHTNESS_CMD = "light -A 5" -- "xbacklight -inc 5"
--local DEC_BRIGHTNESS_CMD = "light -U 5" -- "xbacklight -dec 5"

local thermal_text = wibox.widget.textbox()
thermal_text.text = "30°C"

local thermal_icon = wibox.widget {
    {
        image = PATH_TO_ICON,
        resize = false,
        widget = wibox.widget.imagebox
    },
--    top = 3,
    widget = wibox.container.margin
--    layout = wibox.container.margin(_, 0, 0, 3)
} 


local thermal_widget = wibox.widget {
    thermal_icon,
    thermal_text,
    layout = wibox.layout.fixed.horizontal
}

return thermal_widget
