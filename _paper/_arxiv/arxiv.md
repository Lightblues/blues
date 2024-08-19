
- [ ] summary: 中文? 显示为 bullet points
- [ ] links: papers.cool, repos
- [ ] keywords: 实现方式可以是 LLM 总结! 

## APIs
- arxiv API [doc](https://info.arxiv.org/help/api/user-manual.html#Quickstart)
    - unofficial [github](https://github.com/lukasschwab/arxiv.py) 1k
- Notion SDK 
    - unofficial notion-client [github](https://github.com/ramnes/notion-sdk-py) 1.7k
- Semantic Scholar [doc](https://www.semanticscholar.org/product/api)
    - unofficial [github](https://github.com/danielnsilva/semanticscholar) 0.3k
- Paper with Code [doc](https://paperswithcode.com/api/v1/docs/)
    - official [github](https://github.com/paperswithcode/paperswithcode-client)

## ref

arxiv-browswer-extension
- arxiv2notion [github](https://github.com/denkiwakame/arxiv2notion) 0.1k | Chrome extension
- arxiv2notionplus [github](https://github.com/wangjksjtu/arxiv2notionplus) 0.05k | support Safari

## from paperstack
- paperstack [github](https://github.com/dreadnode/paperstack/) 很简洁优雅

```sh
cd _ref/paperstack
source .env
python paperstack.py --search-arxiv --arxiv-search-query llm
```
