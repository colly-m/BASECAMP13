// This module shows an alternative to snapshots for complex types using copy trait

#[cfg(test)]
mod tests {

    fn add_one(x: u32) -> u32 {
        x + 1
    }

    #[test]
    fn test_add_one() {
        lex x = 1;
        let y = add_one(x); // x is copied
        assert!(y == 2);
        assert!(x == 1); // Ownership is moved
    }

    #[derive(Drop, copy)]
    struct Person {
        height: u32,
        age: u32,
    }

    fn get_age(person: Person) -> u32 {
        person.age
    }

    #[test]
    fn test_get_age() {
        let person = Person {
            height: 180,
            age: 30,
        };
        let age = get_age(person); // Person is copied
        assert!(age == 30);
        assert!(person.age == 30); // Ownership is never moved
    }

    fn increase_age(mut person: Person) {
        person.age += 1;
    }

    #[test]
    fn test_increase_age() {
        let person = Person {
            height: 180,
            age: 30,
        };
        increase_age(person); // Person is copied
        assert!(person.age == 30); // Ownership is never moved
    }
}