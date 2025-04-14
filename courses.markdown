---
layout: page
title: Courses
permalink: /portfolio/courses/
---

<div class="collection-content">
    <div class="collection-intro">
        <h1>Training Courses</h1>
        <p>Browse my collection of training courses covering cloud architecture, DevOps, and other technical topics.</p>
    </div>

    <div class="content-list">
        {% assign sorted_courses = site.courses | sort: 'date' | reverse %}
        {% for course in sorted_courses %}
        <div class="content-item">
            <h2><a href="{{ course.url }}">{{ course.title }}</a></h2>
            <div class="content-meta">
                <span class="platform">{{ course.platform }}</span>
                {% if course.level %}
                <span class="level">{{ course.level }}</span>
                {% endif %}
                {% if course.duration %}
                <span class="duration">{{ course.duration }}</span>
                {% endif %}
                <span class="date">{{ course.date | date: "%B %Y" }}</span>
                {% if course.tags %}
                <div class="tags">
                    {% for tag in course.tags %}
                    <span class="tag">{{ tag }}</span>
                    {% endfor %}
                </div>
                {% endif %}
            </div>
            {% if course.excerpt %}
            <div class="content-excerpt">
                {{ course.excerpt }}
            </div>
            {% endif %}
            {% if course.link %}
            <div class="content-links">
                <a href="{{ course.link }}" target="_blank" rel="noopener noreferrer" class="course-link">
                    View on {{ course.platform }}
                </a>
            </div>
            {% endif %}
        </div>
        {% endfor %}
    </div>
</div>
