# aviutl-scripts
俺が今まで作って来たAviutlの自作スクリプトをすべて入れました。
いくつかうまく動作しないのや、外部プラグインに頼るのもあります。

## CharacterBone
使い方が複雑です。ざっくり説明すると、
1. 適当に図形オブジェクトを配置。
2. アニメーション効果「CharacterBase@CharacterBone」を適用
2.1 「参照」から事前に用意したcbauファイルを参照。
3. アニメーション効果「CharacterSettings@CharacterBone」を適用
4. アニメーション効果「Draw@CharacterBone」を適用

###cbauってなんやねん
独自のフォーマットを用いたキャラクターファイルです。
exampleにうさ義さんの立ち絵でのcbauの記述例載せておくので参考にして構文は察してください。

##いろいろなアニメーション効果
本当にいろいろです。動作重いのに需要が全くないという完全に地雷なやつもあるのでご注意ください。

### NoRedrawGlitch
なんかめちゃくちゃな画面を作ります。
1. 一番上のレイヤーにカスタムオブジェクト「Draw@NoRedrawGlitch」を設置。
2. いくつかのオブジェクトをその下のレイヤーに配置。
3. 最後に一番下のレイヤーにカスタムオブジェクト「Up@NoRedrawGlitch」を設置。
exampleにこの例を置いておきます。参考にしてください。