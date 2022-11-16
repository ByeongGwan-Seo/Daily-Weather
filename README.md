# Daily-Weather
   
## 1.機能説明
利用者が入力した地域の天気を確認できるアプリケーションです。
### 1-1. 特徴   
<img width="200" alt="스크린샷 2022-11-15 15 23 10" src="https://user-images.githubusercontent.com/109661308/201843685-8e56a194-7d0d-4138-b77c-ee496badbca5.png">　　　

一つの画面に示される情報を簡略化し、別のスワイプゼスチャーなしで情報を確認できます。
Today, Forecastタブにて現在と予報を別の画面で確認できて、Searchタブにて他に確認したい地域の情報が確認できます。
（詳細UIはまだ作業中です。）　　　

## 2. 項目説明　　　
### 2-1. SplashとWelcome Screen   
<img width="200" alt="스크린샷 2022-11-15 15 22 18" src="https://user-images.githubusercontent.com/109661308/201843535-5cd76bfa-ccfe-422d-9afa-5a681bfa01bd.png"> <img width="200" alt="스크린샷 2022-11-15 15 22 25" src="https://user-images.githubusercontent.com/109661308/201844987-12880901-c533-4fde-ac9a-53084802d3d8.png">　　　

アプリケーションを起動すると簡単なアニメーション効果とWelcomeスクリンが示されます。Welcomeスクリンで利用者が入力した地域の天気情報が次のCurrentWeatherスクリンに反映されます。   

### 2-2. CurrentWeather   
<img width="200" alt="스크린샷 2022-11-15 15 23 10" src="https://user-images.githubusercontent.com/109661308/201849440-8d0776b5-8287-4122-8329-5aae23c97787.png"><img width="200" alt="스크린샷 2022-11-15 15 23 25" src="https://user-images.githubusercontent.com/109661308/201849553-c2aa30d7-936d-49e3-a1ed-f90d9320bcd0.png"><img width="200" alt="스크린샷 2022-11-15 15 44 40" src="https://user-images.githubusercontent.com/109661308/201849641-ebe04048-f7ce-45b2-9b54-120cdc1108b7.png"><img width="200" alt="스크린샷 2022-11-15 15 50 14" src="https://user-images.githubusercontent.com/109661308/201849741-1cd8f1e4-97cf-46d8-a530-5285f850881b.png">   

利用者が入力した地域の天気情報を示すスクリンです。各地域の天気によって背景色が変わる機能が実装されています。
現在詳細情報やUIは作業中です。

### 2-3. Forecast(作業予定）
<img width="200" alt="스크린샷 2022-11-15 15 23 54" src="https://user-images.githubusercontent.com/109661308/201851618-9cfd7a93-5c85-4247-b6eb-1d5c261c56cd.png">
Forecastは現在Currentに反映されている地域の天気予報が示されるスクリンです。

### 2-4. Search(作業中)   
<img width="200" alt="스크린샷 2022-11-15 15 24 02" src="https://user-images.githubusercontent.com/109661308/201853814-71cec1e3-7f76-47c0-a551-b79c44e7c322.png">
利用者が他の地域の情報を確認したいときに使えるスクリンです。現在は利用者が入力した地域名がCurrentWeatherに反映されるように作業中です。

## 3. 現在目標
(22.11.15 基準)
1. ~SearchVで利用者が入力した地域名をCurrentWeatherに反映させること~   
2. ~SearchVで利用者が入力した情報を画面のリストにセーブすること（UserDefaultか@AppStorage活用予定）~
3. ForecastデータをForecast ビューに反映させること
4. ネットワーク上で例外処理できるようにすること
5. Currentの詳細情報をGridで示すこと

(22.11.16)
1. 利用者の検索履歴がアプリケーション再起動後にも維持できるようにUserDefaultや＠AppStorage活用
2. SearchVの検索履歴リストでCurrentを変更できるように調整
3. ForecastデータをForecast ビューに反映させること
4. ネットワーク上で例外処理できるようにすること
5. Currentの詳細情報をGridで示すこと 
