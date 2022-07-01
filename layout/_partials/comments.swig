{% if page.comments %}

  {% if theme.disqus.enable %}
    <div class="comments" id="comments">
      <div id="disqus_thread">
        <div id="dsqjs">
          <section class="dsqjs-info">
            <p id="dsqjs-load-disqus" class="dsqjs-message">评论完整模式加载中...如果长时间无法加载，请针对 disq.us | disquscdn.com | disqus.com 启用代理</p>
          </section>
        </div>
      </div>
    </div>

  {% elseif theme.livere_uid %}
    <div class="comments" id="comments">
      <div id="lv-container" data-id="city" data-uid="{{ theme.livere_uid }}"></div>
    </div>

  {% elseif theme.gitment.enable %}
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
