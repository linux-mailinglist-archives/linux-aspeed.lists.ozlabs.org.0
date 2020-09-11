Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA222656D6
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 04:04:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnfG24sfbzDqhD
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 12:04:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QOgC4b/s; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnfDM3jLwzDqhD
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 12:03:14 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id e23so11648848eja.3
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 19:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BEZPiPwvSp1+pr7dCzwJ1u9bYXlu8VKtXAOvnlFbehc=;
 b=QOgC4b/s6UykHTFkdZSAELfdpJak5EwbEkSLC8zeYoeRsrtocmxmU5gI2W3P9dq5ja
 4s9sg8N+OKylTMi8wRh6VF/FZIJ9FD9XJSyTb2IJ9ue4h9P466cUntPUQuc3M2vsZwHJ
 6tk5tH87LY7SeSUv6qWBnPlG/rMpjxc4crgdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BEZPiPwvSp1+pr7dCzwJ1u9bYXlu8VKtXAOvnlFbehc=;
 b=o5C3IM0mgXZH1xihysyEMth8qzJg4PqLlSGL4sgDZr25kuUNOpVyOWBq89v1kdvnDL
 c4Z3XfO5rmFgI0zjFEJVfOif0OQeJlk/agLrVkaUFE1pJWq5XX2/MEFipz4STcp/j/XM
 XDgpQfFGx2bOzrCDHg68MHmf8DP7hpdizu64H4XOKychDkJdTtEdyuFgYuMU+r7D1Yh7
 /90g56CNTGnLekmvI8eVkcKhDCjVfq+1M4x8MJSR3cqUGoCvEkZ+Zs6JMmKtfbbGz/y+
 Ynv7tZLSV5E0sE9muAl2TABLbjE6hQRVYGU9GQsn/IbL9W1CIsT2JNdt4PHABgA2yGgW
 rzrw==
X-Gm-Message-State: AOAM531eN29bTf1zf5grhLm3UEFNog8NlFoyF4+LntBryuKM7m5qkMZA
 tlRcBgOkE7hql/p9FUF3Jris7/47cw7aMUQkfHw=
X-Google-Smtp-Source: ABdhPJwhEp9Qyfs+QXTGM95VkwxGCWqdOgLu52PLOzdk6GKHUhYEku+GPwNJ2oQe7RPCCtvX80JXo/BoPO/gmhz/GJY=
X-Received: by 2002:a17:906:e918:: with SMTP id
 ju24mr11535634ejb.442.1599789790428; 
 Thu, 10 Sep 2020 19:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200910105440.3087723-1-andrew@aj.id.au>
 <20200910105440.3087723-3-andrew@aj.id.au>
In-Reply-To: <20200910105440.3087723-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 02:02:58 +0000
Message-ID: <CACPK8Xf-jys=F0Uqg-hYH-eDThmd5yOSNeC7+vLhra3GdOK1Zw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: sdhci-of-aspeed: Expose data sample phase delay
 tuning
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Sep 2020 at 10:55, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Allow sample phase adjustment to deal with layout or tolerance issues.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 137 +++++++++++++++++++++++++++--
>  1 file changed, 132 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 4f008ba3280e..641accbfcde4 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -16,9 +16,18 @@
>
>  #include "sdhci-pltfm.h"
>
> -#define ASPEED_SDC_INFO                0x00
> -#define   ASPEED_SDC_S1MMC8    BIT(25)
> -#define   ASPEED_SDC_S0MMC8    BIT(24)
> +#define ASPEED_SDC_INFO                        0x00
> +#define   ASPEED_SDC_S1_MMC8           BIT(25)
> +#define   ASPEED_SDC_S0_MMC8           BIT(24)
> +#define ASPEED_SDC_PHASE               0xf4
> +#define   ASPEED_SDC_S1_PHASE_IN       GENMASK(25, 21)
> +#define   ASPEED_SDC_S0_PHASE_IN       GENMASK(20, 16)
> +#define   ASPEED_SDC_S1_PHASE_OUT      GENMASK(15, 11)
> +#define   ASPEED_SDC_S1_PHASE_IN_EN    BIT(10)
> +#define   ASPEED_SDC_S1_PHASE_OUT_EN   GENMASK(9, 8)
> +#define   ASPEED_SDC_S0_PHASE_OUT      GENMASK(7, 3)
> +#define   ASPEED_SDC_S0_PHASE_IN_EN    BIT(2)
> +#define   ASPEED_SDC_S0_PHASE_OUT_EN   GENMASK(1, 0)
>
>  struct aspeed_sdc {
>         struct clk *clk;
> @@ -28,9 +37,21 @@ struct aspeed_sdc {
>         void __iomem *regs;
>  };
>
> +struct aspeed_sdhci_phase_desc {
> +       u32 value_mask;
> +       u32 enable_mask;
> +       u8 enable_value;
> +};
> +
> +struct aspeed_sdhci_phase {
> +       struct aspeed_sdhci_phase_desc in;
> +       struct aspeed_sdhci_phase_desc out;
> +};
> +
>  struct aspeed_sdhci {
>         struct aspeed_sdc *parent;
>         u32 width_mask;
> +       const struct aspeed_sdhci_phase *phase;
>  };
>
>  static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
> @@ -50,6 +71,25 @@ static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
>         spin_unlock(&sdc->lock);
>  }
>
> +static void
> +aspeed_sdc_configure_phase(struct aspeed_sdc *sdc,
> +                          const struct aspeed_sdhci_phase_desc *phase,
> +                          uint8_t value, bool enable)
> +{
> +       u32 reg;
> +
> +       spin_lock(&sdc->lock);

What is the lock protecting against?

We call this in the ->probe, so there should be no concurrent access going on.


> +       reg = readl(sdc->regs + ASPEED_SDC_PHASE);
> +       reg &= ~phase->enable_mask;
> +       if (enable) {
> +               reg &= ~phase->value_mask;
> +               reg |= value << __ffs(phase->value_mask);
> +               reg |= phase->enable_value << __ffs(phase->enable_mask);
> +       }
> +       writel(reg, sdc->regs + ASPEED_SDC_PHASE);
> +       spin_unlock(&sdc->lock);
> +}
> +
>  static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
>  {
>         struct sdhci_pltfm_host *pltfm_host;
> @@ -155,8 +195,58 @@ static inline int aspeed_sdhci_calculate_slot(struct aspeed_sdhci *dev,
>         return (delta / 0x100) - 1;
>  }
>
> +static int aspeed_sdhci_configure_of(struct platform_device *pdev,
> +                                    struct aspeed_sdhci *sdhci)
> +{
> +       u32 iphase, ophase;
> +       struct device_node *np;
> +       struct device *dev;
> +       int ret;
> +
> +       if (!sdhci->phase)
> +               return 0;
> +
> +       dev = &pdev->dev;
> +       np = dev->of_node;
> +
> +       ret = of_property_read_u32(np, "aspeed,input-phase", &iphase);
> +       if (ret < 0) {
> +               aspeed_sdc_configure_phase(sdhci->parent, &sdhci->phase->in, 0,
> +                                          false);

Will this clear any value that eg. u-boot writes?

The register should be left alone if the kernel doesn't have a
configuration of it's own, otherwise we may end up breaking an
otherwise working system.

> +               dev_dbg(dev, "Input phase configuration disabled");
> +       } else if (iphase >= (1 << 5)) {
> +               dev_err(dev,
> +                       "Input phase value exceeds field range (5 bits): %u",
> +                       iphase);
> +               return -ERANGE;
> +       } else {
> +               aspeed_sdc_configure_phase(sdhci->parent, &sdhci->phase->in,
> +                                          iphase, true);
> +               dev_info(dev, "Input phase relationship: %u", iphase);

Make theis _dbg, on a normal boot we don't need this chatter in the logs.

The same comments apply for the output.

> +       }
> +
> +       ret = of_property_read_u32(np, "aspeed,output-phase", &ophase);
> +       if (ret < 0) {
> +               aspeed_sdc_configure_phase(sdhci->parent, &sdhci->phase->out, 0,
> +                                          false);
> +               dev_dbg(dev, "Output phase configuration disabled");
> +       } else if (ophase >= (1 << 5)) {
> +               dev_err(dev,
> +                       "Output phase value exceeds field range (5 bits): %u",
> +                       iphase);
> +               return -ERANGE;

This will cause the driver to fail to probe. I think skipping setting
of the phase is a better option.


> +       } else {
> +               aspeed_sdc_configure_phase(sdhci->parent, &sdhci->phase->out,
> +                                          ophase, true);
> +               dev_info(dev, "Output phase relationship: %u", ophase);
> +       }
> +
> +       return 0;
> +}
> +
>  static int aspeed_sdhci_probe(struct platform_device *pdev)
>  {
> +       const struct aspeed_sdhci_phase *phase;
>         struct sdhci_pltfm_host *pltfm_host;
>         struct aspeed_sdhci *dev;
>         struct sdhci_host *host;
> @@ -181,7 +271,10 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>                 return -EINVAL;
>
>         dev_info(&pdev->dev, "Configuring for slot %d\n", slot);
> -       dev->width_mask = !slot ? ASPEED_SDC_S0MMC8 : ASPEED_SDC_S1MMC8;
> +       dev->width_mask = !slot ? ASPEED_SDC_S0_MMC8 : ASPEED_SDC_S1_MMC8;
> +       phase = of_device_get_match_data(&pdev->dev);
> +       if (phase)
> +               dev->phase = &phase[slot];
>
>         sdhci_get_of_property(pdev);
>
> @@ -195,6 +288,10 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>                 goto err_pltfm_free;
>         }
>
> +       ret = aspeed_sdhci_configure_of(pdev, dev);
> +       if (ret)
> +               goto err_sdhci_add;
> +
>         ret = mmc_of_parse(host->mmc);
>         if (ret)
>                 goto err_sdhci_add;
> @@ -230,10 +327,40 @@ static int aspeed_sdhci_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static const struct aspeed_sdhci_phase ast2600_sdhci_phase[] = {
> +       /* SDHCI/Slot 0 */
> +       [0] = {
> +               .in = {
> +                       .value_mask = ASPEED_SDC_S0_PHASE_IN,
> +                       .enable_mask = ASPEED_SDC_S0_PHASE_IN_EN,
> +                       .enable_value = 1,
> +               },
> +               .out = {
> +                       .value_mask = ASPEED_SDC_S0_PHASE_OUT,
> +                       .enable_mask = ASPEED_SDC_S0_PHASE_OUT_EN,
> +                       .enable_value = 3,
> +               },
> +       },
> +       /* SDHCI/Slot 1 */
> +       [1] = {
> +               .in = {
> +                       .value_mask = ASPEED_SDC_S1_PHASE_IN,
> +                       .enable_mask = ASPEED_SDC_S1_PHASE_IN_EN,
> +                       .enable_value = 1,
> +               },
> +               .out = {
> +                       .value_mask = ASPEED_SDC_S1_PHASE_OUT,
> +                       .enable_mask = ASPEED_SDC_S1_PHASE_OUT_EN,

Is there any value in splitting the input and output phase values
up? (instead of taking the property from the device tree and putting
it in the hardware).

> +                       .enable_value = 3,
> +               },
> +       },
> +};
> +
> +/* If supported, phase adjustment fields are stored in the data pointer */
>  static const struct of_device_id aspeed_sdhci_of_match[] = {
>         { .compatible = "aspeed,ast2400-sdhci", },
>         { .compatible = "aspeed,ast2500-sdhci", },
> -       { .compatible = "aspeed,ast2600-sdhci", },
> +       { .compatible = "aspeed,ast2600-sdhci", .data = ast2600_sdhci_phase },
>         { }
>  };
>
> --
> 2.25.1
>
