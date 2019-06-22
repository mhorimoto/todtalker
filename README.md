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
    
## cnd.mXX の内容

cnd.mXXの書式内容は以下の通り。
ビット位置などに関しては1.00-E10の仕様書p.37を参照。

* Alert(5bits)

| Value | DECIMAL   | 状態                          | 実装状態 |
|:-----:|----------:|:------------------------------|:--------:|
| 00000 |         0 | 正常                          |    完    |
| 00001 |  67108864 | 初期化完了                    |    未    |
| 00010 | 134217728 | Shutdown割り込み発生          |    未    |
| ???xx |           | 予約                          |          |

* Attention(6bits)

| Value  | DECIMAL   | 状態                          | 実装状態 |
|:------:|----------:|:------------------------------|:--------:|
| 000000 |         0 | 正常                          |    完    |
| 000001 |   1048576 | ntpdが起動していない・停止    |    未    |
| ?????x |           | 予約                          |          |

* Operation Mode(4bits)

| Value  | DECIMAL   | 状態                          | 実装状態 |
|:------:|----------:|:------------------------------|:--------:|
|  0000  |         0 | 自律モード                    |    完    |
|  0001  |     65536 | rcAモード                     |    無    |
|  0010  |    131072 | Web強制操作モード             |    無    |
|  0011  |    196608 | rcMモード                     |    無    |
|  0100  |    262144 | インターロック                |    未    |
|  0101  |    327680 | 強制停止モード                |    未    |
|  0110  |    393216 | スタンドアーロンモード        |    未    |

* Reserve for extention(4bits)

| Value  | DECIMAL   | 状態                          | 実装状態 |
|:------:|----------:|:------------------------------|:--------:|
|  0000  |         0 | 予約                          |          |
