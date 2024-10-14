class Animal {
    let legs: Int
    
    init(legs: Int = 4) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Woof! Woof!")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init()
    }
    
    func speak() {
        print("Meow!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Woof! Woof! Woof!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Woof! Woof! Woof! Woof!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Meow! Meow!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Meow! Meow! Meow!")
    }
}


let dog = Dog()
dog.speak()

let poodle = Poodle()
poodle.speak()

let corgi = Corgi()
corgi.speak()

let cat = Cat(isTame: true)
cat.speak()

let persian = Persian(isTame: true)
persian.speak()

let lion = Lion(isTame: false)
lion.speak()
