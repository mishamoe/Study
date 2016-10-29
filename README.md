# Usage

## Create a Matrix
To create a Matrix you need to pass a 2-dimensional array of integers to Matrix class initializer, which is failable (for example, if you pass an array with different amount of elements in sub-arrays - it will fail).
```swift
let matrix1 = Matrix(elements:
    [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ]
)

let matrix2 = Matrix(elements:
    [
        [1, 2, 3],
        [0, 3, 4],
        [4, 7, 9]
    ]
)

guard let matrix1 = matrix1, let matrix2 = matrix2 else {
	return
}

```

There is also a subclass of **Matrix** named **MatrixLimited**, that has some constraints:
- max size is 50x50;
- elements in range from -1 to 1.

## Print Matrix description
```swift
print(matrix1.description())
//	Matrix(
//		1, 2, 3
//		4, 5, 6
//		7, 8, 9
//	)
```

## Add another Matrix
```swift
let newMatrix: Matrix? = matrix1.add(matrix: matrix2)
```

## Multiply Matrix by number
```swift
let newMatrix: Matrix = matrix1.multiply(by: 2)
```

## Multiply Matrix by Matrix
```swift
let newMatrix: Matrix? = matrix1.multiply(by: matrix2)
```

## Transponse Matrix
```swift
let newMatrix: Matrix! = matrix1.transponse()
```

## Find determinant of a Matrix
```swift
let determinant: Int? = matrix1.determinant()
```
