<!DOCTYPE html>

{% set html_class = 'sagiri-x' %}

<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}" class="theme-darling">

  {% set container_class = "container " %}
  {% if theme.sidebar.position %}
    {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %}
  {% endif %}

  <div class="{{ container_class }} {% block page_class %}{% endblock %}">
    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>
    </header>

    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_partials/comments.swig' %}
        </div>
        {% if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {% endif %}
      </div>
    </main>

    <footer id="footer" class="footer">
      <div class="footer-image">
        <img src="https://cdn.jsdelivr.net/gh/DIYgod/diygod.me/themes/sagiri/source/images/footer.png">
      </div>
      <div class="footer-inner">
        {% include '_partials/footer.swig' %}
        {% block footer %}{% endblock %}
      </div>
    </footer>

    {% if theme.sidebar.b2t %}
      <div class="back-to-top">
        <img src="https://cdn.jsdelivr.net/gh/DIYgod/diygod.me/themes/sagiri/source/images/scroll.png">
      </div>
    {% endif %}

    <canvas id="evanyou"></canvas>

  </div>

  <script type="text/javascript" src="{{ url_for(theme.js) }}/sagirix.min.js?v={{ theme.version }}"></script>

  {% include '_third-party/mathjax.swig' %}
  {% include '_third-party/scroll-cookie.swig' %}
  {% include '_third-party/exturl.swig' %}
  
  {% if theme.service_worker %}
  <script>
    if ('serviceWorker' in navigator) {
      window.addEventListener('load', () => {
        navigator.serviceWorker.register('/sw.js');
      });
    }
  </script>
  {% endif %}
</body>
</html>
