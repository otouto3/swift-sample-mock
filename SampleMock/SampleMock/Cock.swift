//
//  Cock.swift
//  SampleMock
//
//  Created by ごつ on 2022/07/09.
//


protocol CockProtocol {
    func cookRamen(bowls: Int, soup: Soup) -> [Ramen]
}

enum Soup {
    case 醤油
    case 味噌
}

struct Ramen {
    var soup: Soup
}

struct Waiter {
    let cock: CockProtocol // 依存オブジェクト　これをMockにする
    func order() -> [Ramen] {
        return cock.cookRamen(bowls: 2, soup: .醤油)
    }
}

class MockCock: CockProtocol {
    var cockRamenCallCount = 0
    var cockRamenLastBowls = 0
    var cockRamenCallReturn: [Ramen] = []
    var cockRamenLastSoup: Soup = .醤油
    
    func cookRamen(bowls: Int, soup: Soup) -> [Ramen] {
        // 呼び出し回数の記録
        cockRamenCallCount += 1
        
        // 引数の記録
        cockRamenLastBowls = bowls
        cockRamenLastSoup = soup
        
        //　任意の値を返す
        return cockRamenCallReturn
    }
}
