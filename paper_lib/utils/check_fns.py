from easonsi.util.leetcode import *
from easonsi import utils
import os,sys
import re
ddir = 'paperlib-main'

def normalize_title(title):
    title = re.sub(r'[^\w\s]', ' ', title)  # 去除标点
    title = re.sub(r'_', ' ', title)        # 去除 _
    # title = ' '.join(title.split())         # 去除多余的空格
    
    title = re.sub(r'\d+', '', title)       # 去除数字
    # 去除所有空白字符
    title = title.replace(' ', '').replace('\t', '').replace('\n', '')
    return title


def get_all_titles(ddir):
    files = os.listdir(ddir)
    normalized_title_to_fn = {}
    for f in files:
        if not f.endswith('.pdf'): continue
        title = f.split('+')[-1]
        # 找到倒数第二个 _ 的位置
        idx_suffix = title.rfind('_')
        idx_suffix2 = title.rfind('_', 0, idx_suffix)
        original_title = title[:idx_suffix2]
        normalized_title = normalize_title(original_title)
        if normalized_title in normalized_title_to_fn:
            # FIXME: 但实际上有 sup 文件！
            print(f'duplicated title!\n{title}\n{normalized_title_to_fn[normalized_title]}')
            continue
        normalized_title_to_fn[normalized_title] = f
    return normalized_title_to_fn


if __name__ == '__main__':
    get_all_titles(ddir)