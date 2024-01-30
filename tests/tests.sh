REF_OUT=".echo.out"
TEST_OUT=".my_echo.out"

testcase() {
    echo "Test: $@"
    echo $(($@)) > "$REF_OUT"
    ./calculatord "$@" > "$TEST_OUT"
    diff "$REF_OUT" "$TEST_OUT"
    rm "$REF_OUT" "$TEST_OUT"
}

echo "--- Test basic expression ---"
testcase "1 + 2"
testcase "1 - 2"
testcase "1 * 2"
testcase "1 / 2"
echo "--- Test expression with parenthesis ---"
testcase "1 + (2 + 3)"
testcase "1 - (2 - 3)"
testcase "1 * (2 * 3)"
testcase "1 / (6 / 3)"

echo "--- Test complicated expression ---"
testcase "1 + 2 * 3"
testcase "1 - 2 / 3"
testcase "1 * 2 + 3"
testcase "1 / 2 - 34 + 57888 / 6 - (1 + 2 * 3)"
testcase "1 / 2 - 34 + 57888 / 6 - (1 + 2 * 3) * 2 + 3 * (1 + 2 * 3)"
