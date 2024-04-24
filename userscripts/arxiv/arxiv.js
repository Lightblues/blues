// ==UserScript==
// @name         arXiv Tools
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  对于arXiv的文章, 生成可以拖动的透明按钮, 点击跳转到 papers.cool
// @author       Easonshi
// @match        *://arxiv.org/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    const arxivRegex = /arxiv\.org\/(pdf|abs|html)\/(\d+\.\d+)/;
    const match = window.location.href.match(arxivRegex);

    if (match) {
        const arxivId = match[2];

        // 创建按钮
        const button = document.createElement('button');
        button.textContent = 'View on Papers.cool';
        button.style.position = 'fixed';
        button.style.top = '10px';
        button.style.right = '10px';
        button.style.zIndex = '1000';
        button.style.opacity = '0.8'; // 设置透明度
        button.style.cursor = 'move'; // 设置光标为移动模式

        // 固定大小? 不然移动之后左边还停在右边框
        button.style.width = '150px';
        // button.style.height = '40px';

        
        // 拖动功能的实现
        let posX = 0, posY = 0, mouseX = 0, mouseY = 0;
        // 在脚本中添加一个标志来判断用户是否拖动了按钮
        let isDragging = false;

        const mouseDownHandler = function(e) {
            // 阻止事件的默认行为
            e.preventDefault();

            // 获取初始位置
            mouseX = e.clientX;
            mouseY = e.clientY;

            // 当mousedown时，先设置拖动标志为false
            isDragging = false;

            document.addEventListener('mousemove', mouseMoveHandler);
            document.addEventListener('mouseup', mouseUpHandler);
        };




        const mouseMoveHandler = function(e) {
            // 设置拖动标志为true
            isDragging = true;

            // 计算移动距离
            const dx = e.clientX - mouseX;
            const dy = e.clientY - mouseY;

            // 获取元素当前位置
            const rect = button.getBoundingClientRect();

            // 计算并设置新位置
            button.style.top = rect.top + dy + 'px';
            button.style.left = rect.left + dx + 'px';

            // 重新设置初始位置
            mouseX = e.clientX;
            mouseY = e.clientY;
        };

        const mouseUpHandler = function() {
            // 移除事件监听
            document.removeEventListener('mousemove', mouseMoveHandler);
            document.removeEventListener('mouseup', mouseUpHandler);

            // 如果mouseup时，isDragging为false，则认为是单击，执行跳转
            if (!isDragging) {
                window.location.href = `https://papers.cool/arxiv/${arxivId}`;
            }
        };

        button.addEventListener('mousedown', mouseDownHandler);

        // button.onclick = function() {
        //     window.location.href = `https://papers.cool/arxiv/${arxivId}`;
        // };
        // 修改button的点击事件，移除原来的跳转逻辑
        button.onclick = function(e) {
            // 阻止事件冒泡，避免mouseup事件中的跳转逻辑被触发
            e.stopPropagation();
        };

        document.body.appendChild(button);
    }
})();
