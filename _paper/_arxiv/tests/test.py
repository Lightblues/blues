# %%
import os, sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.parent))


# %%
""" =====================================================================================
arxiv
"""
from arxiv_utils import search_arxiv_as_paper, search_arxiv_by_id

# %%
res = search_arxiv_by_id("1707.06347")
res
# %%
# title, entry_id, summary, authors, published
res.links
# %%
res.categories
# %%
res.entry_id, res.get_short_id(), res.pdf_url, res.primary_category
# %%
import arxiv
client = arxiv.Client()
r = [result for result in client.results(arxiv.Search(id_list=["1707.06347v1"]))]
# %%
r
# %%
len(r)
# %%
""" ===============================================================================================
paper with code
API: https://paperswithcode.com/api/v1/docs/
unofficial API: https://github.com/paperswithcode/paperswithcode-client?tab=readme-ov-file
sample:
    https://arxiv.paperswithcode.com/api/v0/papers/1707.06347
    (result) https://paperswithcode.com/paper/proximal-policy-optimization-algorithms
"""
# %%
import requests

base_url = "https://arxiv.paperswithcode.com/api/v0/papers/1707.06347"

r = requests.get(base_url).json()
# repo_url = None
# if "official" in r and r["official"]:
#     repo_url = r["official"]["url"]
r
# %%
from paperswithcode import PapersWithCodeClient

client = PapersWithCodeClient()
paper_repos = client.search("1707.06347")
# %%
paper_repo = paper_repos.results[0]
paper_repo
# %%
paper_repo.paper, paper_repo.repository
# %%
paper_repo.is_official
# %%
len(paper_repos)
