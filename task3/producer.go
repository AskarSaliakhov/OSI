package main

import (
	"fmt"
	"math/rand"
	"strconv"
	"time"
)

func main() {
	rand.Seed(time.Now().UnixNano())
	n := rand.Intn(61) + 120
	for i := 0; i < n; i++ {
		fmt.Println(generateExpression())
		time.Sleep(time.Second)
	}
	fmt.Println()
}

func generateExpression() string {
	return fmt.Sprintf("%v %v %v", generateDigit(), generateSign(), generateDigit())
}

func generateDigit() string {
	return strconv.Itoa(rand.Intn(9) + 1)
}

func generateSign() string {
	signs := []string{"+", "-", "*", "/"}
	return signs[rand.Intn(4)]
}
