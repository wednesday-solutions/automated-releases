fix=''
for i in $(git log --format=%h 21064e446701946cfe9bfe691385b136d596728b..dd2d50098047aed057b87b49bf0d1d69ee04d40d)
do
    IFS=":" read -a arr <<< $(git log --format=%B -n 1 $i)
    if [ "${arr[0]}" == "fix" ]
        then
            fix+="${arr[1]}"
    fi
    echo "${fix}"  
done

    # msg+="&#8226; [$(git log --format=%B -n 1 $i)](https://github.com/${{ github.repository }}/commit/$i)<br/>"