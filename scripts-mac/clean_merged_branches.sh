cat << EOF

***************************************************
This will delete all local branches that are merged
***************************************************
EOF

read -r -p "Are you sure? [y/N]: " CONFIRMATION

if ! [[ "$CONFIRMATION" == 'y' ]]; then
    exit 0
fi

git checkout master
git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
