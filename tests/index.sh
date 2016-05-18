#!/bin/sh

################
# CONFIGURATION
################
PHP_IMAGE_NAME="petehouston/docker-alpine-php"
PHP_VERSION_5_5="5.5"
PHP_VERSION_5_6="5.6"
PHP_VERSION_7_0="7.0"

############
# UTILITIES
############

# assert
function assert {
    actual=$1
    expect=$2
    message=${3:-"FAILED"}

    if [[ $actual == *$expect* ]]
    then
        echo "  ✔ PASSED"
    else
        echo "  $message"
    fi

    echo ""
}

#############
# TEST CASES
#############

# test - PHP 5.5
function test_php_5_5 {
    echo "- it should build correct version $PHP_VERSION_5_5"

    result=`docker run --rm $PHP_IMAGE_NAME:$PHP_VERSION_5_5 php --version | grep "$PHP_VERSION_5_5"`

    assert "$result" "$PHP_VERSION_5_5" "FAILED: incorrect PHP version. It should be $PHP_VERSION_5_5"
}

# test - PHP 5.6
function test_php_5_6
 {
    echo "- it should build correct version $PHP_VERSION_5_6"

    result=`docker run --rm $PHP_IMAGE_NAME:$PHP_VERSION_5_6 php --version | grep "$PHP_VERSION_5_6"`

    assert "$result" "$PHP_VERSION_5_6" "FAILED: incorrect PHP version. It should be $PHP_VERSION_5_6"
}

# test - PHP 7.0
function test_php_7_0 {
    echo "- it should build correct version $PHP_VERSION_7_0"

    result=`docker run --rm $PHP_IMAGE_NAME:$PHP_VERSION_7_0 php --version | grep "$PHP_VERSION_7_0"`

    assert "$result" "$PHP_VERSION_7_0" "FAILED: incorrect PHP version. It should be $PHP_VERSION_7_0"
}

# test suite
function run_all_tests {
    test_php_5_5
    test_php_5_6
    test_php_7_0
}
############
# EXECUTION
############
run_all_tests

