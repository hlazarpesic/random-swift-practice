import Foundation

//A class should have one, and only one, reason to change.

class Journal: CustomStringConvertible {
    
    var entries = [String]()
    var count = 0
    
    func addEntry(_ text: String) -> Int {
        count += 1
        entries.append("\(count): \(text)")
        return count - 1
    }
    
    func removeEntry(_ index: Int) {
        entries.remove(at: index)
    }
    
    var description: String {
        return entries.joined(separator: "\n")
    }
}

class Persistence {
    
    func saveToFile(_ journal: Journal, _ filePathName: String, _ overvrite: Bool = false) {
        
    }
    
    func load(_ fileName: String) { }
}

func main() {
    let j = Journal()
    let _ = j.addEntry("I cried today")
    let bug = j.addEntry("I ate a bug")
    print(j)
    j.removeEntry(bug)
    print("---")
    print(j)
    
    let p = Persistence()
    let filename = "mnt/C/asdflakjsdf"
    p.saveToFile(j, filename, false)
}

main()
