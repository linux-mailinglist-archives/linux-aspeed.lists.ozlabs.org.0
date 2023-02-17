Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9568669BF0E
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 08:48:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKHjK2rTBz3bg1
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 18:48:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ePSkcEjM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=gengcixi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ePSkcEjM;
	dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHyDc0Hmzz3c9K
	for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Feb 2023 14:37:17 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id r28so3806136oiw.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 19:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nSVqDFINb6eTwnKScQKOjb76m3fWngmDehoCyhWJ504=;
        b=ePSkcEjMi7poii0SK0dny0hZgpjsBJ5YF2xuLigoCxuADXvJNjLAwR52kS9buXCrb2
         lvM+POooecWQXQlVjfndNYmpqxxicw4qBA0oOZHtszF12yYjz6oME4sp7NVcDE9roKpI
         TYIbJuGYHtFCpf1OSqlCYEickCzf8g4TwtsC4fQtQuxNmjlmXV0/Vrb1+cZncl82bA6b
         cJD2nUNQMgmPaNdEpDTQ8krB3vtt5ArJ+j1y1kBQkP2C9WFcjQ/zwQ5LCC35+IAOpX5o
         jWdBzLK9zJUQgZsFKHvlpcJAKyOzdvqNhxWdLAKu6wYmcWUtG0i5dOn5TOLrgSnYW5us
         9WGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSVqDFINb6eTwnKScQKOjb76m3fWngmDehoCyhWJ504=;
        b=fV5VkyheAEoSZB2442l4nMiK9edDf9CuJWyyO0ZW5Af4cEwRQ0nT10J6JMejkeiRP7
         RKMIAhqpTG01GqcWxKPzWzIvrzhoDB3Bjw3zWjle+LP2WsF5zYN5VSXhuJk7hE/doDLQ
         a6F7Nz8PDullmC1DXcuUVwxbn0CXxUuuBL4goTjBqIfNgiD4uA+kNqXabiomzB9DGIpr
         iWON1RAcImIQZzUoJ9zEdaifIcfsySzwuyeb0tBXS2S6n+Fz9mvFABlRNG729owZwSO3
         5f9Sp0ffSA7i/iPi7GDR7SnrJvP84rxX2TXDNyyqf2HMYjuBNz1bvHkfVl7iD+4Ug/TC
         1n2A==
X-Gm-Message-State: AO0yUKX+GZ+vnXtzc6I/TIfzYUGvUJp2T1nXO/c5mR+P3l+J25dMguhW
	LVzODmd9mii2xi2iOkUpPMB70amAg8h2A7oPXTo=
X-Google-Smtp-Source: AK7set8sazgD1rXwE5nxeE+TvZYbpwDcytXkRh1hJj9cXjV8uta15Eq5AjAMfNdOotYQDnb4JNCJvgE7fgHunDDmA3Y=
X-Received: by 2002:a05:6808:10cd:b0:378:7f38:c934 with SMTP id
 s13-20020a05680810cd00b003787f38c934mr374426ois.127.1676605034648; Thu, 16
 Feb 2023 19:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org> <20230215-immutable-chips-v1-7-51a8f224a5d0@linaro.org>
In-Reply-To: <20230215-immutable-chips-v1-7-51a8f224a5d0@linaro.org>
From: Cixi Geng <gengcixi@gmail.com>
Date: Fri, 17 Feb 2023 11:36:38 +0800
Message-ID: <CAF12kFt3SPJppcwPxE9F2mTKaMKkN_Nvw1J8_=L1U5OOEgxwJA@mail.gmail.com>
Subject: Re: [PATCH 07/17] gpio: eic_sprd: Convert to immutable irq_chip
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000084dbcd05f4dd07f0"
X-Mailman-Approved-At: Sun, 19 Feb 2023 18:42:49 +1100
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
Cc: Marc Zyngier <maz@kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-omap@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Mun Yew Tham <mun.yew.tham@intel.com>, Kevin Hilman <khilman@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jay Fang <f.fangjian@huawei.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Romain Perier <romain.perier@gmail.com>, William Breathitt Gray <william.gray@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--00000000000084dbcd05f4dd07f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus Walleij <linus.walleij@linaro.org> =E4=BA=8E2023=E5=B9=B42=E6=9C=8816=
=E6=97=A5=E5=91=A8=E5=9B=9B 17:41=E5=86=99=E9=81=93=EF=BC=9A

> Convert the driver to immutable irq-chip with a bit of
> intuition.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-eic-sprd.c | 33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
> index 8d722e026e9c..695d74ba55f0 100644
> --- a/drivers/gpio/gpio-eic-sprd.c
> +++ b/drivers/gpio/gpio-eic-sprd.c
>
Hi LInus:
this file which convert to immutable changes had included in the
patchset[1] early.
Thank you for your commit anyway.
[1]
https://lore.kernel.org/all/CAMRc=3DMeCCT09umHQ+T6Z6OXMedBh3UXzmQ=3D1PCyo1z=
EMr34TCw@mail.gmail.com/

@@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/seq_file.h>
>  #include <linux/spinlock.h>
>
>  /* EIC registers definition */
> @@ -91,7 +92,7 @@ enum sprd_eic_type {
>
>  struct sprd_eic {
>         struct gpio_chip chip;
> -       struct irq_chip intc;
> +       struct device *dev;
>         void __iomem *base[SPRD_EIC_MAX_BANK];
>         enum sprd_eic_type type;
>         spinlock_t lock;
> @@ -255,6 +256,7 @@ static void sprd_eic_irq_mask(struct irq_data *data)
>         default:
>                 dev_err(chip->parent, "Unsupported EIC type.\n");
>         }
> +       gpiochip_disable_irq(chip, irqd_to_hwirq(data));
>  }
>
>  static void sprd_eic_irq_unmask(struct irq_data *data)
> @@ -263,6 +265,7 @@ static void sprd_eic_irq_unmask(struct irq_data *data=
)
>         struct sprd_eic *sprd_eic =3D gpiochip_get_data(chip);
>         u32 offset =3D irqd_to_hwirq(data);
>
> +       gpiochip_enable_irq(chip, irqd_to_hwirq(data));
>         switch (sprd_eic->type) {
>         case SPRD_EIC_DEBOUNCE:
>                 sprd_eic_update(chip, offset, SPRD_EIC_DBNC_IE, 1);
> @@ -564,6 +567,24 @@ static void sprd_eic_irq_handler(struct irq_desc
> *desc)
>         chained_irq_exit(ic, desc);
>  }
>
> +static void sprd_eic_irq_print_chip(struct irq_data *data, struct
> seq_file *p)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       struct sprd_eic *sprd_eic =3D gpiochip_get_data(chip);
> +
> +       seq_printf(p, dev_name(sprd_eic->dev));
> +}
> +
> +static const struct irq_chip sprd_eic_irq_chip =3D {
> +       .irq_ack =3D sprd_eic_irq_ack,
> +       .irq_mask =3D sprd_eic_irq_mask,
> +       .irq_unmask =3D sprd_eic_irq_unmask,
> +       .irq_set_type =3D sprd_eic_irq_set_type,
> +       .irq_print_chip =3D sprd_eic_irq_print_chip,
> +       .flags =3D IRQCHIP_SKIP_SET_WAKE | IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>  static int sprd_eic_probe(struct platform_device *pdev)
>  {
>         const struct sprd_eic_variant_data *pdata;
> @@ -584,6 +605,7 @@ static int sprd_eic_probe(struct platform_device *pde=
v)
>
>         spin_lock_init(&sprd_eic->lock);
>         sprd_eic->type =3D pdata->type;
> +       sprd_eic->dev =3D &pdev->dev;
>
>         sprd_eic->irq =3D platform_get_irq(pdev, 0);
>         if (sprd_eic->irq < 0)
> @@ -626,15 +648,8 @@ static int sprd_eic_probe(struct platform_device
> *pdev)
>                 break;
>         }
>
> -       sprd_eic->intc.name =3D dev_name(&pdev->dev);
> -       sprd_eic->intc.irq_ack =3D sprd_eic_irq_ack;
> -       sprd_eic->intc.irq_mask =3D sprd_eic_irq_mask;
> -       sprd_eic->intc.irq_unmask =3D sprd_eic_irq_unmask;
> -       sprd_eic->intc.irq_set_type =3D sprd_eic_irq_set_type;
> -       sprd_eic->intc.flags =3D IRQCHIP_SKIP_SET_WAKE;
> -
>         irq =3D &sprd_eic->chip.irq;
> -       irq->chip =3D &sprd_eic->intc;
> +       gpio_irq_chip_set_chip(irq, &sprd_eic_irq_chip);
>         irq->handler =3D handle_bad_irq;
>         irq->default_type =3D IRQ_TYPE_NONE;
>         irq->parent_handler =3D sprd_eic_irq_handler;
>
> --
> 2.34.1
>
>

--00000000000084dbcd05f4dd07f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Linus Walleij &lt;<a href=3D"mailto:l=
inus.walleij@linaro.org">linus.walleij@linaro.org</a>&gt; =E4=BA=8E2023=E5=
=B9=B42=E6=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 17:41=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Convert the =
driver to immutable irq-chip with a bit of<br>
intuition.<br>
<br>
Cc: Marc Zyngier &lt;<a href=3D"mailto:maz@kernel.org" target=3D"_blank">ma=
z@kernel.org</a>&gt;<br>
Signed-off-by: Linus Walleij &lt;<a href=3D"mailto:linus.walleij@linaro.org=
" target=3D"_blank">linus.walleij@linaro.org</a>&gt;<br>
---<br>
=C2=A0drivers/gpio/gpio-eic-sprd.c | 33 ++++++++++++++++++++++++---------<b=
r>
=C2=A01 file changed, 24 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c<br=
>
index 8d722e026e9c..695d74ba55f0 100644<br>
--- a/drivers/gpio/gpio-eic-sprd.c<br>
+++ b/drivers/gpio/gpio-eic-sprd.c<br></blockquote><div>Hi LInus:=C2=A0</di=
v><div>this file which convert to immutable changes had included in the pat=
chset[1] early.</div><div>Thank you for your commit anyway.</div><div>[1]=
=C2=A0<a href=3D"https://lore.kernel.org/all/CAMRc=3DMeCCT09umHQ+T6Z6OXMedB=
h3UXzmQ=3D1PCyo1zEMr34TCw@mail.gmail.com/">https://lore.kernel.org/all/CAMR=
c=3DMeCCT09umHQ+T6Z6OXMedBh3UXzmQ=3D1PCyo1zEMr34TCw@mail.gmail.com/</a></di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
@@ -11,6 +11,7 @@<br>
=C2=A0#include &lt;linux/module.h&gt;<br>
=C2=A0#include &lt;linux/of_device.h&gt;<br>
=C2=A0#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/seq_file.h&gt;<br>
=C2=A0#include &lt;linux/spinlock.h&gt;<br>
<br>
=C2=A0/* EIC registers definition */<br>
@@ -91,7 +92,7 @@ enum sprd_eic_type {<br>
<br>
=C2=A0struct sprd_eic {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gpio_chip chip;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct irq_chip intc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem *base[SPRD_EIC_MAX_BANK];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum sprd_eic_type type;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spinlock_t lock;<br>
@@ -255,6 +256,7 @@ static void sprd_eic_irq_mask(struct irq_data *data)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(chip-&gt;pa=
rent, &quot;Unsupported EIC type.\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiochip_disable_irq(chip, irqd_to_hwirq(data))=
;<br>
=C2=A0}<br>
<br>
=C2=A0static void sprd_eic_irq_unmask(struct irq_data *data)<br>
@@ -263,6 +265,7 @@ static void sprd_eic_irq_unmask(struct irq_data *data)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sprd_eic *sprd_eic =3D gpiochip_get_data=
(chip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 offset =3D irqd_to_hwirq(data);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiochip_enable_irq(chip, irqd_to_hwirq(data));=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (sprd_eic-&gt;type) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case SPRD_EIC_DEBOUNCE:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprd_eic_update(chi=
p, offset, SPRD_EIC_DBNC_IE, 1);<br>
@@ -564,6 +567,24 @@ static void sprd_eic_irq_handler(struct irq_desc *desc=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chained_irq_exit(ic, desc);<br>
=C2=A0}<br>
<br>
+static void sprd_eic_irq_print_chip(struct irq_data *data, struct seq_file=
 *p)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_chip *chip =3D irq_data_get_irq_chi=
p_data(data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_eic *sprd_eic =3D gpiochip_get_data=
(chip);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(p, dev_name(sprd_eic-&gt;dev));<br>
+}<br>
+<br>
+static const struct irq_chip sprd_eic_irq_chip =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_ack =3D sprd_eic_irq_ack,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_mask =3D sprd_eic_irq_mask,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_unmask =3D sprd_eic_irq_unmask,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_set_type =3D sprd_eic_irq_set_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_print_chip =3D sprd_eic_irq_print_chip,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D IRQCHIP_SKIP_SET_WAKE | IRQCHIP_IMMU=
TABLE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GPIOCHIP_IRQ_RESOURCE_HELPERS,<br>
+};<br>
+<br>
=C2=A0static int sprd_eic_probe(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct sprd_eic_variant_data *pdata;<br>
@@ -584,6 +605,7 @@ static int sprd_eic_probe(struct platform_device *pdev)=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_init(&amp;sprd_eic-&gt;lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprd_eic-&gt;type =3D pdata-&gt;type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_eic-&gt;dev =3D &amp;pdev-&gt;dev;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprd_eic-&gt;irq =3D platform_get_irq(pdev, 0);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sprd_eic-&gt;irq &lt; 0)<br>
@@ -626,15 +648,8 @@ static int sprd_eic_probe(struct platform_device *pdev=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_eic-&gt;<a href=3D"http://intc.name" rel=
=3D"noreferrer" target=3D"_blank">intc.name</a> =3D dev_name(&amp;pdev-&gt;=
dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_eic-&gt;intc.irq_ack =3D sprd_eic_irq_ack;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_eic-&gt;intc.irq_mask =3D sprd_eic_irq_mas=
k;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_eic-&gt;intc.irq_unmask =3D sprd_eic_irq_u=
nmask;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_eic-&gt;intc.irq_set_type =3D sprd_eic_irq=
_set_type;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_eic-&gt;intc.flags =3D IRQCHIP_SKIP_SET_WA=
KE;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D &amp;sprd_eic-&gt;chip.irq;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0irq-&gt;chip =3D &amp;sprd_eic-&gt;intc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpio_irq_chip_set_chip(irq, &amp;sprd_eic_irq_c=
hip);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;handler =3D handle_bad_irq;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;default_type =3D IRQ_TYPE_NONE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;parent_handler =3D sprd_eic_irq_handler=
;<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000084dbcd05f4dd07f0--
