Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ECB8569F1
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Feb 2024 17:49:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zacnJTwM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbLcY1jTMz3dXY
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Feb 2024 03:49:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zacnJTwM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbLbT25xcz3dJ0
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Feb 2024 03:48:03 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so1075338276.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Feb 2024 08:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708015677; x=1708620477; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MJXT4bkQbGQzTXV7k3G659qQ960IV+AKnK8ee7bJMnQ=;
        b=zacnJTwMb6RgQSazkV6OZ/ZJHcbSX/qXbuDtE/UFF+cjNBwE1pSUoMJfCRoxPBfr/e
         VUY6GG3K0HzyrPqRlrA/eja+2HLmZPeJc7krheYqAeRpyc57c5876d6RMNT2ulK/s9D+
         k91m9VyTlLwWUTd0f+sDXSkOB2YI9e2SS8EIgXb3a9VHSnz98r8PJOqZaMVOyN+DxvsT
         Au33sFgXAvFFraS8yqZDK4AmsPSeLKHi809i2KdwMyACIij17rXGyZWxrSQh1wP9DEjo
         fCTutbb9B7BMGLt6t/kMmzxw5PvPMV7pqCxf+Ihua15ViSyOwSCUjG8iJ3QCChJwWmSk
         Li1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708015677; x=1708620477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJXT4bkQbGQzTXV7k3G659qQ960IV+AKnK8ee7bJMnQ=;
        b=bzqlJ7WWvXoSaBgaW1tlLY4I3lK4tsPGP8xvuMsUakhvm9igyt701pXvX46sE6FaKy
         JBi4vTtsRQewvaX0SiLh5INf2/WZsGQEIFLY0hKUTGRsrVnB4W65AJE7CqnRDP8ojfvc
         HdCMpbjRCV3yKWvJ7PgR7K08Kl0xtFgdbn2aCAQoetapHh0i3uS1ELVP4tdO1/sELK8D
         Km0Hbs99KT1Y+W32trAchECyEj/Kq+xUr/WL6WMP/9y7vfoVJ9Cq6d0ka/bQ9IvfQapQ
         La8++Zp3x+XKYDOJ93dtmUNeZ29ld73ne3DAB/v+waQWdW0eaLaEkiat/ZpUSHlsIaNh
         kh7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFpyj0NfUBzAGdU0ZayH/fj1YvHVzU4mtOFEWtBJYPcga1/Gq5BqjyqH3SWVYGIY6oDdRbVDKguY5yW3dt+iNHTTmzDDrTgz1o0dqv/w==
X-Gm-Message-State: AOJu0YzsCLuD2QOlxxc8f5TwADh6EvUp2UbGaIOcn2Z6eLuvQx4fYKKz
	ar576U5CJZfIblOydKyX13wiGyYkhSUwm5N/hFnC/OCWQV9vto84/PYIqE5Vk2s8IJOvFVAxMUH
	fd2uKx4VE994LU3bCCTTXSWVnqfZQdE6M+XFrmg==
X-Google-Smtp-Source: AGHT+IFcEdDxkaV5gl2B0D9rLVsJb+rIMq80f4RxVLr6/cWjMSKXRFW8Ted8UPodyM0dXz2HXXSU8/DgM010QxOPGuc=
X-Received: by 2002:a81:b3c4:0:b0:602:c1e2:c6ee with SMTP id
 r187-20020a81b3c4000000b00602c1e2c6eemr2101425ywh.44.1708015677601; Thu, 15
 Feb 2024 08:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com>
In-Reply-To: <20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Feb 2024 17:47:22 +0100
Message-ID: <CAPDyKFo9NpKSuBnrcOseuD-jDA64CMyRxpH-OUoozOQDYHj1mQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: replace 1st argument to struct device * for mmc_of_parse_clk_phase()
To: forbidden405@outlook.com
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 15 Feb 2024 at 12:03, Yang Xiwen via B4 Relay
<devnull+forbidden405.outlook.com@kernel.org> wrote:
>
> From: Yang Xiwen <forbidden405@outlook.com>
>
> Parsing dt usaully happens very early, sometimes even bofore struct
> mmc_host is allocated (e.g. dw_mci_probe() and dw_mci_parse_dt() in
> dw_mmc.c). Looking at the source of mmc_of_parse_clk_phase(), it's
> actually not mandatory to have a initialized mmc_host first, instead we
> can pass struct device * to it directly.
>
> Also fix the only current user (sdhci-of-aspeed.c).

Is there a problem? I don't see it, can please elaborate.

Kind regards
Uffe

>
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
> ---
>  drivers/mmc/core/host.c            | 4 +---
>  drivers/mmc/host/sdhci-of-aspeed.c | 2 +-
>  include/linux/mmc/host.h           | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index cf396e8f34e9..8b2844ac5dc5 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -234,10 +234,8 @@ static void mmc_of_parse_timing_phase(struct device *dev, const char *prop,
>  }
>
>  void
> -mmc_of_parse_clk_phase(struct mmc_host *host, struct mmc_clk_phase_map *map)
> +mmc_of_parse_clk_phase(struct device *dev, struct mmc_clk_phase_map *map)
>  {
> -       struct device *dev = host->parent;
> -
>         mmc_of_parse_timing_phase(dev, "clk-phase-legacy",
>                                   &map->phase[MMC_TIMING_LEGACY]);
>         mmc_of_parse_timing_phase(dev, "clk-phase-mmc-hs",
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 42d54532cabe..430c1f90037b 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -435,7 +435,7 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>                 goto err_sdhci_add;
>
>         if (dev->phase_desc)
> -               mmc_of_parse_clk_phase(host->mmc, &dev->phase_map);
> +               mmc_of_parse_clk_phase(&pdev->dev, &dev->phase_map);
>
>         ret = sdhci_add_host(host);
>         if (ret)
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 2f445c651742..5894bf912f7b 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -539,7 +539,7 @@ struct mmc_host *devm_mmc_alloc_host(struct device *dev, int extra);
>  int mmc_add_host(struct mmc_host *);
>  void mmc_remove_host(struct mmc_host *);
>  void mmc_free_host(struct mmc_host *);
> -void mmc_of_parse_clk_phase(struct mmc_host *host,
> +void mmc_of_parse_clk_phase(struct device *dev,
>                             struct mmc_clk_phase_map *map);
>  int mmc_of_parse(struct mmc_host *host);
>  int mmc_of_parse_voltage(struct mmc_host *host, u32 *mask);
>
> ---
> base-commit: 9d64bf433c53cab2f48a3fff7a1f2a696bc5229a
> change-id: 20240215-mmc_phase-26e85511285d
>
> Best regards,
> --
> Yang Xiwen <forbidden405@outlook.com>
>
