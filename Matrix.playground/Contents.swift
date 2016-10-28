//: Playground - noun: a place where people can play

let matrix1 = Matrix(elements:
    [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ]
)

let matrix2 = Matrix(elements:
    [
        [1, 1, 1],
        [0, 1, 0],
        [0, 0, 1]
    ]
)

if let matrix1 = matrix1, let matrix2 = matrix2 {
    print(matrix1.description())
    print(matrix2.description())
    
    print(matrix1.transponse().description())
    
    matrix1.addRow(row: [1, 2, 3, 4])
    let newMatrix = matrix1.multiply(by: matrix1)
    
    if let matrix = newMatrix {
        print(matrix.description())
        
    }
}
