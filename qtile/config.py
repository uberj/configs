from libqtile.manager import Key, Screen, Group, Click, Drag
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook



# The bindings below are for use with a Kinesis keyboard, and may not make
# sense for standard keyboards.
alt = "mod1"
modkey = alt
control = "control"
keys = [
    # XMONAD bindings
    #Key([modkey], "k", lazy.layout.down()),
    #Key([modkey], "j", lazy.layout.up()),
    #Key([modkey, "shift"], "k", lazy.layout.shuffle_down()),
    #Key([modkey, "shift"], "j", lazy.layout.shuffle_up()),
    #Key([modkey], "i", lazy.layout.grow()),
    #Key([modkey], "m", lazy.layout.shrink()),
    #Key([modkey], "n", lazy.layout.normalize()),
    #Key([modkey], "o", lazy.layout.maximize()),
    #Key([modkey, "shift"], "space", lazy.layout.flip()),
    # TILE bindings
    Key([modkey], "m", lazy.layout.swap_down()),
    Key([modkey], "n", lazy.layout.swap_up()),
    Key([modkey], "b", lazy.layout.shift()),
    Key([modkey], "k", lazy.layout.next()),
    Key([modkey], "j", lazy.layout.previous()),
    Key([modkey], "l", lazy.layout.increase_ratio()),
    Key([modkey], "h", lazy.layout.decrease_ratio()),
    Key([modkey], "bracketright", lazy.layout.increase_nmaster()),
    Key([modkey], "bracketleft", lazy.layout.decrease_nmaster()),
    Key([modkey, "shift"], "k", lazy.layout.up()),
    Key([modkey, "shift"], "j", lazy.layout.down()),
    Key([modkey, "shift"], "space", lazy.layout.flip()),
    # Change screen focus
    Key([modkey], "q", lazy.to_prev_screen()),
    Key([modkey], "w", lazy.to_next_screen()),
    Key([modkey], "o", lazy.layout.maximize()),

#   Screen Brightness
    Key([alt, "shift"], "z", lazy.spawn("xbacklight -dec 30 -time 1")),
    Key([alt, "shift"], "x", lazy.spawn("xbacklight -inc 30 -time 1")),

# LAYOUT CHANGERS

    # kill current window
    Key([alt, "shift"], "c", lazy.window.kill()),

    # cycle to previous group
    Key([alt], "Left", lazy.group.prevgroup()),

    # cycle to next group
    Key([alt], "Right", lazy.group.nextgroup()),

    Key([alt, "shift"], "Return", lazy.spawn("urxvt +j")),
    #Key([alt, "shift"], "Return", lazy.spawn("gnome-terminal")),
    Key([alt], "period",    lazy.nextlayout()),
    Key([alt], "comma",    lazy.prevlayout()),

    Key([alt], "p", lazy.spawn("dmenu_run")),
    Key([control, alt], "l", lazy.spawn("xscreensaver-command --lock")),

    # Window Bindings
    Key([alt], "t", lazy.window.toggle_floating()),

    # Restart
    Key([alt, "shift"], "q", lazy.spawn("echo 'restart' | qsh")),
]

# Next, we specify group names, and use the group name list to generate an appropriate
# set of bindings for group switching.
groups = [
    Group("1"),
    Group("2"),
    Group("3"),
    Group("4"),
    Group("5"),
    Group("6"),
    Group("7"),
    Group("8"),
    Group("9"),
]

mouse = [
    Drag([alt], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([alt], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([alt], "Button2", lazy.window.bring_to_front())
]

for i in groups:
    keys.append(
        Key([alt], i.name, lazy.group[i.name].toscreen())
    )
    keys.append(
        Key([alt, "shift"], i.name, lazy.window.togroup(i.name))
    )


# Two simple layout instances:
layouts = [
    layout.Tile(),
    layout.Max(),
    layout.Stack(),
    layout.RatioTile(),
]

theme = {
    "font":"inconsolata"
    ,"fontsize":11
    ,"background":"#000000"
    ,"foreground":"#efefef"
}


# I have two screens, each of which has a Bar at the bottom. Each Bar has two
# simple widgets - a GroupBox, and a WindowName.
screens = [
        Screen(
            bottom = bar.Bar(
                [
                    widget.GroupBox(),
                    widget.WindowName(font='Consolas',fontsize=12, margin_x=6),
                    widget.CurrentLayout(**theme),
                    widget.Battery(font='Consolas',fontsize=12, margin_x=6),
                    widget.Sep(),
                    widget.CPUGraph(),
                    widget.SwapGraph(foreground='#FFFFE0'),
                    widget.Systray(),
                    widget.Sep(),
                    widget.Prompt(),
                    widget.Clock('%H:%M:%S %d.%m.%Y',
                        font='Consolas', fontsize=12, padding=6),
                    ],
                30,
                ),
            ),
        Screen(
            bottom = bar.Bar(
                [
                    widget.GroupBox(),
                    widget.WindowName(font='Consolas',fontsize=12, margin_x=6),
                    ],
                30,
                ),
            )
        ]
#### SPAWN DAEMONS ####
@hook.subscribe.startup
def runner():
    import subprocess

    """
    Run after qtile is started
    """

    subprocess.Popen("/home/uberj/.startup.sh")
    subprocess.Popen(['keychain', '/home/uberj/.ssh/id_rsa'])
