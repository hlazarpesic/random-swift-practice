import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

//let observable = Observable.just(1)
//let observable2 = Observable.of(1,2,3)
//let observable3 = Observable.of([1,2,3])
//let observable4 = Observable.from([1,2,3,4,5])

//observable4.subscribe({ event in
////    print(event)
//    if let element = event.element {
//        print(element)
//    }
//})

//observable3.subscribe({ event in
////    print(event)
//    if let element = event.element {
//        print(element )
//    }
//})

//observable4.subscribe(onNext: { element in
//    print(element)
//})

//Observable.of("A", "B", "C").subscribe({ event in
//    print(event)
//}).disposed(by: disposeBag)

//Observable<String>.create({ observer in
//    observer.onNext("A")
//    observer.onCompleted()
//    observer.onNext("?")
//    return Disposables.create()
//}).subscribe(onNext: { event in
//    print(event)
//}, onError: { error in
//    print(error)
//}, onCompleted: {
//    print("Completed")
//}, onDisposed: {
//    print("Disposed")
//}).disposed(by: disposeBag)


//***Publish subjects
//let subject = PublishSubject<String>()
//subject.onNext("Issue 1")

//subject.subscribe({ event in
//    print(event)
//}).disposed(by: disposeBag)

//subject.onNext("Issue 2")
//subject.onNext("Issue 3")


//***Behavior subjects
//let subject = BehaviorSubject(value: "Initial issue")
//subject.onNext("Second issue")

//subject.subscribe({ event in
//    print(event)
//}).disposed(by: disposeBag)

//subject.onNext("Issue 1")


//***Replay subjects
//let subject = ReplaySubject<String>.create(bufferSize: 2)
//subject.onNext("Issue 1")
//subject.onNext("Issue 2")
//subject.onNext("Issue 3")

//subject.subscribe({ event in
//    print(event)
//})

//subject.onNext("Issue 4")
//subject.onNext("Issue 5")
//subject.onNext("Issue 6")

//print("[Subscription 2]")

//subject.subscribe({ event in
//    print(event)
//})


//***Variables
//let variable = Variable<[String]>([String]())
//variable.value.append("Issue 1")
//variable.value.append("Issue 2")

//variable.asObservable().subscribe({ event in
//    print(event)
//})

//variable.value.append("Issue 3")
//variable.value.append("Issue 4")


//***Behavior Relay
//let relay = BehaviorRelay<String>(value: "Initial value")

//relay.asObservable().subscribe({ event in
//    print(event)
//})

//relay.accept("Secont issue")

//let relay2 = BehaviorRelay<[String]>(value: [String]())
//let relay2 = BehaviorRelay<[String]>(value: ["Item 1"])

//relay2.accept(["Item 2"]) bad approach
//relay2.accept(relay2.value + ["Item 2"]) correct but not the best
//var value = relay2.value
//value.append("Item 2")
//value.append("Item 3")
//value.append("Item 4")

//relay2.accept(value)
//relay2.asObservable().subscribe({ event in
//    print(event)
//})


//***Filtering operators
//let strikes = PublishSubject<String>()

//***Ignore operator
//strikes
//    .ignoreElements()
//    .subscribe ({ _ in
//        print("[Subscription is called]")
//    }).disposed(by: disposeBag)
//
//strikes.onNext("A")
//strikes.onNext("B")
//strikes.onNext("C")
//strikes.onCompleted()


//***ElementAt operator
//strikes
//    .elementAt(2)
//    .subscribe(onNext: { text in
//        print("You are out!")
//}).disposed(by: disposeBag)
//strikes.onNext("A")
//strikes.onNext("B")
//strikes.onNext("C")


//***Filter operator
//Observable.of(1,2,3,4,5,6,7,8,9)
//    .filter({ $0 % 2 == 0})
//    .subscribe(onNext: { number in
//        print(number)
//    }).disposed(by: disposeBag)

//var subject = PublishSubject<Int>()
//subject.asObservable()
//    .filter({$0 % 2 == 0})
//    .subscribe(onNext: { number in
//        print(number)
//    }).disposed(by: disposeBag)
//
//subject.onNext(1)
//subject.onNext(2)
//subject.onNext(3)
//subject.onNext(4)
//subject.onNext(5)
//subject.onNext(6)
//subject.onNext(7)
//subject.onNext(8)
//subject.onNext(9)


//***Skip operator
//Observable.of("A","B", "C", "D", "E", "F")
//    .skip(3)
//    .subscribe(onNext: { item in
//        print(item)
//    }).disposed(by: disposeBag)


//***SkipWhile operator
//Observable.of(2,2,3,4,4)
//    .skipWhile({ $0 % 2 == 0})
//    .subscribe(onNext: { item in
//        print(item)
//    }).disposed(by: disposeBag)


//***SkipUntil operator
//let subject = PublishSubject<String>()
//let trigger = PublishSubject<String>()

//subject
//    .skipUntil(trigger)
//    .subscribe(onNext: { item in
//        print(item)
//    }).disposed(by: disposeBag)

//subject.onNext("A")
//subject.onNext("B")
//trigger.onNext("X")
//subject.onNext("C")


//***Take operator
//Observable.of(1,2,3,4,5,6)
//    .take(3)
//    .subscribe(onNext: { item in
//        print(item)
//    }).disposed(by: disposeBag)


//***TakeWhile operator
//Observable.of(2,4,6,7,8,9,10)
//    .takeWhile({ $0 % 2 == 0})
//    .subscribe(onNext: { item in
//        print(item)
//    }).disposed(by: disposeBag)


//***TakeUntil operator
//let subject = PublishSubject<String>()
//let triger = PublishSubject<String>()

//subject
//    .takeUntil(triger)
//    .subscribe(onNext: { item in
//        print(item)
//    }).disposed(by: disposeBag)

//subject.onNext("A")
//subject.onNext("B")
//subject.onNext("C")
//triger.onNext("X")

//subject.onNext("D")
//subject.onNext("E")


//***Transform operators
//**ToArray operator
//Observable.of(1,2,3,4,5)
//    .toArray()
//    .subscribe(onNext: { event in
//        print(event)
//    }).disposed(by: disposeBag)


//***Map operator
//Observable.of(1,2,3,4,5)
//    .map({$0 * 2})
//    .subscribe(onNext: {event in
//        print(event)
//    }).disposed(by: disposeBag)


//***FlatMap & FlatMapLatest operator
//struct Student {
//    var score: BehaviorRelay<Int>
//}

//let john = Student(score: BehaviorRelay<Int>(value: 60))
//let mary = Student(score: BehaviorRelay<Int>(value: 80))

//***Flatmap
//let student = PublishSubject<Student>()
//student
//    .flatMap({ $0.score.asObservable() })
//    .subscribe(onNext: { event in
//        print(event)
//    }).disposed(by: disposeBag)
//
//student.onNext(john)
//student.onNext(mary)
//john.score.accept(100)


//***FlatMapLatest
//let student = PublishSubject<Student>()
//student
//    .flatMapLatest({ $0.score.asObservable() })
//    .subscribe(onNext: { event in
//        print(event)
//    }).disposed(by: disposeBag)

//student.onNext(john)
//student.onNext(mary)
//john.score.accept(100)
//mary.score.accept(45)


//***Starts with operator
//let numbers = Observable.of(2,3,4,5)
//let observable = numbers.startWith(1)

//observable.subscribe(onNext: { event in
//    print(event)
//}).disposed(by: disposeBag)

//***Concate operator
//let first = Observable.of(1,2,3)
//let second = Observable.of(4,5,6)

//let observable = Observable.concat([first,second])
//observable.subscribe(onNext: { event in
//    print(event)
//}).disposed(by: disposeBag)


//***Merge operator
//let left = PublishSubject<Int>()
//let right = PublishSubject<Int>()

//let source = Observable.of(left.asObserver(), right.asObserver())
//let observable = source.merge()
//observable.subscribe(onNext: { number in
//    print(number)
//}).disposed(by: disposeBag)

//left.onNext(1)
//right.onNext(4)
//right.onNext(5)
//left.onNext(2)
//right.onNext(6)
//left.onNext(3)


//***Combine latest operator
//let left = PublishSubject<Int>()
//let right = PublishSubject<Int>()

//let observable = Observable.combineLatest(left, right, resultSelector: { lastLeft, lastRight in
//    "\(lastLeft) : \(lastRight)"
//})

//let disposable = observable.subscribe(onNext: { event in
//    print(event)
//})

//left.onNext(45)
//right.onNext(1)
//left.onNext(30)
//right.onNext(99)
//right.onNext(2)


//***Login example
//let userName = BehaviorRelay<String>(value: "")
//let password = BehaviorRelay<String>(value: "")

//let isEnable = Observable.combineLatest(userName.asObservable(), password.asObservable(), resultSelector: { lastUsername, lastPassword in
//    return(!lastUsername.isEmpty && !lastPassword.isEmpty)
//})

//isEnable.asObservable().subscribe(onNext: { event in
//    print(event)
//})

//userName.accept("a")
//password.accept("a")
//userName.accept("")


//***WithLatestFrom operator
//let button = PublishSubject<Void>()
//let textField = PublishSubject<String>()

//let observable = button.withLatestFrom(textField)
//observable.subscribe(onNext: { event in
//    print(event)
//}).disposed(by: disposeBag)

//textField.onNext("a")
//textField.onNext("as")
//textField.onNext("asd")
//button.onNext(())
//textField.onNext("asdf")
//button.onNext(())


//***Reduce operator
//let source = Observable.of(1,2,3,4)
//source.reduce(0, accumulator: +).subscribe(onNext: { event in
//    print(event)
//}).disposed(by: disposeBag)

//source.reduce(0, accumulator: { summary, newValue in
//    return summary + newValue
//}).subscribe(onNext: { event in
//    print(event)
//}).disposed(by: disposeBag)


//***Scan operator
//let source = Observable.of(1,2,3,4)
//source.scan(0, accumulator: +).subscribe(onNext: { event in
//    print(event)
//}).disposed(by: disposeBag)



