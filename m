Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D036492B45
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jan 2022 17:33:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdZ8J0QtLz30Nd
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Jan 2022 03:33:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Yn54nBV+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::92d;
 helo=mail-ua1-x92d.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Yn54nBV+; dkim-atps=neutral
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdZ883R3lz30KZ
 for <linux-aspeed@lists.ozlabs.org>; Wed, 19 Jan 2022 03:33:09 +1100 (AEDT)
Received: by mail-ua1-x92d.google.com with SMTP id b16so3293032uaq.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Jan 2022 08:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZY3FpkXY4tgdgabKgpJwDiO8vngnEaG/fbyxkoOA/4=;
 b=Yn54nBV+Zy31zRNafII/WjinUazzKw9l48VaEzdGURAWPU2k61GROdAwm1oTj0BqYd
 ywaQjaGhDqoEaoGFZzmUMtWsrhOh3epFPkXArNei4pHC29NJ6biCIUA8PrGpCnrL/4gQ
 Wz3gXeBz6twEEI/jWjZOtPO89y9Uqoz6V4+nl6bsA/v5YQs/1AiovgsgdibOhA6xqLmF
 7HYfik7FsQvzy0nipcNflew3FfxObCU8ETIpJqF1A+mDQkB9E6dRdC/dDU3cAt8Vo6fP
 A1uWWpRIc8ichGm8BqO9IeqQa0HwedifCCXdL0aMcK/6VcdkG5EFemzbASo7isxNza+L
 g7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZY3FpkXY4tgdgabKgpJwDiO8vngnEaG/fbyxkoOA/4=;
 b=1529Vqw8FmU/KT/n8QhoZnXkJgOJcci8hSvEckl1xLoT9WR8nx79GexyNbPWXtASlI
 8sBQyBT4QbTnNLw3F6zJzGWtMmSOeHB47YTNZWoOGmLg0N99YEA5qB09Am6zwBJduYZl
 4ZfunG6IYZBMxIGYK3cBcJvnHulNQmKDZx918YMMZhozJY8v0Kq02g6JmPFxgheczpu2
 oTujySPZ7OcFKcP1jtXBOSkZ/jQFE0rwXx3nSTGqjyJHCuvEqSi0cKDTrj0SoHVJ7fSm
 SD9QKxcoEhXHjArlGr0AG/HX7lNjuc04tfCpXBJ8HWVxnHjh0WNshIXG37u1kZ6WPSgZ
 cETA==
X-Gm-Message-State: AOAM532U7OJwG4jfYEdQ7x7yX/xSvWOXYGcG43UBLAAuBH1gMASQz9OH
 k70ncZ+EnHijpRphbAUfLsnG++f/8qrkhGDIu4BXcA==
X-Google-Smtp-Source: ABdhPJwm9f1xEDRL9fyHmcacceOFLyapEF/sYipte9oWa547EjopnJDImOtg/lPnYiAjykDd2l1f2iML+QxkYnt0gIM=
X-Received: by 2002:a05:6130:30c:: with SMTP id
 ay12mr11667518uab.15.1642523584645; 
 Tue, 18 Jan 2022 08:33:04 -0800 (PST)
MIME-Version: 1.0
References: <20220114064357.18562-1-linmq006@gmail.com>
In-Reply-To: <20220114064357.18562-1-linmq006@gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 18 Jan 2022 08:32:53 -0800
Message-ID: <CAO=notwdkeJRyc0qQROV=Jsmgj2UrPGQkKii9Hu8bYv7oQLSpQ@mail.gmail.com>
Subject: Re: [PATCH] soc: aspeed: Fix IRQ check in aspeed_lpc_snoop_config_irq
To: Miaoqian Lin <linmq006@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ccb17405d5ddd2d4"
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
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Vernon Mauery <vernon.mauery@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--000000000000ccb17405d5ddd2d4
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 10:44 PM Miaoqian Lin <linmq006@gmail.com> wrote:

> platform_get_irq() returns negative error number instead 0 on failure.
> And the doc of platform_get_irq() provides a usage example:
>
>     int irq = platform_get_irq(pdev, 0);
>     if (irq < 0)
>         return irq;
>
> Fix the check of return value to catch errors correctly.
>
> Fixes: 524feb799408 ("soc: add aspeed folder and misc drivers")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>

Signed-off-by: Patrick Venture <venture@google.com>


> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index eceeaf8dfbeb..c4a03b3a5cf8 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -167,8 +167,8 @@ static int aspeed_lpc_snoop_config_irq(struct
> aspeed_lpc_snoop *lpc_snoop,
>         int rc;
>
>         lpc_snoop->irq = platform_get_irq(pdev, 0);
> -       if (!lpc_snoop->irq)
> -               return -ENODEV;
> +       if (lpc_snoop->irq < 0)
> +               return lpc_snoop->irq;
>
>         rc = devm_request_irq(dev, lpc_snoop->irq,
>                               aspeed_lpc_snoop_irq, IRQF_SHARED,
> --
> 2.17.1
>
>

--000000000000ccb17405d5ddd2d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 10:44 PM Miao=
qian Lin &lt;<a href=3D"mailto:linmq006@gmail.com">linmq006@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">platfo=
rm_get_irq() returns negative error number instead 0 on failure.<br>
And the doc of platform_get_irq() provides a usage example:<br>
<br>
=C2=A0 =C2=A0 int irq =3D platform_get_irq(pdev, 0);<br>
=C2=A0 =C2=A0 if (irq &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return irq;<br>
<br>
Fix the check of return value to catch errors correctly.<br>
<br>
Fixes: 524feb799408 (&quot;soc: add aspeed folder and misc drivers&quot;)<b=
r>
Signed-off-by: Miaoqian Lin &lt;<a href=3D"mailto:linmq006@gmail.com" targe=
t=3D"_blank">linmq006@gmail.com</a>&gt;<br></blockquote><div><br></div><div=
>Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com">v=
enture@google.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
---<br>
=C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/asp=
eed-lpc-snoop.c<br>
index eceeaf8dfbeb..c4a03b3a5cf8 100644<br>
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c<br>
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c<br>
@@ -167,8 +167,8 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lp=
c_snoop *lpc_snoop,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int rc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lpc_snoop-&gt;irq =3D platform_get_irq(pdev, 0)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lpc_snoop-&gt;irq)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (lpc_snoop-&gt;irq &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return lpc_snoop-&g=
t;irq;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D devm_request_irq(dev, lpc_snoop-&gt;irq,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aspeed_lpc_snoop_irq, IRQF_SHARED,<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--000000000000ccb17405d5ddd2d4--
