Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E245678D
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 02:46:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwKJT5SLPz305V
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 12:46:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwKJQ47cFz2xsT;
 Fri, 19 Nov 2021 12:46:11 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1AJ1Kvrp077196;
 Fri, 19 Nov 2021 09:20:57 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Nov
 2021 09:44:45 +0800
Content-Type: multipart/alternative;
 boundary="------------2Vex4QfILpzh4egjjC919b1m"
Message-ID: <421745ba-0311-4556-b6e0-555bb8b3d9eb@aspeedtech.com>
Date: Fri, 19 Nov 2021 09:44:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v5 02/10] media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg
 for log
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <20211118074030.685-3-jammy_huang@aspeedtech.com>
 <YZY/VCt8WZx/4dFt@paasikivi.fi.intel.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <YZY/VCt8WZx/4dFt@paasikivi.fi.intel.com>
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AJ1Kvrp077196
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--------------2Vex4QfILpzh4egjjC919b1m
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari,

On 2021/11/18 下午 07:56, Sakari Ailus wrote:
> Hi Jammy,
>
> On Thu, Nov 18, 2021 at 03:40:23PM +0800, Jammy Huang wrote:
>> The debug log level, 0~3, is controlled by module_param, debug.
>> The higher the value, the more the information.
>>    0: off
>>    1: info
>>    2: debug
>>    3: register operations
>>
>> Signed-off-by: Jammy Huang<jammy_huang@aspeedtech.com>
> Just wondering: what's the purpose of switching to v4l2_*() functions for
> printing when dev_*() equivalents already can do the same?
>
Indeed, most of them, such as dev_err/v4l2_err or dev_info/v4l2_info, are the same.
The reason why I want to adapt v4l2_*() is v4l2_dbg with which I can have module's
own debug level.
/* These three macros assume that the debug level is set with a module
parameter called 'debug'. */
#define v4l2_dbg 
<https://elixir.bootlin.com/linux/latest/C/ident/v4l2_dbg>(level 
<https://elixir.bootlin.com/linux/latest/C/ident/level>, debug 
<https://elixir.bootlin.com/linux/latest/C/ident/debug>, dev, fmt 
<https://elixir.bootlin.com/linux/latest/C/ident/fmt>, arg...) \
do { \
if (debug <https://elixir.bootlin.com/linux/latest/C/ident/debug> >= 
(level <https://elixir.bootlin.com/linux/latest/C/ident/level>)) \
v4l2_printk 
<https://elixir.bootlin.com/linux/latest/C/ident/v4l2_printk>(KERN_DEBUG 
<https://elixir.bootlin.com/linux/latest/C/ident/KERN_DEBUG>, dev, fmt 
<https://elixir.bootlin.com/linux/latest/C/ident/fmt> , ## arg); \
} while (0)
-- 
Best Regards
Jammy

--------------2Vex4QfILpzh4egjjC919b1m
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Sakari,<br>
    </p>
    <div class=3D"moz-cite-prefix">On 2021/11/18 =E4=B8=8B=E5=8D=88 07:56=
, Sakari Ailus
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:YZY%2FVCt8WZx%2F4dFt@paasikivi.fi.intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Hi Jammy,

On Thu, Nov 18, 2021 at 03:40:23PM +0800, Jammy Huang wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">The debug log level, 0~3, =
is controlled by module_param, debug.
The higher the value, the more the information.
  0: off
  1: info
  2: debug
  3: register operations

Signed-off-by: Jammy Huang <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:jammy_huang@aspeedtech.com">&lt;jammy_huang@aspeedtech.com&gt;</a>
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Just wondering: what's the purpose of switching to v4l2_*() functions for=

printing when dev_*() equivalents already can do the same?

</pre>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">Indeed, most of them, such a=
s dev_err/v4l2_err or dev_info/v4l2_info, are the same.
The reason why I want to adapt v4l2_*() is v4l2_dbg with which I can have=
 module's
own debug level.
<span class=3D"cm" style=3D"box-sizing: inherit; color: slategray; font-s=
tyle: italic;">/* These three macros assume that the debug level is set w=
ith a module</span>
<span class=3D"cm" style=3D"box-sizing: inherit; color: slategray; font-s=
tyle: italic;">   parameter called 'debug'. */</span>
<span class=3D"cp" style=3D"box-sizing: inherit; color: rgb(85, 119, 153)=
;">#define <a href=3D"https://elixir.bootlin.com/linux/latest/C/ident/v4l=
2_dbg" style=3D"box-sizing: inherit; background: linear-gradient(rgba(0, =
0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, =
0, 0) 90%); color: inherit; text-decoration: none; font-weight: 700; bord=
er-radius: 0.2em;">v4l2_dbg</a>(<a href=3D"https://elixir.bootlin.com/lin=
ux/latest/C/ident/level" style=3D"box-sizing: inherit; background: linear=
-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255=
) 90%, rgba(0, 0, 0, 0) 90%); color: inherit; text-decoration: none; font=
-weight: 700; border-radius: 0.2em;">level</a>, <a href=3D"https://elixir=
=2Ebootlin.com/linux/latest/C/ident/debug" style=3D"box-sizing: inherit; =
background: linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%,=
 rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0) 90%); color: inherit; text-deco=
ration: none; font-weight: 700; border-radius: 0.2em;">debug</a>, dev, <a=
 href=3D"https://elixir.bootlin.com/linux/latest/C/ident/fmt" style=3D"bo=
x-sizing: inherit; background: linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(=
244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0) 90%); color:=
 inherit; text-decoration: none; font-weight: 700; border-radius: 0.2em;"=
>fmt</a>, arg...)			\</span>
<span class=3D"cp" style=3D"box-sizing: inherit; color: rgb(85, 119, 153)=
;">	do {								\</span>
<span class=3D"cp" style=3D"box-sizing: inherit; color: rgb(85, 119, 153)=
;">		if (<a href=3D"https://elixir.bootlin.com/linux/latest/C/ident/debug=
" style=3D"box-sizing: inherit; background: linear-gradient(rgba(0, 0, 0,=
 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0)=
 90%); color: inherit; text-decoration: none; font-weight: 700; border-ra=
dius: 0.2em;">debug</a> &gt;=3D (<a href=3D"https://elixir.bootlin.com/li=
nux/latest/C/ident/level" style=3D"box-sizing: inherit; background: linea=
r-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 25=
5) 90%, rgba(0, 0, 0, 0) 90%); color: inherit; text-decoration: none; fon=
t-weight: 700; border-radius: 0.2em;">level</a>))					\</span>
<span class=3D"cp" style=3D"box-sizing: inherit; color: rgb(85, 119, 153)=
;">			<a href=3D"https://elixir.bootlin.com/linux/latest/C/ident/v4l2_pri=
ntk" style=3D"box-sizing: inherit; background: linear-gradient(rgba(0, 0,=
 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0,=
 0) 90%); color: inherit; text-decoration: none; font-weight: 700; border=
-radius: 0.2em;">v4l2_printk</a>(<a href=3D"https://elixir.bootlin.com/li=
nux/latest/C/ident/KERN_DEBUG" style=3D"box-sizing: inherit; background: =
linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 24=
6, 255) 90%, rgba(0, 0, 0, 0) 90%); color: inherit; text-decoration: none=
; font-weight: 700; border-radius: 0.2em;">KERN_DEBUG</a>, dev, <a href=3D=
"https://elixir.bootlin.com/linux/latest/C/ident/fmt" style=3D"box-sizing=
: inherit; background: linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246=
, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0) 90%); color: inherit=
; text-decoration: none; font-weight: 700; border-radius: 0.2em;">fmt</a>=
 , ## arg);	\</span>
<span class=3D"cp" style=3D"box-sizing: inherit; color: rgb(85, 119, 153)=
;">	} while (0)</span>
--=20
Best Regards
Jammy</pre>
  </body>
</html>
--------------2Vex4QfILpzh4egjjC919b1m--
