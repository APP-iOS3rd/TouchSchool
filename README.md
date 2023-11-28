# 🏫 학교 대항전
## 📖 목차
1. [소개](#🌱-소개)
2. [개발환경 및 라이브러리](#💻-개발환경-및-라이브러리)
3. [Tree](#🌲-tree)
4. [키워드](#🔑-키워드)
5. [타임라인](#⏰-타임라인)
6. [실행화면](#📱-실행-화면)
7. [트러블슈팅](#❓-트러블-슈팅)

## 🌱 소개
### 학교를 선택하고 게임화면으로 가서 화면을 터치하며 점수를 올리는 앱입니다.

### 🧑🏻‍💻 팀원
|[최동호](https://github.com/hamfan524)|[황성진](https://github.com/Hsungjin)|[김성엽](https://github.com/RapidSloth)|[김혜란](https://github.com/hyeran1122)|[윤준성](https://github.com/PinkSoju)|
|-----------|-----------|-----------|------------|------------|
|<img src="https://user-images.githubusercontent.com/96968834/212670363-ae5dbf8f-dc1a-41b2-a08e-21a6f5f345b1.jpg" width="100">|<img src="https://avatars.githubusercontent.com/u/120264964?v=4" width="100">|<img src="https://i.ibb.co/dWrn9Tb/Kakao-Talk-Photo-2023-09-19-15-30-11.jpg" alt="Kakao-Talk-Photo-2023-09-19-15-30-11" width="100">|<img width="90" alt="1f" src="https://postfiles.pstatic.net/MjAyMjA3MjRfMjAz/MDAxNjU4NjQxNzk3MjA2.eittTtSlRsPrC8HlcuNqKZW-duuJnmgaMAjEdx8cwSsg.oO1hUAN305tH-vDXgRa5VldUiUA0GqP4Ly52FlEqcMIg.JPEG.hyeran931122/IMG_7071.JPG?type=w580">|<img src="https://avatars.githubusercontent.com/u/127680963?v=4" width="100">|



## ⚙️ 개발 환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.9.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-15.0.1-blue)]()
[![Firebase](https://img.shields.io/badge/Firebase-10.16.0-green)]()
[![Alamofire](https://img.shields.io/badge/Alamofire-5.8.0-red)]()
[![GoogleMobileAds](https://img.shields.io/badge/GoogleMobileAds-10.13.0-yellow)]()

## 🌲 Tree
```
📦TouchSchool
 ┣ 📂iOS
 ┃ ┣ 📂AD
 ┃ ┃ ┣ 📜BannerView.swift
 ┃ ┃ ┗ 📜BannerViewController.swift
 ┃ ┣ 📂Game
 ┃ ┃ ┣ 📜GameVM.swift
 ┃ ┃ ┗ 📜GameView.swift
 ┃ ┣ 📂Helpers
 ┃ ┃ ┣ 📂Font
 ┃ ┃ ┃ ┣ 📜Giants-Bold.otf
 ┃ ┃ ┃ ┗ 📜Recipekorea.ttf
 ┃ ┃ ┣ 📂Sound
 ┃ ┃ ┃ ┣ 📜buttomBGM.mp3
 ┃ ┃ ┃ ┣ 📜buttonBGM.mp3
 ┃ ┃ ┃ ┣ 📜errorBGM.mp3
 ┃ ┃ ┃ ┗ 📜mainBGM.mp3
 ┃ ┃ ┣ 📜ActivityIndicator.swift
 ┃ ┃ ┣ 📜Audio.swift
 ┃ ┃ ┣ 📜Colors.swift
 ┃ ┃ ┣ 📜Helpers.swift
 ┃ ┃ ┣ 📜infoView.swift
 ┃ ┃ ┣ 📜MultitouchRepresentable.swift
 ┃ ┃ ┗ 📜MultitouchView.swift
 ┃ ┣ 📂Main
 ┃ ┃ ┣ 📜MainVM.swift
 ┃ ┃ ┗ 📜MainView.swift
 ┃ ┣ 📂Model
 ┃ ┃ ┣ 📜School.swift
 ┃ ┃ ┗ 📜Smoke.swift
 ┃ ┣ 📂Rank
 ┃ ┃ ┗ 📜RankView.swift
 ┃ ┗ 📂Search
 ┃ ┃ ┣ 📜FirebaseManager.swift
 ┃ ┃ ┣ 📜SearchBar.swift
 ┃ ┃ ┣ 📜SearchGuide.swift
 ┃ ┃ ┣ 📜SearchVM.swift
 ┃ ┃ ┗ 📜SearchView.swift
 ┣ 📜ContentView.swift
 ┣ 📜GoogleService-Info.plist
 ┣ 📜Info.plist
 ┗ 📜TouchSchoolApp.swift
```

## 🔑 키워드
- `MVVM`
- `URLSession`
- `Alamofire`
- `Firebase`


## ⏰ 타임라인

<details>
<summary>Step 1 타임라인</summary>

- 23.10.11 ~ 23.10.17
    - 프로젝트 시작
    - 학교검색화면 구현
    - 메인화면 구현
- 23.10.19 ~ 23.10.26
    - 초,중,고등학교 데이터 가져와서 저장
    - URLSession -> Alamofire 라이브러리 적용
    - 학교정보 검색 시 필터링 기능 구현
</details>

<details>
<summary>Step 2 타임라인</summary>

- 23.11.02 ~ 23.11.03
    - Firebase와 데이터 주고 받는 함수들 구현
    - 학교 선택 시 Firebase에 추가 및 데이터 연결
    - 배경화면 수정
    - 깃 컨벤션 템플릿 추가
- 23.11.06 ~ 23.11.15
    - 랭킹 화면 추가
    - 게임 기능 구현 완료
    - 앱 실행 시 메인화면이 먼저나오도록 로직 수정
- 23.11.16
    - 앱 종료 후 들어왔을 때 데이터 남게 수정
    - 터치시 이벤트 추가
</details>

<details>
<summary>Step 3 타임라인</summary>

- 23.11.17
    - 비정상적인 값 검출 및 초기화 기능 구현
- 23.11.19 ~ 23.11.21
    - UI 수정 및 sound데이터 추가
    - 게임 화면 터치 애니메이션 추가
- 23.11.22
    - 메인BGM, 터치BGM, 오류BGM 추가
    - 게임화면 멀티터치 기능 구현
    - 앱 아이콘 생성
- 23.11.23
    - 커스텀 폰트 적용
    - Sound 인스턴스 생성 후 재사용 로직으로 변경
    - 오디오 재생 백그라운드 스레드에서 처리
</details>


## 📱 실행 화면

|앱 실행|학교선택|
|:--:|:--:|
|<img src="https://github.com/APP-iOS3rd/TouchSchool/assets/37105602/a3f39f8e-1d14-438b-8e32-bb4a11b36e55" width="300">|<img src="https://github.com/APP-iOS3rd/TouchSchool/assets/37105602/3a6d3076-78ec-4050-88f9-a919444ce9e0" width="300">|

|게임화면|랭킹화면|
|:--:|:--:|
|<img src="https://github.com/APP-iOS3rd/TouchSchool/assets/37105602/cc1750a0-9982-41f1-81be-b813bff09fd0" width="300">|<img src="https://github.com/APP-iOS3rd/TouchSchool/assets/37105602/54e05fda-e9be-4d0e-8ba3-e8fc9239cc77" width="300">|

## ❓ 트러블 슈팅

### Step1

<details>
<summary>GameView 멀티 터치가 안되던 이슈</summary>

- `GameView`에서 화면을 터치할 때 여러 손가락으로 화면을 터치하면 먹히는 현상이 있었습니다.
- `SwiftUI`는 직접적인 멀티터치 처리를 위한 API를 제공하지 않기에 기본적인 `onTapGesture` 대신에 더 낮은 수준의 이벤트 처리를 사용했습니다.

- 멀티터치 기능을 활성화하기 위해 `UIViewRepresentable`프로토콜을 준수하는 `MultitouchRepresentable`과 `UIView`의 하위 클래스인 `MultitouchView`를 추가했습니다.

- `makeUIView(context:)` 이 메소드는 `MultitouchView` 생성을 담당합니다. `MultitouchView`의 `touchBegan` 클로저를 설정합니다. 이 클로저는 `MultitouchView`에서 터치가 시작될 때마다 호출됩니다.

```Swift 

struct MultitouchRepresentable: UIViewRepresentable {
    var touchBegan: ((CGPoint) -> Void)

    func makeUIView(context: Context) -> MultitouchView {
        let view = MultitouchView()
        view.touchBegan = touchBegan
        return view
    }

    func updateUIView(_ uiView: MultitouchView, context: Context) {
    }
}
```

- `isMultipleTouchEnabled = true` 이 코드를 통해 뷰가 여러 개의 동시 터치 이벤트를 감지할 수 있었습니다.
- `touchesBegan(_:with:)` 이는 뷰에서 새로운 터치가 감지될 때마다 호출되는 `UIView`의 메서드를 재정의합니다. 이 메서드는 각 터치를 처리하고 터치 위치와 함께 `touchBegan`클로저를 호출합니다.

```Swift
import UIKit

class MultitouchView: UIView {
    var touchBegan: ((CGPoint) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        isMultipleTouchEnabled = true 
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touches.forEach { touch in
            let location = touch.location(in: self)
            touchBegan?(location)
        }
    }
}

```

- 사용자가 화면을 터치할 때마다 `MultitouchView`의 `touchesBegan(_:with:)`가 호출되고, 이는 차례로 `touchBegan`클로저를 호출하게 됩니다.
- 이 코드를 통해 여러 터치 이벤트를 동시에 감지하고 응답할 수 있게 해결했습니다. 
</details>

### Step 2
<details>
<summary>터치 효과음 관련 에러</summary>

- `SoundSetting` 클래스에서 `playSound`메서드로 버튼을 클릭하면 효과음이 나오는 효과를 주려고했습니다.
- `playSound` 메서드에서는 매번 새로운 `AVAudioPlayer 인스턴스를 생성하고 있었고, 이는 비효율적이며 성능 저하를 일으키고 있었습니다.
- 또, `playSound` 메서드가 메인 스레드에서 오디오를 재생하여 화면이 뚝뚝 끊기는 문제가 있었습니다.

```Swift
//변경 전
class SoundSetting: ObservableObject {
    static let instance = SoundSetting()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case mainBGM = "mainBGM"
        case buttonBGM = "buttonBGM"
        case errorBGM = "errorBGM"
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            player?.volume = 1
        } catch {
            print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }
```
- 각 사운드별로 `AVAudioPlayer` 인스턴스를 사전에 생성하고 저장하는 방식으로 `SoundSetting` 클래스를 수정했습니다.
- 또한, 오디오 재생을 백그라운드 스레드에서 수행하도록 변경했습니다.

```Swift
// 수정 후
class SoundSetting: ObservableObject {
    static let instance = SoundSetting()
    private var players: [SoundOption: AVAudioPlayer] = [:]

    enum SoundOption: String, CaseIterable {
        case mainBGM = "mainBGM"
        case buttonBGM = "buttomBGM"
        case errorBGM = "errorBGM"
    }

    init() {
        for sound in SoundOption.allCases {
            if let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") {
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    player.prepareToPlay()
                    players[sound] = player
                } catch {
                    print("오디오 플레이어 초기화 실패: \(error)")
                }
            } else {
                print("사운드 파일 로드 실패: \(sound.rawValue).mp3")
            }
        }
    }

    func playSound(sound: SoundOption) {
        DispatchQueue.global().async {
            if let player = self.players[sound], !player.isPlaying {
                player.play()
                player.volume = 0.1
            }
        }
    }
}
```
</details>