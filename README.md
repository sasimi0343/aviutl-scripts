# aviutl-scripts
俺が今まで作って来たAviutlの自作スクリプトをすべて入れました。
いくつかうまく動作しないのや、外部プラグインに頼るのもあります。

## CharacterBone
めっちゃ動く(個人差)立ち絵を表示できるものです。
使い方が複雑です。ざっくり説明すると、
1. 適当に図形オブジェクトを配置。
2. アニメーション効果「CharacterBase@CharacterBone」を適用
2.1 「参照」から事前に用意したcbauファイルを参照。
3. アニメーション効果「CharacterSettings@CharacterBone」を適用
4. アニメーション効果「Draw@CharacterBone」を適用

### cbauってなんやねん
独自のフォーマットを用いたキャラクターファイルです。
exampleにうさ義さんの立ち絵でのcbauの記述例載せておくので参考にして構文は察してください。
ちなみにパスに_centerがついているものは中心を変えている画像です。用意はそちら側でお願いします。

## ExtremeTransion
文字などの登場を補助します。(ずれて登場など)
使用する際は「文字ごとに個別オブジェクト」にチェックを入れて使用してください。
パラメータは、
- [Global]Delay       - オブジェクト毎のずれ
- [Global]Time        - 登場にかける時間
- [Global]GlobalDelay - オブジェクト関係ない遅延
- Easing              - イージング (正の値だとCurve Editorのカーブ番号、負の値だとイージング番号指定)

となっており、下にあるアニメーション効果を適用させて使います。
- [ShowDelayed]		指定した時間で登場させます。
- Blink				点滅登場させます。
- Raster			ラスターをかけます。
- Move				指定した量だけ移動して登場させます。
- RandomMove90Deg	ランダムな方向から指定した量だけ移動して登場させます。
- RandomPos 		ランダムな位置にオブジェクトを配置します。
- Zoom				拡大率を変えて登場させます。
- Rotate			回転して登場させます。
- FanClipping		rikkyさんの「扇クリッピング」を使って登場させます。
- [PositionCalibration]	文字の位置調整に使いますが、使う必要はありません。

## MoreShapes
いろいろな図形を出せるだけのつもりでしたが、気分だったので3Dにも対応させました。
カスタムオブジェクトで矢印とか箱とか出せます。
アニメーション効果の「MoreShapes3D」では、3Dの配置をできるようにしています。
最も簡単な使い方は、
1. 四角形を配置。
2. アニメーション効果「[3DShape]Box@MoreShapes3D」を適用
3. アニメーション効果「[3D]Render@MoreShapes3D」を適用
です。
[3DShape]Boxと[3D]Renderの間に他の[3D]がついたアニメーション効果をつけることによって、自由度がちょっと上がります。

## GroupControl
まだ制作が安定していないので動作するかはわかりませんが一応解説だけしておきます。
・TransparentFrameBuffer	YMMでの「背景を削除」を適用したフレームバッファです。拡大系のアニメーション効果と相性が悪い...?

## いろいろなアニメーション効果
本当にいろいろです。動作重いのに需要が全くないという完全に地雷なやつもあるのでご注意ください。

### NoRedrawGlitch
なんかめちゃくちゃな画面を作ります。
1. 一番上のレイヤーにカスタムオブジェクト「Draw@NoRedrawGlitch」を設置。
2. いくつかのオブジェクトをその下のレイヤーに配置。
3. 最後に一番下のレイヤーにカスタムオブジェクト「Up@NoRedrawGlitch」を設置。
exampleにこの例を置いておきます。参考にしてください。
