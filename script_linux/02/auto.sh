#! /bin/sh
function quine () {
  echo -n "$@"
  echo -ne "\047"
  echo -n "$@"
  echo -e "\047"
}
quine '#! /bin/sh
function quine () {
  echo -n "$@"
  echo -ne "\047"
  echo -n "$@"
  echo -e "\047"
}
quine '
