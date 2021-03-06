# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require 'tempfile'
#require './lib/snippets.rb'
require 'oj'
require "nanoc/cachebuster"
include Nanoc::Helpers::CacheBusting

STATUS_CODES = {
  200 => '200 OK',
  201 => '201 Created',
  202 => '202 Accepted',
  204 => '204 No Content',
  301 => '301 Moved Permanently',
  304 => '304 Not Modified',
  401 => '401 Unauthorized',
  403 => '403 Forbidden',
  404 => '404 Not Found',
  409 => '409 Conflict',
  422 => '422 Unprocessable Entity',
  500 => '500 Server Error'
} unless defined? STATUS_CODES

# The languages we show in code blocks.
LANGUAGES = %w{Python Ruby Console} unless defined? LANGUAGES

# The default active language
ACTIVE_LANGUAGE = 'Python' unless defined? ACTIVE_LANGUAGE


def language_class(languge)
  languge == ACTIVE_LANGUAGE ? 'active' : ''
end

def code_tabs(section, languages=nil)
  html = "<ul class=\"nav nav-tabs\" id=\"#{section}-tabs\">"
  (languages or LANGUAGES).each do |lang|
    l = lang.downcase
    html += <<-EOF
      <li class="#{language_class(lang)}">
        <a data-toggle="tab" class="lang-tab #{l}-lang-tab" lang="#{l}" href="##{section}-#{l}">#{lang}</a>
      </li>
    EOF
  end
  html += "</ul>"
  return html
end

def argument(name, description, options={})
  is_required = !options.member?(:default)
  r = is_required ? 'required' : 'optional'
  o = !is_required ? ", default=#{options[:default]}" : ''

  if options[:lang]
    lang = " class=\"lang-specific lang-specific-#{options[:lang]}\""
    lang += ' style="display: none;"' if options[:lang] != ACTIVE_LANGUAGE.downcase
  else
    lang = nil
  end

  return <<-EOF
    <li#{lang}>
      <strong>#{name} [#{r}#{o}]</strong>
      <div>#{description}</div>
    </li>
  EOF
end

def adroll_pixel()
  html = <<-EOF
    <script type="text/javascript">
      adroll_adv_id = "AWPYDAH5JJH2JGSUWJVDKM";
      adroll_pix_id = "BPNOSTJTQFA3HBFU5WDRCM";
      (function () {
        var oldonload = window.onload;
        window.onload = function(){
        __adroll_loaded=true;
        var scr = document.createElement("script");
        var host = (("https:" == document.location.protocol) ? "https://s.adroll.com" : "http://a.adroll.com");
        scr.setAttribute('async', 'true');
        scr.type = "text/javascript";
        scr.src = host + "/j/roundtrip.js";
        ((document.getElementsByTagName('head') || [null])[0] ||
        document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
        if(oldonload){oldonload()}};
      }());
    </script>
  EOF

  return html
end

def snowplow_pixel()
  html = <<-EOF
    <script type="text/javascript">
      ;(function(p,l,o,w,i,n,g){if(!p[i]){p.GlobalSnowplowNamespace=p.GlobalSnowplowNamespace||[];
      p.GlobalSnowplowNamespace.push(i);p[i]=function(){(p[i].q=p[i].q||[]).push(arguments)
      };p[i].q=p[i].q||[];n=l.createElement(o);g=l.getElementsByTagName(o)[0];n.async=1;
      n.src=w;g.parentNode.insertBefore(n,g)}}(window,document,"script","https://don08600y3gfm.cloudfront.net/ps3b/static/js/plow232.js","snowplow"));
      window.snowplow('newTracker', 'co', 'collector.datadoghq.com', { // Initialise a tracker
      appId: 'datadog', // Application ID. Make sure you use the same value across all the tags you fire on your trial
      platform: 'web',
      cookieDomain: '.datadoghq.com',
      contexts: {
        performanceTiming: true,
        webPage: true
        }
      });
      window.snowplow('enableActivityTracking', 5, 5); // Ping every 30 seconds after 30 seconds
      window.snowplow('enableLinkClickTracking');
      window.snowplow('trackPageView');
    </script>
  EOF

  return html
end

# Used by marketing operations and sales teams for tracking leads
def marketo_pixel()
  html = <<-EOF
    <script type="text/javascript">
      (function() {
       var didInit = false;
       function initMunchkin() {
         if(didInit === false) {
           didInit = true;
           Munchkin.init('875-UVY-685');
         }
       }
       var s = document.createElement('script');
       s.type = 'text/javascript';
       s.async = true;
       s.src = '//munchkin.marketo.net/munchkin.js';
       s.onreadystatechange = function() {
         if (this.readyState == 'complete' || this.readyState == 'loaded') {
           initMunchkin();
         }
       };
       s.onload = initMunchkin;
       document.getElementsByTagName('head')[0].appendChild(s);
      })();
    </script>
  EOF

  return html
end
