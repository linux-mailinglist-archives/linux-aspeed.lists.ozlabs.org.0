Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F38E139D3C8
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 06:11:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz0Lc2CW0z303y
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 14:11:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=eKsNiSwD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=eKsNiSwD; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz0LT46xxz2yY0
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Jun 2021 14:11:44 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id i68so11878786qke.3
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Jun 2021 21:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hbR25Ey1jYTS5sXaXKkm7NsaVYIVVD2EtITwUZt+jv4=;
 b=eKsNiSwDdQrxODDTUtuA3Uy1ZOpjV0TNA6OQVCt8it1vcmDzH4pXSHCslNNVdqQs6H
 gtXvbWVWqX3fhQ1IQVbXQICfR06Wd1oOm/RbPoR3y5haOeOC1BV0Wc7q6mzp77VZxTyJ
 G/XG14v1FeXw9YdIv+tixboAv/PzlMASCV8FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hbR25Ey1jYTS5sXaXKkm7NsaVYIVVD2EtITwUZt+jv4=;
 b=P1ARE2W7O6TcOTk9PpgLkbV8iScY8jdpYLk2iLFkHCPdEt+pSXE34Dq+CjR1x1UHS/
 SntqVvCapueIcWy7IHiCv83pmYuldeHuG9aAPDxXkWf2xMOOBhIg7uwOWxEjfTMnOIoE
 i/KTqscD7KoRff4h6qGzgST2DGepYpHleEW2/bn/0lhDJBI9ufqx3llO98FTimWq2moK
 idqlx41VfJdvr8Hm8rQZshx72AKii7fSoGuclOSDsaJiptng1hz0psshTLhBbGkpMMiE
 I6ByMiCW5uqguOVkU9DZadx0EOj+sn3pWdBoHKMx6c6xQWDUWEKcTMo26KcNN1nmWc3Y
 S0Pw==
X-Gm-Message-State: AOAM530OytHG7uQTrnG5sim+UiV6yq9HFl+Mu3pc1t5Fiqa5c+PgBztY
 JIub6b7yF1LGUIn9hJhNVMbTlmFlFFdyMT46ghk=
X-Google-Smtp-Source: ABdhPJww3/VFgYyaDmLGX7xYSKpphZ34RO5B4B8KHOZzHIN6EN/Za5WTmJybfY+OvXChMMKumHsWj9EEfDRLcB/9Xp0=
X-Received: by 2002:a37:b404:: with SMTP id d4mr3459096qkf.465.1623039100241; 
 Sun, 06 Jun 2021 21:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210607013020.85885-1-andrew@aj.id.au>
In-Reply-To: <20210607013020.85885-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Jun 2021 04:11:28 +0000
Message-ID: <CACPK8Xc1hKarizpPAWNmx1sHrPTuak0hhwZ4ZO09+iMSR+cmiA@mail.gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Steven Lee <steven_lee@aspeedtech.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 7 Jun 2021 at 01:30, Andrew Jeffery <andrew@aj.id.au> wrote:
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

Reviewed-by: Joel Stanley <joel@jms.id.au>

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
