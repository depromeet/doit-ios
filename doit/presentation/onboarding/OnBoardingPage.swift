//
//  OnBoardingPage.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

enum OnBoardingPage: Int {
    case first = 1
    case second = 2
    case third = 3
    case fourth = 4
    case fifth = 5
    
    var title: String {
        switch self {
        case .first:    return "#친구들과 목표이루기"
        case .second:   return "#다양한 Goal 인증방식"
        case .third:    return "#우리만의 Timeline"
        case .fourth:   return "#친구야 안하니? Push"
        case .fifth:    return "#다크모드 디자인"
        }
    }
    
    var description: String {
        switch self {
        case .first:
            return """
                   남들은 속여도 내 친구는 못 속여~
                   친구들과 함께해서 더 확실한 내기!
                   """
        case .second:
            return """
                   사진, 타이머, 글…
                   우리와 맞는 인증방식으로!
                   """
        case .third:
            return """
                   목표를 위해 함께 이루는 친구들의
                   타임라인을 볼 수 있어요.
                   """
        case .fourth:
            return """
                   Goal을 이루기 위해
                   함께 하라고 푸시알림이 와요
                   """
        case .fifth:
            return """
                   트렌디한 다크모드 디자인과
                   그라디언트로 우리만의 Goal을 꾸며보세요.
                   """
        }
    }
    
    var image: UIImage? {
        switch self {
        case .first:    return UIImage(named: "onboardingFirst")
        case .second:   return UIImage(named: "onboardingSecond")
        case .third:    return UIImage(named: "onboardingThird")
        case .fourth:   return UIImage(named: "onboardingFourth")
        case .fifth:    return UIImage(named: "onboardingFifth")
        }
    }
}


extension OnBoardingPage: CaseIterable {
    
}
