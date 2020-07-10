Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D2D21B051
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 09:40:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B34hQ05DczDqtr
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 17:40:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::a42;
 helo=mail-vk1-xa42.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=S0F2RZ5t; dkim-atps=neutral
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B34hG3sBgzDqtr
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2020 17:40:10 +1000 (AEST)
Received: by mail-vk1-xa42.google.com with SMTP id m21so1037223vkp.1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2020 00:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HbS7NrT88QQtzei4LIhV4jR15fEzmmczH+EWwTkx0Gc=;
 b=S0F2RZ5t6lwxkw0gw10S2nKQUqUR0kxq+ZFgzWnIqbArWFmnoTIFp2hoE/n9I7TMky
 UYZxYZK76jZwCpPuHolcsFVyPUMHA/+MlyQc3nc9K49PXc1HHJRP2te9zTe7Qx9ZOYXq
 JYZ5feuoHQe7fDKQWVsCTR6dfMeyB+3XY1zkE4ZO72ud1Amar4cIJdogSEFH61EhsRhS
 jUAPqyFz2z0LpzxYyhj+RqU8Luqkw8U373G+XHNw+qKcPlIynK/QTWK3Leeuyfx9nirz
 LsOQU4T9vHmstut2VpQ7BIlLmnsDqTQWC2SnM/4ThTrMvOkcceh/YR6rpBwyTAT5DSlu
 xetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HbS7NrT88QQtzei4LIhV4jR15fEzmmczH+EWwTkx0Gc=;
 b=IRHUGGWSzxN6PH8HWs+ScRbQ9l9GbSZAM/YRRfuaE8fyX9P2S+Z9FC8hT8RKhmdsm8
 Y/PaQBRXxeVGZL7J+S/k/5wUp1lejxqXqX3s3C9wXJFNpR8uu7B4VIELWqZQFdHTW8Ry
 qwgDYYoY+/g0wZ/pis1MqddvWup03IB6zb43QVxczbbdRtva4dfA7UrDREL2N1cUBkmD
 1NoRNsFwz2m3uNi+qXWlx7zxHCrD4zwe95mO+bUAJGGHyco07/bnZqQsB/h29hZRb1Wc
 PQCjdVD8WnDo2lU1QwXlgo6Gc71gIk3E3YUAHOGpciqTMKM4dH2G/gasMVqHbQS5L6Nr
 +Ysw==
X-Gm-Message-State: AOAM532vNT7huI+XLJpJrl2lw8muWV3PMvrZGqW8w+BpjjKzIADaPgQz
 CQFAHnlGis9JTfGbQUsVAJwV103SrLnqCsS9TBtdvg==
X-Google-Smtp-Source: ABdhPJyxAUZLBoe1qaidLdrmiJXsBccoWfh2LWUPQHC4jzlNh6ot1/AAIwVeQsFJQhWrdqZv9UO9vOxkLYbd7WLwQd4=
X-Received: by 2002:a1f:3f0f:: with SMTP id m15mr49715254vka.53.1594366806470; 
 Fri, 10 Jul 2020 00:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200709195706.12741-1-eajames@linux.ibm.com>
 <20200709195706.12741-3-eajames@linux.ibm.com>
In-Reply-To: <20200709195706.12741-3-eajames@linux.ibm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Jul 2020 09:39:30 +0200
Message-ID: <CAPDyKFozpWKt=L_hMh4ymhJ1X+TSK0vUQ5E0vy7j9EowTRywxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: sdhci-of-aspeed: Fix clock divider calculation
To: Eddie James <eajames@linux.ibm.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Mike Turquette <mturquette@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 9 Jul 2020 at 21:57, Eddie James <eajames@linux.ibm.com> wrote:
>
> When calculating the clock divider, start dividing at 2 instead of 1.
> The divider is divided by two at the end of the calculation, so starting
> at 1 may result in a divider of 0, which shouldn't happen.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Looks like I can pick this for fixes, as a standalone fix without patch1? No?

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 56912e30c47e..a1bcc0f4ba9e 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -68,7 +68,7 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
>         if (WARN_ON(clock > host->max_clk))
>                 clock = host->max_clk;
>
> -       for (div = 1; div < 256; div *= 2) {
> +       for (div = 2; div < 256; div *= 2) {
>                 if ((parent / div) <= clock)
>                         break;
>         }
> --
> 2.24.0
>
