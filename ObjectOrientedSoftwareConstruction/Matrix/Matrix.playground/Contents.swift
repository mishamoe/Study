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

if let matrix1 = matrix1, let matrix2 = matrix2 {
    // Adding
    var newMatrix = matrix1.add(matrix: matrix2)
    print(newMatrix?.description() ?? "")
    
    // Multiplying by number
    newMatrix = newMatrix?.multiply(by: 2)
    print(newMatrix?.description() ?? "")
    
    // Multiplying by Matrix
    newMatrix = newMatrix?.multiply(by: matrix1)
    print(newMatrix?.description() ?? "")
    
    // Transponse
    newMatrix = newMatrix?.transponse()
    print(newMatrix?.description() ?? "")
    
    // Determinant
    let determinant = matrix2.determinant()
    print(determinant)
}

