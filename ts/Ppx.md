



# Ppx

### Environment



QEMU , QEMU is a generic and open source machine emulator and virtualizer.

```shell
sudo apt-get install qemu
```

第一个指令地址再 `0xfffffff0` 从 BIOS 中读取程序，查找可启动设备，如果存储设备第一个扇区中 512 Byte 中最后连个字节是 `0x55` 和 `0xaa` 那么这个设备就是可启动的。

将启动设备的第一个扇区加载到 `0x7C00`  处，并跳转执行，此时被被加载到 `0x7C00` 的程序叫做 bootloader，GRUB 就是一个 bootloader。可以进行 multiboot



### GRUB

为什么要了解 GRUB，因为想要了解操作系统，不想先被繁琐的 bootloader 给难在了门槛外，汇编。就直接用现有的成熟的 bootloader，GRUB 就是这么一个。

GRUB 的主要作用是告诉计算机到哪里去找操作系统

为了使用 GRUB 就要了解 GRUB 的 [Multiboot Specification](https://www.gnu.org/software/grub/manual/multiboot/multiboot.html)

bootloader 最后把控制交给操作系统，bootloader 主要负责的就是把 OS image load 到内存中。

GRUB 可以正确的检测和执行 ELF（Executable and Linkable Format），找到相关代码的代码段和数据段，从而把内核加载到正确的位置上并执行。代码段和数据段位置等信息存放在可执行文件的头部。

GRUB 支持很多的常见的文件系统去读取和载入内核文件，当然也包括 FAT12。

1.44MB 的软盘中包含如下

- GRUB
- GRUB 配置文件
- 编译好的内核





