# macでCentOS7のUSBインストールメディアを作成
- macでCentOS7のUSBインストールメディアを作成するBashスクリプトです。
- 操作を間違えるとデータが損失したり、macが起動しなくなる可能性があります。自己責任で実行してください。

# 実行環境
- macOS Sierra 10.12.3
- Google Chrome 56.0.2924.87 (64-bit)

# 作成手順
- [Download CentOS](https://www.centos.org/download/)を開き、isoファイル（軽量版のMinimal ISOを推奨）をダウンロードします。(ダウンロードフォルダを自動的に参照するので特にどこかに移動させなくても大丈夫です。)
- 8GBくらいのUSBメモリをMacに刺す。
- macのターミナル上で以下のコマンドを実行する
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/kubotan/bash_createInstallMedia/master/createInstallMedia.sh)"
```
## 実行結果
- 以下のように進めていき、`Finished.`と表示されたら、ディスクを取り出して、作成完了です。
```
===== External Disk List =====
/dev/disk2 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *3.9 GB     disk2
   1:                       0xEF                         6.4 MB     disk2s2


===== Download ISO List =====
/Users/hogehoge/Downloads/CentOS-7-x86_64-Minimal-1611.iso


Enter the USB storage to create the installation disk [/dev/disk2]: 
Enter the ISO file to create the installation disk [/Users/hogehoge/Downloads/CentOS-7-x86_64-Minimal-1611.iso]: 


Execute this command.

  Command:
    /usr/sbin/diskutil unMountDisk /dev/disk2
    /usr/bin/sudo /bin/dd if=/Users/hogehoge/Downloads/CentOS-7-x86_64-Minimal-1611.iso of=/dev/disk2

Do you want to continue? [Y/n]Y

Press Control + T to display the progress.
Executing...
Unmount of all volumes on disk2 was successful
1392640+0 records in
1392640+0 records out
713031680 bytes transferred in 676.196776 secs (1054474 bytes/sec)
Finished.
```
