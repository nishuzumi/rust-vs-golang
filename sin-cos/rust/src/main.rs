use num_cpus;
use std::{
    sync::{Arc, Mutex},
    thread,
};

use std::time::Instant;
fn main() {
    let num_cpus = num_cpus::get();
    let start_time = Instant::now();

    let mut handles = vec![];
    let result = Arc::new(Mutex::new(vec![0.0; num_cpus]));

    for i in 0..num_cpus {
        let result = Arc::clone(&result);
        let handle = thread::spawn(move || {
            let mut local_result = 0.0;
            for j in 0..100_000_000 {
                local_result += (j as f64).sin() * (j as f64).cos();
            }

            let mut result = result.lock().unwrap();
            result[i] = local_result;
            println!("Thread {} result: {}", i, local_result);
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    let final_result = result.lock().unwrap().iter().sum::<f64>();

    println!("Elapsed time: {:?}", start_time.elapsed().as_secs_f64());
    println!("Final result: {}", final_result);
}
