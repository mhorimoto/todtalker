# UECS TOD Talker Daemon

UECSインタフェースを使ってDate/Timeを送出するデーモン

まだフルスペックではない。

Version 0.01  
horimoto@holly-linux.com

Python3で動作する。

## 必要なモジュール

 * import lcd_i2c as lcd   (RPiSpiを使う)
 * import datetime
 * import time
 * import configparser
 * import netifaces
 * from socket import *

