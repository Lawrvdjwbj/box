#! /bin/bash

#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}


#BBR
function bbr(){
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
chmod +x "/root/tcp.sh"
chmod 777 "/root/tcp.sh"
blue "下载完成，开始运行"
bash "/root/tcp.sh"
}
#XUI
function xui(){
bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
}
#安装docker
function docker1(){
curl -fsSL https://get.docker.com | bash && systemctl restart docker 
}
#安装docker
function docker2(){
docker run --restart=always -d --name tm traffmonetizer/cli_v2 start accept --token qPOKnYo6EavkxWPIoDLvVbiDX9SH5yHtPXbZ3IMr2f8=
}
#L2TP
function l2tp(){
bash <(curl -Ls https://raw.githubusercontent.com/qiao0123/sdfwesds/main/l2t.sh)
}
#防火墙
function firewall(){
sudo yum install firewalld
sudo systemctl start firewalld
firewall-cmd --zone=public --add-port=1-65535/tcp --permanent
firewall-cmd --zone=public --add-port=1-65535/udp --permanent
firewall-cmd --reload
}






#主菜单
function start_menu(){
    clear
    red "  综合工具箱 " 
    yellow " =================================================="
    green " 1. BBR plus加速" 
    green " 2. xui面板"
    green " 3. 安装docker"
    green " 4. 运行容器" 
    green " 5. L2TP"
    green " 6. 关闭防火墙"
    green " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           bbr
	;;
        2 )
           xui
	;;
        3 )
           docker1
	;;
        4 )
           docker2
	;;
        5 )
           l2tp
	;;
	6 )
           firewall
	;;
	
        0 )
            exit 1
        ;;
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}
start_menu "first"
