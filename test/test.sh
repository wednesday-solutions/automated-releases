          declare -A category=( [fix]="" [build]="" [docs]="" [feature]="" [performance]="" [refactor]="" [style]="" [test]="" [others]="") 
          declare -A categoryTitle=( [fix]="<h5>Bug Fixes</h5>" [build]="<h5>Build</h5>" [docs]="<h5>Documentation</h5>" [feature]="<h5>New Features</h5>" [performance]="<h5>Performance Enhancement</h5>" [refactor]="<h5>Refactored</h5>" [style]="<h5>Style Changed</h5>" [test]="<h5>Added Tests</h5>" [others]="<h5>Others</h5>") 
          msg=""
          for i in $(git log --format=%h 986a8b572cdf045ffde5fbb4c5c78f8b9d9d4894..199a796c97072d0fb056999d7930ff976c065376)
          do
            IFS=":" read -r type commit_msg <<< $(git log --format=%B -n 1 $i)
            type="${type}" | xargs
            text_msg="&nbsp;&nbsp;&nbsp;&nbsp;&#8226; $i - ${commit_msg}<br/>"
            flag=1
            for i in "${!category[@]}"
            do
                if [ "${type}" == "$i" ]
                then
                    category[$i]+="${text_msg}"
                    flag=0
                    break
                fi
            done
            if [ $flag -eq 1 ]
            then
              category[others]+="${text_msg}"
            fi
          done
          for i in "${!category[@]}" 
          do
            if [ ! -z "${category[$i]}" ] && [ "others" != "$i" ]
            then
              msg+="${categoryTitle[$i]}${category[$i]}"
            fi
          done
          if [ ! -z "${category[others]}" ]
          then
            msg+="${categoryTitle[others]}${category[others]}"
          fi
        #   echo ::set-env name=COMMIT_MESSAGE::"${msg}"
          echo "${msg}"