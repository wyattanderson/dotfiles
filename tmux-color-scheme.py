# -*- coding: utf-8 -*- 
import colorsys
import colortrans
import sys

LIGHTNESS_FACTOR = 1.7
DARKNESS_FACTOR = .5

def rgbhex_to_components(hexcolor):
    return [int(hexcolor[s:s+2], 16)
            for s in xrange(0, len(hexcolor), 2)]

def get_contrast_yiq(hexcolor):
    """Based on this calculation:

    http://24ways.org/2010/calculating-color-contrast/

    Determines the optimal text color (either white or black) for the given
    hexcolor background."""
    r, g, b = rgbhex_to_components(hexcolor)
    yiq = ((r*299)+(g*587)+(b*114))/1000
    return 'black' if yiq >=128 else 'colour15'

def transform_rgb(hexcolor, factor):
    """Converts hexadecimal color string to its hue, lightness and saturation
    components and applies factor to the lightness value to either lighten or
    darken the color"""
    r, g, b = rgbhex_to_components(hexcolor)
    r /= 255.0
    g /= 255.0
    b /= 255.0
    
    h, l, s = colorsys.rgb_to_hls(r, g, b)
    l = min(1, l * factor)
    r, g, b = colorsys.hls_to_rgb(h, l, s)

    return '{0:02x}{1:02x}{2:02x}'.format(
            *[min(255, int(v*255)) for v in [r, g, b]])

def status_colors(host_color):
    base = host_color

    base_rgb = colortrans.short2rgb(base)
    text_color = get_contrast_yiq(base_rgb)

    light_rgb = transform_rgb(base_rgb, LIGHTNESS_FACTOR)
    dark_rgb = transform_rgb(base_rgb, DARKNESS_FACTOR)

    bg = "colour{bg}".format(bg=base)
    cbg, cbg_hex = colortrans.rgb2short(light_rgb)
    cfg, cfg_hex = colortrans.rgb2short(dark_rgb)
    cbg = "colour{cbg}".format(cbg=cbg)
    cfg = "colour{cfg}".format(cfg=cfg)

    print u"""
source-file ~/.tmux.conf
set -g status-bg {bg}
set -g pane-active-border-fg {cbg}
set -g status-left '#[fg=colour235,bg=colour252,bold] ❐ #S #[fg=colour252,bg=colour238,nobold]#[fg=colour245,bg=colour238,bold] #(whoami) #[fg=colour238,bg={bg},nobold]'
set -g status-right '#[fg=colour238]⮂#[fg=colour252,bg=colour238,nobold] #H ⮂#[fg=colour235,bg=colour252,bold] %c'
set -g window-status-format "#[fg={fg},bg={bg}] #I #W "
set -g window-status-current-format "#[fg={bg},bg={cbg}]#[fg={cfg},bg={cbg},noreverse,bold] #I ⮁ #W #[fg={cbg},bg={bg},nobold]"
    """.format(
            fg=text_color,
            bg=bg,
            cbg=cbg,
            cfg=cfg)

if __name__ == "__main__":
    if sys.stdout.encoding is None:
        import codecs
        writer = codecs.getwriter("utf-8")
        sys.stdout = writer(sys.stdout)

    host_color = sys.argv[1]
    if ';' in host_color:
        host_color = host_color.split(';')[-1]

    status_colors(host_color)
