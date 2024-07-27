package main

import (
	"fmt"
	"math"
	"runtime"
	"sync"
	"time"
)

func main() {
	numCPU := runtime.NumCPU()
	fmt.Printf("Running with %d CPUs\n", numCPU)

	var wg sync.WaitGroup

	start := time.Now()

	for i := 0; i < numCPU; i++ {
		wg.Add(1)
		go func(id int) {
			defer wg.Done()
			result := 0.0
			for j := 0; j < 1e8; j++ {
				result += math.Sin(float64(j)) * math.Cos(float64(j))
			}
			fmt.Printf("Goroutine %d result: %f\n", id, result)
		}(i)
	}

	wg.Wait()

	elapsed := time.Since(start)
	fmt.Printf("Elapsed time: %f\n", elapsed.Seconds())
}
