Return-Path: <linux-aspeed+bounces-597-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F31A24104
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Jan 2025 17:48:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl1zr3nxLz30NN;
	Sat,  1 Feb 2025 03:48:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738342104;
	cv=none; b=dsw6EJ4W6N+KnhFuoqj+UX8lyP74s/vG1KTdd16rCNWr+5mJTKXHjOP5i/kc4OS+ZhI08Tl0FtvLaMXaUhqIZjt3VmNawa7T2szGSo+121Ug/vg4eRVOr1NcN7vJH3Pc1mSYVJF++o+9bCO/7IR9HOZBXhkYauMpNLHXOc2n01Fu/kz3Tk6dwpx+7k8qo5xLK6xMZTTffiGeqCh2B21uXFwmCqfY1wj5gS2PDT6Rdrj6Sso5BSimZ1UN82nXoeGTj0237gzbOJlTBxiUXP/QM9SL5BrTf7QpMQyW3MCbPFw31S4jYm3yqRqNCHzAZ07tqw6Zsjzw0mJRTYJuysrwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738342104; c=relaxed/relaxed;
	bh=zbZODgSfQ8dTNQ71PLU7lLra/naTkm614ENyg5PDJ0I=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N/2i+4nT02EB+UY7DufI9jZYhMPADSVqzG9ebBX7zGkJcc8kK24mEvOzQlDlJaVJxFBfKT95psWwuSz9mCbh03w9nTClwGF9fsC2T4d5uHSdNO/lBBDQU2oOKgpLMFJqmsGEohnI6Mz2XTnwEcBPt/bOmxjIpw/zCZ7F40QGSeWk7vrGMkbGGDGBfoH9G6MjI/pwdw4nXnbJiAuzX7FEnKI0jk+MeWNuAn937QFNvt04VS4fhvMw/U/Jh9opkBGN19SBgqiwKB3U1taKvdl8zB5PNueZw1ut6Rb8jnw/crG/ciAXOsWNYNHA6h1QdnwgRLmrEwtUpz/Jj3c54BSDCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 925 seconds by postgrey-1.37 at boromir; Sat, 01 Feb 2025 03:48:22 AEDT
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yl1zp6nw0z2yMh
	for <linux-aspeed@lists.ozlabs.org>; Sat,  1 Feb 2025 03:48:20 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Yl1bP1gXVz6D9H9;
	Sat,  1 Feb 2025 00:30:41 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C5C2D140155;
	Sat,  1 Feb 2025 00:32:49 +0800 (CST)
Received: from localhost (10.195.244.178) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 31 Jan
 2025 17:32:47 +0100
Date: Fri, 31 Jan 2025 16:32:46 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, "Bartosz
 Golaszewski" <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, Jonathan Cameron
	<jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang
	<ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Yury Norov
	<yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Johannes Berg"
	<johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, "Alex Elder"
	<elder@ieee.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <qat-linux@intel.com>,
	<linux-gpio@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-iio@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
Message-ID: <20250131163246.00000077@huawei.com>
In-Reply-To: <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
References: <cover.1738329458.git.geert+renesas@glider.be>
	<1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.244.178]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 31 Jan 2025 14:46:51 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant.
> 
> To avoid this limitation, the AT91 clock driver and several other
> drivers already have their own non-const field_{prep,get}() macros.
> Make them available for general use by consolidating them in
> <linux/bitfield.h>, and improve them slightly:
>   1. Avoid evaluating macro parameters more than once,
>   2. Replace "ffs() - 1" by "__ffs()",
>   3. Support 64-bit use on 32-bit architectures.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
For the IIO one.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
> v2:
>   - Cast val resp. reg to the mask type,
>   - Fix 64-bit use on 32-bit architectures,
>   - Convert new upstream users:
>       - drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c
>       - drivers/gpio/gpio-aspeed.c
>       - drivers/iio/temperature/mlx90614.c
>       - drivers/pinctrl/nuvoton/pinctrl-ma35.c
>       - sound/usb/mixer_quirks.c
>   - Convert new user queued in renesas-devel for v6.15:
>       - drivers/soc/renesas/rz-sysc.c
> ---
>  drivers/clk/at91/clk-peripheral.c             |  1 +
>  drivers/clk/at91/pmc.h                        |  3 --
>  .../qat/qat_common/adf_gen4_pm_debugfs.c      |  8 +----
>  drivers/gpio/gpio-aspeed.c                    |  5 +--
>  drivers/iio/temperature/mlx90614.c            |  5 +--
>  drivers/pinctrl/nuvoton/pinctrl-ma35.c        |  4 ---
>  drivers/soc/renesas/rz-sysc.c                 |  3 +-
>  include/linux/bitfield.h                      | 34 +++++++++++++++++++
>  sound/usb/mixer_quirks.c                      |  4 ---
>  9 files changed, 39 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
> index c173a44c800aa8cc..60208bdc3fe4797e 100644
> --- a/drivers/clk/at91/clk-peripheral.c
> +++ b/drivers/clk/at91/clk-peripheral.c
> @@ -3,6 +3,7 @@
>   *  Copyright (C) 2013 Boris BREZILLON <b.brezillon@overkiz.com>
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 4fb29ca111f7d427..3838e4f7df2d4a70 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -116,9 +116,6 @@ struct at91_clk_pms {
>  	unsigned int parent;
>  };
>  
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  #define ndck(a, s) (a[s - 1].id + 1)
>  #define nck(a) (a[ARRAY_SIZE(a) - 1].id + 1)
>  
> diff --git a/drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c b/drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c
> index 2e4095c4c12c94f9..ebaa59e934178309 100644
> --- a/drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c
> +++ b/drivers/crypto/intel/qat/qat_common/adf_gen4_pm_debugfs.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright(c) 2023 Intel Corporation */
> +#include <linux/bitfield.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/kernel.h>
>  #include <linux/string_helpers.h>
> @@ -11,13 +12,6 @@
>  #include "adf_gen4_pm.h"
>  #include "icp_qat_fw_init_admin.h"
>  
> -/*
> - * This is needed because a variable is used to index the mask at
> - * pm_scnprint_table(), making it not compile time constant, so the compile
> - * asserts from FIELD_GET() or u32_get_bits() won't be fulfilled.
> - */
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -
>  #define PM_INFO_MEMBER_OFF(member)	\
>  	(offsetof(struct icp_qat_fw_init_admin_pm_info, member) / sizeof(u32))
>  
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 40c1bd80f8b0434d..b45e4dd8d8e4f00a 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -5,6 +5,7 @@
>   * Joel Stanley <joel@jms.id.au>
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/gpio/aspeed.h>
>  #include <linux/gpio/driver.h>
> @@ -30,10 +31,6 @@
>  #include <linux/gpio/consumer.h>
>  #include "gpiolib.h"
>  
> -/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> -#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  #define GPIO_G7_IRQ_STS_BASE 0x100
>  #define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)
>  #define GPIO_G7_CTRL_REG_BASE 0x180
> diff --git a/drivers/iio/temperature/mlx90614.c b/drivers/iio/temperature/mlx90614.c
> index 740018d4b3dfb35e..c58dc59d4f570831 100644
> --- a/drivers/iio/temperature/mlx90614.c
> +++ b/drivers/iio/temperature/mlx90614.c
> @@ -22,6 +22,7 @@
>   * the "wakeup" GPIO is not given, power management will be disabled.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/gpio/consumer.h>
> @@ -68,10 +69,6 @@
>  #define MLX90614_CONST_SCALE 20 /* Scale in milliKelvin (0.02 * 1000) */
>  #define MLX90614_CONST_FIR 0x7 /* Fixed value for FIR part of low pass filter */
>  
> -/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> -#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  struct mlx_chip_info {
>  	/* EEPROM offsets with 16-bit data, MSB first */
>  	/* emissivity correction coefficient */
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> index 59c4e7c6cddea127..3ba28faa8e1418a9 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> @@ -81,10 +81,6 @@
>  #define MVOLT_1800			0
>  #define MVOLT_3300			1
>  
> -/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> -#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  static const char * const gpio_group_name[] = {
>  	"gpioa", "gpiob", "gpioc", "gpiod", "gpioe", "gpiof", "gpiog",
>  	"gpioh", "gpioi", "gpioj", "gpiok", "gpiol", "gpiom", "gpion",
> diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
> index 1c98da37b7d18745..917a029d849585cd 100644
> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2024 Renesas Electronics Corp.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -12,8 +13,6 @@
>  
>  #include "rz-sysc.h"
>  
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -
>  /**
>   * struct rz_sysc - RZ SYSC private data structure
>   * @base: SYSC base address
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f1732230700..c62324a9fcc81241 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -203,4 +203,38 @@ __MAKE_OP(64)
>  #undef __MAKE_OP
>  #undef ____MAKE_OP
>  
> +/**
> + * field_prep() - prepare a bitfield element
> + * @_mask: shifted mask defining the field's length and position
> + * @_val:  value to put in the field
> + *
> + * field_prep() masks and shifts up the value.  The result should be
> + * combined with other fields of the bitfield using logical OR.
> + * Unlike FIELD_PREP(), @_mask is not limited to a compile-time constant.
> + */
> +#define field_prep(_mask, _val)						\
> +	({								\
> +		typeof(_mask) __mask = (_mask);				\
> +		unsigned int __shift = sizeof(_mask) <= 4 ?		\
> +				       __ffs(__mask) : __ffs64(__mask);	\
> +		(((typeof(_mask))(_val) << __shift) & (__mask));	\
> +	})
> +
> +/**
> + * field_get() - extract a bitfield element
> + * @_mask: shifted mask defining the field's length and position
> + * @_reg:  value of entire bitfield
> + *
> + * field_get() extracts the field specified by @_mask from the
> + * bitfield passed in as @_reg by masking and shifting it down.
> + * Unlike FIELD_GET(), @_mask is not limited to a compile-time constant.
> + */
> +#define field_get(_mask, _reg)						\
> +	({								\
> +		typeof(_mask) __mask = _mask;				\
> +		unsigned int __shift = sizeof(_mask) <= 4 ?		\
> +				       __ffs(__mask) : __ffs64(__mask);	\
> +		(typeof(_mask))(((_reg) & (__mask)) >> __shift);	\
> +	})
> +
>  #endif
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 23fcd680167d0298..00ab811e4b11a573 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -3109,10 +3109,6 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
>  #define RME_DIGIFACE_REGISTER(reg, mask) (((reg) << 16) | (mask))
>  #define RME_DIGIFACE_INVERT BIT(31)
>  
> -/* Nonconst helpers */
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  static int snd_rme_digiface_write_reg(struct snd_kcontrol *kcontrol, int item, u16 mask, u16 val)
>  {
>  	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);


