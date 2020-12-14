Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F8A2D9B67
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Dec 2020 16:49:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cvm6p3GwHzDqSm
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Dec 2020 02:49:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e41;
 helo=mail-vs1-xe41.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=e31mRl3i; dkim-atps=neutral
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cvm6X0xMtzDqQg
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Dec 2020 02:49:35 +1100 (AEDT)
Received: by mail-vs1-xe41.google.com with SMTP id x26so9223577vsq.1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Dec 2020 07:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KvO0sb07TDmRwegOoF9S5e6D5LMN7XTNc/ZFX2Y5vi4=;
 b=e31mRl3iGwwoztxn7fB1r+7GX+JZDHiFrSDXcuX2noyakj/Rsa2UQvMZSgpkHhDQhz
 /OhDQiCjCYyTS8VKtZPO51Rgh7Qhva7khKek+vh24xQuYnVwLPv79B9BbyCFMu2t9tk7
 9Di2/3UEkPhrsYi5JUKM3sWSJYVOz9n6B+nSrb2CKYY05eOhx8u9eVLPyDizCsz1hZ28
 b5a2lFQN84VYht8a7ZIAyBWqL2voWZ0secptdIDU2brkyUl/fujqriiBs/hPmah1OkR4
 Hipxd9oLz3IIZNxqdFOkWE5EctlepAr41yu5ofxtmW0LMJWSdxmcYjv/iFjIf9AbABPh
 Duhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KvO0sb07TDmRwegOoF9S5e6D5LMN7XTNc/ZFX2Y5vi4=;
 b=Kkn3I3FRd1vwsiMLPTeEutB4gb1VzfLhJKk7d5lDh4oSJc6vBbOrL6rJmjzQxD0Bac
 eZadtpdzGAG/8XqBX1OUsuF0VSL5hczrpJGMboFqXXRA/PF9pqz4NlaZtTr6pA9Fv/hx
 rNGYdS2cAalhuyPQS0R5YkaBNLK9TT8COTmdaeYp0dMF88ZONd1EuEH+xsgyLY/E34Il
 65iL2tLqZJO8vzf7CXYw0bhK1g5WI2nXDSNOkDHZRXC3PFLMOLciWvP8tiG8B9EiUL5d
 rUx9rarfGwBlS8QnkXDemZBkH+T1h2hoLN0r2ARgIdbhG8+vDc94pFTEcC8ATc/fqL1g
 pNrQ==
X-Gm-Message-State: AOAM5312RzQRpf/53CmCFAtqHQIK8mhaMgWObSg0z5iO4VBlPJA++dlc
 tR0we15CYTDkJiVtvtt1IoptOxwY3mJhFu1m9ti7Uw==
X-Google-Smtp-Source: ABdhPJxYosNVAKN1SQj4JiAthUoa5PPHeE6hBjmZW96vQQzREIo27iOk/lOij7ngld6+k7N2O0c2NCLcmIebOV2zyTQ=
X-Received: by 2002:a67:70c6:: with SMTP id l189mr23767784vsc.34.1607960971339; 
 Mon, 14 Dec 2020 07:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20201208012615.2717412-1-andrew@aj.id.au>
 <20201208012615.2717412-2-andrew@aj.id.au>
In-Reply-To: <20201208012615.2717412-2-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Dec 2020 16:48:54 +0100
Message-ID: <CAPDyKFrceNPNz9+88p+mzbYEo-ZqWOwTBWaqycxPr3MQEFtbaA@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] mmc: core: Add helper for parsing clock phase
 properties
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 8 Dec 2020 at 02:26, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Drivers for MMC hosts that accept phase corrections can take advantage
> of the helper by embedding a mmc_clk_phase_map_t object in their
> private data and invoking mmc_of_parse_clk_phase() to extract phase
> parameters. It is the responsibility of the host driver to translate and
> apply the extracted values to hardware as required.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/mmc/core/host.c  | 44 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/mmc/host.h | 17 ++++++++++++++++
>  2 files changed, 61 insertions(+)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 96b2ca1f1b06..b1697f00c4b5 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -163,6 +163,50 @@ static void mmc_retune_timer(struct timer_list *t)
>         mmc_retune_needed(host);
>  }
>
> +static void mmc_of_parse_timing_phase(struct device *dev, const char *prop,
> +                                     struct mmc_clk_phase *phase)
> +{
> +       int degrees[2] = {0};
> +       int rc;
> +
> +       rc = device_property_read_u32_array(dev, prop, degrees, 2);
> +       phase->valid = !rc;
> +       if (phase->valid) {
> +               phase->in_deg = degrees[0];
> +               phase->out_deg = degrees[1];
> +       }
> +}
> +
> +void
> +mmc_of_parse_clk_phase(struct mmc_host *host, mmc_clk_phase_map_t map)

Would you mind to change to pass a "struct mmc_clk_phase_map *map" to this?

See more comments below.

> +{
> +       struct device *dev = host->parent;
> +
> +       mmc_of_parse_timing_phase(dev, "clk-phase-legacy",
> +                                 &map[MMC_TIMING_LEGACY]);
> +       mmc_of_parse_timing_phase(dev, "clk-phase-mmc-hs",
> +                                 &map[MMC_TIMING_MMC_HS]);
> +       mmc_of_parse_timing_phase(dev, "clk-phase-sd-hs",
> +                                 &map[MMC_TIMING_SD_HS]);
> +       mmc_of_parse_timing_phase(dev, "clk-phase-uhs-sdr12",
> +                                 &map[MMC_TIMING_UHS_SDR12]);
> +       mmc_of_parse_timing_phase(dev, "clk-phase-uhs-sdr25",
> +                                 &map[MMC_TIMING_UHS_SDR25]);
> +       mmc_of_parse_timing_phase(dev, "clk-phase-uhs-sdr50",
> +                                 &map[MMC_TIMING_UHS_SDR50]);
> +       mmc_of_parse_timing_phase(dev, "clk-phase-uhs-sdr104",
> +                                 &map[MMC_TIMING_UHS_SDR104]);
> +       mmc_of_parse_timing_phase(dev, "clk-phase-uhs-ddr50",
> +                                 &map[MMC_TIMING_UHS_DDR50]);
> +       mmc_of_parse_timing_phase(dev, "clk-phase-mmc-ddr52",
> +                                 &map[MMC_TIMING_MMC_DDR52]);
> +       mmc_of_parse_timing_phase(dev, "clk-phase-mmc-hs200",
> +                                 &map[MMC_TIMING_MMC_HS200]);
> +       mmc_of_parse_timing_phase(dev, "clk-phase-mmc-hs400",
> +                                 &map[MMC_TIMING_MMC_HS400]);
> +}
> +EXPORT_SYMBOL(mmc_of_parse_clk_phase);
> +
>  /**
>   *     mmc_of_parse() - parse host's device-tree node
>   *     @host: host whose node should be parsed.
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 01bba36545c5..bc4731c9738f 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -79,6 +79,22 @@ struct mmc_ios {
>         bool enhanced_strobe;                   /* hs400es selection */
>  };
>
> +struct mmc_clk_phase {
> +       bool valid;
> +       u16 in_deg;
> +       u16 out_deg;
> +};
> +
> +/*
> + * Define a type to map between bus timings and phase correction values. To
> + * avoid bloat in struct mmc_host we leave it to the host driver to define the
> + * phase map object in its private data if it supports phase correction.
> + * However, mmc_of_parse_clk_phase() is provided by the mmc core and needs the
> + * provided array to be correctly sized, so typedef an appropriately sized
> + * array to minimise the chance that the wrong size object is passed.
> + */
> +typedef struct mmc_clk_phase mmc_clk_phase_map_t[MMC_TIMING_MMC_HS400 + 1];
> +

Nitpick: I would appreciate if we could avoid using "typedefs", as I
think they in many cases makes the code harder to read. How about
doing this instead?

#define MMC_NUM_CLK_PHASES (MMC_TIMING_MMC_HS400 + 1)

struct mmc_clk_phase_map {
        struct mmc_clk_phase phase[MMC_NUM_CLK_PHASES];
};

[...]

Kind regards
Uffe
