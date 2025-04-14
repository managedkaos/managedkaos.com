---
layout: page
title: Portfolio
permalink: /portfolio/
order: 1
TODO: Update the page to display the lastest 3 items from each collection
---


<div class="portfolio-content">
    <div class="portfolio-intro">
        <p>Welcome to my portfolio. Here you'll find a collection of my work across various platforms and formats.</p>
    </div>

    <div class="portfolio-sections">
        <section class="portfolio-section">
            <h2>Courses</h2>
            <p>My training courses on LinkedIn Learning and Pluralsight covering cloud architecture, DevOps, and technical topics.</p>
            <div class="content-list">
                {% assign sorted_courses = site.courses | sort: 'date' | reverse %}
                {% for course in sorted_courses limit:3 %}
                <div class="content-item">
                    <h3><a href="{{ course.url }}">{{ course.title }}</a></h3>
                    <div class="content-meta">
                        <span class="platform">{{ course.platform }}</span>
                        <span class="date">{{ course.date | date: "%B %Y" }}</span>
                    </div>
                    {% if course.excerpt %}
                    <div class="content-excerpt">
                        {{ course.excerpt }}
                    </div>
                    {% endif %}
                </div>
                {% endfor %}
            </div>
            <p class="view-all"><a href="/portfolio/courses">View all courses →</a></p>
        </section>

        <section class="portfolio-section">
            <h2>Podcasts</h2>
            <p>Podcast episodes where I've been featured as a guest or host, discussing cloud architecture and technical topics.</p>
            <div class="content-list">
                {% assign sorted_podcasts = site.podcasts | sort: 'date' | reverse %}
                {% for podcast in sorted_podcasts limit:3 %}
                <div class="content-item">
                    <h3><a href="{{ podcast.url }}">{{ podcast.title }}</a></h3>
                    <div class="content-meta">
                        <span class="podcast-name">{{ podcast.podcast_name }}</span>
                        <span class="date">{{ podcast.date | date: "%B %Y" }}</span>
                    </div>
                    {% if podcast.excerpt %}
                    <div class="content-excerpt">
                        {{ podcast.excerpt }}
                    </div>
                    {% endif %}
                </div>
                {% endfor %}
            </div>
            <p class="view-all"><a href="/portfolio/podcasts">View all podcasts →</a></p>
        </section>

        <section class="portfolio-section">
            <h2>Presentations</h2>
            <p>Conference talks and presentations I've given on various technical topics.</p>
            <div class="content-list">
                {% assign sorted_presentations = site.presentations | sort: 'date' | reverse %}
                {% for presentation in sorted_presentations limit:3 %}
                <div class="content-item">
                    <h3><a href="{{ presentation.url }}">{{ presentation.title }}</a></h3>
                    <div class="content-meta">
                        <span class="event">{{ presentation.event }}</span>
                        <span class="date">{{ presentation.date | date: "%B %Y" }}</span>
                    </div>
                    {% if presentation.excerpt %}
                    <div class="content-excerpt">
                        {{ presentation.excerpt }}
                    </div>
                    {% endif %}
                </div>
                {% endfor %}
            </div>
            <p class="view-all"><a href="/portfolio/presentations">View all presentations →</a></p>
        </section>

        <section class="portfolio-section">
            <h2>Articles</h2>
            <p>Technical articles and blog posts I've written on various platforms.</p>
            <div class="content-list">
                {% assign sorted_articles = site.articles | sort: 'date' | reverse %}
                {% for article in sorted_articles limit:3 %}
                <div class="content-item">
                    <h3><a href="{{ article.url }}">{{ article.title }}</a></h3>
                    <div class="content-meta">
                        <span class="publication">{{ article.publication }}</span>
                        <span class="date">{{ article.date | date: "%B %Y" }}</span>
                    </div>
                    {% if article.excerpt %}
                    <div class="content-excerpt">
                        {{ article.excerpt }}
                    </div>
                    {% endif %}
                </div>
                {% endfor %}
            </div>
            <p class="view-all"><a href="/portfolio/articles">View all articles →</a></p>
        </section>
    </div>
</div>
