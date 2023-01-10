# Daily-Weather
   
## 1.プロジェクト概要
研修で学んだ内容の実習及び、先輩社員との協業を通じて実務感覚も身につけるた当プロジェクトを始めました。
### 1-1. 特徴   
<img width="200" alt="스크린샷 2022-11-15 15 23 10" src="https://user-images.githubusercontent.com/109661308/211483736-39fe1e60-165e-440b-886f-a3b96ec1033d.png">　　　

一つの画面に示される情報を簡略化し、別のスワイプジェスチャーなしで情報を確認できます。
Today, Forecastタブにて現在と予報を別の画面で確認できて、Searchタブにて他に確認したい地域の情報が確認できます。　　　

## 2. プロジェクトのアイディア
    a. ユーザーが確認したい地域の天気情報がすぐに確認できるようにシンプルなUI構成。
    b. 表示される天気の情報をテキストと共に、アイコンと背景を通じてわかるように。
    c. OpenWeather APIを活用、気温、天気はもちろん、風速から気圧、日出と日没時間まで確認できるように。

## 3. 開発環境及び、開発ツール
    a. XCode (ver. 13 ~ 14) with SwiftUI
    b. OpenWeather API
    c. Swiftgen
    d. git & github with Github Desktop application
    
## 4. 項目説明　　　
### 4-1. SplashとWelcome Screen   
<img width="200" alt="스크린샷 2022-11-15 15 22 18" src="https://user-images.githubusercontent.com/109661308/201843535-5cd76bfa-ccfe-422d-9afa-5a681bfa01bd.png"> <img width="200" alt="스크린샷 2022-11-15 15 22 25" src="https://user-images.githubusercontent.com/109661308/201844987-12880901-c533-4fde-ac9a-53084802d3d8.png">　　　

アプリケーションを起動すると簡単なアニメーション効果とWelcomeスクリンが示されます。Welcomeスクリンで利用者が入力した地域の天気情報が次のCurrentWeatherスクリンに反映されます。   

### 4-2. CurrentWeather   
<img width="200" alt="스크린샷 2022-11-15 15 23 10" src="https://user-images.githubusercontent.com/109661308/211485799-db19008c-c4dd-4bd0-ae5e-84fa4fd7af13.png">　<img width="200" alt="스크린샷 2022-11-15 15 23 25" src="https://user-images.githubusercontent.com/109661308/211485072-2b8b2e22-e426-405a-b637-1a857f5d3c00.png">  

利用者が入力した地域の天気情報を表示する画面です。各地域の天気によって背景色が変わる機能が実装されています。

### 4-3. Forecast
<img width="200" alt="스크린샷 2022-11-15 15 23 54" src="https://user-images.githubusercontent.com/109661308/211485408-cd9baf8a-bdc3-4a43-9ca6-0884e91d0b6f.png">　<img width="200" alt="스크린샷 2022-11-15 15 23 54" src="https://user-images.githubusercontent.com/109661308/211485440-01f42ee8-b62f-47d6-9923-279f3927c3d5.png">　　

Forecastは現在Currentに反映されている地域の天気予報が表示される画面です。

### 4-4. Search   
<img width="200" alt="스크린샷 2022-11-15 15 24 02" src="https://user-images.githubusercontent.com/109661308/211486955-67b47e7e-4c70-4167-9189-84d4ab648bc2.png">
利用者が他の地域の情報を確認したいときに使う画面です。検索履歴は画面の真ん中にリストとしてセーブされ、アプリケーションを再起動してもその履歴は残ります。

## 5. Swiftgenを活用した内部テキスト管理
<img width="200" alt="스크린샷 2023-01-10 16 23 50" src="https://user-images.githubusercontent.com/109661308/211487758-5294e49b-e6ec-4de9-b827-bfd3bb89b9ca.png">  
アプリケーションの内部テキストは全てSwiftgenを活用して管理し、作業中に発生する可能性があるテキスト誤代入問題を予防しようとするともに、利用者の機器設定によって英語と日本語でテキストが表示されます。

