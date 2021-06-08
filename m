Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 825AC39F774
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 15:16:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzrNt6vyRz302f
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 23:16:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Omj0Ojhv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::934;
 helo=mail-ua1-x934.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Omj0Ojhv; dkim-atps=neutral
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzrNn23xmz2yyj
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 23:16:38 +1000 (AEST)
Received: by mail-ua1-x934.google.com with SMTP id p1so11536337uam.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Jun 2021 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=606SEYScY/4Dm3TG2zXGyFR6Ly8KOu4QIRdQzAVRtJ4=;
 b=Omj0OjhvQ++d98yJSdmaXOk1bHCbynHCXQlXQa4ETkUydcSD2yCZsQqwxh76dHd2EN
 NaWVtW1fj9h0vehRKFR5saruc/HSNNc/MPrxxWz/VBlEh3plbcCVVi7mLPc/cdtEMjy+
 E4WWkbPCIAG0+XNmMsGsEqTYJ8c3wLylpNI+N/iJb/Z5KHrVybXjVzqToRgJn3smF09b
 2HequXh1rPYIH1tSjlB9dVMVGB4wH39RIvNrK6DiaQSouBto3Qh+jBRfLayJKOyekeb8
 78E7x9hrCKxO4h4PJFuDyza3nuNy5exKSLnx8qPGVe4Glpd/4Qj0oQJR4JX72hBb4/lu
 rxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=606SEYScY/4Dm3TG2zXGyFR6Ly8KOu4QIRdQzAVRtJ4=;
 b=N8qUywucRk0W1nWigHC3xN/A+XgFtRsYW7jAqx1a0PJ88qmgfrDy2a1ZD7+zOgwntl
 3PHAYCW7GqQ9dy3o8astRHD/YS8FtJ9R5sn83DzzYvFgpi64tqUBiDTvurfppCEqzrae
 XoH1RUwpK8Xt4zHY9gxmdsWlSrCS6YFvj/8FDFzhxpRqhb5THl6wjBWcinS2DCXIxABW
 gU80ihFh8LGGslrSNTFkWu/m9UNx+wIu+KNJ7JbmIHR0rWmdDsuVhKsaHbox3EwAehqU
 Uw1t7EjiF9M1+tLrHnDtuVDkwitv7AoY5DTJjz1zcEzgmq6aRJLURdF/6dSLiPKLqJFb
 dMTw==
X-Gm-Message-State: AOAM532cIuDQ4VOqiTbzXvlMX7AJb9fMIjzTV1QwJGeipuUaw9b2Fvwz
 HPKT+V4b1O3zOc2EC3HXYZ/2aZMAWLkC3UYjelLQlQ==
X-Google-Smtp-Source: ABdhPJz5aZwPNxnntAA8aRpvQS8xefc61/tur00rKpE7jf8yvD/K9Pq7D2dgwSTb802UwSLtR5tTYL3kwFEXhrF2Jjk=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr3216292uad.100.1623158194715; 
 Tue, 08 Jun 2021 06:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210607013020.85885-1-andrew@aj.id.au>
In-Reply-To: <20210607013020.85885-1-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Jun 2021 15:15:57 +0200
Message-ID: <CAPDyKFrqKW9VwEga0bzY+H9Br57RbfXBnxJFP_-rWcfpic-0hA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-aspeed: Turn down a phase correction warning
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Steven Lee <steven_lee@aspeedtech.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 7 Jun 2021 at 03:30, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The card timing and the bus frequency are not changed atomically with
> respect to calls to the set_clock() callback in the driver. The result
> is the driver sees a transient state where there's a mismatch between
> the two and thus the inputs to the phase correction calculation
> formula are garbage.
>
> Switch from dev_warn() to dev_dbg() to avoid noise in the normal case,
> though the change does make bad configurations less likely to be
> noticed.
>
> Reported-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index d001c51074a0..e4665a438ec5 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -150,7 +150,7 @@ static int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
>
>         tap = div_u64(phase_period_ps, prop_delay_ps);
>         if (tap > ASPEED_SDHCI_NR_TAPS) {
> -               dev_warn(dev,
> +               dev_dbg(dev,
>                          "Requested out of range phase tap %d for %d degrees of phase compensation at %luHz, clamping to tap %d\n",
>                          tap, phase_deg, rate_hz, ASPEED_SDHCI_NR_TAPS);
>                 tap = ASPEED_SDHCI_NR_TAPS;
> --
> 2.30.2
>
