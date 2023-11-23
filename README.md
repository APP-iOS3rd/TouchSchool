# 🏫 학교 대항전
## 📖 목차
1. [소개](#🌱-소개)
2. [개발환경 및 라이브러리](#💻-개발환경-및-라이브러리)
3. [Tree](#🌲-tree)
4. [타임라인](#⏰-타임라인)
5. [실행화면](#📱-실행-화면)
6. [구현내용](#✨-구현내용)
7. [트러블슈팅](#❓-트러블-슈팅)

## 🌱 소개
### 학교를 선택하고 게임화면으로 가서 화면을 클릭하며 점수를 올리는 앱입니다.

### 🧑🏻‍💻 팀원
|[최동호](https://github.com/hamfan524)|[황성진](https://github.com/Hsungjin)|[김성엽](https://github.com/RapidSloth)|[김혜란](https://github.com/hyeran1122)|[윤준성](https://github.com/PinkSoju)|
|-----------|-----------|-----------|------------|------------|
|<img src="https://user-images.githubusercontent.com/96968834/212670363-ae5dbf8f-dc1a-41b2-a08e-21a6f5f345b1.jpg" width="100">|<img src="https://avatars.githubusercontent.com/u/120264964?v=4" width="100">|<img src="https://i.ibb.co/dWrn9Tb/Kakao-Talk-Photo-2023-09-19-15-30-11.jpg" alt="Kakao-Talk-Photo-2023-09-19-15-30-11" width="100">|<img width="90" alt="1f" src="https://postfiles.pstatic.net/MjAyMjA3MjRfMjAz/MDAxNjU4NjQxNzk3MjA2.eittTtSlRsPrC8HlcuNqKZW-duuJnmgaMAjEdx8cwSsg.oO1hUAN305tH-vDXgRa5VldUiUA0GqP4Ly52FlEqcMIg.JPEG.hyeran931122/IMG_7071.JPG?type=w580">|<img src="https://avatars.githubusercontent.com/u/127680963?v=4" width="100">|



## 💻 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.9.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-15.0.1-blue)]()
[![Firebase](https://img.shields.io/badge/Firebase-10.16.0-green)]()
[![Alamofire](https://img.shields.io/badge/Alamofire-5.8.0-red)]()
[![GoogleMobileAds](https://img.shields.io/badge/Alamofire-10.13.0-yellow)]()

## 🌲 Tree

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
|![시작](https://github.com/APP-iOS3rd/TouchSchool/assets/37105602/a3f39f8e-1d14-438b-8e32-bb4a11b36e55)|![학교검색](https://github.com/APP-iOS3rd/TouchSchool/assets/37105602/3a6d3076-78ec-4050-88f9-a919444ce9e0)|

|게임화면|랭킹화면|
|:--:|:--:|
|![게임](https://github.com/APP-iOS3rd/TouchSchool/assets/37105602/cc1750a0-9982-41f1-81be-b813bff09fd0)|![랭킹](https://github.com/APP-iOS3rd/TouchSchool/assets/37105602/54e05fda-e9be-4d0e-8ba3-e8fc9239cc77)|

## ✨ 구현내용

## ❓ 트러블 슈팅
