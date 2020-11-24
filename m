Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD45B2C295E
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Nov 2020 15:24:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgR8w5JqgzDqLy
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Nov 2020 01:23:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b43;
 helo=mail-yb1-xb43.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lVh9DyyE; dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgR5Y4TrRzDqbf
 for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Nov 2020 01:21:04 +1100 (AEDT)
Received: by mail-yb1-xb43.google.com with SMTP id x17so19422476ybr.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Nov 2020 06:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b+WvQJn+RbKkh+kUKZATZKfERFtuz9WNMxrxpGdw4hA=;
 b=lVh9DyyEfKvcpYdLTOBc3Nv7y0XSPVmAax24cS/h8/bJq0VqEJVouyW0BXofj2piQz
 bgOBSfkFkwLeXYcIQcWo/iA5j1semJXlsGSiLQXskciSGm42jWE6AqL7gfMlHdsB5tt9
 N6IpPHvYLlca/szoVbA10P32eVBwV3iSJXKp/P2L/6O+GG2XmnmlS7X4rQF+CiewZ3fI
 Z+NcGQjghI2XAq8KoiMt4jRwIPMTAyMrJZQC6BsD5KANKnMG6ZVpCxXZyCm0qcX/kMMU
 ut+smv0g/SYIcPs9lj1u0xXaNMdZ/vu0oOtca6K1l3OEAR1Lub9HVQ6Vf8r+xdqEBp1/
 hiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b+WvQJn+RbKkh+kUKZATZKfERFtuz9WNMxrxpGdw4hA=;
 b=O27gHlExA3wV5NTSQNq1v0rmSYxNKyOrc6uMLhU15+YYkZt+mOtj2GR/25Y4iFnDyA
 OlaWrUxYNAFJPF1PALC6fiSvcnVSAmjS2lq1/kKiaoLDEPVdqppce8kEQIdZItG1YPd+
 kkgF0xwo6gAQ5XqrzkJfNvh/+IDF2CarOZEiryYNGOkIObxt6HWz5kb9GsZvGiVybfmn
 llPdzazsvJgMom17Mh96LQu/r/w7rieFEbdfnicz7YXinrZejHTu55XJif7wvOqnJOjK
 m808WPrV6etCUXEKwnofHdxSHy3zykppnjeDVLTAb0wADaV1ABl2Hc12bf6Y250+ZWNW
 mWWw==
X-Gm-Message-State: AOAM531znf3xmE8AA9ur9eccezaqcWz5ILyTvCOJalCZsgzCk8gjhYMX
 FYvQwzfV4uRzm9XSxPIZ+Aiiv9KGBngiB1UF51OZPa9mL24JWbo8
X-Google-Smtp-Source: ABdhPJxmk8XhxSo3oGE/to/rjbARVYneX0tkPuRJWkHA+FwhStIlTcIjXRAWqXDBjx8lvAFiCX8YN6mPcudkicwGqbQ=
X-Received: by 2002:ab0:23d5:: with SMTP id c21mr2736730uan.129.1606227174150; 
 Tue, 24 Nov 2020 06:12:54 -0800 (PST)
MIME-Version: 1.0
References: <20201123063004.337345-1-andrew@aj.id.au>
 <20201123063004.337345-2-andrew@aj.id.au>
In-Reply-To: <20201123063004.337345-2-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Nov 2020 15:12:17 +0100
Message-ID: <CAPDyKFrC9vp5gtpFC5L1K17uN059GsJ2zF4f7-_=sFEQ5BBRpw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] mmc: sdhci-of-aspeed: Expose phase delay tuning
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
Cc: DTML <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 23 Nov 2020 at 07:30, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The Aspeed SD/eMMC controllers feature up to two SDHCIs alongside a
> a set of "global" configuration registers. The global configuration
> registers house controller-specific settings that aren't exposed by the
> SDHCI, one example being a register for phase tuning.
>
> The phase tuning feature is new in the AST2600 design. It's exposed as a
> single register in the global register set and controls both the input
> and output phase adjustment for each slot. As the settings are
> slot-specific, the values to program are extracted from properties in
> the SDHCI devicetree nodes.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

[...]

>
> +static void
> +aspeed_sdhci_of_parse_phase(struct device_node *np, const char *prop,
> +                           struct aspeed_sdhci_phase_param *phase)
> +{
> +       int degrees[2] = {0};
> +       int rc;
> +
> +       rc = of_property_read_variable_u32_array(np, prop, degrees, 2, 0);
> +       phase->set = rc == 2;
> +       if (phase->set) {
> +               phase->in_deg = degrees[0];
> +               phase->out_deg = degrees[1];
> +       }
> +}
> +
> +static int aspeed_sdhci_of_parse(struct platform_device *pdev,
> +                                struct aspeed_sdhci *sdhci)
> +{
> +       struct device_node *np;
> +       struct device *dev;
> +
> +       if (!sdhci->phase_desc)
> +               return 0;
> +
> +       dev = &pdev->dev;
> +       np = dev->of_node;
> +
> +       aspeed_sdhci_of_parse_phase(np, "clk-phase-legacy",
> +                                   &sdhci->phase_param[MMC_TIMING_LEGACY]);
> +       aspeed_sdhci_of_parse_phase(np, "clk-phase-mmc-hs",
> +                                   &sdhci->phase_param[MMC_TIMING_MMC_HS]);
> +       aspeed_sdhci_of_parse_phase(np, "clk-phase-sd-hs",
> +                                   &sdhci->phase_param[MMC_TIMING_SD_HS]);
> +       aspeed_sdhci_of_parse_phase(np, "clk-phase-uhs-sdr12",
> +                                   &sdhci->phase_param[MMC_TIMING_UHS_SDR12]);
> +       aspeed_sdhci_of_parse_phase(np, "clk-phase-uhs-sdr25",
> +                                   &sdhci->phase_param[MMC_TIMING_UHS_SDR25]);
> +       aspeed_sdhci_of_parse_phase(np, "clk-phase-uhs-sdr50",
> +                                   &sdhci->phase_param[MMC_TIMING_UHS_SDR50]);
> +       aspeed_sdhci_of_parse_phase(np, "clk-phase-uhs-sdr104",
> +                                   &sdhci->phase_param[MMC_TIMING_UHS_SDR104]);
> +       aspeed_sdhci_of_parse_phase(np, "clk-phase-uhs-ddr50",
> +                                   &sdhci->phase_param[MMC_TIMING_UHS_DDR50]);
> +       aspeed_sdhci_of_parse_phase(np, "clk-phase-mmc-ddr52",
> +                                   &sdhci->phase_param[MMC_TIMING_MMC_DDR52]);
> +       aspeed_sdhci_of_parse_phase(np, "clk-phase-mmc-hs200",
> +                                   &sdhci->phase_param[MMC_TIMING_MMC_HS200]);
> +
> +       return 0;
> +}

If it's not too much to ask, would you mind adding a helper function
to the mmc core, as to let us avoid open coding? Then we should be
able to move the sdhci-of-arasan driver to use this as well.

Perhaps the definition of the helper could look something like this:
int mmc_of_parse_clk_phase(struct mmc_host *host, struct mmc_clk_phase
*phases) (or something along those lines)

I think the struct mmc_clk_phase could be something that is stored in
the host specific struct, rather than in the common struct mmc_host
(to avoid sprinkle it with unnecessary data).

Moreover, we should probably use the device_property_* APIs instead of
the DT specific of_property_*.

[...]

Kind regards
Uffe
