# アプリケーション名 
学習進捗アプリ

# アプリケーション概要  このアプリケーションでできることを記述。
受講者とコーチが学習の進捗を管理するアプリ

# URL デプロイ済みのURLを記述。デプロイが済んでいない場合は、デプロイが完了次第記述すること。
 https://oriap-35389.herokuapp.com/

# 利用方法  このアプリケーションの利用方法を記述。
コーチ：カリキュラム、学習期間を設定し、受講者の質問に回答する。
受講者：完了したらフォームを提出、アウトプット、質問、完了報告する。

# 目指した課題解決  このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。
学習時間や範囲が曖昧に設定されている、現場で働く社員に対し
コーチが進捗を把握し、受講者が項目を把握し質問できる。

# 洗い出した要件 スプレッドシートにまとめた要件定義を記述。
優先順位（高：3、中：2、低：1） 機能  目的  詳細  ストーリー(ユースケース) 見積もり（所要時間）
3  ユーザー管理機能 ユーザーがログインする ユーザーを判別、管理する。 ・ユーザーアカウントの登録方法を「手打ち入力」にする  32時間
2  コメント機能 コメントする  投稿されたフォームにコメントを返す。  "・ユーザーのフォームが指定のユーザーに届くよう設定する。・フォームの内容はお互いが確認できる状態にす る。  16時間
3  投稿機能 画像やファイルの投稿  教材を追加する ・画像と教材は指定のユーザーのみ投稿可能にする。  16時間
3  編集機能 修正、更新する 教材となるファイルを編集する  ・画像と教材は指定のユーザーのみ編集、更新可能にする。 16時間
2  削除機能 削除する  教材の削除を行う  ・画像と教材は指定のユーザーのみ投稿可能にする。  8時間
3  一覧表示機能 投稿の一覧を表示する  教材の一覧を表示する  ・チェック項目を設け、完了後チェックする  16時間

# 実装予定の機能 洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。
・学習時間を設定し、表示する機能

# データベース設計
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname           | string | null: false   |
| email              | string | unique: true,null: false |
| encrypted_password | string | null: false   |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |
### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
### Association

- belongs_to :room
- belongs_to :user
