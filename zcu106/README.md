```
[zynq@zynqbuild01 ~]$ mkdir zcu106_riscv
[zynq@zynqbuild01 ~]$ cd zcu106_riscv/
[zynq@zynqbuild01 zcu106_riscv]$ git clone https://github.com/wtakase/rc-fpga-zcu.git
[zynq@zynqbuild01 zcu106_riscv]$ cd rc-fpga-zcu/
[zynq@zynqbuild01 rc-fpga-zcu]$ cd zcu106
[zynq@zynqbuild01 zcu106]$ make init-submodules
[zynq@zynqbuild01 zcu106]$ cd ../rocket-chip/
[zynq@zynqbuild01 rocket-chip]$ git submodule update --init
[zynq@zynqbuild01 rocket-chip]$ export RISCV=/home/zynq/zcu106_riscv/riscv-toolchain
[zynq@zynqbuild01 rocket-chip]$ cd riscv-tools/
[zynq@zynqbuild01 riscv-tools]$ git submodule update --init --recursive
[zynq@zynqbuild01 riscv-tools]$ vi build.sh 
[zynq@zynqbuild01 riscv-tools]$ git diff build.sh
diff --git a/build.sh b/build.sh
index becfda2..dc95941 100755
--- a/build.sh
+++ b/build.sh
@@ -8,7 +8,7 @@
 echo "Starting RISC-V Toolchain build process"
 
 build_project riscv-openocd --prefix=$RISCV --enable-remote-bitbang --enable-jtag_vpi --disable-werror
-sed -i '245 i | aarch64 \' ./riscv-fesvr/scripts/config.sub && build_project riscv-fesvr --prefix=$RISCV
+sed -i '245 i | aarch64 \\' ./riscv-fesvr/scripts/config.sub && build_project riscv-fesvr --prefix=$RISCV
 build_project riscv-isa-sim --prefix=$RISCV --with-fesvr=$RISCV
 build_project riscv-gnu-toolchain --prefix=$RISCV
 CC= CXX= build_project riscv-pk --prefix=$RISCV --host=riscv64-unknown-elf
[zynq@zynqbuild01 riscv-tools]$ ./build.sh 
[zynq@zynqbuild01 riscv-tools]$ cd riscv-gnu-toolchain/build/
[zynq@zynqbuild01 build]$ rm -rf *
[zynq@zynqbuild01 build]$ ../configure --prefix=$RISCV
[zynq@zynqbuild01 build]$ make -j7 linux
[zynq@zynqbuild01 build]$ vi ~/.bashrc
[zynq@zynqbuild01 build]$ tail -3 ~/.bashrc 
export RISCV=/home/zynq/zcu106_riscv/riscv-toolchain
export PATH=$PATH:$RISCV/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$RISCV/lib
[zynq@zynqbuild01 build]$ . ~/.bashrc 
[zynq@zynqbuild01 build]$ cd ../../../chisel3/
[zynq@zynqbuild01 chisel3]$ sudo apt-get install default-jdk openjdk-8-jdk
[zynq@zynqbuild01 chisel3]$ echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
deb https://dl.bintray.com/sbt/debian /
[zynq@zynqbuild01 chisel3]$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
[zynq@zynqbuild01 chisel3]$ sudo apt-get update
[zynq@zynqbuild01 chisel3]$ sudo apt-get install sbt
[zynq@zynqbuild01 chisel3]$ sudo apt-get install git make autoconf g++ flex bison
[zynq@zynqbuild01 chisel3]$ git clone http://git.veripool.org/git/verilator
[zynq@zynqbuild01 chisel3]$ cd verilator
[zynq@zynqbuild01 verilator]$ git pull
[zynq@zynqbuild01 verilator]$ git checkout v3.904
[zynq@zynqbuild01 verilator]$ autoconf
[zynq@zynqbuild01 verilator]$ ./configure
[zynq@zynqbuild01 verilator]$ make -j7
[zynq@zynqbuild01 verilator]$ sudo make install
[zynq@zynqbuild01 verilator]$ cd ../../firrtl/
[zynq@zynqbuild01 firrtl]$ sbt compile
[zynq@zynqbuild01 firrtl]$ sbt assembly
[zynq@zynqbuild01 firrtl]$ vi ~/.bashrc 
[zynq@zynqbuild01 firrtl]$ tail -2 ~/.bashrc 
export PATH=$PATH:$RISCV/bin:/home/zynq/zcu106_riscv/rc-fpga-zcu/rocket-chip/firrtl/utils/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$RISCV/lib
[zynq@zynqbuild01 firrtl]$ . ~/.bashrc 
[zynq@zynqbuild01 firrtl]$ sbt publishLocal
[zynq@zynqbuild01 firrtl]$ cd ../../zcu106
[zynq@zynqbuild01 zcu106]$ export TERM=xterm-color
[zynq@zynqbuild01 zcu106]$ update-java-alternatives --list
java-1.11.0-openjdk-amd64      1111       /usr/lib/jvm/java-1.11.0-openjdk-amd64
java-1.8.0-openjdk-amd64       1081       /usr/lib/jvm/java-1.8.0-openjdk-amd64
[zynq@zynqbuild01 zcu106]$ update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64
update-java-alternatives: no root privileges
[zynq@zynqbuild01 zcu106]$ sudo update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64
update-alternatives: error: no alternatives for mozilla-javaplugin.so
update-java-alternatives: plugin alternative does not exist: /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so
[zynq@zynqbuild01 zcu106]$ java -version
openjdk version "1.8.0_275"
OpenJDK Runtime Environment (build 1.8.0_275-8u275-b01-0ubuntu1~18.04-b01)
OpenJDK 64-Bit Server VM (build 25.275-b01, mixed mode)
[zynq@zynqbuild01 zcu106]$ make rocket
[zynq@zynqbuild01 zcu106]$ make bitstream



takase@tks-mac04 ~ % ssh -Y zynqbuild01 
[zynq@zynqbuild01 ~]$ vivado zcu106_riscv/rc-fpga-zcu/zcu106/zcu106_rocketchip_ZynqConfig/zcu106_rocketchip_ZynqConfig.xpr

File -> Export -> Export Hardware
 - Platform type: Fixed
 - Output: Include bitstream
 - Files:
   - XSA file name: rocketchip_wrapper
   - Export to: /home/zynq/zcu106_riscv/rc-fpga-zcu/zcu106/zcu106_rocketchip_ZynqConfig
 - Finish
File -> Exit


[zynq@zynqbuild01 zcu106]$ cp zcu106_rocketchip_ZynqConfig/zcu106_rocketchip_ZynqConfig.runs/impl_1/rocketchip_wrapper.hwdef soft_config/rocketchip_wrapper.hdf
[zynq@zynqbuild01 zcu106]$ cp zcu106_rocketchip_ZynqConfig/zcu106_rocketchip_ZynqConfig.runs/impl_1/rocketchip_wrapper.bit soft_config/
[zynq@zynqbuild01 zcu106]$ cp zcu106_rocketchip_ZynqConfig/rocketchip_wrapper.xsa soft_config/
[zynq@zynqbuild01 zcu106]$ ls soft_config/*.bsp
soft_config/xilinx-zcu106-v2020.1-final.bsp
[zynq@zynqbuild01 zcu106]$ . ~/opt/petalinux/settings.sh 
[zynq@zynqbuild01 zcu106]$ petalinux-create -t project -s soft_config/xilinx-zcu106-v2020.1-final.bsp -n petalinux_proj  
[zynq@zynqbuild01 zcu106]$ vi petalinux_proj/project-spec/configs/config
[zynq@zynqbuild01 zcu106]$ egrep '^CONFIG_TMP_DIR_LOCATION|^CONFIG_SUBSYSTEM_ETHERNET_PSU_ETHERNET_3_MAC|^CONFIG_SUBSYSTEM_REMOVE_PL_DTB' petalinux_proj/project-spec/configs/config
CONFIG_SUBSYSTEM_ETHERNET_PSU_ETHERNET_3_MAC="00:0a:35:05:64:81"
CONFIG_SUBSYSTEM_REMOVE_PL_DTB=y
CONFIG_TMP_DIR_LOCATION="/home/zynq/zcu106_riscv/rc-fpga-zcu/zcu106/petalinux_proj/build/tmp"
[zynq@zynqbuild01 zcu106]$ cd petalinux_proj/
[zynq@zynqbuild01 petalinux_proj]$ petalinux-config --get-hw-description=/home/zynq/zcu106_riscv/rc-fpga-zcu/zcu106/soft_config --silentconfig
[zynq@zynqbuild01 petalinux_proj]$ petalinux-config -c rootfs --silentconfig
[zynq@zynqbuild01 petalinux_proj]$ petalinux-build
[zynq@zynqbuild01 petalinux_proj]$ cd images/linux/
[zynq@zynqbuild01 linux]$ petalinux-package --boot --fsbl zynqmp_fsbl.elf --fpga ../../../soft_config/rocketchip_wrapper.bit --pmufw pmufw.elf --u-boot
[zynq@zynqbuild01 linux]$ cd ../../..
[zynq@zynqbuild01 zcu106]$ cp petalinux_proj/images/linux/BOOT.BIN fpga-images-zcu106/
[zynq@zynqbuild01 zcu106]$ cp petalinux_proj/images/linux/image.ub fpga-images-zcu106/
[zynq@zynqbuild01 zcu106]$ cp petalinux_proj/images/linux/rootfs.cpio.gz fpga-images-zcu106/
[zynq@zynqbuild01 zcu106]$ cp petalinux_proj/images/linux/boot.scr fpga-images-zcu106/
[zynq@zynqbuild01 zcu106]$ make fesvr-zynq
[zynq@zynqbuild01 zcu106]$ cd ../common/
[zynq@zynqbuild01 common]$ ~/zcu106_riscv/riscv-toolchain/bin/riscv64-unknown-elf-gcc -g hello.c -o hello
[zynq@zynqbuild01 common]$ cd ~/zcu106_riscv/
[zynq@zynqbuild01 zcu106_riscv]$ git clone https://github.com/sifive/freedom-u-sdk 
[zynq@zynqbuild01 zcu106_riscv]$ cd freedom-u-sdk/
[zynq@zynqbuild01 freedom-u-sdk]$ unset RISCV
[zynq@zynqbuild01 freedom-u-sdk]$ git checkout db77bd7a8
[zynq@zynqbuild01 freedom-u-sdk]$ git submodule update --recursive --init
[zynq@zynqbuild01 freedom-u-sdk]$ cd buildroot/
[zynq@zynqbuild01 buildroot]$ git checkout sifive
[zynq@zynqbuild01 buildroot]$ cd ..
[zynq@zynqbuild01 freedom-u-sdk]$ cp ~/zcu106_riscv/rc-fpga-zcu/zcu106/soft_config/config_freedom conf/linux_defconfig 
[zynq@zynqbuild01 freedom-u-sdk]$ unset LD_LIBRARY_PATH
[zynq@zynqbuild01 freedom-u-sdk]$ cp ~/zcu106_riscv/rc-fpga-zcu/common/hello work/buildroot_initramfs_sysroot/root/
[zynq@zynqbuild01 freedom-u-sdk]$ make vmlinux -j7
[zynq@zynqbuild01 freedom-u-sdk]$ cd ~/zcu106_riscv/rc-fpga-zcu/rocket-chip/riscv-tools/riscv-pk/build/
[zynq@zynqbuild01 build]$ . ~/.bashrc
[zynq@zynqbuild01 build]$ rm -rf *
[zynq@zynqbuild01 build]$ ../configure --prefix=$RISCV --host=riscv64-unknown-linux-gnu --with-payload=/home/zynq/zcu106_riscv/freedom-u-sdk/work/linux/vmlinux
[zynq@zynqbuild01 build]$ make -j7
[zynq@zynqbuild01 build]$ make install
[zynq@zynqbuild01 build]$ cd ~/zcu106_riscv/rc-fpga-zcu/zcu106/
[zynq@zynqbuild01 zcu106]$ make rootfs-open
[zynq@zynqbuild01 zcu106]$ sudo cp ../common/build/fesvr-zynq ../common/build/libfesvr.so ../rocket-chip/riscv-tools/riscv-pk/build/bbl ../rocket-chip/riscv-tools/riscv-pk/build/pk ../common/hello rootfs/home/root/
[zynq@zynqbuild01 zcu106]$ make rootfs-close




takase@ubuntu20:~/Desktop/fpga-images-zcu106$ ls
BOOT.BIN  boot.scr  image.ub  README.md  rootfs.cpio.gz
takase@ubuntu20:~/Desktop/fpga-images-zcu106$ sudo parted /dev/sdb
[sudo] password for takase: 
GNU Parted 3.3
Using /dev/sdb
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) mklabel msdos                                                    
Warning: The existing disk label on /dev/sdb will be destroyed and all data on
this disk will be lost. Do you want to continue?
Yes/No? Yes                                                               
(parted) mkpart primary fat32 0% 1124MB                                   
(parted) set 1 boot on                                                    
(parted) set 1 lba off                                                    
(parted) mkpart primary ext4 1124MB 4325MB                                
(parted) p                                                                
Model: CalDigit Card Reader (scsi)
Disk /dev/sdb: 31.0GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags: 

Number  Start   End     Size    Type     File system  Flags
 1      1049kB  1124MB  1123MB  primary  fat32        boot
 2      1124MB  4325MB  3201MB  primary  ext4         lba

(parted) set 2 lba off                                                    
(parted) p
Model: CalDigit Card Reader (scsi)
Disk /dev/sdb: 31.0GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags: 

Number  Start   End     Size    Type     File system  Flags
 1      1049kB  1124MB  1123MB  primary  fat32        boot
 2      1124MB  4325MB  3201MB  primary  ext4

(parted) q                                                                
Information: You may need to update /etc/fstab.

takase@ubuntu20:~/Desktop/fpga-images-zcu106$ sudo mkfs.vfat -F32 /dev/sdb1
mkfs.fat 4.1 (2017-01-24)
takase@ubuntu20:~/Desktop/fpga-images-zcu106$ sudo mkfs.ext4 /dev/sdb2
mke2fs 1.45.5 (07-Jan-2020)
/dev/sdb2 contains a ext4 file system
	created on Thu Feb  4 12:21:44 2021
Proceed anyway? (y,N) y
Creating filesystem with 781568 4k blocks and 195456 inodes
Filesystem UUID: 5a3ac4cc-a4f3-45af-adcb-2a002f4ae9a9
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done 

takase@ubuntu20:~/Desktop/fpga-images-zcu106$ sudo mount /dev/sdb1 /mnt
takase@ubuntu20:~/Desktop/fpga-images-zcu106$ sudo cp BOOT.BIN image.ub boot.scr /mnt/
takase@ubuntu20:~/Desktop/fpga-images-zcu106$ sudo umount /mnt
takase@ubuntu20:~/Desktop/fpga-images-zcu106$ gzip -d rootfs.cpio.gz 
takase@ubuntu20:~/Desktop/fpga-images-zcu106$ sudo mount /dev/sdb2 /mnt
takase@ubuntu20:~/Desktop/fpga-images-zcu106$ sudo cp rootfs.cpio /mnt/
takase@ubuntu20:~/Desktop/fpga-images-zcu106$ cd /mnt/
takase@ubuntu20:/mnt$ sudo pax -r -f rootfs.cpio 
takase@ubuntu20:/mnt$ cd
takase@ubuntu20:~$ sudo umount /mnt
takase@ubuntu20:~$ sudo screen -L /dev/ttyUSB0 115200 


root@xilinx-zcu106-2020_1:~# LD_LIBRARY_PATH=./ ./fesvr-zynq pk hello
load_elf hello
Hello World!


root@xilinx-zcu106-2020_1:~# LD_LIBRARY_PATH=./ ./fesvr-zynq bbl
# ls
hello
# ./hello 
Hello World!
```
