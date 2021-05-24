Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194CB38E87A
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 May 2021 16:12:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpfL100xyz3076
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 May 2021 00:12:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pbgNUmfp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pbgNUmfp; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpfKS6dHRz2yj1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 May 2021 00:11:54 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id q7so39529975lfr.6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 24 May 2021 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/yZGsZDGj6VwJI2huNhq3QoEWnA9XjvVe/EfZq4y7IU=;
 b=pbgNUmfpmE+TUnwYGWa4+Cr8UT5p+RNDrrQf6fokKwwro+TbWKERs2VaUCqCAqsBxA
 I5TWFMPioWQdKlL+6MfKFR/wp6EmqQGuoA1C+6bhCqfstK6RzS/ZhkqYuPyoxo8WbNBc
 XlsOS3fFXH+dAkql4342osYDPx8Ey7GqFptWyAYbp/ASsmyS6WraUNbATVAUcgzJWo/K
 T6rVcFOxsVeIqWjoSbjOdE7Eb1irD5xl1pBziojPDGreqr1x00ExHeA284yUpteD6x6y
 euIdJh+5pr5YNBBWZJPQM0Fvc9Dg+KbpX6mRFnYuB28NPTOIu37uncKP0J3Z/9GJZ8gM
 63ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/yZGsZDGj6VwJI2huNhq3QoEWnA9XjvVe/EfZq4y7IU=;
 b=EM3D5TQTZZoct6zvEwYm1oOBTUH/KmGc88zdr4MqhCEeXZOQ8qWeW862elmQYluDe8
 zx2lmMzt32q+9z5NKS19zKQXivW6mbD3mk3oWAfnQQoaHt/fL4stvCcyAzwZlXQxcQKC
 wWHKJfAOGW0em2ZnOMVBcDVqDiGpn/67TeegMLTatc7gfznhL7oBLKjqUwSS4Qv/GEr8
 p4sKFTnLHdo1euirv2+YIUMyPmE6jZD6vMz3WZAomxqoAHZGfLhki/MGLNYS6I+ta6tH
 5tKWWjn85rRO9xWtRhFGVXUtB/oj+OuvyMD8JBlQkMsYEDNmJWvZzgzcaAc9jdqWg/PS
 XbKg==
X-Gm-Message-State: AOAM533lsp9HQcXgRWePcHRwh0of04zYvaAwHaAmJRWu07LzHE71Yheu
 Hx7HZhnzd9w/EhpTj7utSaHK4r51cWxn1oDSYlKfEw==
X-Google-Smtp-Source: ABdhPJw3DDszILd4fOwSk02DmS3LBF/6L9iWayO0ZEI9oK+oW8u6lCsJSES4QzzosVigXKy0dhQfIFXD4tnEHBmlMEw=
X-Received: by 2002:a05:6512:49b:: with SMTP id
 v27mr11106312lfq.29.1621865507531; 
 Mon, 24 May 2021 07:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210524073308.9328-1-steven_lee@aspeedtech.com>
 <20210524073308.9328-5-steven_lee@aspeedtech.com>
In-Reply-To: <20210524073308.9328-5-steven_lee@aspeedtech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 24 May 2021 16:11:08 +0200
Message-ID: <CAPDyKFqd+ZdPVuFKf-C7ztQp_aH9HOXByq6qwykkdU9Aku3pAA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] mmc: sdhci-of-aspeed: Configure the SDHCIs as
 specified by the devicetree.
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Hongweiz@ami.com, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 24 May 2021 at 09:33, Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> The hardware provides capability configuration registers for each SDHCI
> in the global configuration space for the SD controller. Writes to the
> global capability registers are mirrored to the capability registers in
> the associated SDHCI. Configuration of the capabilities must be written
> through the mirror registers prior to initialisation of the SDHCI.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 48 ++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index d001c51074a0..65b5685f6c15 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -31,6 +31,11 @@
>  #define   ASPEED_SDC_S0_PHASE_OUT_EN   GENMASK(1, 0)
>  #define   ASPEED_SDC_PHASE_MAX         31
>
> +/* SDIO{10,20} */
> +#define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
> +/* SDIO{14,24} */
> +#define ASPEED_SDC_CAP2_SDR104         (1 * 32 + 1)
> +
>  struct aspeed_sdc {
>         struct clk *clk;
>         struct resource *res;
> @@ -72,6 +77,37 @@ struct aspeed_sdhci {
>         const struct aspeed_sdhci_phase_desc *phase_desc;
>  };
>
> +/*
> + * The function sets the mirror register for updating
> + * capbilities of the current slot.
> + *
> + *   slot | capability  | caps_reg | mirror_reg
> + *   -----|-------------|----------|------------
> + *     0  | CAP1_1_8V   | SDIO140  |   SDIO10
> + *     0  | CAP2_SDR104 | SDIO144  |   SDIO14
> + *     1  | CAP1_1_8V   | SDIO240  |   SDIO20
> + *     1  | CAP2_SDR104 | SDIO244  |   SDIO24
> + */
> +static void aspeed_sdc_set_slot_capability(struct sdhci_host *host, struct aspeed_sdc *sdc,
> +                                          int capability, bool enable, u8 slot)
> +{
> +       u32 mirror_reg_offset;
> +       u32 cap_val;
> +       u8 cap_reg;
> +
> +       if (slot > 1)
> +               return;
> +
> +       cap_reg = capability / 32;
> +       cap_val = sdhci_readl(host, 0x40 + (cap_reg * 4));
> +       if (enable)
> +               cap_val |= BIT(capability % 32);
> +       else
> +               cap_val &= ~BIT(capability % 32);
> +       mirror_reg_offset = ((slot + 1) * 0x10) + (cap_reg * 4);
> +       writel(cap_val, sdc->regs + mirror_reg_offset);
> +}
> +
>  static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
>                                            struct aspeed_sdhci *sdhci,
>                                            bool bus8)
> @@ -328,6 +364,7 @@ static inline int aspeed_sdhci_calculate_slot(struct aspeed_sdhci *dev,
>  static int aspeed_sdhci_probe(struct platform_device *pdev)
>  {
>         const struct aspeed_sdhci_pdata *aspeed_pdata;
> +       struct device_node *np = pdev->dev.of_node;
>         struct sdhci_pltfm_host *pltfm_host;
>         struct aspeed_sdhci *dev;
>         struct sdhci_host *host;
> @@ -372,6 +409,17 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>
>         sdhci_get_of_property(pdev);
>
> +       if (of_property_read_bool(np, "mmc-hs200-1_8v") ||
> +           of_property_read_bool(np, "sd-uhs-sdr104")) {
> +               aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP1_1_8V,
> +                                              true, slot);
> +       }
> +
> +       if (of_property_read_bool(np, "sd-uhs-sdr104")) {
> +               aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP2_SDR104,
> +                                              true, slot);
> +       }
> +
>         pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
>         if (IS_ERR(pltfm_host->clk))
>                 return PTR_ERR(pltfm_host->clk);
> --
> 2.17.1
>
