import re, yaml
from dataclasses import asdict, dataclass, field
from datetime import datetime
from enum import Enum
from typing import Optional, Dict, Any, List


class Focus(str, Enum):
    Offensive = "Offensive"
    Defensive = "Defensive"
    Adversarial = "Adversarial"
    Safety = "Safety"
    Other = "Other"

@dataclass
class Config:
    notion_token: str = None
    notion_database_id: str = None
    openai_token: str = None

    search_arxiv: bool = True
    search_semantic_scholar: bool = False
    link_kimi: bool = True
    
    arxiv_max_results: int = 10
    arxiv_search_queries: Dict[str, Any] = field(default_factory=dict)
    user_keywords: List[str] = field(default_factory=list)
    
    @classmethod
    def from_yaml(cls, path: str):
        with open(path, 'r') as f:
            config = yaml.load(f, Loader=yaml.FullLoader)
            return cls(**config)
        
    def to_dict(self):
        return asdict(self)
    

@dataclass
class Paper:
    # Note: These need to reflect in the Notion DB and
    # notion_utils functions.

    page_id: str | None = None      # Notion Page ID
    title: str | None = None
    url: str | None = None
    focus: Focus | None = None
    summary: str | None = None
    kimi: str | None = None
    abstract: str | None = None
    authors: list[str] = field(default_factory=list)
    published: datetime | None = None
    explored: bool | None = None

    # We don't want to excessively write back to Notion, so we'll
    # offer the ability to set change tracking when we read.

    track_changes: bool = False

    def __post_init__(self):
        self._original_state = asdict(self)

    def has_changed(self):
        if self.track_changes:
            return self._original_state != asdict(self)
        else:
            return True

    def has_arxiv_props(self) -> bool:
        return all(
            [
                self.title,
                self.url,
                self.authors,
                self.published,
            ]
        )

    @property
    def arxiv_id(self) -> str | None:
        if not self.url:
            return None
        match = re.search(r"\d{4}\.\d{5}", self.url)
        return match.group(0) if match else None
