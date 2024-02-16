# analysis-notebook-template

VSCode Dev Containers内で動作するJupyter Notebookによる分析環境のテンプレートリポジトリ。

商用含めて自由にお使いいただけます。README末尾のクレジットは残しておいていただけるとありがたいです。

## 事前準備

- Docker
- VSCode
  - `Dev Containers` エクステンションをインストールしておく

をインストールしてください。

## 利用方法

### 1. コンテナ環境に入る

1. Dockerを起動しておく
2. VSCodeでこのディレクトリを開く
3. コマンドパレット（Cmd+Shift+P）を開いて `Dev Containers: Reopen in Container`　を選ぶ

これでコンテナが立ち上がり、コンテナ内の環境をVSCodeから利用できるようになります。

初回起動時はJupyter・Python・GitHub Copilotなどのエクステンションが自動でインストールされます。ウィンドウの再起動を求められることがあります。

/jupyter ディレクトリはホストとコンテナで共有されます。Gitに残したい変更履歴はホスト側で適宜コミット・プッシュしてください。

### 2. Jupyter Notebookを使う

VSCodeのエクスプローラーから既存のノートブック（.ipynb）を開くか、コマンドパレット > `Create: New Jupyter Notebook` で新規ノートブックを作成すると、Jupyter Notebookを利用できます。

/private ディレクトリ内はGit履歴から除外されるので、ローカルに留めておきたいデータやノートブックの保存に使ってください。

### 3. 依存関係の追加

依存関係の管理にはPoetryを利用しています。

コンテナ内のターミナルで `poetry add <パッケージ名>` を実行すると、新しい依存関係を追加できます。

pyproject.tomlやpoetry.lockが更新されるので、適宜Gitでコミット・プッシュしてください。

### 4. コードの再利用

再利用したいコードは /jupyter/src 内に書いて、ノートブック側でインポートする方法がおすすめです。

例えば /jupyter/src/data_loader.py を作成して、DataLoader というクラスを記述した場合、

```python
import sys; sys.path.insert(0, '..')

from src.data_loader import DataLoader
```

でノートブック側から呼び出すことができます。

### 5. コンテナ環境から出る

コンテナ環境から出てホストのVSCodeに戻りたい場合は、コマンドパレットを開いて `Dev Containers: Reopen Folder Locally` を選んでください。

## クレジット

このリポジトリは [kecbigmt/analysis-notebook-template](https://github.com/kecbigmt/analysis-notebook-template) をもとに作成されました。