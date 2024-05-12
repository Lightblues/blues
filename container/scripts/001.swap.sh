# 创建虚拟内存文件
dd if=/dev/zero of=/mnt/swap bs=1M count=4096   # 创建一个4G（1M*4096）大小的块文件。
chmod 0600 /mnt/swap
mkswap /mnt/swap
swapon /mnt/swap
# 写入自动挂载参数
if ! grep -q swap /etc/fstab; then
    echo "/mnt/swap swap swap defaults 0 0" >> /etc/fstab
fi
# 设置虚拟内存使用率
if ! grep -q swappiness /etc/sysctl.conf; then
    echo "vm.swappiness = 10" >> /etc/sysctl.conf
else
    # swappiness=0 表示最大限度使用物理内存，然后才是swap空间。
    # swappiness＝100 表示积极的使用swap分区，并且把内存上的数据及时的搬运到swap空间里面。
    sed -i 's/vm.swappiness = 0/vm.swappiness = 10/' /etc/sysctl.conf
fi
# 使配置生效
sysctl -p
