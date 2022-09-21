Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3567D5BFE59
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Sep 2022 14:50:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXdY60PBMz3c1N
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Sep 2022 22:50:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kQLHGhz6;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kQLHGhz6;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXdXG6kgcz3bcF
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 22:49:18 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id bq9so9734386wrb.4
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Sep 2022 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=F5Aj6UsKXonhXjaCbwszX18YbRfjkPa5U1IrmdLJ2uo=;
        b=kQLHGhz6TByVsMUoQtSqGzC9Gc6weBfXxZgUqnPeF6B+9iyhqtsMtlKJLp01S4SWjQ
         CpoLlS1cA1v9dVJPgWykPwFQz1rCczudnjTMoc+s9EJ0ztBwUv3a6xJhIUKUHKgbZQRQ
         17JnKX7bU0kICHqYMUYT18XiXr1cjdwvmXTeM8HicMtVhkcFh1mOLyQopKe97FYaNAgT
         KB4g+8RaGaw+76p1fD2+L9aNL6xbSUNNieZDO1+hdHowrtxnN38u5SlvA4HQQfMhulyl
         BbeQLNbCqDmgCBbF74WxUWWDccehDfsn1PGvwZOIvjTqjpri5eDxLHUspeUsG5Yg8yFP
         9EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=F5Aj6UsKXonhXjaCbwszX18YbRfjkPa5U1IrmdLJ2uo=;
        b=wYFYeNvMHHIQg1NU2jafhHcxck3atnpb/t7T0zQwNwd7IkSZDCXLkHoluSMxUZy7xO
         j8fvz86yC5VsMGpu0I3RAqEY8f4oKBoUHe30dSgOQSds7hz/dMSOowOuDwjsga4R8aih
         cxsDWocHL6C9WrqonXFAGYO0SJx95VbqjZlahjYBYWNka6zGVz1l6MyxTVc/HLDnH43a
         7UJ+6MYWcC7TtgFUjL708M1+t3EFy2HYgLmfgdS7UpOXtEaR5bKOgfoGZzzPaD+BOhFc
         2CVRs/6/tSxxXhgSIasIQ79LHPLC++o9TdRN3c9zY6yIu/Z5nTd6Jb6yp6Ms0LGyuqo+
         h+7g==
X-Gm-Message-State: ACrzQf2ni1pJS/jNqXHRTwwxJJppnLSN63QoGXqrVs77dG0iTlKGx2Ai
	axvTDigiyVXxIz5q5giiW5oBrEgjAmIEFQJZ9NXnNg==
X-Google-Smtp-Source: AMsMyM5FKzTNmyylU3xPPxJYhH/SCtTxGMS0wL4PqMMujFXMXANNrm34bY1b+dRJoKk9gq76vmB+V1SFcep8mi+/4tI=
X-Received: by 2002:a5d:588f:0:b0:22b:5cc:e1d3 with SMTP id
 n15-20020a5d588f000000b0022b05cce1d3mr7784825wrf.142.1663764553759; Wed, 21
 Sep 2022 05:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220916115602.370003-1-pbrobinson@gmail.com>
In-Reply-To: <20220916115602.370003-1-pbrobinson@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 Sep 2022 14:48:37 +0200
Message-ID: <CAPDyKFr8Y+ChTK2-AdioYr5zYuxx_d-gwUBppGJcR5X7M2+SSQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-aspeed: Add dependency on ARCH_ASPEED
To: Peter Robinson <pbrobinson@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 16 Sept 2022 at 13:56, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The MMC_SDHCI_OF_ASPEED is part of the Aspeed silicon so it makes
> sense to depend on ARCH_ASPEED and for compile testing.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index e63608834411..f324daadaf70 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -157,6 +157,7 @@ config MMC_SDHCI_OF_ARASAN
>
>  config MMC_SDHCI_OF_ASPEED
>         tristate "SDHCI OF support for the ASPEED SDHCI controller"
> +       depends on ARCH_ASPEED || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM
>         depends on OF && OF_ADDRESS
>         select MMC_SDHCI_IO_ACCESSORS
> --
> 2.37.3
>
