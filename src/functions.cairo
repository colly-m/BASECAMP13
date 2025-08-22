// This section covers the anatomy of a function
// How to return a value with or without the return keyword
// How to pass args and how touse closers

fn foo() -> u32 {
    5
}

fn bar() -> u32 {
    foo()
}

fn baz() -> u32 {
    return 10;
}

fn double(x: u32) -> u32 {
    x * 2
}

#[cfg(test)]
mod test {

    use super::*;

    #[test]
    fn test_foo() {
        assert!(foo() == 5);
    }

    #[test]
    fn test_bar() {
        assert!(bar() == 5);
    }

    #[test]
    fn test_baz() {
        assert!(baz() == 10);
    }

    #[test]
    fn test_double() {
        assert!(double(5) == 10);
    }

    #[test]
    fn test_closure() {
        let add = |a: u32| {
            |b| a + b
        };

        let add_five = add(5);
        assert!(add_five(6) == 11);

        let add_ten = add(10);
        assert!(add_ten(6) == 16);
    }
}