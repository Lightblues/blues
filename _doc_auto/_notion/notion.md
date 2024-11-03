notion SDK
- notion-py [github](https://github.com/jamalex/notion-py) 4.3k
    - 相较于下面那个包, 对于 Notion 数据结构进行了封装! 
- notion-client [github](https://github.com/ramnes/notion-sdk-py) 1.7k
    - 基本就是对于API的简单封装, 例如更新 block [doc](https://developers.notion.com/reference/patch-block-children)

对于格式的转换, 参见 md2notion [GitHub](https://github.com/Cobertos/md2notion/blob/master/md2notion/NotionPyRenderer.py) (已停止维护, 但里面用到的 `Render` 思路值得借鉴. )


## 豆瓣 douban
```sh
cd _ref/notion_sync_data

python run.py -f init
python run.py -m book -s all # movie, music, game
```

## paper arxiv
see [[arxiv]]

test inline $E = mc^2$
and equations
$$
\begin{align}
E &= mc^2 \\
a^2 &= b^2 + c^2
\end{align}
$$