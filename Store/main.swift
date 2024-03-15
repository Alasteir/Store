import Foundation

typealias Customer = (name:String, isPartner:Bool, sum:Double)

var customers : [Customer] = [
    ("Юля", true, 480 ),
    ("Оля", false, 700 ),
    ("Лiля", true, 1200 ),
    ("Вiка", false, 2200),
    ("Люда",false,200),
    ("Галя",true,1000),
    ("Надя",false,500),
    ("Люба",true ,1111)]

func calculateDiscount(for sum: Double) -> Double {
    switch sum {
    case 0...500:
        return 0
    case 501...1110:
        return 0.1
    case 1111...2000:
        return 0.15
    case 2000...:
        return 0.25
    default:
        return 0.0
    
    }
    
}

func winGift(for sum:Double) -> String{
    switch sum{
    case 500:
        return "You are lucky. Your gift is lemon"
    case 1000:
        return "You are superman. Your gift is banana"
    case 1111:
        return "You are are binary customer. Your gift is apple"
    default:
        return ""
    }
}



func printCustomerInfo(_ customer: Customer) {
    
    let discount :Double = calculateDiscount(for: customer.sum)
    
    let winGiftBonus: String =  winGift(for: customer.sum)
    
    
    print("Customer: \(customer.name)")
    print("Price amount: \(customer.sum)")
        
    let discountedAmount: Double

    if customer.isPartner && discount == 0 {
        
        discountedAmount = customer.sum * 0.95
        print("Customer is partner")
        print("Discount: \(discount)%")
        print("Partnership discount: 5%")
        
    } else if !customer.isPartner {
        
        discountedAmount = customer.sum * (1 - discount)
        print("Customer is not partner")
        print("Discount: \(Int(discount * 100))%")
        
    } else {
        
        discountedAmount = customer.sum * (1 - (discount * 2))
        print("Customer is partner")
        print("Discount: \(Int((discount * 100) * 2))%")
        
    }
    
    print("Discounted amount: \(String(format: "%.1f", discountedAmount) )")
    print("\(winGiftBonus)\n")
}


for customer in customers {
    printCustomerInfo( customer) }
