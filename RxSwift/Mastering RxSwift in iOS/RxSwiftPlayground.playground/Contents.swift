import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

//let observable = Observable.just(1)
//let observable2 = Observable.of(1,2,3)
//let observable3 = Observable.of([1,2,3])
//let observable4 = Observable.from([1,2,3,4,5])

//observable4.subscribe({ event in
//    //print events
////    print(event)
//    if let element = event.element {
//        print(element)
//    }
//})

//observable3.subscribe({ event in
//    //print events
////    print(event)
//    if let element = event.element {
//        print(element )
//    }
//})

//observable4.subscribe(onNext: { element in
//    print(element)
//})

//Observable.of("A", "B", "C").subscribe({ event in
////    print($0)
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
//
//subject.onNext("Issue 1")
//
//subject.subscribe({ event in
//    print(event)
//}).disposed(by: disposeBag)
//
//
//subject.onNext("Issue 2")
//subject.onNext("Issue 3")

//***Behavior subjects
//let subject = BehaviorSubject(value: "Initial issue")
//
//subject.onNext("Second issue")
//
//subject.subscribe({ event in
//    print(event)
//}).disposed(by: disposeBag)
//
//subject.onNext("Issue 1")

//***Replay subjects
//let subject = ReplaySubject<String>.create(bufferSize: 2)
//subject.onNext("Issue 1")
//subject.onNext("Issue 2")
//subject.onNext("Issue 3")
//
//subject.subscribe({ event in
//    print(event)
//})
//
//subject.onNext("Issue 4")
//subject.onNext("Issue 5")
//subject.onNext("Issue 6")
//
//print("[Subscription 2]")
//
//subject.subscribe({ event in
//    print(event)
//})

//***Variables
//let variable = Variable<[String]>([String]())
//variable.value.append("Issue 1")
//variable.value.append("Issue 2")
//
//variable.asObservable().subscribe({ event in
//    print(event)
//})
//
//variable.value.append("Issue 3")
//variable.value.append("Issue 4")

//***Behavior Relay
//let relay = BehaviorRelay<String>(value: "Initial value")
//
//relay.asObservable().subscribe({ event in
//    print(event)
//})
//
//relay.accept("Secont issue")

//let relay2 = BehaviorRelay<[String]>(value: [String]())
//let relay2 = BehaviorRelay<[String]>(value: ["Item 1"])

//relay2.accept(["Item 2"]) bad approach
//relay2.accept(relay2.value + ["Item 2"]) correct but not the best
//var value = relay2.value
//value.append("Item 2")
//value.append("Item 3")
//value.append("Item 4")
//
//relay2.accept(value)
//relay2.asObservable().subscribe({ event in
//    print(event)
//})

