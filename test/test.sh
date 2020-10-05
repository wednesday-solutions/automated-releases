          declare -A cata=( [fix]="" [build]="" [ci]="" [docs]="" [feat]="" [perf]="" [refactor]="" [style]="" [test]="" [others]="") 
          declare -A cataTitle=( [fix]="<h5>Bug Fixes</h5>" [build]="<h5>Build</h5>" [ci]="<h5>Continuous Integration</h5>" [docs]="<h5>Documentation</h5>" [feat]="<h5>New Features</h5>" [perf]="<h5>Performance Enhancement</h5>" [refactor]="<h5>Refactored</h5>" [style]="<h5>Changed Style</h5>" [test]="<h5>Added Tests</h5>" [others]="<h5>Others</h5>") 
          msg=""
          for i in $(git log --format=%h 7e1dd3601b496fed45668cca1369624696feb8af..fc7f1db3903955734a5d44a54617e139e8eb3b6f)
          do
            IFS=":" read -r type cmmsg <<< $(git log --format=%B -n 1 $i)
            type="${type}" | xargs
            text_msg="&nbsp;&nbsp;&nbsp;&nbsp;&#8226; $i - ${cmmsg}<br/>"
            flag=1
            for i in "${!cata[@]}"
            do
                if [ "${type}" == "$i" ]
                then
                    cata[$i]+="${text_msg}"
                    break
                    flag=0
                fi
            done
                if [ $flag -eq 1 ]
                then
                    cata[others]+="${text_msg}"
                fi
            done
            for i in "${!cata[@]}"
            do
                if [ ! -z "${cata[$i]}" ] && [ "others" != "$i" ]
                    then
                    msg+="${cataTitle[$i]}${cata[$i]}"
                fi
            done
            if [ ! -z "${cata[others]}" ]
            then
                msg+="${cataTitle[others]}${cata[others]}"
            fi
          echo "${msg}"