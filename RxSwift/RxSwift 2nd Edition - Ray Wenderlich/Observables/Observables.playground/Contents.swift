import UIKit
import RxSwift

enum MyError: Error {
    case anyError
}

enum FileReadError: Error {
    case fileNotFound
    case unreadable
    case encodingFailed
}

var str = "Hello, playground"
var db = DisposeBag()

//var observable = Observable.from(["demo", "demo 2"])
//observable.subscribe(onNext: { item in
//    print(item)
//}).disposed(by: db)

//var observable1 = Observable.range(start: 0, count: 10)
//observable1.subscribe(onNext: { num in
//    print(num)
//    }).disposed(by: db)


//let observable = Observable<String>.create{ observer in
//    observer.onNext("1")
//    observer.onError(MyError.anyError)
//    observer.onCompleted()
//    return Disposables.create()
//}
//
//observable.subscribe(
//    onNext: { item in
//        print(item)
//}, onError: { error in
//    print(error)
//}, onCompleted: {
//    print("completed")
//}, onDisposed: {
//    print("disposed")
//})
//    .disposed(by: db)

//MARK: Creating Observable Factories
//var flip = false
//
//let factories = Observable<Int>.deferred {
//
//    flip = !flip
//
//    if flip {
//        return Observable.of(1, 2, 3)
//    } else {
//        return Observable.of(4, 5, 6)
//    }
//}
//
//for _ in 0...3 {
//    factories.subscribe( onNext: { item in
//        print(item, terminator: " ")
//        }).disposed(by: db)
//}



//MARK: Using Traits

func loadText(from name: String) -> Single<String> {
    return Single.create{ single in
        
        let disposable = Disposables.create()
        
        guard let path = Bundle.main.path(forResource: name, ofType: "txt") else {
            single(.error(FileReadError.fileNotFound))
            return disposable
        }
        
        
        guard let data = FileManager.default.contents(atPath: path) else {
            single(.error(FileReadError.unreadable))
            return disposable
        }
        
        guard let contents = String(data: data, encoding: .utf8) else {
            single(.error(FileReadError.encodingFailed))
            return disposable
        }
        
        single(.success(contents))
        return disposable
    }
}

loadText(from: "").subscribe(
    onSuccess: { content in
        print(content)
}, onError: { error in
    print(error)
}) 
 
