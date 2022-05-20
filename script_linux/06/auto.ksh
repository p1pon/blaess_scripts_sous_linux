#! /bin/ksh
function quine {
  echo -n "$@"
  echo -ne "\047"
  echo -n "$@"
  echo -e "\047"
}
quine '#! /bin/ksh
function quine {
  echo -n "$@"
  echo -ne "\047"
  echo -n "$@"
  echo -e "\047"
}
quine '
