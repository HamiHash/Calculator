import Foundation

struct CaclculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if symbol == "+/-" {
            return number * -1
        }
        if symbol == "AC" {
            return 0
        }
        if symbol == "%" {
            return number * 0.01
        } else {
            return nil
        }
    }
}
