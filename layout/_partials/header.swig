<nav class="site-nav">
  {% if theme.menu %}
    <ul id="menu" class="menu">
      {% for name, path in theme.menu %}
        {% set itemName = name.toLowerCase() %}
        <li class="menu-item menu-item-{{ itemName | replace(' ', '-') }}">
          <a href="{{ url_for(trim(path.split('||')[0])) }}" rel="section"{% if path.split('||')[2] %} target="_blank"{% endif %}>
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon {{ trim(path.split('||')[1]) }}"></i> <br />
            {% endif %}
            {{ __('menu.' + name) | replace('menu.', '') }}
          </a>
          {% if theme.submenu[itemName] %}
            <ul class="submenu submenu-{{ itemName | replace(' ', '-') }}">
              {% for name, path in theme.submenu[itemName] %}
                {% set itemName = name.toLowerCase() %}
                <li class="submenu-item submenu-item-{{ itemName | replace(' ', '-') }}">
                  <a href="{{ trim(url_for(path)) }}" rel="section">
                    {{ __('menu.' + name) | replace('menu.', '') }}
                  </a>
                </li>
              {% endfor %}
            </ul>
          {% endif %}
        </li>
      {% endfor %}

      {% if theme.local_search.enable %}
        <li class="menu-item menu-item-search">
            <a href="javascript:;" class="popup-trigger">
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon fa fa-search fa-fw"></i> <br />
            {% endif %}
            {{ __('menu.search') }}
          </a>
        </li>
      {% else %}
      <li class="menu-item search">
          <form class="search-form">
            <input name="keyword" type="text" class="search-input" placeholder="站内搜索">
            <button type="submit" class="search-submit"><i class="fas fa-search"></i></button>
          </form>
      </li>
      {% endif %}
    </ul>
  {% endif %}

  {% if theme.local_search.enable %}
    <div class="site-search">
      {% include 'search.swig' %}
    </div>
  {% endif %}
</nav>

<div class="site-brand-wrapper">
  <div class="site-brand-bg">
      <img loading="lazy" src="{{ theme.header_bg  }}">
  </div>
  <div class="site-meta">
    <div class="custom-logo-site-title">
      <div class="brand">
        <span class="logo-line-before"><i></i></span>
        <div class="site-title">
          <div id="animate-stroke" class="animate">
            {% for letter in config.title %}{#
              #}<span>
                  <svg>
                    <use xlink:href="#stroke{{ letter }}"></use>
                  </svg>
                </span>{#
            #}{% endfor %}
          </div>
          <div id="animate" class="animate">
            {% for letter in config.title %}{#
              #}<span>
                  <svg>
                    <text id="stroke{{ letter }}">{{ letter }}</text>
                  </svg>
                </span>{#
            #}{% endfor %}
          </div>
          <div id="guide" class="guide">
            {% for letter in config.title %}{#
              #}<span>{{ letter }}</span>{#
            #}{% endfor %}
          </div>
        </div>
        <span class="logo-line-after"><i></i></span>
      </div>
    </div>
  </div>
</div>
<div class="site-master" itemprop="author" itemscope itemtype="http://schema.org/Person">
    <img class="site-master-avatar scaleup" itemprop="image" src="{{ url_for( theme.avatar | default(theme.images + '/Anya.png') ) }}" alt="{{ theme.author }}" />
    <h2 class="site-master-description scaleup" itemprop="description">
        {{ config.description }}
    </h2>
</div>
{% include '../_custom/header.swig' %}
