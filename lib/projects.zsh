function find_project() {
  project_name=$1

  for i in $PROJECT_SOURCES
  do
    if [[ -a "$i/$project_name/.my.zsh/Makefile" ]]
    then
      echo "$i/$project_name/.my.zsh/"
    fi
  done
}


function project() {
  project_name=$1
  action=$2

  make_file=$(find_project $1)

  pushd > /dev/null

  cd "$make_file/../"

  echo "Executing '$action' hook of '$project_name'"
  make -f $make_file/Makefile $action

  popd > /dev/null
}
