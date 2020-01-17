import UIKit

class Document {
    
}

protocol Printer {
    
    func print(d: Document)
}

protocol Scanner {
    
    func scan(d: Document)
}

protocol Fax {
    
    func fax(d: Document)
}

protocol MultiFunctionDevice: Printer, Scanner, Fax {
    
}


//MARK: Devices

class OrdinaryPrinter: Printer {
    
    func print(d: Document) {
        
    }
}

class Photocopier: Printer, Scanner {
    
    func print(d: Document) {
        
    }
    
    func scan(d: Document) {
        
    }
}

class MultiFunctionMachine: MultiFunctionDevice {
    
    fileprivate let printer: Printer
    fileprivate let scanner: Scanner
    
    init(printer: Printer, scanner: Scanner) {
        self.printer = printer
        self.scanner = scanner
    }
    
    
    func print(d: Document) {
        printer.print(d: d) //Decorator
    }
    
    func scan(d: Document) {
        scanner.scan(d: d)
    }
    
    func fax(d: Document) {
        
    }
}
