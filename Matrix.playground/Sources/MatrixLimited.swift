/*
 *  Restrictions:
 *  Matrix must contain maximum 50 rows, with maximum 50 elements in each row.
 *  And each element must be an integer in range from -1 to 1
 */
public class MatrixLimited: Matrix {
    
    // MARK: - Initialization
    
    override public init?(elements: [[Int]]? = nil) {
        super.init(elements: elements)
        
        // Check if number of rows
        // is more in range from 1 to 50.
        guard let elements = elements, 1...50 ~= elements.count else { return }
        
        let validElements = elements.enumerated().filter({ (rowIndex, row) -> Bool in
            // Check if number of elements in each row
            // is in range from 1 to 50.
            guard 1...50 ~= elements[rowIndex].count else { return false }
            
            let validElementsInRow = row.filter({ (element) -> Bool in
                // Check if all elements are in range from -1 to 1
                return -1...1 ~= element
            })
            
            return validElementsInRow.count == elements[rowIndex].count
        })
        
        guard validElements.count == elements.count else {
            print("Error: All elements must be in range from -1 to 1.")
            return nil
        }
        
        self.elements = elements
    }
}
