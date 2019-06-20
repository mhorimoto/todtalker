# UECS TOD Talker Daemon

UECSインタフェースを使ってDate/Timeを送出するデーモン


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
      <CCM cast="0" unit="" SR="S" LV="A-1M-0" exp="日付" detail="日付">Date</CCM>
      <CCM cast="0" unit="" SR="S" LV="A-1M-0" exp="時刻" detail="日本標準時">Time</CCM>
      <CCM cast="0" unit="" SR="S" LV="A-1S-0" exp="機器動作状態" detail="">cnd.mXX</CCM>
    </UECS>


## 使い方

### config.iniの変更

config.iniを変更することで、room,region,order,priorityの設定を変更することが出来る。

    [NODE]
    name = TODTALKER
    vender = HOLLY
    uecsid = 10100C000001
    xmlfile = /etc/uecs/todtalker.xml
    
    [Date]
    room = 0
    region = 0
    order = 0
    priority = 1
    
    [Time]
    room = 0
    region = 0
    order = 0
    priority = 1
    
    [cnd.mXX]
    room = 0
    region = 0
    order = 0
    priority = 29

### インストールの方法

    sudo make install

 詳細は、Makefileの中を見る。


### 起動の方法

    systemctl enable todtalker
    systemctl enable scanresponse
    systemctl start todtalker
    systemctl start scanresponse
    
