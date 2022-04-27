local wezterm = require("wezterm");

return {
    font = wezterm.font_with_fallback({
        "FiraCode Nerd Font Mono",
        "PowerlineSymbols",
        "Noto Color Emoji",
        "Symbols Nerd Font Mono",
        "FreeMono",
        "DejaVu Sans Mono",
        "monospace",
    }),
    line_height = 2.0,
    harfbuzz_features = {"zero" , "ss01", "cv05"},
    color_scheme = "OneHalfDark",
}
