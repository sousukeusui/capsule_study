# CapsuleStudy

![トップページ](./readme1.png)

### アプリ説明
勉強系のWebアプリです。<br>
あらかじめ用意されている問題の中からランダムにテストが作成され、解答することができます。<br>
問題を作成し投稿できたり、逆に様々な問題を解くこともできます。<br>
つぶやくこともでき、勉強についての悩みや目標、情報を発信してみましょう。

### なぜ作ったか
勉強のモチベーションを維持して楽しく継続し、各個人の目標を達成して欲しいという思いから作りました。

### URL
https://capsule-study.herokuapp.com/

### テスト用アカウント
メール：example@email.com<br>
パスワード：capsule_study

### 利用方法
<details>
<summary>①新規登録・ログイン方法</summary><br>
トップページで新規登録または、ログインボタンをクリックしてください。<br>
	<br>

- **新規登録方法**<br>
  メールアドレス、ニックネーム、パスワードを入力してください。（初回登録時、500pt付与)<br>
	<br>
- **ログイン**<br>
  登録したメールアドレス、パスワードを入力してください。(1日1回ログイン時、100pt付与。AM5時更新）

</details>

<details>
<summary>②プロフィール画面</summary><br>
ログインするとプロフィール画面に遷移します。プロフィール画面では以下のことができます<br>
	<br>


- **プロフィール編集**<br>
  「プロフィール編集」ボタンをクリックすることで以下のことができます
  - ユーザーネームの編集
  - 自己紹介文の作成
  - 目標を記入
  - ユーザー画像の編集
  <br>
- **マイリスト確認**<br>
	「マイリスト」をクリックするとマイリストに登録した問題を確認できます<br>
  <br>
- **投稿一覧表示**<br>
	投稿した内容の確認、編集、削除ができます<br>
  <br>
- **問題一覧表示**<br>
	投稿した問題の確認、編集、削除ができます<br>
  </details>

<details>
<summary>③メニュー</summary><br>
左上の三本線を押すとメニューが開き、以下のことができます<br>
	<br>


- **管理者の問題**<br>
	あらかじめ用意されている問題の中からランダムに10題選ばれ、解答できます。<br>
  <br>
- **投稿された問題**<br>
	他のユーザーが作成/投稿した問題を解くことができます。<br>
  <br>
- **問題作成/投稿**<br>
	自分で考えた問題を作成し、投稿することができます。<br>
  <br>
- **お問い合わせ**<br>
	質問や、要望などを問い合わせることができます。<br>
  <br>
- **現在のポイント**<br>
	現在持っているポイント数の確認ができます。<br>
  </details>

<details>
<summary>④問題解答説明</summary><br>


- **ポイントについて**<br>
  一つの問題につき100pt消費<br>
  問題解答後獲得ポイントは以下の通り<br>
  テーブルでせつめい<br>
  <br>
- **制限時間**<br>
	制限時間は10分です<br>
  <br>
- **解答方法**<br>
	問題は全て四肢択一問題です。<br>
	正解だと思うチェックボックスを一つ選択してください。(複数選択すると、不正解になります)<br>
	解答が終わったら、解答終了ボタンを押して解答を終了します。<br>
  <br>
- **解答結果**<br>
	正解数と獲得ポイントが表示され、問題の正解を確認できます。<br>
  </details>

### 使用技術
Ruby 3.1.2<br>
Ruby on Rails 6.1.3.2<br>
PostgreSQL 14.5<br>
Puma<br>
RSpec<br>
HTML&CSS<br>
JavaScript

### 機能一覧

### テスト

