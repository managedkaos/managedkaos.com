---
layout: page
title: Articles
permalink: /portfolio/articles/
---

<div class="collection-content">
    <div class="collection-intro">
        <h1>Technical Articles</h1>
        <p>Browse my collection of technical articles covering cloud architecture, DevOps practices, and other technology topics.</p>
    </div>

    <div class="content-list">
        {% assign sorted_articles = site.articles | sort: 'date' | reverse %}
        {% for article in sorted_articles %}
        <div class="content-item">
            <h2><a href="{{ article.url }}">{{ article.title }}</a></h2>
            <div class="content-meta">
                <span class="publication">{{ article.publication }}</span>
                <span class="date">{{ article.date | date: "%B %Y" }}</span>
                {% if article.tags %}
                <div class="tags">
                    {% for tag in article.tags %}
                    <span class="tag">{{ tag }}</span>
                    {% endfor %}
                </div>
                {% endif %}
            </div>
            {% if article.excerpt %}
            <div class="content-excerpt">
                {{ article.excerpt }}
            </div>
            {% endif %}
            {% if article.link %}
            <div class="content-links">
                <a href="{{ article.link }}" target="_blank" rel="noopener noreferrer" class="article-link">
                    Read on {{ article.publication }}
                </a>
            </div>
            {% endif %}
        </div>
        {% endfor %}
    </div>
</div>
