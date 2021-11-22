Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA2A4596A8
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Nov 2021 22:29:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HygPq0Pd5z2xTC
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Nov 2021 08:29:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 130 seconds by postgrey-1.36 at boromir;
 Tue, 23 Nov 2021 04:52:46 AEDT
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyZcG3JQ9z2yLv;
 Tue, 23 Nov 2021 04:52:45 +1100 (AEDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2884840004;
 Mon, 22 Nov 2021 17:52:36 +0000 (UTC)
Date: Mon, 22 Nov 2021 18:52:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 13/17] pinctl: ti: iodelay: Use bitfield helpers
Message-ID: <YZvY4/FCgYMBMeDJ@piout.net>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <60257a3c5b567fb5b14d6f9adb770899bce88f7a.1637592133.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60257a3c5b567fb5b14d6f9adb770899bce88f7a.1637592133.git.geert+renesas@glider.be>
X-Mailman-Approved-At: Tue, 23 Nov 2021 08:28:20 +1100
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, alsa-devel@alsa-project.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-clk@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux-omap@vger.kernel.org,
 Benoit Parrot <bparrot@ti.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Eduardo Valentin <edubezval@gmail.com>,
 Paul Walmsley <paul@pwsan.com>, Rajendra Nayak <rnayak@codeaurora.org>,
 Tero Kristo <kristo@kernel.org>, Keerthy <j-keerthy@ti.com>,
 linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Geert,

There is a typo in pinctrl in the subject

On 22/11/2021 16:54:06+0100, Geert Uytterhoeven wrote:
> Use the field_{get,prep}() helpers, instead of defining a custom
> function, or open-coding the same operations.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> Marked RFC, as this depends on [PATCH 01/17], but follows a different
> path to upstream.
> ---
>  drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 35 +++++++------------------
>  1 file changed, 10 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> index 4e2382778d38f557..b220dcd9215520db 100644
> --- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> +++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> @@ -9,6 +9,7 @@
>   * warranty of any kind, whether express or implied.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> @@ -155,18 +156,6 @@ struct ti_iodelay_device {
>  	struct ti_iodelay_reg_values reg_init_conf_values;
>  };
>  
> -/**
> - * ti_iodelay_extract() - extract bits for a field
> - * @val: Register value
> - * @mask: Mask
> - *
> - * Return: extracted value which is appropriately shifted
> - */
> -static inline u32 ti_iodelay_extract(u32 val, u32 mask)
> -{
> -	return (val & mask) >> __ffs(mask);
> -}
> -
>  /**
>   * ti_iodelay_compute_dpe() - Compute equation for delay parameter
>   * @period: Period to use
> @@ -233,10 +222,10 @@ static int ti_iodelay_pinconf_set(struct ti_iodelay_device *iod,
>  	}
>  
>  	reg_mask = reg->signature_mask;
> -	reg_val = reg->signature_value << __ffs(reg->signature_mask);
> +	reg_val = field_prep(reg->signature_mask, reg->signature_value);
>  
>  	reg_mask |= reg->binary_data_coarse_mask;
> -	tmp_val = c_elements << __ffs(reg->binary_data_coarse_mask);
> +	tmp_val = field_prep(reg->binary_data_coarse_mask, c_elements);
>  	if (tmp_val & ~reg->binary_data_coarse_mask) {
>  		dev_err(dev, "Masking overflow of coarse elements %08x\n",
>  			tmp_val);
> @@ -245,7 +234,7 @@ static int ti_iodelay_pinconf_set(struct ti_iodelay_device *iod,
>  	reg_val |= tmp_val;
>  
>  	reg_mask |= reg->binary_data_fine_mask;
> -	tmp_val = f_elements << __ffs(reg->binary_data_fine_mask);
> +	tmp_val = field_prep(reg->binary_data_fine_mask, f_elements);
>  	if (tmp_val & ~reg->binary_data_fine_mask) {
>  		dev_err(dev, "Masking overflow of fine elements %08x\n",
>  			tmp_val);
> @@ -260,7 +249,7 @@ static int ti_iodelay_pinconf_set(struct ti_iodelay_device *iod,
>  	 * impacting iodelay configuration. Use with care!
>  	 */
>  	reg_mask |= reg->lock_mask;
> -	reg_val |= reg->unlock_val << __ffs(reg->lock_mask);
> +	reg_val |= field_prep(reg->lock_mask, reg->unlock_val);
>  	r = regmap_update_bits(iod->regmap, cfg->offset, reg_mask, reg_val);
>  
>  	dev_dbg(dev, "Set reg 0x%x Delay(a: %d g: %d), Elements(C=%d F=%d)0x%x\n",
> @@ -296,16 +285,14 @@ static int ti_iodelay_pinconf_init_dev(struct ti_iodelay_device *iod)
>  	r = regmap_read(iod->regmap, reg->reg_refclk_offset, &val);
>  	if (r)
>  		return r;
> -	ival->ref_clk_period = ti_iodelay_extract(val, reg->refclk_period_mask);
> +	ival->ref_clk_period = field_get(reg->refclk_period_mask, val);
>  	dev_dbg(dev, "refclk_period=0x%04x\n", ival->ref_clk_period);
>  
>  	r = regmap_read(iod->regmap, reg->reg_coarse_offset, &val);
>  	if (r)
>  		return r;
> -	ival->coarse_ref_count =
> -	    ti_iodelay_extract(val, reg->coarse_ref_count_mask);
> -	ival->coarse_delay_count =
> -	    ti_iodelay_extract(val, reg->coarse_delay_count_mask);
> +	ival->coarse_ref_count = field_get(reg->coarse_ref_count_mask, val);
> +	ival->coarse_delay_count = field_get(reg->coarse_delay_count_mask, val);
>  	if (!ival->coarse_delay_count) {
>  		dev_err(dev, "Invalid Coarse delay count (0) (reg=0x%08x)\n",
>  			val);
> @@ -326,10 +313,8 @@ static int ti_iodelay_pinconf_init_dev(struct ti_iodelay_device *iod)
>  	r = regmap_read(iod->regmap, reg->reg_fine_offset, &val);
>  	if (r)
>  		return r;
> -	ival->fine_ref_count =
> -	    ti_iodelay_extract(val, reg->fine_ref_count_mask);
> -	ival->fine_delay_count =
> -	    ti_iodelay_extract(val, reg->fine_delay_count_mask);
> +	ival->fine_ref_count = field_get(reg->fine_ref_count_mask, val);
> +	ival->fine_delay_count = field_get(reg->fine_delay_count_mask, val);
>  	if (!ival->fine_delay_count) {
>  		dev_err(dev, "Invalid Fine delay count (0) (reg=0x%08x)\n",
>  			val);
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
