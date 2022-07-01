<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
<meta name="theme-color" content="{{ theme.android_chrome_color }}">

<link rel="preload" href="https://cdn.jsdelivr.net/gh/DIYgod/diygod.me/themes/sagiri/source/fonts/Candyshop.otf" as="font" type="font/otf" crossorigin="anonymous">

{# Disable Baidu tranformation #}
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

{% include "./head/external-fonts.swig" %}

{% set font_awesome_uri = url_for(theme.vendors._internal + '/font-awesome/css/font-awesome.min.css?v=4.7.0') %}
{% if theme.vendors.fontawesome %}
  {% set font_awesome_uri = theme.vendors.fontawesome %}
{% endif %}

<link href="{{ font_awesome_uri }}" rel="stylesheet" type="text/css" />
<link href="{{ url_for(theme.css) }}/sagirix.min.css?v={{ theme.version }}" rel="stylesheet" type="text/css" />

{% if theme.favicon.apple_touch_icon %}
  <link rel="apple-touch-icon" sizes="180x180" href="{{ url_for(theme.favicon.apple_touch_icon) }}?v={{ theme.version }}">
{% endif %}
{% if theme.favicon.normal %}
  <link rel="icon" type="image/png" sizes="32x32" href="{{ url_for(theme.favicon.normal) }}?v={{ theme.version }}">
{% endif %}
{% if theme.favicon.safari_pinned_tab %}
  <link rel="mask-icon" href="{{ url_for(theme.favicon.safari_pinned_tab) }}?v={{ theme.version }}" color="{{ theme.android_chrome_color }}">
{% endif %}
{% if theme.favicon.android_manifest %}
  <link rel="manifest" href="{{ url_for(theme.favicon.android_manifest) }}">
{% endif %}

{% if page.keywords %}
  <meta name="keywords" content="{{ page.keywords }}" />
{% elif page.tags and page.tags.length %}
  <meta name="keywords" content="{% for tag in page.tags %}{{ tag.name }},{% endfor %}" />
{% elif config.keywords %}
<meta name="keywords" content="{{ config.keywords }}" />
{% elif theme.keywords %}
  <meta name="keywords" content="{{ theme.keywords }}" />
{% endif %}


{% if theme.rss === '' and config.feed and config.feed.path %}
  {% set theme.rss = config.feed.path %}
{% endif %}
{% if theme.rss %}
  <link rel="alternate" href="{{ url_for(theme.rss) }}" title="{{ config.title }}" type="application/atom+xml" />
{% endif %}


{# Export some HEXO Configurations to Front-End #}
<script type="text/javascript" id="hexo.configurations">
  var SagiriX = window.SagiriX || {};
  var CONFIG = {
    root: '{{ theme.root }}',
    version: '{{ theme.version }}',
    sidebar: {{ theme.sidebar | json_encode }},
    tabs: {{ theme.tabs.enable }},
    since: '{{ theme.footer.since }}',
    site: {
      title: '{{ theme.title }}',
      subtitle: '{{ theme.subtitle }}',
      author: '{{ theme.author }}'
    },
    favicon: {
      visibilitychange: {{theme.favicon.visibilitychange}},
      normal: '{{theme.favicon.normal}}',
      hidden: '{{theme.favicon.hidden}}',
      show_text: '{{theme.favicon.show_text}}',
      hide_text: '{{theme.favicon.hide_text}}'
    }
  };
</script>
{% set js_vendors = {} %}
{% set js_vendors.jquery      = true %}
{% for name, internal in js_vendors %}
  <script type="text/javascript" src="{{ theme.vendors[name] }}"></script>
{% endfor %}

{% include 'head/custom-head.swig' %}
