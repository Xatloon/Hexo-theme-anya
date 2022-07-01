{% if page.comments %}

  {% if theme.gitment.enable %}
    <div class="comments" id="comments">
      {% if theme.gitment.lazy %}
        <div onclick="showGitment()" id="gitment-display-button">{{ __('gitmentbutton') }}</div>
        <div id="gitment-container" style="display:none"></div>
      {% else %}
        <div id="gitment-container"></div>
      {% endif %}
    </div>

  {% elseif theme.valine.appid and theme.valine.appkey %}
    <div class="comments" id="comments">
      <div id="vcomments"></div>
    </div>
  {% endif %}

{% endif %}
{% include '../_third-party/comments/index.swig' %}
