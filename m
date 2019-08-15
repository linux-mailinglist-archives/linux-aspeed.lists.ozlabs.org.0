Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F13B98E472
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Aug 2019 07:29:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468FP73shvzDr2d
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Aug 2019 15:28:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="BH2oD1o7"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468FNt3c6zzDr0X
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2019 15:28:46 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id k13so1206703qtm.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 22:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=90yfiuR7ZFX00U4yJUPEfg7jx0k1epw3YqHqI9A23zo=;
 b=BH2oD1o7f7PNjnFsnlOOqsL8xjqgP03uRRN3Xq4d5t+GeRAz6BCHn9VK1Iki4KQ60L
 0Kje3WEtKcHLv2TxSfEuckAEslHJyooYvTnvNMBTbOf21bvfOQot3QgdRZjYHFg/m2oI
 mldcIKkmo9VN8gSYS9KP5JnotaTxszOB9mHvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=90yfiuR7ZFX00U4yJUPEfg7jx0k1epw3YqHqI9A23zo=;
 b=hUksG6v84n7SLDXNJS/Fwa1eFFko+S0u6tRebIa3O7BYqtI1ebvAkpE3NmYbg8Hzrd
 zCmaNSXd6ncD4t6hxECjIie+gyu1gA/y8Rv4e5fa2Zz1zceX9Vh9A4RlGu1MO8MGcGC5
 u9e3i7ylitt/NJNBbMOfi4KHjYtG21GTC0+NvQkNQKdaIwfDxbmrNJ557mDWfQs99Z4k
 3zGE7ayESkg4VSh/WVVNHMr74fvqVHMXi2LQritsrv9Ky6/HMmEKg5XWecYrtdXHCMug
 buAqF8uPdLowDfK6iaSHzDH44PuPopIGf6aYCyf5odvOPCQBtTkKOnFJIj+pL8g89a6l
 npxQ==
X-Gm-Message-State: APjAAAVcaj2eA+A8VjrnE08HdYUA5ylVTM2XUw58XPr8gZZEE7kJFdG4
 avRW2G/p+IioUgwtrj5fzCXUujHHMp5asc1FWZI=
X-Google-Smtp-Source: APXvYqzZEnC2BU4ihtcOrOmuhoTH83B7TBqvLZDdrElh0JmJzTY4KGtWyXUyd32+AlNOMuTMOsgTlFu7e/SxQch/Bi4=
X-Received: by 2002:ac8:2fc8:: with SMTP id m8mr2496247qta.269.1565846920278; 
 Wed, 14 Aug 2019 22:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190807003629.2974-1-andrew@aj.id.au>
 <20190807003629.2974-3-andrew@aj.id.au>
In-Reply-To: <20190807003629.2974-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Aug 2019 05:28:28 +0000
Message-ID: <CACPK8XeJbSNLr+9f3J8beg20sSqg7XUSLrX7E=S+ewPx0rqcmw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mmc: Add support for the ASPEED SD controller
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, ulf.hansson@linaro.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, linux-mmc@vger.kernel.org,
 adrian.hunter@intel.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 7 Aug 2019 at 00:38, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Add a minimal driver for ASPEED's SD controller, which exposes two
> SDHCIs.
>
> The ASPEED design implements a common register set for the SDHCIs, and
> moves some of the standard configuration elements out to this common
> area (e.g. 8-bit mode, and card detect configuration which is not
> currently supported).
>
> The SD controller has a dedicated hardware interrupt that is shared
> between the slots. The common register set exposes information on which
> slot triggered the interrupt; early revisions of the patch introduced an
> irqchip for the register, but reality is it doesn't behave as an
> irqchip, and the result fits awkwardly into the irqchip APIs. Instead
> I've taken the simple approach of using the IRQ as a shared IRQ with
> some minor performance impact for the second slot.
>
> Ryan was the original author of the patch - I've taken his work and
> massaged it to drop the irqchip support and rework the devicetree
> integration. The driver has been smoke tested under qemu against a
> minimal SD controller model and lightly tested on an ast2500-evb.
>
> Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>


>
> ---
>
> v5:
> * Cleanup sdhci driver on registration failure
>
> v4: No change
>
> v2:
> * Add AST2600 compatible
> * Drop SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN
> * Ensure slot number is valid
> * Fix build with CONFIG_MODULES
> * Fix module license string
> * Non-PCI devices won't die
> * Rename aspeed_sdc_configure_8bit_mode()
> * Rename aspeed_sdhci_pdata
> * Switch to sdhci_enable_clk()
> * Use PTR_ERR() on the right `struct platform_device *`
> ---
>  drivers/mmc/host/Kconfig           |  12 ++
>  drivers/mmc/host/Makefile          |   1 +
>  drivers/mmc/host/sdhci-of-aspeed.c | 332 +++++++++++++++++++++++++++++
>  3 files changed, 345 insertions(+)
>  create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 14d89a108edd..0f8a230de2f3 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -154,6 +154,18 @@ config MMC_SDHCI_OF_ARASAN
>
>           If unsure, say N.
>
> +config MMC_SDHCI_OF_ASPEED
> +       tristate "SDHCI OF support for the ASPEED SDHCI controller"
> +       depends on MMC_SDHCI_PLTFM
> +       depends on OF
> +       help
> +         This selects the ASPEED Secure Digital Host Controller Interface.
> +
> +         If you have a controller with this interface, say Y or M here. You
> +         also need to enable an appropriate bus interface.
> +
> +         If unsure, say N.
> +
>  config MMC_SDHCI_OF_AT91
>         tristate "SDHCI OF support for the Atmel SDMMC controller"
>         depends on MMC_SDHCI_PLTFM
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index 73578718f119..390ee162fe71 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -84,6 +84,7 @@ obj-$(CONFIG_MMC_SDHCI_ESDHC_IMX)     += sdhci-esdhc-imx.o
>  obj-$(CONFIG_MMC_SDHCI_DOVE)           += sdhci-dove.o
>  obj-$(CONFIG_MMC_SDHCI_TEGRA)          += sdhci-tegra.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ARASAN)      += sdhci-of-arasan.o
> +obj-$(CONFIG_MMC_SDHCI_OF_ASPEED)      += sdhci-of-aspeed.o
>  obj-$(CONFIG_MMC_SDHCI_OF_AT91)                += sdhci-of-at91.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)       += sdhci-of-esdhc.o
>  obj-$(CONFIG_MMC_SDHCI_OF_HLWD)                += sdhci-of-hlwd.o
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> new file mode 100644
> index 000000000000..8bb095ca2fa9
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -0,0 +1,332 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Copyright (C) 2019 ASPEED Technology Inc. */
> +/* Copyright (C) 2019 IBM Corp. */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/mmc/host.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +
> +#include "sdhci-pltfm.h"
> +
> +#define ASPEED_SDC_INFO                0x00
> +#define   ASPEED_SDC_S1MMC8    BIT(25)
> +#define   ASPEED_SDC_S0MMC8    BIT(24)
> +
> +struct aspeed_sdc {
> +       struct clk *clk;
> +       struct resource *res;
> +
> +       spinlock_t lock;
> +       void __iomem *regs;
> +};
> +
> +struct aspeed_sdhci {
> +       struct aspeed_sdc *parent;
> +       u32 width_mask;
> +};
> +
> +static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
> +                                          struct aspeed_sdhci *sdhci,
> +                                          bool bus8)
> +{
> +       u32 info;
> +
> +       /* Set/clear 8 bit mode */
> +       spin_lock(&sdc->lock);
> +       info = readl(sdc->regs + ASPEED_SDC_INFO);
> +       if (bus8)
> +               info |= sdhci->width_mask;
> +       else
> +               info &= ~sdhci->width_mask;
> +       writel(info, sdc->regs + ASPEED_SDC_INFO);
> +       spin_unlock(&sdc->lock);
> +}
> +
> +static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
> +{
> +       int div;
> +       u16 clk;
> +
> +       if (clock == host->clock)
> +               return;
> +
> +       sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
> +
> +       if (clock == 0)
> +               goto out;
> +
> +       for (div = 1; div < 256; div *= 2) {
> +               if ((host->max_clk / div) <= clock)
> +                       break;
> +       }
> +       div >>= 1;
> +
> +       clk = div << SDHCI_DIVIDER_SHIFT;
> +
> +       sdhci_enable_clk(host, clk);
> +
> +out:
> +       host->clock = clock;
> +}
> +
> +static void aspeed_sdhci_set_bus_width(struct sdhci_host *host, int width)
> +{
> +       struct sdhci_pltfm_host *pltfm_priv;
> +       struct aspeed_sdhci *aspeed_sdhci;
> +       struct aspeed_sdc *aspeed_sdc;
> +       u8 ctrl;
> +
> +       pltfm_priv = sdhci_priv(host);
> +       aspeed_sdhci = sdhci_pltfm_priv(pltfm_priv);
> +       aspeed_sdc = aspeed_sdhci->parent;
> +
> +       /* Set/clear 8-bit mode */
> +       aspeed_sdc_configure_8bit_mode(aspeed_sdc, aspeed_sdhci,
> +                                      width == MMC_BUS_WIDTH_8);
> +
> +       /* Set/clear 1 or 4 bit mode */
> +       ctrl = sdhci_readb(host, SDHCI_HOST_CONTROL);
> +       if (width == MMC_BUS_WIDTH_4)
> +               ctrl |= SDHCI_CTRL_4BITBUS;
> +       else
> +               ctrl &= ~SDHCI_CTRL_4BITBUS;
> +       sdhci_writeb(host, ctrl, SDHCI_HOST_CONTROL);
> +}
> +
> +static const struct sdhci_ops aspeed_sdhci_ops = {
> +       .set_clock = aspeed_sdhci_set_clock,
> +       .get_max_clock = sdhci_pltfm_clk_get_max_clock,
> +       .set_bus_width = aspeed_sdhci_set_bus_width,
> +       .get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
> +       .reset = sdhci_reset,
> +       .set_uhs_signaling = sdhci_set_uhs_signaling,
> +};
> +
> +static const struct sdhci_pltfm_data aspeed_sdhci_pdata = {
> +       .ops = &aspeed_sdhci_ops,
> +       .quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> +};
> +
> +static inline int aspeed_sdhci_calculate_slot(struct aspeed_sdhci *dev,
> +                                             struct resource *res)
> +{
> +       resource_size_t delta;
> +
> +       if (!res || resource_type(res) != IORESOURCE_MEM)
> +               return -EINVAL;
> +
> +       if (res->start < dev->parent->res->start)
> +               return -EINVAL;
> +
> +       delta = res->start - dev->parent->res->start;
> +       if (delta & (0x100 - 1))
> +               return -EINVAL;
> +
> +       return (delta / 0x100) - 1;
> +}
> +
> +static int aspeed_sdhci_probe(struct platform_device *pdev)
> +{
> +       struct sdhci_pltfm_host *pltfm_host;
> +       struct aspeed_sdhci *dev;
> +       struct sdhci_host *host;
> +       struct resource *res;
> +       int slot;
> +       int ret;
> +
> +       host = sdhci_pltfm_init(pdev, &aspeed_sdhci_pdata, sizeof(*dev));
> +       if (IS_ERR(host))
> +               return PTR_ERR(host);
> +
> +       pltfm_host = sdhci_priv(host);
> +       dev = sdhci_pltfm_priv(pltfm_host);
> +       dev->parent = dev_get_drvdata(pdev->dev.parent);
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       slot = aspeed_sdhci_calculate_slot(dev, res);
> +
> +       if (slot < 0)
> +               return slot;
> +       else if (slot >= 2)
> +               return -EINVAL;
> +
> +       dev_info(&pdev->dev, "Configuring for slot %d\n", slot);
> +       dev->width_mask = !slot ? ASPEED_SDC_S0MMC8 : ASPEED_SDC_S1MMC8;
> +
> +       sdhci_get_of_property(pdev);
> +
> +       pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(pltfm_host->clk))
> +               return PTR_ERR(pltfm_host->clk);
> +
> +       ret = clk_prepare_enable(pltfm_host->clk);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Unable to enable SDIO clock\n");
> +               goto err_pltfm_free;
> +       }
> +
> +       ret = mmc_of_parse(host->mmc);
> +       if (ret)
> +               goto err_sdhci_add;
> +
> +       ret = sdhci_add_host(host);
> +       if (ret)
> +               goto err_sdhci_add;
> +
> +       return 0;
> +
> +err_sdhci_add:
> +       clk_disable_unprepare(pltfm_host->clk);
> +err_pltfm_free:
> +       sdhci_pltfm_free(pdev);
> +       return ret;
> +}
> +
> +static int aspeed_sdhci_remove(struct platform_device *pdev)
> +{
> +       struct sdhci_pltfm_host *pltfm_host;
> +       struct sdhci_host *host;
> +       int dead = 0;
> +
> +       host = platform_get_drvdata(pdev);
> +       pltfm_host = sdhci_priv(host);
> +
> +       sdhci_remove_host(host, dead);
> +
> +       clk_disable_unprepare(pltfm_host->clk);
> +
> +       sdhci_pltfm_free(pdev);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id aspeed_sdhci_of_match[] = {
> +       { .compatible = "aspeed,ast2400-sdhci", },
> +       { .compatible = "aspeed,ast2500-sdhci", },
> +       { .compatible = "aspeed,ast2600-sdhci", },
> +       { }
> +};
> +
> +static struct platform_driver aspeed_sdhci_driver = {
> +       .driver         = {
> +               .name   = "sdhci-aspeed",
> +               .of_match_table = aspeed_sdhci_of_match,
> +       },
> +       .probe          = aspeed_sdhci_probe,
> +       .remove         = aspeed_sdhci_remove,
> +};
> +
> +static int aspeed_sdc_probe(struct platform_device *pdev)
> +
> +{
> +       struct device_node *parent, *child;
> +       struct aspeed_sdc *sdc;
> +       int ret;
> +
> +       sdc = devm_kzalloc(&pdev->dev, sizeof(*sdc), GFP_KERNEL);
> +       if (!sdc)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&sdc->lock);
> +
> +       sdc->clk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(sdc->clk))
> +               return PTR_ERR(sdc->clk);
> +
> +       ret = clk_prepare_enable(sdc->clk);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Unable to enable SDCLK\n");
> +               return ret;
> +       }
> +
> +       sdc->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       sdc->regs = devm_ioremap_resource(&pdev->dev, sdc->res);
> +       if (IS_ERR(sdc->regs)) {
> +               ret = PTR_ERR(sdc->regs);
> +               goto err_clk;
> +       }
> +
> +       dev_set_drvdata(&pdev->dev, sdc);
> +
> +       parent = pdev->dev.of_node;
> +       for_each_available_child_of_node(parent, child) {
> +               struct platform_device *cpdev;
> +
> +               cpdev = of_platform_device_create(child, NULL, &pdev->dev);
> +               if (IS_ERR(cpdev)) {
> +                       of_node_put(child);
> +                       ret = PTR_ERR(cpdev);
> +                       goto err_clk;
> +               }
> +       }
> +
> +       return 0;
> +
> +err_clk:
> +       clk_disable_unprepare(sdc->clk);
> +       return ret;
> +}
> +
> +static int aspeed_sdc_remove(struct platform_device *pdev)
> +{
> +       struct aspeed_sdc *sdc = dev_get_drvdata(&pdev->dev);
> +
> +       clk_disable_unprepare(sdc->clk);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id aspeed_sdc_of_match[] = {
> +       { .compatible = "aspeed,ast2400-sd-controller", },
> +       { .compatible = "aspeed,ast2500-sd-controller", },
> +       { .compatible = "aspeed,ast2600-sd-controller", },
> +       { }
> +};
> +
> +MODULE_DEVICE_TABLE(of, aspeed_sdc_of_match);
> +
> +static struct platform_driver aspeed_sdc_driver = {
> +       .driver         = {
> +               .name   = "sd-controller-aspeed",
> +               .pm     = &sdhci_pltfm_pmops,
> +               .of_match_table = aspeed_sdc_of_match,
> +       },
> +       .probe          = aspeed_sdc_probe,
> +       .remove         = aspeed_sdc_remove,
> +};
> +
> +static int __init aspeed_sdc_init(void)
> +{
> +       int rc;
> +
> +       rc = platform_driver_register(&aspeed_sdhci_driver);
> +       if (rc < 0)
> +               return rc;
> +
> +       rc = platform_driver_register(&aspeed_sdc_driver);
> +       if (rc < 0)
> +               platform_driver_unregister(&aspeed_sdhci_driver);
> +
> +       return rc;
> +}
> +module_init(aspeed_sdc_init);
> +
> +static void __exit aspeed_sdc_exit(void)
> +{
> +       platform_driver_unregister(&aspeed_sdc_driver);
> +       platform_driver_unregister(&aspeed_sdhci_driver);
> +}
> +module_exit(aspeed_sdc_exit);
> +
> +MODULE_DESCRIPTION("Driver for the ASPEED SD/SDIO/SDHCI Controllers");
> +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
> +MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
> +MODULE_LICENSE("GPL");
> --
> 2.20.1
>
