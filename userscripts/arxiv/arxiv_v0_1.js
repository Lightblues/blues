// ==UserScript==
// @name         arXiv Tools
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  对于arXiv的文章, 生成按钮, 点击跳转到 papers.cool
// @author       Easonshi
// @match        *://arxiv.org/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // 检查当前URL是否符合特定的arXiv格式
    const arxivRegex = /arxiv\.org\/(pdf|abs|html)\/(\d+\.\d+)/;
    const match = window.location.href.match(arxivRegex);

    if (match) {
        // 提取arXiv ID
        const arxivId = match[2];

        // 创建按钮
        const button = document.createElement('button');
        button.textContent = 'View on Papers.cool';
        button.style.position = 'fixed';
        button.style.top = '10px';
        button.style.right = '10px';
        button.style.zIndex = 1000;
        button.style.opacity = '0.5'; // 设置透明度

        // 设置按钮点击事件
        button.onclick = function() {
            window.location.href = `https://papers.cool/arxiv/${arxivId}`;
        };

        // 将按钮添加到页面上
        document.body.appendChild(button);
    }
})();
