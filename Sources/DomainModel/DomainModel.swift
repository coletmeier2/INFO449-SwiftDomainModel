struct DomainModel {
    var text = "Hello, World!"
        // Leave this here; this value is also tested in the tests,
        // and serves to make sure that everything is working correctly
        // in the testing harness and framework.
}

////////////////////////////////////
// Money
//
public struct Money {
    var amount : Int
    var currency : String
    
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    func convert (_ newCurrency : String) -> Money {
        
        if currency == "USD" {
            if newCurrency == "GBP" {
                return Money(amount: Int(Double(amount) * 0.5), currency: newCurrency)
            }
            if newCurrency == "EUR" {
                return Money(amount: Int(Double(amount) * 1.5), currency: newCurrency)
            }
            if newCurrency == "CAN" {
                return Money(amount: Int(Double(amount) * 1.25), currency: newCurrency)
            }
        }
        if currency == "EUR" {
            if newCurrency == "USD" {
                return Money(amount: Int(Double(amount) * (2/3)), currency: newCurrency)
            }
            if newCurrency == "GBP" {
                return Money(amount: Int(Double(amount) * 0.3333333), currency: newCurrency)
            }
            if newCurrency == "CAN" {
                return Money(amount: Int(Double(amount) * 0.8333333), currency: newCurrency)
            }
        }
        if currency == "GBP" {
            if newCurrency == "USD" {
                return Money(amount: Int(Double(amount) * 2), currency: newCurrency)
            }
            if newCurrency == "EUR" {
                return Money(amount: Int(Double(amount) * 3), currency: newCurrency)
            }
            if newCurrency == "CAN" {
                return Money(amount: Int(Double(amount) * 2.5), currency: newCurrency)
            }
        }
        if currency == "CAN" {
            if newCurrency == "USD" {
                return Money(amount: Int(Double(amount) * 0.8), currency: newCurrency)
            }
            if newCurrency == "GBP" {
                return Money(amount: Int(Double(amount) * 0.4), currency: newCurrency)
            }
            if newCurrency == "EUR" {
                return Money(amount: Int(Double(amount) * 1.2), currency: newCurrency)
            }
        }
        
        return Money(amount: amount, currency: currency)
    }
    
    func add (_ other: Money) -> Money {
        let convertedSelf = self.convert(other.currency)
        let totalAmount = convertedSelf.amount + other.amount
        return Money(amount: totalAmount, currency: other.currency)
    }
    
    func subtract (_ other: Money) -> Money {
        let convertedSelf = self.convert(other.currency)
        let totalAmount = convertedSelf.amount - other.amount
        return Money(amount: totalAmount, currency: other.currency)
    }
}

////////////////////////////////////
// Job
//
public class Job {
    var title: String
    var type: JobType
    
    public enum JobType {
        case Hourly(Double)
        case Salary(UInt)
    }
    
    init (title: String, type: JobType) {
        self.title = title
        self.type = type
    }
}
//
//////////////////////////////////////
//// Person
////
//public class Person {
//}
//
//////////////////////////////////////
//// Family
////
//public class Family {
//}
