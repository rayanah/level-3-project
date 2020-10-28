#!/usr/bin/env bash
pwd 
ls && cd e2e-pr && ls
code=0
testfile=$1
files=$testfile

if [ -z $testfile ]
then
  files=$(ls e2e-pr/e2e-js-test/login_test.js)
fi

for test in $files
do
  node e2e-js-test/test_helper.js
  casperjs test $test
  ret=$?
  if [ ! $ret == "0" ]; then code=1; fi
done

exit $code
