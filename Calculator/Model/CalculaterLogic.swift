import Foundation

struct CaclculatorLogic {
    
    private var number: Double?
    
    // we hold the first number here, to use in performTwoNumberCalculation
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    // since we made number property private, we should set the number in  a function
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n * 0.01
            } else if symbol == "=" {
                return performTwoNumberCalculation(n2: n)
            } else { // if the user tapped on the "+" or "-" or "%", store the number first number in intermediateCalculation
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    // perform calculation
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
                
            case "-":
                return n1 - n2
                
            case "×":
                return n1 * n2
                
            case "÷":
                return n1 / n2
            default:
                fatalError("error in performTwoNumberCalculation")
            }
        }
        return nil
    }
}
