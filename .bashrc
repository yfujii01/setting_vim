# 対話型ではない接続の場合はこれ以降を読み込まない
[ -z "$PS1" ] && return

# 起動時imageの読み込み
if [ -f ~/.bashrcImg ]; then
    COMMENT=【`date "+%Y-%m-%d (%a)"`】
    IFS=">"
    AA=(`sed -e "s/__DATE__/$COMMENT/g" ~/.bashrcImg`)
    NUM=${#AA[*]}
    NO=`expr $RANDOM % $NUM`
    echo ${AA[$NO]}
else
	echo '~/.bachrcImgが見つかりません'
fi

# エイリアスの設定
if [ -f ~/.bashrcAliases ]; then
    . ~/.bashrcAliases
else
	echo '~/.bachrcAliasesが見つかりません'
fi

# Linuxでのみ必要なスクリプト(windowsで流しても影響は無い)
if [ -f ~/.bashrcLinux ]; then
    . ~/.bashrcLinux
fi
