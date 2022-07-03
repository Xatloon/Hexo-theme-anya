<p>博客已运行<span id="since"></span><span class="my-face">(●'◡'●)ﾉ♥</span></p>
{% if theme.footer.custom_text %}<p>{{ theme.footer.custom_text }}</p>{% endif %}
{% set current = date(Date.now(), "YYYY") %}
<p>© <span itemprop="copyrightYear">{{ current }}</span> {{ config.title }}.
    {% if theme.footer.powered %}
    由 <a href="https://hexo.io/" target="_blank" class="external" rel="nofollow">Hexo</a> 强力驱动.
    {% endif %}
    {% if theme.footer.theme.enable %}
    Theme By <a href="https://github.com/XiangNorth/hexo-theme-anya" target="_blank" class="external" rel="nofollow">Anya</a>
    {% endif %}
    {% if theme.footer.theme.version %}
     v{{ theme.version }}.
     {% endif %}
     {% if theme.footer.sitemap.enable %}
    <a href="{{ url_for(theme.footer.sitemap.dir) }}" target="_blank">站点地图</a>.
    {% endif %}
</p>
<p>Made with <i class="fas fa-heart throb" style="color: #d43f57;"></i> by <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || config.author }}</span>. </p>
