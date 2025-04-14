---
layout: page
title: Presentations
permalink: /presentations/
---

<div class="collection-content">
    <div class="collection-intro">
        <h1>Conference Presentations</h1>
        <p>Explore my conference talks and presentations on various technical topics, including cloud architecture, DevOps, and best practices.</p>
    </div>

    <div class="content-list">
        {% assign sorted_presentations = site.presentations | sort: 'date' | reverse %}
        {% for presentation in sorted_presentations %}
        <div class="content-item">
            <h2><a href="{{ presentation.url }}">{{ presentation.title }}</a></h2>
            <div class="content-meta">
                <span class="event">{{ presentation.event }}</span>
                <span class="location">{{ presentation.location }}</span>
                <span class="date">{{ presentation.date | date: "%B %Y" }}</span>
            </div>
            {% if presentation.excerpt %}
            <div class="content-excerpt">
                {{ presentation.excerpt }}
            </div>
            {% endif %}
            {% if presentation.slides %}
            <div class="content-links">
                {% for slide in presentation.slides %}
                <a href="{{ slide.url }}" target="_blank" rel="noopener noreferrer" class="slide-link">
                    {{ slide.title }}
                </a>
                {% endfor %}
            </div>
            {% endif %}
        </div>
        {% endfor %}
    </div>
</div>
