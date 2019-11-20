Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E77F103AA2
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Nov 2019 14:04:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J2vS546zzDqsR
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Nov 2019 00:04:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a42;
 helo=mail-vk1-xa42.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="DZZd0nos"; 
 dkim-atps=neutral
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J2pR4p5DzDqs1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Nov 2019 23:59:42 +1100 (AEDT)
Received: by mail-vk1-xa42.google.com with SMTP id t184so6003942vka.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Nov 2019 04:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mv3ivjIPtynZHdywCSMliDx/clqr1q5FAXmvUn8sv20=;
 b=DZZd0nosT6fMGQa1LrZVBdRXKbdVyqsPindUQS1a1nqo5KvOOvDL6TYkJpiTiwvqJm
 kj/g0mCy/d36pCSmPRACtWRYhBo+puCWySIvVjJkhBdjQlOJX/vdsIwvOFJXKTqWEIkJ
 qilWi7YApsYcUIF/Ghp5HFDBliyzAw2KPYzEBMtEnuPBotdX72kg7XjjLYcdPlzZ6eTE
 mJzOOAhDrtjtwPvojZ3vCHKnUlRdvUb5r2UjPybqDbDV7PKTti/mA0zC4GArhWLwD1pu
 09jXs0Rs4TfHjCztF/mr43pLNjcug2oAeU+TFTbYX8J1siDHLBfAw3ku2nwrQVzY2d3/
 8HkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mv3ivjIPtynZHdywCSMliDx/clqr1q5FAXmvUn8sv20=;
 b=UiHzSq2Uvea6ZEggTI4suLLv31I4HzVeOH5Va2ZUInk7KsvUhlxldCherDUJAeb554
 Gpwg78glw7ITeyt7MnbZIdQTU21bhvXLaw6cUrlxmN2sCvkYDP6Cq++QGm0zMnqf7TrV
 By6kFhp3F0M4WE2nOeghrRveRJY/MDg0bFeJcuaHOlOX9dju9cMfqLwJDbJLJEeIrDNp
 D/CId9DiXSqyoJ7ujKEC5m+dU6f815LM2/oC9X1n0SIWjgngPCvYml1P1qK+vq8Gtc+p
 D/WHbS0rxKRWC2igaC6NI0vIVSlNN9385IIPhboomst9fXWu8SipKmIKJz67I6NnaXTh
 nvWw==
X-Gm-Message-State: APjAAAViatRjA0Gh2lKtFY5Dvzts56Fa7W5gD+jdbO7ufAiUMXYbC2zI
 ZCrrY2tQJt3xC0CPx5Gw7QgmSOUVXnRSxSHYPBb3iA==
X-Google-Smtp-Source: APXvYqxQDALgcQNWwHLSVFVl8w6QJkMBvvg1vKNEOr6M8d/if/KbiPE09YO/XzOrupoT94zbpYTuK0JTffdMAGJDNgk=
X-Received: by 2002:a05:6122:1181:: with SMTP id
 x1mr1311701vkn.25.1574254780111; 
 Wed, 20 Nov 2019 04:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20191118104646.3838-1-i.mikhaylov@yadro.com>
 <20191118104646.3838-4-i.mikhaylov@yadro.com>
In-Reply-To: <20191118104646.3838-4-i.mikhaylov@yadro.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 20 Nov 2019 13:59:04 +0100
Message-ID: <CAPDyKFrshWd1P9dZGTSuU=5P0L6LSPz=v2nn+0SWi3ZZazKrRw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mmc: sdhci-of-aspeed: add inversion signal presence
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 18 Nov 2019 at 11:47, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
>
> Add read_l callback in sdhci_ops with flipping of SDHCI_CARD_PRESENT
> bit in case of inverted card detection signal.
>
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Applied for next, thanks!

For clarity, I am leaving patch 1 for arm-soc.

Kind regards
Uffe



>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 8962f6664381..56912e30c47e 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -111,7 +111,19 @@ static void aspeed_sdhci_set_bus_width(struct sdhci_host *host, int width)
>         sdhci_writeb(host, ctrl, SDHCI_HOST_CONTROL);
>  }
>
> +static u32 aspeed_sdhci_readl(struct sdhci_host *host, int reg)
> +{
> +       u32 val = readl(host->ioaddr + reg);
> +
> +       if (unlikely(reg == SDHCI_PRESENT_STATE) &&
> +           (host->mmc->caps2 & MMC_CAP2_CD_ACTIVE_HIGH))
> +               val ^= SDHCI_CARD_PRESENT;
> +
> +       return val;
> +}
> +
>  static const struct sdhci_ops aspeed_sdhci_ops = {
> +       .read_l = aspeed_sdhci_readl,
>         .set_clock = aspeed_sdhci_set_clock,
>         .get_max_clock = aspeed_sdhci_get_max_clock,
>         .set_bus_width = aspeed_sdhci_set_bus_width,
> --
> 2.20.1
>
