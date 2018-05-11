# 対話型ではない接続の場合はこれ以降を読み込まない
[ -z "$PS1" ] && return

# 起動時AAの読み込み
if [ -f ~/.aa ]; then
    COMMENT=【`date "+%Y-%m-%d (%a)"`】
    IFS=">"
    AA=(`sed -e "s/__DATE__/$COMMENT/g" ~/.aa`)
    NUM=${#AA[*]}
    NO=`expr $RANDOM % $NUM`
    echo ${AA[$NO]}
fi

# エイリアスの設定
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Linuxでのみ実行するスクリプト
if [ -f ~/.bash_linux ]; then
    . ~/.bash_linux
fi
