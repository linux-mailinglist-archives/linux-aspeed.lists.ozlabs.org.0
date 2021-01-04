Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C592E8F5E
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Jan 2021 03:13:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8K0y530gzDqY7
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Jan 2021 13:13:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Ivw73FCh; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8K0s2pbpzDqFH
 for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Jan 2021 13:13:14 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id v5so17616414qtv.7
 for <linux-aspeed@lists.ozlabs.org>; Sun, 03 Jan 2021 18:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zrfbktkP7+jm+CVexaXtl8hdzXJE0joxlDW/C7HxFeo=;
 b=Ivw73FChOg7aiKOQJ7U35boqdG7P6i/+nwJ6sok5ICJKpSId9Z8Xdsj+ZhccFalEtz
 MJQ4KLeptQc61d2IaraFBjWQ9eSe2GQzXqaCZGpUAQ1q2YiObJlC/fQy2/aFNi2N8f+G
 ehSKWOAQiST7lBFJFtR1n7VWJ+K7KWDLQyrdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zrfbktkP7+jm+CVexaXtl8hdzXJE0joxlDW/C7HxFeo=;
 b=VEnV6FH4yJnFimcLPF1/O+oL7mO45PCsdqn1vJubHfCxfBt8jlnc6T3z9lAysV8CcW
 rdFIb3fkbjZUm8jYdQL6frq8Q5ghvoatYxXe+gh5cepq1YAOYUV0vCAaP+GXkxJCMfWm
 954fBw2aHS4ZveA9f75tWro5XnVb6lsxwsgQEjhlwGl7/AJ5B03Pdyd/LkaBqNQrjGMh
 QYtGQXhRinsCe3VqEmhtX2NJqYdSLTXrvhZRntJ2yGehV3ECBUZ4hJqpl+1H4D5a87uI
 6z5GrYAWimuEUyiofAY+1WvFIppxQsIKK3UeXxvDGJI3pTePqOGhhGONUXiQ1pZgCfKX
 ZQWg==
X-Gm-Message-State: AOAM530d6RmFy9FOiYUzv/pnL3goSZagv2mZk8D4VQZbEjuGLFFhYNK9
 nYjyi4aQ7GiuiEVFga4PfblYfWwSWf/WbKxjEZw=
X-Google-Smtp-Source: ABdhPJyB4uGcG1pAL9Py2J4L5er2++p3paIWHL1ibisrx11L1HvgxFIqHSB+515WhK/fRyLc7CZFc923Ofw6O/s3asM=
X-Received: by 2002:ac8:6651:: with SMTP id j17mr70702854qtp.176.1609726391048; 
 Sun, 03 Jan 2021 18:13:11 -0800 (PST)
MIME-Version: 1.0
References: <1609725945-13895-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1609725945-13895-1-git-send-email-tiantao6@hisilicon.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 4 Jan 2021 02:12:58 +0000
Message-ID: <CACPK8XdvL9yacNKkZ4Ut8b2m9jFrMv=Ri-8qn1DSu0547ZecGw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho): Switch to using the new API
 kobj_to_dev()
To: Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 4 Jan 2021 at 02:05, Tian Tao <tiantao6@hisilicon.com> wrote:
>
> fixed the following coccicheck:
> drivers/hwmon/aspeed-pwm-tacho.c:634:60-61: WARNING opportunity for
> kobj_to_dev()
> drivers/hwmon/aspeed-pwm-tacho.c:623:60-61: WARNING opportunity for
> kobj_to_dev()
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 3d8239f..3cb88d6 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -620,7 +620,7 @@ static ssize_t rpm_show(struct device *dev, struct device_attribute *attr,
>  static umode_t pwm_is_visible(struct kobject *kobj,
>                               struct attribute *a, int index)
>  {
> -       struct device *dev = container_of(kobj, struct device, kobj);
> +       struct device *dev = kobj_to_dev(kobj);
>         struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);
>
>         if (!priv->pwm_present[index])
> @@ -631,7 +631,7 @@ static umode_t pwm_is_visible(struct kobject *kobj,
>  static umode_t fan_dev_is_visible(struct kobject *kobj,
>                                   struct attribute *a, int index)
>  {
> -       struct device *dev = container_of(kobj, struct device, kobj);
> +       struct device *dev = kobj_to_dev(kobj);
>         struct aspeed_pwm_tacho_data *priv = dev_get_drvdata(dev);
>
>         if (!priv->fan_tach_present[index])
> --
> 2.7.4
>
