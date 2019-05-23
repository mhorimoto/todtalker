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

## CCM

    <?xml version="1.0" encoding="UTF-8"?>
    <UECS>
      <CCM cast="0" unit="" SR="S" LV="A-1M-0" exp="日付" detail="日付" >Date.mXX</CCM>
      <CCM cast="0" unit="" SR="S" LV="A-1M-0" exp="時刻" detail="日本標準時" >Time.mXX</CCM>
    </UECS>

## 使い方

### config.iniの変更

config.iniを変更することで、room,region,order,priorityの設定を変更することが出来る。


### 起動の方法

    systemctl enable todtalker
    systemctl start todtalker


