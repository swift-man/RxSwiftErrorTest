//
//  main.swift
//  RxSwiftErrorTest
//
//  Created by 김승진 on 2021/08/22.
//

import Foundation
import RxSwift
import RxCocoa

let one = Observable.just(1)
let two = Observable.just(2)
let three = Observable<Int>.create { observer in
    observer.onNext(3)
    observer.onError(RxError.unknown)
    return Disposables.create()
}

Observable.concat(one, two, three).subscribe({
    print($0)
})

Observable.combineLatest(one, two, three).subscribe({
    print($0)
})

Observable.zip(one, two, three).subscribe({
    print($0)
})

Observable.from([1, 2, 3]).subscribe({
    print($0)
})

Observable.of(1, 2, 3).subscribe({
    print($0)
})

/*
 Observable.concat
 next(1)
 next(2)
 next(3)
 error(Unknown error occurred.)
 ----
 Observable.combineLatest
 next((1, 2, 3))
 error(Unknown error occurred.)
 ----
 Observable.zip
 next((1, 2, 3))
 error(Unknown error occurred.)
 ----
 Observable.from
 next(1)
 next(2)
 next(3)
 completed
 ----
 Observable.of
 next(1)
 next(2)
 next(3)
 completed
 ----
 */
