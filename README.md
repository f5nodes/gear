# gear node

## Installing

1. Run the script:

```sh
. <(wget -qO- sh.f5nodes.com) gear
```

2. Wait till the end of installation, then enter your nodename in the input.

## Commands

#### Check node logs:

```sh
journalctl -n 100 -f -u gear
```

**CTRL + C** to exit logs