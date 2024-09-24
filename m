Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A40CC983AF3
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 03:39:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCMwQ1ZDMz2yVv
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Sep 2024 11:39:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727141956;
	cv=none; b=lMudz0rp1z/T+RyHSsPzpRY9Q0aLOk5WOSxSYxjPsCzUoppdTkb8QRjUasCwo6IDVLPEX32sw535poMtGup4PFvcVQGd/BmDU0PYlUC3JPVX0/uOAP3iNq5yYuJOWp520dZNVZncM89uvIUKQjx7EgBG87OiSh98tpAIMTpG3pIyO3BRn/3+0nBlqoqlMG0fwK6Wi9MxLtVvTRhQAVDb4UJXsqwzf9jX607neojRE5J9tNAbjQM6HB/LneJETGT6NcoIm5XHjdBY0QUkd8kps+L+WVHZ3klOPZphiOps2LtH0NhcuPOxUC/mPt7wcYxz5mYyBNTTjt/xs7gZWqEL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727141956; c=relaxed/relaxed;
	bh=bFM+1Drubnp3netrJw2gcQEIclelNL2Zh/zdkioY7cI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dUGedn2zJTdYR+/rzwVZwvC5Lc+9sYOGt9PJM6+AtnPClmf2L8NzPAcIsmxToTC4bqWorQUK7u5TcXJBpI+naofbmscLnQLvqKGwmFzzlFY+v3/1zqqYEWzmOG+gADuZLJ5lszSZzSrBu50rHJbpZkRBAHzsSW2zcmSDhc0b7T0kSt8F6oKEAifvqjC9kyZ5PqA6nJXbP4/tuYePsfVmJ2t51sk1XAc870lUxDx9nKiVZtraqmmNWL0pREi7qMFC9ki7eRBgfMrWc8S0irlVgvmLTrOOAE6hjenKOOEswPogwBKxBQUcPMnwbLMCIPRo4OlVccq55GNm7LQEcsJNhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dnp3D1Lg; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dnp3D1Lg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCMwM2JWyz2xm5
	for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Sep 2024 11:39:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727141951;
	bh=bFM+1Drubnp3netrJw2gcQEIclelNL2Zh/zdkioY7cI=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=dnp3D1LgSJCL3xFayUpH+FD5nPw/an1J51a8EbQNXjECROAPP1MsU3YtpkCPxNQRc
	 /2959bQ8J5OBQnG47fIeCcsX/3Trdy4ngdICuWKOG93HtxOgyrOvF2YApS6vfmR/fE
	 p/HJQfL13fTBXcsioDiJLV2Adg8I7UZnNsvAbtGkLdpuk1y9yMprEzSShRpDye12Rk
	 6T8zTO5G7fjzWKzH0siq+UvoNOBZ+6riAndEmDpRst8niPYehfBsF2dU8BBw2+LHeo
	 OgmG3i1wxS93V3CQGM62lMvH1YNyN2wQIomAocHpwPrALbUhjwJU8qxwO9rJRb6Gav
	 /VyMaHzG/QM/A==
Received: from [192.168.68.112] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A75566502A;
	Tue, 24 Sep 2024 09:39:09 +0800 (AWST)
Message-ID: <fe54dfef05d67a44a60eb497cdc052aeeed4a4d0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 4/6] gpio: aspeed: Support G7 Aspeed gpio controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Tue, 24 Sep 2024 11:09:09 +0930
In-Reply-To: <20240923100611.1597113-5-billy_tsai@aspeedtech.com>
References: <20240923100611.1597113-1-billy_tsai@aspeedtech.com>
	 <20240923100611.1597113-5-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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

Hi Billy,

On Mon, 2024-09-23 at 18:06 +0800, Billy Tsai wrote:
> In the 7th generation of the SoC from Aspeed, the control logic of the
> GPIO controller has been updated to support per-pin control. Each pin now
> has its own 32-bit register, allowing for individual control of the pin's
> value, direction, interrupt type, and other settings. The permission for
> coprocessor access is supported by the hardware but hasn't been
> implemented in the current patch.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 122 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d3994d833684..7418d65be721 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -30,6 +30,23 @@
>  #include <linux/gpio/consumer.h>
>  #include "gpiolib.h"
> =20
> +#define GPIO_G7_IRQ_STS_BASE 0x100
> +#define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)
> +#define GPIO_G7_CTRL_REG_BASE 0x180
> +#define GPIO_G7_CTRL_REG_OFFSET(x) (GPIO_G7_CTRL_REG_BASE + (x) * 0x4)
> +#define GPIO_G7_CTRL_OUT_DATA BIT(0)
> +#define GPIO_G7_CTRL_DIR BIT(1)
> +#define GPIO_G7_CTRL_IRQ_EN BIT(2)
> +#define GPIO_G7_CTRL_IRQ_TYPE0 BIT(3)
> +#define GPIO_G7_CTRL_IRQ_TYPE1 BIT(4)
> +#define GPIO_G7_CTRL_IRQ_TYPE2 BIT(5)
> +#define GPIO_G7_CTRL_RST_TOLERANCE BIT(6)
> +#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(7)
> +#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(8)
> +#define GPIO_G7_CTRL_INPUT_MASK BIT(9)
> +#define GPIO_G7_CTRL_IRQ_STS BIT(12)
> +#define GPIO_G7_CTRL_IN_DATA BIT(13)
> +
>  struct aspeed_bank_props {
>  	unsigned int bank;
>  	u32 input;
> @@ -95,6 +112,7 @@ struct aspeed_gpio_bank {
>   */
> =20
>  static const int debounce_timers[4] =3D { 0x00, 0x50, 0x54, 0x58 };
> +static const int g7_debounce_timers[4] =3D { 0x00, 0x04, 0x00, 0x08 };
> =20
>  static const struct aspeed_gpio_copro_ops *copro_ops;
>  static void *copro_data;
> @@ -250,6 +268,39 @@ static inline void __iomem *bank_reg(struct aspeed_g=
pio *gpio,
>  	BUG();
>  }
> =20
> +static inline u32 reg_mask(const enum aspeed_gpio_reg reg)

This is specific to the AST2700/G7, can you name it as such? Also I
find in helpful when reading backtraces if even static functions are
prefixed with e.g. aspeed_gpio_.

Other than that, the broad preference is to not mark functions as
inline. The function is already static and the keyword is at best a
hint, the compiler will decide what it thinks is best either way.

> +{
> +	switch (reg) {
> +	case reg_val:
> +		return GPIO_G7_CTRL_OUT_DATA;
> +	case reg_dir:
> +		return GPIO_G7_CTRL_DIR;
> +	case reg_irq_enable:
> +		return GPIO_G7_CTRL_IRQ_EN;
> +	case reg_irq_type0:
> +		return GPIO_G7_CTRL_IRQ_TYPE0;
> +	case reg_irq_type1:
> +		return GPIO_G7_CTRL_IRQ_TYPE1;
> +	case reg_irq_type2:
> +		return GPIO_G7_CTRL_IRQ_TYPE2;
> +	case reg_tolerance:
> +		return GPIO_G7_CTRL_RST_TOLERANCE;
> +	case reg_debounce_sel1:
> +		return GPIO_G7_CTRL_DEBOUNCE_SEL1;
> +	case reg_debounce_sel2:
> +		return GPIO_G7_CTRL_DEBOUNCE_SEL2;
> +	case reg_rdata:
> +		return GPIO_G7_CTRL_OUT_DATA;
> +	case reg_irq_status:
> +		return GPIO_G7_CTRL_IRQ_STS;
> +	case reg_cmdsrc0:
> +	case reg_cmdsrc1:
> +	default:
> +		WARN_ON_ONCE(1);
> +		return 0;
> +	}
> +}
> +
>  #define GPIO_BANK(x)	((x) >> 5)
>  #define GPIO_OFFSET(x)	((x) & 0x1f)
>  #define GPIO_BIT(x)	BIT(GPIO_OFFSET(x))
> @@ -1106,6 +1157,53 @@ static const struct aspeed_gpio_llops aspeed_g4_ll=
ops =3D {
>  	.privilege_ctrl =3D aspeed_g4_privilege_ctrl,
>  	.privilege_init =3D aspeed_g4_privilege_init,
>  };
> +
> +static void aspeed_g7_reg_bit_set(struct aspeed_gpio *gpio, unsigned int=
 offset,
> +				  const enum aspeed_gpio_reg reg, bool val)
> +{
> +	u32 mask =3D reg_mask(reg);
> +	void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +	u32 write_val =3D (ioread32(addr) & ~(mask)) | (((val) << (ffs(mask) - =
1)) & (mask));

Might be worth poking at whether there are existing macros or functions
that can more clearly describe this bit-hackery :)

Subtracting 1 from 0 to feed a shift is problematic.

> +
> +	iowrite32(write_val, addr);
> +}
> +
> +static bool aspeed_g7_reg_bit_get(struct aspeed_gpio *gpio, unsigned int=
 offset,
> +				  const enum aspeed_gpio_reg reg)
> +{
> +	u32 mask =3D reg_mask(reg);
> +	void __iomem *addr;
> +
> +	addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +	if (reg =3D=3D reg_val)
> +		mask =3D GPIO_G7_CTRL_IN_DATA;
> +
> +	return (((ioread32(addr)) & (mask)) >> (ffs(mask) - 1));

Again, can we avoid open-coding the bit-hackery? The subtraction is
still problematic.

Andrew
