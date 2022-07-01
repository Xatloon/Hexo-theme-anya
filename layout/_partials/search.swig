{% if theme.tinysou_Key %}
  {% include 'search/tinysou.swig' %}
{% elseif theme.local_search.enable %}
  {% include 'search/localsearch.swig' %}
{% endif %}
