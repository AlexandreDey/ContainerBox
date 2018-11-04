USER=$1
if [ "$UID" != "0" ];then
    echo "[ERROR]: You must run this script as root"
    exit
fi
if [ -z "$1" ];then
    echo "[ERROR]: Provide the username that can start Xorg"
    exit
fi

INPUT_EXISTS=$(grep input /etc/group)
# If it does not exists
if [ -z "$INPUT_EXISTS" ];then
    groupadd input
    cat > /etc/udev/rules.d/99-dev-input-group.rules << EOF
SUBSYSTEM=="input", ACTION=="add", GROUP="input"
EOF
    /etc/init.d/udev reload
fi

usermod -a -G input,video $USER