struct Car {
    let model: String
    let seats: Int
    private var gear = 5
    
    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
    }
    
    mutating func changeGear(to newGear: Int) {
        if newGear > 0 && newGear < 10 {
            print("gear changed to: \(newGear)")
            self.gear = newGear
        }
        else {
            print("gear can't be changed to: \(newGear)")
        }
    }
    func showCurrentGear() {
            print("Current gear is: \(gear)")
        }
}


var vwBeetle = Car(model: "VW Beetle", seats: 4)

vwBeetle.showCurrentGear()

vwBeetle.changeGear(to: 7)
vwBeetle.showCurrentGear()

vwBeetle.changeGear(to: 0)
