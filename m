Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0B45E36A
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 00:35:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Z4M502Bz3bmr
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Nov 2021 10:35:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=185.176.79.56;
 helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1155 seconds by postgrey-1.36 at boromir;
 Thu, 25 Nov 2021 02:40:39 AEDT
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzlZv70w5z2yNY;
 Thu, 25 Nov 2021 02:40:37 +1100 (AEDT)
Received: from fraeml739-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Hzl7x66WJz67x9G;
 Wed, 24 Nov 2021 23:20:45 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml739-chm.china.huawei.com (10.206.15.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 24 Nov 2021 16:21:16 +0100
Received: from localhost (10.52.122.252) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 24 Nov
 2021 15:21:14 +0000
Date: Wed, 24 Nov 2021 15:21:12 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 08/17] iio: humidity: hts221: Use bitfield helpers
Message-ID: <20211124152112.000078bf@Huawei.com>
In-Reply-To: <c906f7449c0210cefba53eab2c2d87105d5c8599.1637592133.git.geert+renesas@glider.be>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <c906f7449c0210cefba53eab2c2d87105d5c8599.1637592133.git.geert+renesas@glider.be>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.122.252]
X-ClientProxiedBy: lhreml733-chm.china.huawei.com (10.201.108.84) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 26 Nov 2021 10:35:12 +1100
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-clk@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Lorenzo
 Bianconi <lorenzo.bianconi83@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Eduardo Valentin <edubezval@gmail.com>,
 Paul Walmsley <paul@pwsan.com>, Rajendra Nayak <rnayak@codeaurora.org>,
 Tero Kristo <kristo@kernel.org>, Keerthy <j-keerthy@ti.com>,
 linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Jonathan
 Cameron <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 22 Nov 2021 16:54:01 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Use the field_prep() helper, instead of open-coding the same operation.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Hi Geert,

If this should got forwards, looks like a nice cleanup for the two IIO
ones, so I'll be happy to pick them up once infrastructure in place
(ideally have the infrastructure an immutable branch to save having
to revisit in 3+ months time!)

Jonathan

> ---
> Compile-tested only.
> Marked RFC, as this depends on [PATCH 01/17], but follows a different
> path to upstream.
> ---
>  drivers/iio/humidity/hts221_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
> index 6a39615b696114cd..749aedc469ede5c1 100644
> --- a/drivers/iio/humidity/hts221_core.c
> +++ b/drivers/iio/humidity/hts221_core.c
> @@ -7,6 +7,7 @@
>   * Lorenzo Bianconi <lorenzo.bianconi@st.com>
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/device.h>
> @@ -171,7 +172,7 @@ static int hts221_update_avg(struct hts221_hw *hw,
>  			     u16 val)
>  {
>  	const struct hts221_avg *avg = &hts221_avg_list[type];
> -	int i, err, data;
> +	int i, err;
>  
>  	for (i = 0; i < HTS221_AVG_DEPTH; i++)
>  		if (avg->avg_avl[i] == val)
> @@ -180,9 +181,8 @@ static int hts221_update_avg(struct hts221_hw *hw,
>  	if (i == HTS221_AVG_DEPTH)
>  		return -EINVAL;
>  
> -	data = ((i << __ffs(avg->mask)) & avg->mask);
> -	err = regmap_update_bits(hw->regmap, avg->addr,
> -				 avg->mask, data);
> +	err = regmap_update_bits(hw->regmap, avg->addr, avg->mask,
> +				 field_prep(avg->mask, i));
>  	if (err < 0)
>  		return err;
>  

