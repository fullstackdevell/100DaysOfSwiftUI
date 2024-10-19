protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var agent: String { get }
    func salesSummary()
    
}



struct House: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    
    func salesSummary() {
        print("House with \(rooms) rooms, costs $\(cost), sold by \(agent)")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    
    func salesSummary() {
        print ("Office with \(rooms) rooms, costs $\(cost), sold by \(agent)")
    }
}


let house = House(rooms: 3, cost: 300000, agent: "Dave Grohl")
let office = Office(rooms: 10, cost: 1500000, agent: "Bill Gates")

house.salesSummary()
office.salesSummary()
