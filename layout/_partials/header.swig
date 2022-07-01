<nav class="site-nav">
  {% set hasSearch = theme.tinysou_Key || theme.local_search.enable %}

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

      {% if hasSearch %}
        <li class="menu-item menu-item-search">
          {% if theme.local_search.enable %}
            <a href="javascript:;" class="popup-trigger">
          {% endif %}
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

  {% if hasSearch %}
    <div class="site-search">
      {% include 'search.swig' %}
    </div>
  {% endif %}
</nav>

<div class="site-brand-wrapper">
  <div class="site-brand-bg">
    <picture>
      <source srcset="https://cdn.jsdelivr.net/gh/DIYgod/diygod.me/themes/sagiri/source/images/header-rss33.webp" type="image/webp" media="(max-width: 500px)">
      <source srcset="https://cdn.jsdelivr.net/gh/DIYgod/diygod.me/themes/sagiri/source/images/header-rss33.png" type="image/png" media="(max-width: 500px)">
      <source srcset="https://cdn.jsdelivr.net/gh/DIYgod/diygod.me/themes/sagiri/source/images/header-rss3.webp" type="image/webp">
      <img loading="lazy" src="https://cdn.jsdelivr.net/gh/DIYgod/diygod.me/themes/sagiri/source/images/header-rss3.png">
    </picture>
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

  <div class="site-nav-toggle">
    <button>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
    </button>
  </div>
</div>
<div class="site-master" itemprop="author" itemscope itemtype="http://schema.org/Person">
    <img class="site-master-avatar scaleup" itemprop="image" src="{{ url_for( theme.avatar | default(theme.images + '/avatar.gif') ) }}" alt="{{ theme.author }}" />
    <h2 class="site-master-description scaleup" itemprop="description">
        {{ config.description }}
    </h2>
</div>
{% include '../_custom/header.swig' %}
