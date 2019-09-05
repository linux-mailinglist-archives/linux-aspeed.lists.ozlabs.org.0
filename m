Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F30AA611
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 16:41:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PNfl3FppzDqPn
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 00:41:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bETFv/AE"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PNbv0Q90zDqKM
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2019 00:38:48 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id z9so2904818edq.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 07:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z9qGYuvzOKgfE3VSf4A7hjyBrq/wsFQ0ELo9HQginn0=;
 b=bETFv/AEsOjp6qNvUkCj0+WWT3HyrhgruPHhGegUatQbeUr+k2ZLPC9/yib2dthl/g
 HXqve5NkdUzb1wzAPcGMBe1VpcPfkNWKKo98L/LVnW0OljndFxjrEsKcWoYD9wABQkVB
 GoMcJiHBsG8oAISuuy9xY3rsu80o8ZhiOzj5sCGukBdcKmG8mKYTPPNRq8R+fHvdGOdO
 wdJXqH9NhPuYfz12oIwvyWCMPQZvKQdbWklNegRgt9P1pf/ibd5jZXUYFjxd7+p6uiHR
 sPv7GcnoAqT8bVFpDE+3nSY8MnKi3ii5gItHzLLW9g3XykJTV7MAYiije4ptUPC6uwXl
 U3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z9qGYuvzOKgfE3VSf4A7hjyBrq/wsFQ0ELo9HQginn0=;
 b=n+Y8NKpTC1DOD3DfVplUbQgGaC60eGnEB3Uek0Vpwwxo32UK2ZWqCLY1Kax5ANZyFI
 KMDJ+Zn7st4McXL7gzPpYGHlmnL3JtADkW9gow4aDEglE3UhD7bf33VkkMnGqhRPHQ2D
 aLKDZCglvQhFVFl+yL2zCc6DzhJezyl/K8eQPpthkFvDLEs6sknamAYHA3fjZ/ypQzyy
 rtxhxQihfXhVtzg1dDnclx2wQsBeE/pkkp53Gc+2c188OK/NZmz9oJT1yNzKQx7/JdN+
 4/sqY/kY5cerzq0HwcJpWTsOgGfMJ6jJzjJ3Chrlg3ezlAk+1SMRRIdrCdLIz/oZxw/A
 8TyA==
X-Gm-Message-State: APjAAAWkQjTeDjKs/cdxFul1H+MNBhCKNkrI+gQ1Q7tyGEn3yh3JHlIu
 a+GE2Ky0hIrODgvQJRLzTb0oJu9trKJh0Q2GLDAktA==
X-Google-Smtp-Source: APXvYqx/3uKTAYSvYqtkWjmW6yllkZx6L37FPwfh8NaB+a0K2KpQMK/WOjsrjiGVWRGG3OnhfAXscudqwK7xWwMPSNE=
X-Received: by 2002:aa7:da18:: with SMTP id r24mr4238016eds.37.1567694321951; 
 Thu, 05 Sep 2019 07:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190731013404.243755-1-osk@google.com>
 <a2ff0b6edb87d5495dd8e683e95d3b719e55f970.camel@ozlabs.org>
In-Reply-To: <a2ff0b6edb87d5495dd8e683e95d3b719e55f970.camel@ozlabs.org>
From: Oskar Senft <osk@google.com>
Date: Thu, 5 Sep 2019 10:38:24 -0400
Message-ID: <CABoTLcS2z-RtUcm_QNcNC2Pvo4GSg29qpuOnvh+W=UTe+4ehkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drivers/tty/serial/8250: Make Aspeed VUART SIRQ
 polarity configurable
To: Jeremy Kerr <jk@ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002da1b50591cf47d0"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--0000000000002da1b50591cf47d0
Content-Type: text/plain; charset="UTF-8"

Hi Jeremy

Thanks for your comments, they were really helpful!


> > +What:
> /sys/bus/platform/drivers/aspeed-vuart/*/sirq_polarity
> > +Date:                July 2019
> > +Contact:     Oskar Senft <osk@google.com>
> > +Description: Configures the polarity of the serial interrupt to the
> > +             host via the BMC LPC bus.
>
> Can you mention what the value represents? 1/0 don't really indicate a
> specific polarity.
>
Good point. Not sure why I didn't do that initially.


> > @@ -310,6 +379,7 @@ static int aspeed_vuart_probe(struct platform_device
> *pdev)
> >       struct resource *res;
> >       u32 clk, prop;
> >       int rc;
> > +     struct of_phandle_args espi_enabled_args;
> Minor: can you reverse-christmas-tree this?
>
Oops, yeah. Sorry! Conflicting coding styles in my head got confused.


> > +     rc = of_parse_phandle_with_fixed_args(
> > +             np, "espi-enabled", 2, 0, &espi_enabled_args);
> > +     if (rc < 0) {
> > +             dev_warn(&pdev->dev, "espi-enabled property not found\n");
> That may just be a matter of changing this to dev_debug.
>
That was my intent, sorry for that.

I'll send v3 with those changes in a few minutes.

Thanks
Oskar.


On Wed, Sep 4, 2019 at 9:14 PM Jeremy Kerr <jk@ozlabs.org> wrote:

> Hi Oskar,
>
> Looks good to me, some minor comments though:
>
> > +
> > +What:
> /sys/bus/platform/drivers/aspeed-vuart/*/sirq_polarity
> > +Date:                July 2019
> > +Contact:     Oskar Senft <osk@google.com>
> > +Description: Configures the polarity of the serial interrupt to the
> > +             host via the BMC LPC bus.
>
> Can you mention what the value represents? 1/0 don't really indicate a
> specific polarity.
>
> Alternatively, we could use descriptive values (say, "active-low" /
> "idle-low").
>
> > @@ -310,6 +379,7 @@ static int aspeed_vuart_probe(struct platform_device
> *pdev)
> >       struct resource *res;
> >       u32 clk, prop;
> >       int rc;
> > +     struct of_phandle_args espi_enabled_args;
>
> Minor: can you reverse-christmas-tree this?
>
> > @@ -402,6 +472,18 @@ static int aspeed_vuart_probe(struct
> platform_device *pdev)
> >
> >       vuart->line = rc;
> >
> > +     rc = of_parse_phandle_with_fixed_args(
> > +             np, "espi-enabled", 2, 0, &espi_enabled_args);
> > +     if (rc < 0) {
> > +             dev_warn(&pdev->dev, "espi-enabled property not found\n");
>
> In the binding spec, you've listed this property at optional, but here
> we dev_warn() if its not present. Can we default to existing behaviour
> if it's not there?
>
> That may just be a matter of changing this to dev_debug.
>
> Cheers,
>
>
> Jeremy
>
>

--0000000000002da1b50591cf47d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Jeremy</div><div dir=3D"ltr"><br></div=
><div>Thanks for your comments, they were really=C2=A0helpful!</div><div cl=
ass=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /sys/bus/platform/drivers/aspeed-vuart/*/sirq_polarity<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 July 201=
9<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0Oskar Senft &lt;<a href=3D"mailto:osk@goo=
gle.com" target=3D"_blank">osk@google.com</a>&gt;<br>
&gt; +Description: Configures the polarity of the serial interrupt to the<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host via the BMC LPC =
bus.<br>
<br>
Can you mention what the value represents? 1/0 don&#39;t really indicate a<=
br>
specific polarity.<br></blockquote><div>Good point. Not sure why I didn&#39=
;t do that initially.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">&gt; @@ -310,6 +379,7 @@ static int aspeed_vuart_probe(s=
truct platform_device *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clk, prop;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct of_phandle_args espi_enabled_args;<br>
Minor: can you reverse-christmas-tree this?<br></blockquote><div>Oops, yeah=
. Sorry! Conflicting coding styles in my head got confused.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; +=C2=A0 =C2=
=A0 =C2=A0rc =3D of_parse_phandle_with_fixed_args(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0np, &quot;espi-enable=
d&quot;, 2, 0, &amp;espi_enabled_args);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (rc &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;pdev-&g=
t;dev, &quot;espi-enabled property not found\n&quot;);<br>That may just be =
a matter of changing this to dev_debug.<br></blockquote><div>That was my in=
tent, sorry for that.</div><div><br></div><div>I&#39;ll send v3 with those =
changes in a few minutes.</div><div><br></div><div>Thanks</div><div>Oskar.<=
/div><div><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Sep 4, 2019 at 9:14 PM Jeremy Kerr &lt;<a=
 href=3D"mailto:jk@ozlabs.org">jk@ozlabs.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Oskar,<br>
<br>
Looks good to me, some minor comments though:<br>
<br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sys/bus=
/platform/drivers/aspeed-vuart/*/sirq_polarity<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 July 201=
9<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0Oskar Senft &lt;<a href=3D"mailto:osk@goo=
gle.com" target=3D"_blank">osk@google.com</a>&gt;<br>
&gt; +Description: Configures the polarity of the serial interrupt to the<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host via the BMC LPC =
bus.<br>
<br>
Can you mention what the value represents? 1/0 don&#39;t really indicate a<=
br>
specific polarity.<br>
<br>
Alternatively, we could use descriptive values (say, &quot;active-low&quot;=
 /<br>
&quot;idle-low&quot;).<br>
<br>
&gt; @@ -310,6 +379,7 @@ static int aspeed_vuart_probe(struct platform_devi=
ce *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clk, prop;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct of_phandle_args espi_enabled_args;<br>
<br>
Minor: can you reverse-christmas-tree this?<br>
<br>
&gt; @@ -402,6 +472,18 @@ static int aspeed_vuart_probe(struct platform_dev=
ice *pdev)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vuart-&gt;line =3D rc;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc =3D of_parse_phandle_with_fixed_args(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0np, &quot;espi-enable=
d&quot;, 2, 0, &amp;espi_enabled_args);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (rc &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;pdev-&g=
t;dev, &quot;espi-enabled property not found\n&quot;);<br>
<br>
In the binding spec, you&#39;ve listed this property at optional, but here<=
br>
we dev_warn() if its not present. Can we default to existing behaviour<br>
if it&#39;s not there?<br>
<br>
That may just be a matter of changing this to dev_debug.<br>
<br>
Cheers,<br>
<br>
<br>
Jeremy<br>
<br>
</blockquote></div>

--0000000000002da1b50591cf47d0--
