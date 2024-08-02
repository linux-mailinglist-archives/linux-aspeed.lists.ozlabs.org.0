Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C19579FA
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL01NrTz3cZM
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lgLjo1RJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=dmitry.baryshkov@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbGGL1RpJz30VY
	for <linux-aspeed@lists.ozlabs.org>; Sat,  3 Aug 2024 05:33:29 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-66acac24443so75820697b3.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 02 Aug 2024 12:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722627207; x=1723232007; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z7dniS23SKfmEnH3heDmXF7wW6IpRVsH2fGKvJHi/jA=;
        b=lgLjo1RJNxkouzEPc210nL7Af9JzEZB77FUhhnEsc8GzitBMhXtqK9Tb+5OSAY6yaX
         YbNJyyRmcSAfrIAZkm9uOuXbSVpR9h8H7c0rfQSJ+Ifw6LYcoXjRqh+wz3qfnsw8HzuN
         KhYoZ7Y8qLi11hbptQyXiZRET3lIpmWJP7mLVTneIcJ3zrvMk5vg0yImnqK60b+UZPQ+
         jkUxfr1OOeKhlXJ6F0W8cNpcwmV2IpsJAmphmgX7lKMFVzJT28X1gqzgjNI6j5lwOYQ/
         PihYwkLPUsYGK/CCIziYG/BSlYeRrvb5/QSD4Cyhs25hGCMEMBTeAa/SVERK7+wbqJhC
         nqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722627207; x=1723232007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7dniS23SKfmEnH3heDmXF7wW6IpRVsH2fGKvJHi/jA=;
        b=fTqLdFioBVSrE1pkej6CsowvaQ9qNoWfD/xFaftLZ2TsKaQeyEjDLBGyQg162K84tQ
         u2YH+9Bi3NBlKZHZ2RjlpTJ591wYZOCkwiah+bxbVHCBRh3TDdMhklQgz0wxTtGCNxRt
         DPDvPD8KCAR9y3mPqH2b27i905tFl6+55t7QyxwTUMR0Yb+G2k/qEReepS7Gw2DZvrXF
         UGZIanFqWT03uqZfEb0iwNQNOyChZiU2tLby55enTvSoyDs0tYTaW03d+c1dbRFRsMz7
         e0akjJXgmJnKW9OF4cfiGsHJVvYY6vagjvzl0QL4JnzKDYu6TG7lzkS343+0hXuTcKq5
         ZjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC82n/v4YrVvAkIdmvcIJXsSCE11CJYXJ5NotG06o9WdEXhOoH+Qp+Hq1YLovGaeY0CqfX+1CSC2eb/iKsy7TWpFO2BdYFXGlyoIMm6w==
X-Gm-Message-State: AOJu0YwFmsKVaSp/C3aBZnENy2AYByb+FcxIw1fZjMsncgOfyxz2GFBA
	zLvrfpeOQ1MVoV7oCI39b1Z6k+G7D421WV+ANy8OKC8FS2as7YzDRAUfdsIhi8orblV3c3T65pc
	M+ug0vXqKspPwJ/jThr9rvIEtQr5kdff0rkBa6g==
X-Google-Smtp-Source: AGHT+IE7Y6hR9yVIaN5gVaLqlOtLA/L3XUpeQc4CZMQwUS0uVIYXCqjp7w5lpJsvNAXArj0xjLkLoSmwmxdJqEza8zk=
X-Received: by 2002:a81:9c07:0:b0:650:82e0:63b1 with SMTP id
 00721157ae682-689641a6125mr52704377b3.41.1722627206905; Fri, 02 Aug 2024
 12:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com> <20240802090544.2741206-6-kevin_chen@aspeedtech.com>
In-Reply-To: <20240802090544.2741206-6-kevin_chen@aspeedtech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 2 Aug 2024 22:33:15 +0300
Message-ID: <CAA8EJprhpv2i9Y=8FAW+fDi_TMJYLw8KO+GtbA4oPHuK+Kgq_A@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] clk: ast2700: add clock controller
To: Kevin Chen <kevin_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: geert+renesas@glider.be, catalin.marinas@arm.com, mturquette@baylibre.com, will@kernel.org, linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, m.szyprowski@samsung.com, robh@kernel.org, quic_bjorande@quicinc.com, nfraprado@collabora.com, u-kumar1@ti.com, lee@kernel.org, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, soc@kernel.org, linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, olof@lixom.net, krzk+dt@kernel.org, shawnguo@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2 Aug 2024 at 12:05, Kevin Chen <kevin_chen@aspeedtech.com> wrote:
>
> Add support for ast2700 clock controller.
>
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
> ---
>  drivers/clk/Makefile      |    1 +
>  drivers/clk/clk-ast2700.c | 1173 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 1174 insertions(+)
>  create mode 100644 drivers/clk/clk-ast2700.c
>
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index f793a16cad40..0d5992ea0fa4 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -38,6 +38,7 @@ obj-$(CONFIG_COMMON_CLK_FSL_SAI)      += clk-fsl-sai.o
>  obj-$(CONFIG_COMMON_CLK_GEMINI)                += clk-gemini.o
>  obj-$(CONFIG_COMMON_CLK_ASPEED)                += clk-aspeed.o
>  obj-$(CONFIG_MACH_ASPEED_G6)           += clk-ast2600.o
> +obj-$(CONFIG_MACH_ASPEED_G7)           += clk-ast2700.o
>  obj-$(CONFIG_ARCH_HIGHBANK)            += clk-highbank.o
>  obj-$(CONFIG_CLK_HSDK)                 += clk-hsdk-pll.o
>  obj-$(CONFIG_COMMON_CLK_K210)          += clk-k210.o
> diff --git a/drivers/clk/clk-ast2700.c b/drivers/clk/clk-ast2700.c
> new file mode 100644
> index 000000000000..eec8e0cb83d9
> --- /dev/null
> +++ b/drivers/clk/clk-ast2700.c
> @@ -0,0 +1,1173 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright ASPEED Technology
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/clock/aspeed,ast2700-clk.h>
> +#include <dt-bindings/reset/aspeed,ast2700-reset.h>
> +
> +#define SCU_CLK_24MHZ 24000000

Are Aspeed's 24 MHz somehow different from 24 MHz on other platforms?
Please use <linux/units.h> and refrain from defining just random
values. If it has some special meaning (like XO clock or some other
fixed funcion), please use logical names.

> +#define SCU_CLK_25MHZ 25000000
> +#define SCU_CLK_192MHZ 192000000
> +/* SOC0 USB2 PHY CLK*/
> +#define SCU_CLK_12MHZ 12000000

So, this can be #define ASPEED_SOC0_USB2_PHY_RATE (12 * HZ_PER_MHZ)

> +/* SOC0 */
> +#define SCU0_HWSTRAP1 0x010
> +#define SCU0_CLK_STOP 0x240
> +#define SCU0_CLK_SEL1 0x280
> +#define SCU0_CLK_SEL2 0x284
> +#define GET_USB_REFCLK_DIV(x) ((GENMASK(23, 20) & (x)) >> 20)
> +#define UART_DIV13_EN BIT(30)
> +#define SCU0_HPLL_PARAM 0x300
> +#define SCU0_DPLL_PARAM 0x308
> +#define SCU0_MPLL_PARAM 0x310
> +#define SCU0_D1CLK_PARAM 0x320
> +#define SCU0_D2CLK_PARAM 0x330
> +#define SCU0_CRT1CLK_PARAM 0x340
> +#define SCU0_CRT2CLK_PARAM 0x350
> +#define SCU0_MPHYCLK_PARAM 0x360
> +
> +/* SOC1 */
> +#define SCU1_CLK_STOP 0x240
> +#define SCU1_CLK_STOP2 0x260
> +#define SCU1_CLK_SEL1 0x280
> +#define SCU1_CLK_SEL2 0x284
> +#define UXCLK_MASK GENMASK(1, 0)
> +#define HUXCLK_MASK GENMASK(4, 3)
> +#define SCU1_HPLL_PARAM 0x300
> +#define SCU1_APLL_PARAM 0x310
> +#define SCU1_DPLL_PARAM 0x320
> +#define SCU1_UXCLK_CTRL 0x330
> +#define SCU1_HUXCLK_CTRL 0x334
> +#define SCU1_MAC12_CLK_DLY 0x390
> +#define SCU1_MAC12_CLK_DLY_100M 0x394
> +#define SCU1_MAC12_CLK_DLY_10M 0x398
> +
> +/*
> + * MAC Clock Delay settings
> + */
> +#define MAC_CLK_RMII1_50M_RCLK_O_CTRL          BIT(30)
> +#define   MAC_CLK_RMII1_50M_RCLK_O_DIS         0
> +#define   MAC_CLK_RMII1_50M_RCLK_O_EN          1
> +#define MAC_CLK_RMII0_50M_RCLK_O_CTRL          BIT(29)
> +#define   MAC_CLK_RMII0_5M_RCLK_O_DIS          0
> +#define   MAC_CLK_RMII0_5M_RCLK_O_EN           1
> +#define MAC_CLK_RMII_TXD_FALLING_2             BIT(27)
> +#define MAC_CLK_RMII_TXD_FALLING_1             BIT(26)
> +#define MAC_CLK_RXCLK_INV_2                    BIT(25)
> +#define MAC_CLK_RXCLK_INV_1                    BIT(24)
> +#define MAC_CLK_1G_INPUT_DELAY_2               GENMASK(23, 18)
> +#define MAC_CLK_1G_INPUT_DELAY_1               GENMASK(17, 12)
> +#define MAC_CLK_1G_OUTPUT_DELAY_2              GENMASK(11, 6)
> +#define MAC_CLK_1G_OUTPUT_DELAY_1              GENMASK(5, 0)
> +
> +#define MAC_CLK_100M_10M_RESERVED              GENMASK(31, 26)
> +#define MAC_CLK_100M_10M_RXCLK_INV_2           BIT(25)
> +#define MAC_CLK_100M_10M_RXCLK_INV_1           BIT(24)
> +#define MAC_CLK_100M_10M_INPUT_DELAY_2         GENMASK(23, 18)
> +#define MAC_CLK_100M_10M_INPUT_DELAY_1         GENMASK(17, 12)
> +#define MAC_CLK_100M_10M_OUTPUT_DELAY_2                GENMASK(11, 6)
> +#define MAC_CLK_100M_10M_OUTPUT_DELAY_1                GENMASK(5, 0)
> +
> +#define AST2700_DEF_MAC12_DELAY_1G     0x00CF4D75

lowcase hex, please.

> +#define AST2700_DEF_MAC12_DELAY_100M   0x00410410
> +#define AST2700_DEF_MAC12_DELAY_10M    0x00410410
> +
> +struct mac_delay_config {
> +       u32 tx_delay_1000;
> +       u32 rx_delay_1000;
> +       u32 tx_delay_100;
> +       u32 rx_delay_100;
> +       u32 tx_delay_10;
> +       u32 rx_delay_10;
> +};
> +
> +/* Globally visible clocks */
> +static DEFINE_SPINLOCK(ast2700_clk_lock);
> +
> +/* Division of RGMII Clock */
> +static const struct clk_div_table ast2700_rgmii_div_table[] = {
> +       { 0x0, 4 },
> +       { 0x1, 4 },
> +       { 0x2, 6 },
> +       { 0x3, 8 },
> +       { 0x4, 10 },
> +       { 0x5, 12 },
> +       { 0x6, 14 },
> +       { 0x7, 16 },
> +       { 0 }
> +};
> +
> +/* Division of RMII Clock */
> +static const struct clk_div_table ast2700_rmii_div_table[] = {
> +       { 0x0, 8 },
> +       { 0x1, 8 },
> +       { 0x2, 12 },
> +       { 0x3, 16 },
> +       { 0x4, 20 },
> +       { 0x5, 24 },
> +       { 0x6, 28 },
> +       { 0x7, 32 },
> +       { 0 }
> +};
> +
> +/* Division of HCLK/SDIO/MAC/apll_divn CLK */
> +static const struct clk_div_table ast2700_clk_div_table[] = {
> +       { 0x0, 2 },
> +       { 0x1, 2 },
> +       { 0x2, 3 },
> +       { 0x3, 4 },
> +       { 0x4, 5 },
> +       { 0x5, 6 },
> +       { 0x6, 7 },
> +       { 0x7, 8 },
> +       { 0 }
> +};
> +
> +/* Division of PCLK/EMMC CLK */
> +static const struct clk_div_table ast2700_clk_div_table2[] = {
> +       { 0x0, 2 },
> +       { 0x1, 4 },
> +       { 0x2, 6 },
> +       { 0x3, 8 },
> +       { 0x4, 10 },
> +       { 0x5, 12 },
> +       { 0x6, 14 },
> +       { 0x7, 16 },
> +       { 0 }
> +};
> +
> +/* HPLL/DPLL: 2000Mhz(default) */
> +static struct clk_hw *ast2700_soc0_hw_pll(const char *name, const char *parent_name, u32 val)

Please migrate from using parent_names to either using parent_hw or
using fwname to specify the parent clock.

> +{
> +       unsigned int mult, div;
> +
> +       if (val & BIT(24)) {
> +               /* Pass through mode */
> +               mult = 1;
> +               div = 1;
> +       } else {
> +               /* F = CLKIN(25MHz) * [(M+1) / 2(N+1)] / (P+1) */
> +               u32 m = val & 0x1fff;
> +               u32 n = (val >> 13) & 0x3f;
> +               u32 p = (val >> 19) & 0xf;
> +
> +               mult = (m + 1) / (2 * (n + 1));
> +               div = (p + 1);
> +       }
> +
> +       return clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mult, div);
> +};
> +
> +/* MPLL 1600Mhz(default) */
> +static struct clk_hw *ast2700_calc_mpll(const char *name, const char *parent_name, u32 val)
> +{
> +       unsigned int mult, div;
> +
> +       if (val & BIT(24)) {
> +               /* Pass through mode */
> +               div = 1;
> +               mult = div;
> +       } else {
> +               /* F = CLKIN(25MHz) * [CLKF/(CLKR+1)] /(CLKOD+1) */
> +               u32 m = val & 0x1fff;
> +               u32 n = (val >> 13) & 0x3f;
> +               u32 p = (val >> 19) & 0xf;
> +
> +               mult = m / (n + 1);
> +               div = (p + 1);
> +       }
> +       return clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mult, div);
> +};
> +
> +static struct clk_hw *ast2700_calc_uclk(const char *name, u32 val)
> +{
> +       unsigned int mult, div;
> +
> +       /* UARTCLK = UXCLK * R / (N * 2) */
> +       u32 r = val & 0xff;
> +       u32 n = (val >> 8) & 0x3ff;
> +
> +       mult = r;
> +       div = n * 2;
> +
> +       return clk_hw_register_fixed_factor(NULL, name, "uxclk", 0, mult, div);
> +};
> +
> +static struct clk_hw *ast2700_calc_huclk(const char *name, u32 val)
> +{
> +       unsigned int mult, div;
> +
> +       /* UARTCLK = UXCLK * R / (N * 2) */
> +       u32 r = val & 0xff;
> +       u32 n = (val >> 8) & 0x3ff;
> +
> +       mult = r;
> +       div = n * 2;
> +
> +       return clk_hw_register_fixed_factor(NULL, name, "huxclk", 0, mult, div);
> +};
> +
> +static struct clk_hw *ast2700_calc_soc1_pll(const char *name, const char *parent_name, u32 val)

How is this different from ast2700_soc0_hw_pll() ?

> +{
> +       unsigned int mult, div;
> +
> +       if (val & BIT(24)) {
> +               /* Pass through mode */
> +               div = 1;
> +               mult = div;
> +       } else {
> +               /* F = 25Mhz * [(M + 1) / (n + 1)] / (p + 1) */
> +               u32 m = val & 0x1fff;
> +               u32 n = (val >> 13) & 0x3f;
> +               u32 p = (val >> 19) & 0xf;
> +
> +               mult = (m + 1) / (n + 1);
> +               div = (p + 1);
> +       }
> +       return clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mult, div);
> +};
> +


-- 
With best wishes
Dmitry
