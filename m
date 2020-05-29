Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A731F28ED
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 02:03:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gr1K0PL4zDqSk
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jun 2020 10:03:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.193;
 helo=mail-lj1-f193.google.com; envelope-from=jhovold@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YL7j13lxzDqd2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 29 May 2020 20:16:16 +1000 (AEST)
Received: by mail-lj1-f193.google.com with SMTP id q2so1894153ljm.10
 for <linux-aspeed@lists.ozlabs.org>; Fri, 29 May 2020 03:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qb23YrFge2bev6B+pdY5MYpRbBAt1YLbxMOSUywPdHk=;
 b=RRd74+4byysJ011zGRxPjYgs7+YO96AnU1hOvQd+vUE3/ycUmwNaGhnFRjutB/tPJB
 OP0PWVJaZ0Ve8LLZzqlLV6fxBPFb9RTV+kvY/9x+g6E5itdTwu5RiISIMKY3QWsFaRrB
 lyeY8NmSbz0X0Pm6gXrw0xx+gf6eZ7NJDg+DacTPOalA70IA1sHwBphfgd4qh9FhJXDa
 85C2r9kEHgcZf5ZDd/f5dLhJLtYyoYJWzP/Be9LSyLFm5Cxa7mU02UjAQ3ABo28j50ZT
 w82VlVAxyM0KeEIPopvG8yy97JQY8ZK1SKYvjkGl1HZumfcPYsKJDT9NwS7y4adItWqp
 IjwA==
X-Gm-Message-State: AOAM530vbthDafoitfv71wp/cSzGJHfGeEpWGQzoZVlolEC6PTpwei9Z
 68VESzCuEW6DCTW25LUh9J0=
X-Google-Smtp-Source: ABdhPJyb49lJcndlDqUtkrSajYOpqC0lpLBM00Du0tW1RABChW4sreguvSnQJV4+HR28+sDilaHYIw==
X-Received: by 2002:a05:651c:39b:: with SMTP id
 e27mr3886282ljp.253.1590747373144; 
 Fri, 29 May 2020 03:16:13 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id h26sm2236339lja.0.2020.05.29.03.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 03:16:12 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1jec3c-0004TR-D6; Fri, 29 May 2020 12:16:08 +0200
Date: Fri, 29 May 2020 12:16:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: Re: [PATCH 4/5] iio: light: lm3533-als: remove explicit parent
 assignment
Message-ID: <20200529101608.GC19480@localhost>
References: <20200522082208.383631-1-alexandru.ardelean@analog.com>
 <20200522082208.383631-4-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522082208.383631-4-alexandru.ardelean@analog.com>
X-Mailman-Approved-At: Tue, 09 Jun 2020 09:41:37 +1000
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
Cc: milo.kim@ti.com, tomislav.denis@avl.com, dan@dlrobertson.com,
 heiko@sntech.de, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linus.walleij@linaro.org, platform-driver-x86@vger.kernel.org,
 paul@crapouillou.net, lorenzo.bianconi83@gmail.com, songqiang1304521@gmail.com,
 srinivas.pandruvada@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 khilman@baylibre.com, tduszyns@gmail.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, wens@csie.org, kgene@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, agross@kernel.org,
 linux-input@vger.kernel.org, orsonzhai@gmail.com, alexandre.torgue@st.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, jikos@kernel.org, vilhelm.gray@gmail.com,
 mripard@kernel.org, vz@mleia.com, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, ak@it-klinger.de, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, fabrice.gasnier@st.com,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com, rmfrfs@gmail.com,
 shawnguo@kernel.org, dmitry.torokhov@gmail.com, coproscefalo@gmail.com,
 linux-kernel@vger.kernel.org, rjui@broadcom.com, slemieux.tyco@gmail.com,
 bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com, zhang.lyra@gmail.com,
 baolin.wang7@gmail.com, ktsai@capellamicro.com, syednwaris@gmail.com,
 peda@axentia.se, jic23@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, May 22, 2020 at 11:22:07AM +0300, Alexandru Ardelean wrote:
> This assignment is the more peculiar of the bunch as it assigns the parent
> of the platform-device's device (i.e. pdev->dev.parent) as the IIO device's
> parent.
>
> It's unclear whether this is intentional or not.
> Hence it is in it's own patch.

Yeah, we have a few mfd drivers whose child drivers registers their
class devices directly under the parent mfd device rather than the
corresponding child platform device.

Since it's done consistently I think you need to update them all if you
really want to change this. 

And it may not be worth it since at least in theory someone could now be
relying on this topology.

> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/iio/light/lm3533-als.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
> index bc196c212881..0f380ec8d30c 100644
> --- a/drivers/iio/light/lm3533-als.c
> +++ b/drivers/iio/light/lm3533-als.c
> @@ -852,7 +852,6 @@ static int lm3533_als_probe(struct platform_device *pdev)
>  	indio_dev->channels = lm3533_als_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(lm3533_als_channels);
>  	indio_dev->name = dev_name(&pdev->dev);
> -	indio_dev->dev.parent = pdev->dev.parent;
>  	indio_dev->modes = INDIO_DIRECT_MODE;
>  
>  	als = iio_priv(indio_dev);

Johan
