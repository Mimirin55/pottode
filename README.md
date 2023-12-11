## サービス概要
仕事やプライベートなど、「ぽっとで」のタスクを整理できるアプリです。

ぱっと見てわかりやすいだけでなく、タスクを完了するたびに褒めてくれる通知機能を実装することで、

小さなことでも達成感を感じられるアプリを目指します。

## このサービスへの思い・作りたい理由
私自身がフルリモートで仕事をしており、使いやすいタスクアプリを普段から欲しいと思っていました。

タスクの完了状態がわかりやすいアプリは数あれど、仕事以外も管理できるアプリはあまり無いように感じます。

さらに完了しても何も起きないためどうも機械的になり、周りに人がいない現実も相まって達成感を感じることもありません。

あと、ゴミ出しの日や買い物など、数分で終わるようなちょっとした用事を書き出すのは案外面倒くさいので、つい忘れてしまうこともしばしばあります。

そこで「毎日の登録が楽しくて、かつ達成感を感じられるタスクアプリ」があれば良いのではないかと考えました。

## ユーザー層について
- 普段何となく達成感が感じられない人
- 次の日のタスクが気になって眠れない人（[この記事](https://everyday-evident.net/the-effects-of-bedtime-writing-on-difficulty-falling-asleep/)では夜に明日のタスクを書き出すと頭がスッキリするとあります）

## サービスの利用イメージ
- 「本日のToDo」「未完了」「完了」ごとにタスクを分けて表示します。
- タスクをカテゴリごとに分け、見てすぐにわかるようにしておきます（仕事、プライベート、買い物）。
- タスクを完了すると褒めてくれる通知を表示します。
- リマインダー機能をつけて、指定した日時にタスクをリマインドします。
- 締切の時間を過ぎても完了にならないタスクについて「大丈夫？」という通知を表示します。
- 毎日、毎週のことは繰り返し入力できるようにします。

## ユーザーの獲得について
以下の点をアピールしていきたいと思っています。
- タスクアプリで達成感を感じられること
- 仕事だけでなくプライベートも管理できること
ユーザー獲得にはSNSを活用したいと考えています。

## サービスの差別化ポイント・推しポイント
完成形としては、以下の競合アプリ2つのメリットを合わせたようなものをイメージしています。

そこに機能を追加し、より楽しくタスクを管理できるアプリを目指します。

### 競合アプリ
- Trello
- Googleカレンダー
### 競合から取り入れたい機能
- 【Trello】「本日のToDo」「未完了」「完了」ごとにタスクを分けて表示します。
- 【Googleカレンダー】リマインド機能、繰り返し機能を実装します。
#### 上記に加えたい機能
- 登録したアイディアをカテゴリ別に分けられます（仕事、プライベート、買い物など）。
- タスク完了時、リマインド時、締切到来時に通知を送ります。

## 機能候補
### MVPリリース時
- アカウント登録・編集・削除機能（deviseで実装予定）
- タスク一覧・詳細・編集・削除機能（Railsで実装予定）
- タスク完了時、リマインド時、締切到来時の通知表示機能（Railsで実装予定）
- カテゴリ分け機能（Railsで実装予定）
- リマインダー機能（Railsで実装予定）
- 繰り返し入力機能（[ice_cube](https://github.com/ice-cube-ruby/ice_cube)で実装予定）

### 本リリース時
- なし

## 機能の実装方針予定
以下のような技術を使って開発を進めたいと考えております。
### フロントエンド
- BootStrap
- React
### バックエンド
- Ruby
- Rails
- devise
- ice_cube
### インフラ
- PostgreSQL
- Heroku