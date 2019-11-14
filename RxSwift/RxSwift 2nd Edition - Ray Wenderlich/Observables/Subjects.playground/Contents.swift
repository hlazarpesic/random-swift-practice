import UIKit
import RxSwift

enum MyError: Error {
    case anError
}

let db = DisposeBag()


//MARK: Publish Subject
//let publishSubject = PublishSubject<String>()
//
//publishSubject.onNext("1")
//
//let subscriptionOne = publishSubject.subscribe({ item in
//    print(item)
//})
//
//publishSubject.onNext("2")
//
//let subscriptionTwo = publishSubject.subscribe({ item in
//    print("2)", item)
//})
//
//publishSubject.onNext("3")
//
//subscriptionOne.dispose()
//
//publishSubject.onNext("4")
//
//publishSubject.onCompleted()
//publishSubject.onNext("5")
//subscriptionTwo.dispose()
//
//publishSubject.subscribe({ item in
//    print("3)", item)
//    }).disposed(by: db)
//
//publishSubject.onNext("?")


//MARK: Behavior Subject
//let subject = BehaviorSubject<String>(value: "Initial value")
//
//let subscriptionOne = subject.subscribe { event in
//    print(event)
//}
//subject.onNext("1")
//
//let subscriptionTwo = subject.subscribe { event in
//    print("2)",event)
//}
//
//subject.onNext("2")
//
//subject.onError(MyError.anError)
//
//let subscriptionThree = subject.subscribe{ event in
//    print("3)", event)
//}
//


//MARK: Replay Subject
let subject = ReplaySubject<String>.create(bufferSize: 2)
subject.onNext("1")
subject.onNext("2")
subject.onNext("3")

subject.subscribe { event in
    print("1)", event)
}.disposed(by: db)

subject.subscribe { event in
    print("2)", event)
}.disposed(by: db)

subject.onNext("4")
subject.onError(MyError.anError)
subject.dispose()

subject.subscribe { event in
    print("3)", event)
}.disposed(by: db)


