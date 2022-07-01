{% macro render(is_post) %}
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>

  <aside id="sidebar" class="sidebar">
    <div class="sidebar-inner">

      {% set display_toc = is_post and theme.toc.enable or is_page and theme.toc.enable %}

      {% if display_toc and toc(page.content).length > 1 %}
        <ul class="sidebar-nav">
          <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap">
            {{ __('sidebar.toc') }}
          </li>
          <li class="sidebar-nav-overview" data-target="site-overview-wrap">
            {{ __('sidebar.overview') }}
          </li>
        </ul>
      {% endif %}

      <section class="site-overview-wrap sidebar-panel{% if not display_toc or toc(page.content).length <= 1 %} sidebar-panel-active{% endif %}">
        <div class="site-overview">
          <div class="site-author" itemprop="author" itemscope itemtype="http://schema.org/Person">
            <img class="site-author-image" itemprop="image"
              src="{{ url_for( theme.avatar | default(theme.images + '/card.jpg') ) }}"
              alt="{{ theme.author }}" />
            <div class="site-author-info">
              <p class="site-author-name scaleup" itemprop="name">{{ theme.card.name }}</p>
              <p class="site-description" itemprop="description">{{ theme.card.description }}</p>
            </div>
          </div>

          <div class="links-of-author">
            {% if theme.social %}
              {% for name, link in theme.social %}
                <span class="links-of-author-item scaleup">
                  <a href="{{ trim(link.split('||')[0]) }}" target="_blank" title="{{ name }}">
                    {% if theme.social_icons.enable %}
                      {{ link.split('||')[1] }}{#
                  #}{% endif %}{#
                    #}{% if not theme.social_icons.icons_only %}{#
                      #}{{ name }}{#
                    #}{% endif %}{#
                #}</a>
                </span>
              {% endfor %}
            {% endif %}
          </div>

          <div class="des-of-author">
              <div class="des-of-author-nav">
                {% for title, des in theme.card.items %}
                  {% if loop.index === 1 %}
                    <div class="des-of-author-title active" data-index="{{ loop.index }}">{{ title }}</div>
                  {% else %}
                    <div class="des-of-author-title" data-index="{{ loop.index }}">{{ title }}</div>
                  {% endif %}
                {% endfor %}
              </div>
              <div class="des-of-author-panel">
                {% for title, des in theme.card.items %}
                  {% if loop.index === 1 %}
                    <div class="des-of-author-des active" data-index="{{ loop.index }}">{{ des }}</div>
                  {% else %}
                    <div class="des-of-author-des" data-index="{{ loop.index }}">{{ des }}</div>
                  {% endif %}
                {% endfor %}
              </div>
          </div>

          {% include '../_custom/sidebar.swig' %}
        </div>
      </section>

      {% if display_toc and toc(page.content).length > 1 %}
      <!--noindex-->
        <section class="post-toc-wrap sidebar-panel sidebar-panel-active">
          <div class="post-toc">

            {% if page.toc_number === undefined %}
              {% set toc = toc(page.content, { "class": "nav", list_number: theme.toc.number }) %}
            {% else %}
              {% set toc = toc(page.content, { "class": "nav", list_number: page.toc_number }) %}
            {% endif %}

            {% if toc.length <= 1 %}
              <p class="post-toc-empty">{{ __('post.toc_empty') }}</p>
            {% else %}
              <div class="post-toc-content">{{ toc }}</div>
            {% endif %}

          </div>
        </section>
      <!--/noindex-->
      {% endif %}
    </div>
  </aside>
{% endmacro %}
