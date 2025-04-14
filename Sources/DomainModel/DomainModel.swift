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
    
    init (title t: String, type ty: JobType) {
        self.title = t
        self.type = ty
    }
    
    func calculateIncome(_ hours : Int) -> Int {
        switch self.type {
        case .Hourly(let hourly):
            return Int(hourly * Double(hours))
        case .Salary(let salary):
            return Int(salary)
        }
    }
    
    func raise(byAmount amount: Double) {
        switch self.type {
        case .Hourly(let hourly):
            self.type = .Hourly(hourly + amount)
        case .Salary(let salary):
            self.type = .Salary(UInt(Double(salary) + amount))
        }
    }
    
    func raise(byPercent percent: Double) {
        switch self.type {
        case .Hourly(let hourly):
            self.type = .Hourly(hourly * (1 + percent))
        case .Salary(let salary):
            let newSalary = UInt(Double(salary) * (1 + percent))
            self.type = .Salary(newSalary)
        }
    }
}
//
//////////////////////////////////////
//// Person
////
public class Person {
    var firstName : String
    var lastName : String
    var age : Int
    private var _job: Job?
        var job: Job? {
            get {
                return _job
            }
            set {
                if age >= 16 {
                    _job = newValue
                }
            }
        }

    private var _spouse: Person?
    var spouse: Person? {
        get {
            return _spouse
        }
        set {
            if age >= 18 {
                _spouse = newValue
            }
        }
    }
    
    init(firstName fn: String, lastName ln: String, age a: Int) {
        self.firstName = fn
        self.lastName = ln
        self.age = a
    }
    // "[Person: firstName:Ted lastName:Neward age:45 job:nil spouse:nil]"
    
    func toString() -> String {
        return "[Person: firstName:\(firstName) lastName:\(lastName) age:\(age) job:\(job?.title ?? "nil") spouse:\(spouse?.firstName ?? "nil")]"
    }
}

////////////////////////////////////
// Family
//
//public class Family {
//}
