htc-usb-internet (htc-linux-pass-through)
=========================================

Internet "pass through" for HTC phones is only available for windows systems, because HTC phones need to have HTCSync running on their PC, and sadly HTCSync has been made only for windows. But it is possible to have internet pass-through in Linux systems too! You only need to enable NAT, make proper firewall rules (or simply disable it by "sudo ufw disable") and a simple trick that make HTC phone think you are on windows and you are using HTCSync. Run this script as super user on your Linux machine before connecting your HTC phone to your computer.
