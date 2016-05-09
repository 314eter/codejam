#!/usr/bin/env sh

USAGE="usage: ./create.sh year round [language]"

copy_files () {
  for file in a b c; do
    cp "template$3" "$1/$2/$file$3"
    echo "copied $1/$2/$file$3"
  done

  if [ "$2" = "qualification" ]; then
    cp "template$3" "$1/$2/d$3"
    echo "copied $1/$2/d$3"
  fi
}

create_ocaml () {
  for file in codejam.ml codejam.mli _tags .merlin; do
    ln -s "../../$file" "$1/$2/$file"
    echo "linked $1/$2/$file"
  done

  copy_files $1 $2 ".ml"
}

create_python () {
  copy_files $1 $2 ".py"
}

if [ "x$1" != "x" ] && [ "x$2" != "x" ]; then
  mkdir -p "$1/$2"

  if [ "x$3" != "xpython" ]; then
    create_ocaml $1 $2
  fi

  if [ "x$3" != "xocaml" ]; then
    create_python $1 $2
  fi
else
  echo "$USAGE"
fi
