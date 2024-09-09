<h1 align="center">🐈 NyaIME</h1>

<p align="center">
  <i><b>猫の IME for Mac</b></i>
</p>

<p align="center">
  <img src="./assets/demo.gif" alt="demo" width="500"/>
</p>

<p align="center">
日本語 | <a href="./README.nya.md">ニャニャニャ</a>
</p>

# インストール

## Homebrew

Homebrew を使用している場合は次のコマンドでインストールすることができます。

```console
$ brew install koki-develop/tap/nyaime
```

インストールが完了したら一度 Mac を再起動もしくはログアウトしてから、もう一度ログインしてください。  
その後、 `設定` > `キーボード` > `入力ソース` で `+` ボタンを押して `日本語` > `NyaIME` を追加してください。

## GitHub リリース

[GitHub リリース](https://github.com/koki-develop/NyaIME/releases/latest) から `NyaIME.pkg` をダウンロードしてください。  
ダウンロードしたファイルを開くと NyaIME をインストールすることができます。

> [!WARNING]
>
> 現在 `NyaIME.pkg` には署名を設定していないため、ダウンロードしたファイルをそのまま開こうとしてもセキュリティの警告が表示されて開くことができません。  
> 開くためには Finder から `NyaIME.pkg` を右クリックして `開く` を選択してください。

インストールが完了したら一度 Mac を再起動もしくはログアウトしてから、もう一度ログインしてください。  
その後、 `設定` > `キーボード` > `入力ソース` で `+` ボタンを押して `日本語` > `NyaIME` を追加してください。

# アンインストール

## Homebrew を使用してインストールした場合

Homebrew を使用してインストールした場合は次のコマンドでアンインストールすることができます。

```console
$ brew uninstall nyaime
```

## GitHub リリースからダウンロードした場合

GitHub リリースからダウンロードした `NyaIME.pkg` を使用してインストールした場合は次の手順を実行してください。

1. `設定` > `キーボード` > `入力ソース` で `NyaIME` を選択した状態で `-` ボタンを押してください。
2. `~/Library/Input Methods/NyaIME.app` を削除してください。

# ライセンス

[MIT](./LICENSE)
