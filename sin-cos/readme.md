# Sin-Cos

In fact, the main problem is not the  `Mutex` or `thread` problem.

The main problem is that Golang uses a different **Math library** than Rust or C++. Golang has its own implementation, but there are some issues with accuracy and no guarantees. Rust and C++ both choose to call libm for computation. And only for Windows, Rust is still over 30% faster than Golang on Macos.

Math problems about Golang: https://github.com/golang/go/issues/9545