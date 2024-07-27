# Rust Vs Golang

Record some benchmarks between Rust and Golang.
There are often issues in Rust and Golang where rust can't beat golang's speed due to different implementations or operations. We're not saying that Rust is necessarily faster than Golang, or that Golang is necessarily faster than Rust. The purpose of this repo is to find out why there is a speed difference and how to optimize for the best repository.
## Contributions
**You are welcome to provide any language performance differences, or you can provide your own and analyze them yourself to get a deeper understanding of the language.**

## Cast

You can find a detailed explanation of why in each example folder

### Sin Cos Compute
> Only happend in Windows
> You should test it by manually running the code in your own environment.

As an interesting example, in Window, rust multi-threaded loop floating-point arithmetic is more than 50% slower than golang.

```shell
# Windows
cd sin-cos
cd rust && cargo run --release
cd ../golang && go run main.go
```