import UIKit
import RxSwift

//let observable = Observable.just(1)
//
//let observable2 = Observable.of(1,2,3)
//
//let observable3 = Observable.of([1,2,3])
//
//let observable4 = Observable.from([1,2,3,4,5])
//
//observable4.subscribe({ event in
//    //print events
////    print(event)
//    if let element = event.element {
//        print(element)
//    }
//})
//
//observable3.subscribe({ event in
//    //print events
////    print(event)
//    if let element = event.element {
//        print(element )
//    }
//})
//
//observable4.subscribe(onNext: { element in
//    print(element)
//})

let disposeBag = DisposeBag()

//Observable.of("A", "B", "C").subscribe({ event in
////    print($0)
//    print(event)
//}).disposed(by: disposeBag)

Observable<String>.create({ observer in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?")
    return Disposables.create()
}).subscribe(onNext: { event in
    print(event)
}, onError: { error in
    print(error)
}, onCompleted: {
    print("Completed")
}, onDisposed: {
    print("Disposed")
}).disposed(by: disposeBag )
