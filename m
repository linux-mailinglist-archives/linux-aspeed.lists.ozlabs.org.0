Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 912DA21B237
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 11:28:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B375d1YMNzDr4M
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jul 2020 19:28:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::942;
 helo=mail-ua1-x942.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bnzvDGU7; dkim-atps=neutral
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B375Q13YvzDr1d
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2020 19:28:39 +1000 (AEST)
Received: by mail-ua1-x942.google.com with SMTP id l12so1614994uak.7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2020 02:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MOW30LWGVGgHDsxnHhurzdv0a/FILHUvG2/DHcNZoI4=;
 b=bnzvDGU7zXPbziIdRdVi4TSs+noharSMJVfDTIbjqh3RuVKK0nJ/VBqVGTnruLQFrY
 vmR4ws08bcS0UMCkkHbGcBXfdnkR+npTr64BVmBubl8z4WwpMcjFUcwHYJj93aKf4FsJ
 QEj9jZ1WNwB+nj5QMKwXZr5B7oVkw9qdSc9ly0GTwz1qV6LcsRGQ/2ge18PSuOSniSZB
 baYZCaXWJFE6BvQl53n3P9QVXZZWmoituUaX997p1PsqkypK8K+4/5bXQk/ECjb8kY+A
 +VprU+YP1ApyUjZlgGBpCkkk++TTfNmGpn+fbjEAKQ+AtAJKQkbxmHKvjlOAHONidE64
 kliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MOW30LWGVGgHDsxnHhurzdv0a/FILHUvG2/DHcNZoI4=;
 b=rtk3WwFhssJmfUyCFudsZuMOYW0LJGXuwEutUkHUAkkdKS+s5AykABnTyK6fuEcbNh
 l4jHrIB84xkamVpflucneAfDF7i6JtThCTfTB/Ckfpr11dy/pvHAzMvro9vXsLnHyJmM
 Pa5c3altfhyXE2UkvsWu/vGxPoqva7ukcuQEuuNXY+CTfkxSXFjRE+0pb6c1ueoviFF6
 PtCkZlYSVtotSNj9MSIKG0ZnjlLaSLXSEHzE9YsW3R/enHB2LY1zbmrd8EDAhqSaGbvG
 fjuMlIv/KF/P+GY75w/aCVwGLr1JFN4QZ1nvNNiFhN/zq2mkpElEsbCrlzwlm04CxFNz
 LF7A==
X-Gm-Message-State: AOAM531+sTfhIWwFPi1UXT6Jp3NvVRgqlcW49a20lLryiVP6GlgxMYlG
 DN9Mv4rdL5i8GZoasjPPgs4FGVELrc9CuqvMlmkY1w==
X-Google-Smtp-Source: ABdhPJy4KIKPN5ob6vqVPh6sGXXql1ac/vvDAf9OLPrZvxX6hts8s3kXcH1N61pqeZYYgTXA6zHbse8yWmaHkz76pWM=
X-Received: by 2002:ab0:4e98:: with SMTP id l24mr17930390uah.15.1594373315479; 
 Fri, 10 Jul 2020 02:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200709195706.12741-1-eajames@linux.ibm.com>
 <20200709195706.12741-3-eajames@linux.ibm.com>
In-Reply-To: <20200709195706.12741-3-eajames@linux.ibm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Jul 2020 11:27:59 +0200
Message-ID: <CAPDyKFrUUfXQmsrXd8TpSxkyq6up1ZRvwYwrWPsSpCibsxJejw@mail.gmail.com>
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

Applied for fixes and by adding a stable tag for v5.4+, thanks!

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
