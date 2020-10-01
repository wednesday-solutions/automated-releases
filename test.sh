        msg=""
          fix=""
          build=""
          ci=""
          docs=""
          feat=""
          perf=""
          refactor=""
          style=""
          test=""
          for i in $(git log --format=%h 7abe829281b0c7be20718723fa1d286a309e3a84..25ac280c13415356e1856f308820cdd6a0d6dd70)
          do
            IFS=":" read -a arr <<< $(git log --format=%B -n 1 $i)
              if [ "${arr[0]}" == "fix" ]
                  then
                      fix+="&#8226; $i - ${arr[1]}<br/>"
              fi
              if [ "${arr[0]}" == "feat" ]
                  then
                      feat+="&#8226; $i - ${arr[1]}<br/>"
              fi
              if [ "${arr[0]}" == "ci" ]
                  then
                      ci+="&#8226; $i - ${arr[1]}<br/>"
              fi
              if [ "${arr[0]}" == "docs" ]
                  then
                      docs+="&#8226; $i - ${arr[1]}<br/>"
              fi
              if [ "${arr[0]}" == "build" ]
                  then
                      build+="&#8226; $i - ${arr[1]}<br/>"
              fi
              if [ "${arr[0]}" == "perf" ]
                  then
                      perf+="&#8226; $i - ${arr[1]}<br/>"
              fi
              if [ "${arr[0]}" == "refactor" ]
                  then
                      refactor+="&#8226; $i - ${arr[1]}<br/>"
              fi
              if [ "${arr[0]}" == "style" ]
                  then
                      style+="&#8226; $i - ${arr[1]}<br/>"
              fi
              if [ "${arr[0]}" == "test" ]
                  then
                      test+="&#8226; $i - ${arr[1]}<br/>"
              fi
          done
          if [ ! -z "${fix}" ]
            then
              msg+="### Bug Fixes<br/>$fix"
          fi
          if [ ! -z "${feat}" ]
              then
              msg+="### New Features<br/>$feat"
          fi
          if [ ! -z "${ci}" ]
              then
              msg+="### Continuous Integration<br/>$ci"
          fi
          if [ ! -z "${docs}" ]
              then
              msg+="### Documentation<br/>$docs"
          fi
          if [ ! -z "${perf}" ]
              then
              msg+="### Performance Enhancement<br/>$perf"
          fi
          if [ ! -z "${refactor}" ]
              then
              msg+="### Refactored<br/>$refactor"
          fi
          if [ ! -z "${style}" ]
              then
              msg+="### Changed Style<br/>$style"
          fi
          if [ ! -z "${test}" ]
              then
              msg+="### Added Tests<br/>$test"
          fi
          echo $msg