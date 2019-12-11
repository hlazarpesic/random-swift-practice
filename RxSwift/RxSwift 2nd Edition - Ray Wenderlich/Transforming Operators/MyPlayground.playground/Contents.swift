import UIKit
import RxSwift

fileprivate let db = DisposeBag()


//MARK: toArray() operator

//let observable = Observable.of ("A", "B", "C")
//
//observable
//    .toArray()
//    .subscribe(onSuccess: {
//        print($0)
//    }, onError: {
//        print($0)
//    }).disposed(by: db)


//MARK: map() operator

//let formatter = NumberFormatter()
//formatter.numberStyle = .spellOut
//
//let observable = Observable<NSNumber>.of(123, 4, 56)
//
//observable.map {
//    formatter.string(from: $0) ?? ""
//}
//.subscribe(onNext: {
//    print($0)
//}).disposed(by: db)

//let observable = Observable.of (1, 2, 3, 4, 5, 6, 7)
//
//observable.enumerated()
//    .map { index, integer in
//        index > 2 ? integer * 2 : integer
//}.subscribe(onNext: {
//    print($0)
//}).disposed(by: db)


//MARK: flatMap and flatMapLatest operators

enum MyError: Error {
    
    case anError
}

struct Student {
    var score: BehaviorSubject<Int>
}

let ryan = Student(score: BehaviorSubject(value: 80))
let charlotte = Student(score: BehaviorSubject(value: 90))

//let student = PublishSubject<Student>()

///MARK: flatMap

//student
//    .flatMap {
//        $0.score
//}
//.subscribe(onNext: {
//    print($0)
//}).disposed(by: db)
//
//student.onNext(ryan)
//ryan.score.onNext(85)
//
//student.onNext(charlotte)
//ryan.score.onNext(95)
//charlotte.score.onNext(100)


///MARK: flatMapLatest

//student
//    .flatMapLatest {
//        $0.score
//}
//.subscribe(onNext: {
//    print($0)
//}).disposed(by: db)
//
//student.onNext(ryan)
//ryan.score.onNext(85)
//student.onNext(charlotte)
//ryan.score.onNext(95)
//
//charlotte.score.onNext(100)

///MARK: Observing events - materialize

let student = BehaviorSubject(value: ryan)

let studentScore = student
    .flatMapLatest {
        $0.score.materialize()
}

studentScore
    .filter {
        guard $0.error == nil else {
            print($0.error!.localizedDescription)
            return false
        }
        return true
}
.dematerialize()
.subscribe(onNext: {
    print($0)
})
    .disposed(by: db)

ryan.score.onNext(85)
ryan.score.onError(MyError.anError)
ryan.score.onNext(90)

student.onNext(charlotte)
