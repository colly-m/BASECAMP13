// Module to show how to refoctor default fibonacci sequence that comes with anew scarb project to its own module
// Then how to execute, create and verify a validity proof with stwo

#[executable]
fn main() -> u32 {
    fib(16)
}

fn fib(mut n: u32) -> u32 {
    let mut a: u32 = 0;
    let mub b: u32 = 1;
    while n != 0 {
	n = n - 1;
	let temp = b;
	b = a + b;
	a = temp;
    };
    a
}

#[cfg(test)]
mod tests {
    use super::fib;

    #[test]
    fn it_works() {
	assert!(fib(16) == 987);
    }
}
