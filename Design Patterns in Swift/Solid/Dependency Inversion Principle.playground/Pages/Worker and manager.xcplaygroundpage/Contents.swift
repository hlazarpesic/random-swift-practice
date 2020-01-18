import Foundation

//The Dependency Inversion Principle states that:
///1. High-level modules should not depend on low-level modules. Both should depend on abstractions.
///2. Abstractions should not depend upon details. Details should depend upon abstractions.

protocol IWorker {
    
    func work()
}

class Worker: IWorker { //low-level
    
    func work() {
        
    }
}

class SuperWorker: IWorker {
    
    func work() {
        
    }
}

class Manager { //high-level
    
    var worker: IWorker!
    
    func setWoker(_ worker: IWorker) {
        self.worker = worker
    }
    
    func manage() {
        worker.work()
    }
}
