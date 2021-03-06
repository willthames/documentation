---
last_modified: 2017/02/14
translation_status: complete
language: ja
title: Agentの基本的な使用方法 (Amazon Linux)
kind: documentation
servicename: /etc/init.d/datadog-agent
serviceinfoname: /etc/init.d/datadog-agent info
configdirectory: /etc/dd-agent/
logdirectory: /var/log/datadog/
supervisorlog: /var/log/supervisor/datadog-supervisord.log
---

<!--
======================================================
OVERVIEW
======================================================
-->

<!-- ### Overview -->

### 概要
{: #overview}

<!-- This guide will outline the basic functionality of the Datadog Agent.
If you haven't installed the Agent yet, instructions can be found
<a href='https://app.datadoghq.com/account/settings#agent'>here</a>. -->

このガイドでは、Datadog Agentの基本的な機能を説明します。
まだDatadog Agent のインストールを済ませていない場合は、<a href='https://app.datadoghq.com'>Datadog</a> にloginした状態で、該当OSの
<a href='https://app.datadoghq.com/account/settings#agent'>Agent</a> ページに移動し、インストールの手順を確認してください。


<%= render 'partials/BasicAgentUsage-nix-ja' %>

<br/>

<!-- If you're still having trouble, our support team will be glad to provide further assistance.
You can contact them in one of the following ways: -->

上記の方法を実行しても問題が解決しない場合は、Datadogのサポートチームが問題解決のお手伝いをすることができます。Datadogのサポートチームに連絡を取るには、次のような方法があります。

<%= render '_contact_info-ja', :heading_size => 5, :hide_datadog => false %>
