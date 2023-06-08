Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D04072767A
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 07:01:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcBrB723Pz3cM3
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Jun 2023 15:01:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dOUSITiX;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dOUSITiX;
	dkim-atps=neutral
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcBr51jZnz3cM3
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Jun 2023 15:01:09 +1000 (AEST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-19fa4346498so175215fac.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Jun 2023 22:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686200466; x=1688792466;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLZi1CYZuu2VgWmDxEUsvma/BxogAGe1aTFKnySv72E=;
        b=dOUSITiXhrAW9w7lSMWSXYnbmhE+9Z0knBBzF0jANYpU53hS8y5kkq7a45iO9XH/Rq
         kNVUgy68lnLDFFuUheOcD6oOYY30Wx6nQoV7YdnSBBmUu/8c4M50k/wl9hkPRNirnMoK
         l3yTCP4bsiVNxXKqUlml3WdqaJZdA6RcBo5OxzCmshedd5Nrs7puGV33tJHZb0sVplau
         SBOY5YFFKd4Gd2tKX/xdQITCDYAD8J8nrVF0UsjYuenPvRs3LCKMGYMUNTY4A3+LgvC+
         k0MJKLS/tnmWNixZNtPtYQuPyVtBVALDdOyCZnSAOA7rrY41c4hI++u+X3atqYaLkkPn
         jQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686200466; x=1688792466;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tLZi1CYZuu2VgWmDxEUsvma/BxogAGe1aTFKnySv72E=;
        b=dCG8M1JZRsoMrGuQARs5TwznLTQNV1rYhvbaaoNcI6l5Hp8tCD5dnyTEz/u0Z6VGFB
         aFp9RGeRBpksNvhJWrqJ3XNBiHH9svZuM/nE3nNdefhIAHK+gJMC6PwWvZemkHqSAfch
         nsdF2oM8Yy1FKeslWV2F6DpKahcGjMyHhrLfXtc9Q+g9AcZ3OTSIn6gCCrIC0O0rAeq7
         oyZMytkrv0/UcL6Pw8No3tNu7DZj6drDDNej+qvT3SMdAUCU+Z1CnXN+kg7uo4/IGsPn
         Uc2d0r87Cn15LDtlhneoGgsLqRuU6SDAFRxSWU6lrBaBFkF03HG43z8v0HLz7ohzCu5I
         fgbw==
X-Gm-Message-State: AC+VfDzg5Lv8SkqNEttkJvZJmVNdU45pCSoE3vWfeKZBLrI2Brc0S2G4
	HMa7mtaiFA2uRRzTv6BoESM=
X-Google-Smtp-Source: ACHHUZ7mOcP3G0nBPWzh/Jfi432lHgdOvWOndI4O4UpB/qIDWOZuktIrrdDifh6RacP8a7iD0OyxsA==
X-Received: by 2002:a05:6870:e6d0:b0:19e:8883:b0ea with SMTP id s16-20020a056870e6d000b0019e8883b0eamr4828686oak.6.1686200465789;
        Wed, 07 Jun 2023 22:01:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s23-20020a170902b19700b001afd275e186sm360625plr.286.2023.06.07.22.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 22:01:05 -0700 (PDT)
Message-ID: <8d889c6c-b0fb-0a1f-9441-3d983c1a3923@roeck-us.net>
Date: Wed, 7 Jun 2023 22:01:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au,
 andrew@aj.id.au, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 corbet@lwn.net, p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org, patrick@stwcx.xyz
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-5-billy_tsai@aspeedtech.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [v6 4/4] hwmon: Add Aspeed ast2600 TACH support
In-Reply-To: <20230608021839.12769-5-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 6/7/23 19:18, Billy Tsai wrote:
> Add the support of Tachometer which can use to monitor the frequency of
> the input. In Aspeed AST2600 SoC features 16 TACH controllers, with each
> controller capable of supporting up to 1 input.
> 

You mean there will be 16 instances of this driver ? That is weird,
confusing, and warrants a detailed explanation.

> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   Documentation/hwmon/index.rst               |   1 +
>   Documentation/hwmon/tach-aspeed-ast2600.rst |  25 ++
>   drivers/hwmon/Kconfig                       |  10 +
>   drivers/hwmon/Makefile                      |   1 +
>   drivers/hwmon/tach-aspeed-ast2600.c         | 305 ++++++++++++++++++++
>   5 files changed, 342 insertions(+)
>   create mode 100644 Documentation/hwmon/tach-aspeed-ast2600.rst
>   create mode 100644 drivers/hwmon/tach-aspeed-ast2600.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index ddff3c5713d7..4c3dd74675ef 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -194,6 +194,7 @@ Hardware Monitoring Kernel Drivers
>      sparx5-temp
>      stpddc60
>      sy7636a-hwmon
> +   tach-aspeed-ast2600
>      tc654
>      tc74
>      thmc50
> diff --git a/Documentation/hwmon/tach-aspeed-ast2600.rst b/Documentation/hwmon/tach-aspeed-ast2600.rst
> new file mode 100644
> index 000000000000..b08c73a4237f
> --- /dev/null
> +++ b/Documentation/hwmon/tach-aspeed-ast2600.rst
> @@ -0,0 +1,25 @@
> +Kernel driver tach-aspeed-ast2600
> +=================================
> +
> +Supported chips:
> +	ASPEED AST2600
> +
> +Authors:
> +	<billy_tsai@aspeedtech.com>
> +
> +Description:
> +------------
> +This driver implements support for ASPEED AST2600 Fan Tacho controller.
> +The controller supports up to 1 tachometer inputs.
> +
> +The driver provides the following sensor accesses in sysfs:
> +
> +=============== ======= ======================================================
> +fanX_input	ro	provide current fan rotation value in RPM as reported
> +			by the fan to the device.
> +fanX_div	rw	Fan divisor: Supported value are power of 4 (1, 4, 16
> +                        64, ... 4194304)
> +                        The larger divisor, the less rpm accuracy and the less
> +                        affected by fan signal glitch.
> +fanX_pulses	rw      Fan pulses per resolution.

Presumably, as implemented, that would be 16 instances, each with fan1_{input,div}.

> +=============== ======= ======================================================
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index a5253abb7ea7..5948a63e44e7 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -411,6 +411,16 @@ config SENSORS_ASPEED
>   	  This driver can also be built as a module. If so, the module
>   	  will be called aspeed_pwm_tacho.
>   
> +config SENSORS_TACH_ASPEED_AST2600
> +	tristate "ASPEED ast2600 Tachometer support"
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on HAVE_CLK && HAS_IOMEM
> +	help
> +	  This driver provides support for Aspeed ast2600 Tachometer.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called tach-aspeed-ast2600.
> +
>   config SENSORS_ATXP1
>   	tristate "Attansic ATXP1 VID controller"
>   	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index c5cd7e3a67ff..a3bf5b438e0f 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -53,6 +53,7 @@ obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
>   obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
>   obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
>   obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
> +obj-$(CONFIG_SENSORS_TACH_ASPEED_AST2600) += tach-aspeed-ast2600.o
>   obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
>   obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
>   obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
> diff --git a/drivers/hwmon/tach-aspeed-ast2600.c b/drivers/hwmon/tach-aspeed-ast2600.c
> new file mode 100644
> index 000000000000..8be66ee25a31
> --- /dev/null
> +++ b/drivers/hwmon/tach-aspeed-ast2600.c
> @@ -0,0 +1,305 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) ASPEED Technology Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/hwmon.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/sysfs.h>
> +
> +/* TACH Control Register */
> +#define TACH_ASPEED_CTRL		(0x00)
> +#define TACH_ASPEED_IER			BIT(31)
> +#define TACH_ASPEED_INVERS_LIMIT	BIT(30)
> +#define TACH_ASPEED_LOOPBACK		BIT(29)
> +#define TACH_ASPEED_ENABLE		BIT(28)
> +#define TACH_ASPEED_DEBOUNCE_MASK	GENMASK(27, 26)
> +#define TACH_ASPEED_DEBOUNCE_BIT	26
> +#define TACH_ASPEED_IO_EDGE_MASK	GENMASK(25, 24)
> +#define TACH_ASPEED_IO_EDGE_BIT		24
> +#define TACH_ASPEED_CLK_DIV_T_MASK	GENMASK(23, 20)
> +#define TACH_ASPEED_CLK_DIV_BIT		20
> +#define TACH_ASPEED_THRESHOLD_MASK	GENMASK(19, 0)
> +/* [27:26] */
> +#define DEBOUNCE_3_CLK			0x00
> +#define DEBOUNCE_2_CLK			0x01
> +#define DEBOUNCE_1_CLK			0x02
> +#define DEBOUNCE_0_CLK			0x03
> +/* [25:24] */
> +#define F2F_EDGES			0x00
> +#define R2R_EDGES			0x01
> +#define BOTH_EDGES			0x02
> +/* [23:20] */
> +/* divisor = 4 to the nth power, n = register value */
> +#define DEFAULT_TACH_DIV		1024
> +#define DIV_TO_REG(divisor)		(ilog2(divisor) >> 1)
> +
> +/* TACH Status Register */
> +#define TACH_ASPEED_STS			(0x04)

Unnecesarry ()

> +
> +/*PWM_TACH_STS */
> +#define TACH_ASPEED_ISR			BIT(31)
> +#define TACH_ASPEED_PWM_OUT		BIT(25)
> +#define TACH_ASPEED_PWM_OEN		BIT(24)
> +#define TACH_ASPEED_DEB_INPUT		BIT(23)
> +#define TACH_ASPEED_RAW_INPUT		BIT(22)
> +#define TACH_ASPEED_VALUE_UPDATE	BIT(21)
> +#define TACH_ASPEED_FULL_MEASUREMENT	BIT(20)
> +#define TACH_ASPEED_VALUE_MASK		GENMASK(19, 0)
> +/**********************************************************
> + * Software setting
> + *********************************************************/
> +#define DEFAULT_FAN_PULSE_PR		2
> +
> +struct aspeed_tach_channel_params {
> +	u8 pulse_pr;
> +	u32 divisor;
> +};
> +
> +struct aspeed_tach_data {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct clk *clk;
> +	struct reset_control *reset;
> +	bool tach_present;
> +	struct aspeed_tach_channel_params tach_channel;

Assuming that all channels have the same divisor, this structure
is really unnecessary (especially since pulse_pr should be dropped -
see below).

> +	unsigned long clk_source;
> +};
> +
> +static void aspeed_tach_ch_enable(struct aspeed_tach_data *priv, bool enable)
> +{
> +	if (enable)
> +		writel(readl(priv->base + TACH_ASPEED_CTRL) |
> +			       (TACH_ASPEED_ENABLE),
> +		       priv->base + TACH_ASPEED_CTRL);
> +	else
> +		writel(readl(priv->base + TACH_ASPEED_CTRL) &
> +			       ~(TACH_ASPEED_ENABLE),

Unnecessary () around TACH_ASPEED_ENABLE.

> +		       priv->base + TACH_ASPEED_CTRL);
> +}
> +
> +static u64 aspeed_tach_val_to_rpm(struct aspeed_tach_data *priv, u32 tach_val)
> +{
> +	u64 rpm;
> +	u32 tach_div;
> +
> +	tach_div = tach_val * (priv->tach_channel.divisor) *
> +		   (priv->tach.channel.pulse_pr);
> +

Unnecessary () around priv->tach_channel.pulse_pr and priv->tach_channel.divisor.
I am not going to look further for those. Please make sure you drop them all.

> +	dev_dbg(priv->dev, "clk %ld, tach_val %d , tach_div %d\n",
> +		priv->clk_source, tach_val, tach_div);
> +
> +	rpm = (u64)priv->clk_source * 60;
> +	do_div(rpm, tach_div);
> +
> +	return rpm;

This function should really return an integer.

> +}
> +
> +static int aspeed_get_fan_tach_ch_rpm(struct aspeed_tach_data *priv)
> +{
> +	u32 val;
> +	u64 rpm;
> +
> +	val = readl(priv->base + TACH_ASPEED_STS);
> +
> +	if (!(val & TACH_ASPEED_FULL_MEASUREMENT))
> +		return 0;
> +	rpm = aspeed_tach_val_to_rpm(priv, val & TACH_ASPEED_VALUE_MASK);
> +
> +	return rpm;

The 'rpm' variable is unnecessary.

> +}
> +
> +static int aspeed_tach_hwmon_read(struct device *dev,
> +				  enum hwmon_sensor_types type, u32 attr,
> +				  int channel, long *val)
> +{
> +	struct aspeed_tach_data *priv = dev_get_drvdata(dev);
> +	u32 reg_val;
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		ret = aspeed_get_fan_tach_ch_rpm(priv);
> +		if (ret < 0)
> +			return ret;

Why ? The called code never returns a negative value.

> +		*val = ret;
> +		break;
> +	case hwmon_fan_div:
> +		reg_val = readl(priv->base + TACH_ASPEED_CTRL);
> +		reg_val = FIELD_GET(TACH_ASPEED_CLK_DIV_T_MASK, reg_val);
> +		*val = BIT(reg_val << 1);
> +		break;
> +	case hwmon_fan_pulses:
> +		*val = priv->tach_channel.pulse_pr;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +	return 0;
> +}
> +
> +static int aspeed_tach_hwmon_write(struct device *dev,
> +				   enum hwmon_sensor_types type, u32 attr,
> +				   int channel, long val)
> +{
> +	struct aspeed_tach_data *priv = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_fan_div:
> +		if (!is_power_of_2(val) || (ilog2(val) % 2))
> +			return -EINVAL;
> +		else if (DIV_TO_REG(val) > 0xb)

Else after return is unnecessary

> +			return -ERANGE;

Math result not representable ? Not really.

> +		priv->tach_channel.divisor = val;
> +		writel((readl(priv->base + TACH_ASPEED_CTRL) &
> +			~(TACH_ASPEED_CLK_DIV_T_MASK)) |

Unnecessary () around TACH_ASPEED_CLK_DIV_T_MASK.

> +			       (DIV_TO_REG(priv->tach_channel.divisor)
> +				<< TACH_ASPEED_CLK_DIV_BIT),
> +		       priv->base + TACH_ASPEED_CTRL);
> +		break;
> +	case hwmon_fan_pulses:
> +		priv->tach_channel.pulse_pr = val;


The ABI says for the pulses atribute:

                 Should only be created if the chip has a register to configure
                 the number of pulses. In the absence of such a register (and
                 thus attribute) the value assumed by all devices is 2 pulses
                 per fan revolution.

I see no evidence that there is a chip register for the number of pulses.
Please drop this attribute.

> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static umode_t aspeed_tach_dev_is_visible(const void *drvdata,
> +					  enum hwmon_sensor_types type,
> +					  u32 attr, int channel)
> +{
> +	const struct aspeed_tach_data *priv = drvdata;
> +
> +	if (!priv->tach_present)
> +		return 0;

What is the point of instantiating the driver in this case ?

> +	switch (attr) {
> +	case hwmon_fan_input:
> +		return 0444;
> +	case hwmon_fan_div:
> +	case hwmon_fan_pulses:
> +		return 0644;
> +	}
> +	return 0;
> +}
> +
> +static const struct hwmon_ops aspeed_tach_ops = {
> +	.is_visible = aspeed_tach_dev_is_visible,
> +	.read = aspeed_tach_hwmon_read,
> +	.write = aspeed_tach_hwmon_write,
> +};
> +
> +static const struct hwmon_channel_info *aspeed_tach_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_PULSES),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info aspeed_tach_chip_info = {
> +	.ops = &aspeed_tach_ops,
> +	.info = aspeed_tach_info,
> +};
> +
> +static void aspeed_present_fan_tach(struct aspeed_tach_data *priv)
> +{
> +	priv->tach_present = true;
> +	priv->tach_channel.divisor = DEFAULT_TACH_DIV;
> +	priv->tach_channel.pulse_pr = DEFAULT_FAN_PULSE_PR;
> +
> +	writel((readl(priv->base + TACH_ASPEED_CTRL) &
> +		~(TACH_ASPEED_INVERS_LIMIT | TACH_ASPEED_DEBOUNCE_MASK |
> +		  TACH_ASPEED_IO_EDGE_MASK | TACH_ASPEED_CLK_DIV_T_MASK |
> +		  TACH_ASPEED_THRESHOLD_MASK)) |
> +		       ((DEBOUNCE_3_CLK << TACH_ASPEED_DEBOUNCE_BIT) |
> +			F2F_EDGES |
> +			(DIV_TO_REG(priv->tach_channel.divisor)
> +			 << TACH_ASPEED_CLK_DIV_BIT)),
> +	       priv->base + TACH_ASPEED_CTRL);
> +
> +	aspeed_tach_ch_enable(priv, true);
> +}
> +
> +static void aspeed_tach_reset_assert(void *data)
> +{
> +	struct reset_control *rst = data;
> +
> +	reset_control_assert(rst);
> +}
> +
> +static int aspeed_tach_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct aspeed_tach_data *priv;
> +	struct device *hwmon;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->dev = &pdev->dev;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +	priv->clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk),
> +				     "Couldn't get clock\n");
> +
> +	priv->clk_source = clk_get_rate(priv->clk);
> +	priv->reset = devm_reset_control_get_shared(dev, NULL);
> +	if (IS_ERR(priv->reset))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset),
> +				     "Couldn't get reset control\n");
> +
> +	ret = reset_control_deassert(priv->reset);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Couldn't deassert reset control\n");
> +
> +	ret = devm_add_action_or_reset(dev, aspeed_tach_reset_assert,
> +				       priv->reset);
> +	if (ret)
> +		return ret;
> +
> +	aspeed_present_fan_tach(priv);
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "aspeed_tach", priv,
> +						     &aspeed_tach_chip_info, NULL);
> +	ret = PTR_ERR_OR_ZERO(hwmon);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register hwmon device\n");
> +	return 0;
> +}
> +
> +static const struct of_device_id of_stach_match_table[] = {
> +	{
> +		.compatible = "aspeed,ast2600-tach",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_stach_match_table);
> +
> +static struct platform_driver aspeed_tach_driver = {
> +	.probe		= aspeed_tach_probe,
> +	.driver		= {
> +		.name	= "aspeed_tach",
> +		.of_match_table = of_stach_match_table,
> +	},
> +};
> +
> +module_platform_driver(aspeed_tach_driver);
> +
> +MODULE_AUTHOR("Billy Tsai <billy_tsai@aspeedtech.com>");
> +MODULE_DESCRIPTION("Aspeed ast2600 TACH device driver");
> +MODULE_LICENSE("GPL");

