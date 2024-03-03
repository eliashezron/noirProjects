fn main(x: Field, y: pub Field) {
    assert(x != y, "Numbers can not be similar");
}

#[test]
fn test_main() {
    main(1, 2);
}

#[test(should_fail_with = "Numbers can not be similar")]
fn test_main_fails_with_message() {
    main(3, 3);
}
