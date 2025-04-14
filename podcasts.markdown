---
layout: page
title: Podcasts
permalink: /portfolio/podcasts/
---

<div class="collection-content">
    <div class="collection-intro">
        <h1>Podcast Appearances</h1>
        <p>Browse my podcast appearances where I discuss cloud architecture, DevOps, and other technical topics.</p>
    </div>

    <div class="content-list">
        {% assign sorted_podcasts = site.podcasts | sort: 'date' | reverse %}
        {% for podcast in sorted_podcasts %}
        <div class="content-item">
            <h2><a href="{{ podcast.url }}">{{ podcast.title }}</a></h2>
            <div class="content-meta">
                <span class="podcast-name">{{ podcast.podcast_name }}</span>
                {% if podcast.episode_number %}
                <span class="episode">Episode {{ podcast.episode_number }}</span>
                {% endif %}
                {% if podcast.duration %}
                <span class="duration">{{ podcast.duration }}</span>
                {% endif %}
                <span class="date">{{ podcast.date | date: "%B %Y" }}</span>
                {% if podcast.tags %}
                <div class="tags">
                    {% for tag in podcast.tags %}
                    <span class="tag">{{ tag }}</span>
                    {% endfor %}
                </div>
                {% endif %}
            </div>
            {% if podcast.excerpt %}
            <div class="content-excerpt">
                {{ podcast.excerpt }}
            </div>
            {% endif %}
            {% if podcast.links %}
            <div class="content-links">
                <h3>Listen to the Episode</h3>
                <ul>
                    {% for link in podcast.links %}
                    <li>
                        <a href="{{ link.url }}" target="_blank" rel="noopener noreferrer" class="listen-link">
                            {{ link.title }}
                        </a>
                    </li>
                    {% endfor %}
                </ul>
            </div>
            {% endif %}
        </div>
        {% endfor %}
    </div>
</div>
