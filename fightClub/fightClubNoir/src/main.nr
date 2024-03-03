use dep::std::hash::poseidon;
use dep::ecrecover;
struct Person{
    age: Field,
}

global minAge: u8 = 18;
fn main(fighter: Person, password: [Field; 2], passwordhash: pub Field) {
    // Check if the person is old enough
    assert(fighter.age as u8 >= minAge);
    // Check if the password is correct
    assert(passwordhash == poseidon::bn254::hash_2(password));
}

#[test]
fn test_main() {
    let person = Person { age: 20 };
    main(
        person,
        [3, 5],
        0xf0044cfe436e6a40984346b6cfab873c8bb8ff079be9d03738ddc67a89faf08
    );
    // Uncomment to make test fail
    // main(1, 1);
}
