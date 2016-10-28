// TODO: - Replace printing errors with throwing exceptions
// TODO: - Add documentation to each method using markdown

// MARK: - MatrixType
public enum MatrixType {
    case rectangle, square
    
    init(rowsCount: Int, columnsCount: Int) {
        if rowsCount == columnsCount {
            self = .square
        }
        else {
            self = .rectangle
        }
    }
}

// MARK: - Matrix
public class Matrix {
    
    // MARK: - Properties
    
    var elements: [[Int]] = []
    
    public var size: (rows: Int, columns: Int) {
        return (elements.count, elements.first?.count ?? 0)
    }
    
    public var type: MatrixType! {
        return MatrixType(rowsCount: size.rows, columnsCount: size.columns)
    }
    
    // MARK: - Initialization
    
    public init?(elements: [[Int]]? = nil) {
        guard let elements = elements else { return nil }
        
        // Check if number of elements is the same in each row
        let elementsInRowCount = elements.first?.count ?? 0
        let validRows = elements.filter({ (row) -> Bool in
            return row.count == elementsInRowCount
        })
        
        guard elements.count == validRows.count else {
            print("Error: Number of elements must be the same in each row.")
            return nil
        }
        
        self.elements = elements
    }
    
    // MARK: - Methods
    
    public func description() -> String {
        return "Matrix(\n" + elements.map({ (rowElements) -> String in
            return "\t" + rowElements.map({ (element) -> String in
                return "\(element)"
            }).joined(separator: ", ")
        }).joined(separator: "\n") + "\n)"
    }
    
    public func element(in row: Int, in column: Int) -> Int? {
        return elements.count > row && elements[row].count > column ? elements[row][column] : nil
    }
    
    public func row(at index: Int) -> [Int] {
        return index < elements.count ? elements[index] : []
    }
    
    public func column(at index: Int) -> [Int] {
        return elements.map({ (rowElements) -> Int? in
            return index < rowElements.count ? rowElements[index] : nil
        }).flatMap({ (element) in // Use flatMap to remove optional elements from array
            element
        })
    }
    
    public func addRow(row: [Int]) {
        // Check if number of elements in passed row is the same as in other rows
        if row.count == size.columns {
            elements.append(row)
        }
    }
    
    public func add(matrix: Matrix) -> Matrix? {
        // Check if sizes of matrix are the same
        guard size.rows == matrix.size.rows,
            size.columns == matrix.size.columns else {
                print("Error: Sizes of both matrixes must be the same.")
                return nil
        }
        
        var newMatrixElements = self.elements
        
        for rowIndex in 0..<size.rows {
            for elementIndex in 0..<size.columns {
                newMatrixElements[rowIndex][elementIndex] = elements[rowIndex][elementIndex] + matrix.elements[rowIndex][elementIndex]
            }
        }
        
        return Matrix(elements: newMatrixElements)
    }
    
    public func multiply(by number: Int) -> Matrix {
        return Matrix(elements: elements.map({ (rowElements) -> [Int] in
            return rowElements.map({ (element) -> Int in
                return element * number
            })
        }))!
    }
    
    /*
     *  Matrix Multiplication (C = A * B):
     *  A = [
     *      [a11, a12, a13],
     *      [a21, a22, a23]
     *  ];
     *  B = [
     *      [b11, b12],
     *      [b21, b22],
     *      [b31, b32]
     *  ];
     *  C = [
     *      [c11, c12, c13],
     *      [c21, c22, c23],
     *      [c31, c32, c33]
     *  ];
     *  where: c11 = a11 * b11 + a12 * b21 + a13 * b31.
     */
    public func multiply(by matrix: Matrix) -> Matrix? {
        // Check if number of columns (elements in a row) in first matrix
        // is equal to number of rows in second matrix
        guard size.columns == matrix.size.rows else {
            print("Error: Number of columns (elements in a row) in first matrix must equal to number of rows in second matrix")
            return nil
        }
        
        /*
         *  Scalar Product (C = A * B):
         *  A = [a1, a2, a3];
         *  B = [b1, b2, b3];
         *  C = a1 * b1 + a2 * b2 + a3 * b3
         */
        let scalarProduct = { (a: [Int], b: [Int]) -> Int in
            var result = 0
            for i in 0..<min(a.count, b.count) {
                result += a[i] * b[i]
            }
            
            return result
        }
        
        var newMatrixElements = [[Int]]()
        
        for rowIndex in 0..<size.rows {
            var rowElements = [Int]()
            for elementIndex in 0..<matrix.size.columns {
                rowElements.append(
                    scalarProduct(
                        row(at: rowIndex),
                        column(at: elementIndex)
                    )
                )
            }
            newMatrixElements.append(rowElements)
        }
        
        return Matrix(elements: newMatrixElements)
    }
    
    public func transponse() -> Matrix! {
        var newMatrixElements = [[Int]](repeating: [Int](), count: elements.count)
        
        for rowElements in elements {
            for (elementIndex, element) in rowElements.enumerated() {
                newMatrixElements[elementIndex].append(element)
            }
        }
        
        return Matrix(elements: newMatrixElements)
    }
    
    public func determinant() -> Double? {
        guard type == .square else { return nil }
        
        return 0
    }
}
