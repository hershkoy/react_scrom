#!/bin/bash
set -e

echo "backend starts."

service apache2 start

cat << EOB
***
  _____  ______          _______     __
 |  __ \|  ____|   /\   |  __ \ \   / /
 | |__) | |__     /  \  | |  | \ \_/ /
 |  _  /|  __|   / /\ \ | |  | |\   /
 | | \ \| |____ / ____ \| |__| | | |
 |_|  \_\______/_/    \_\_____/  |_|

Is up and running, Happy coding.
Open ports in this container:

    http    (apache):   80
    https   (apache):  443
***
EOB



while true; do sleep 1000; done
