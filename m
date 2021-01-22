Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA452FFF13
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jan 2021 10:27:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMYnT6JjdzDqDl
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jan 2021 20:27:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::92b;
 helo=mail-ua1-x92b.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FzdovL8p; dkim-atps=neutral
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMYn96DqQzDq97
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jan 2021 20:27:06 +1100 (AEDT)
Received: by mail-ua1-x92b.google.com with SMTP id 43so1614674uag.12
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jan 2021 01:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l1OaG7ryvioLgmZ8BmwevSwg84t2pSQg8vMbP0+UiP0=;
 b=FzdovL8pedW1EGTRQAn5/nzwscKjRd9z22SyVGPQQ9V1RYg2rGHC0PnaiCqw4mTrbZ
 xIkeDXRsHnyL3bgoPYVgbcPH1owFWTiHaMTCaz6Ltz5A9owQx3y7yZV8tYoAcBr0czFR
 yUEj0IIoSpbRwoElxpNolfOzbglz6y4y64VlKbHixYwIhnfPH9micI3AwPB4aInHABpH
 GY1R8+rI5lyU24Y+4h59p6x4/jDP2yrBmAyRhnaLhF1FdEERsj5wgZjtnTCr1yJVz+lf
 EBcvS6XVBQ9LNb3T1GwxcmKWrx+Ljh9+KdQa9fz/Qj5ncQtP68hmDLOyj4V13OyciKuy
 k5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l1OaG7ryvioLgmZ8BmwevSwg84t2pSQg8vMbP0+UiP0=;
 b=rvAjLWlEVlY3LODIaA7uV/584pg7nAD4WdEIC86ZD2tXArmPU9BbiOdAAiTDXMRVjv
 GS+GxFxjQyAB8CuPPhKTQenksHL3tDxi2pip791phTYmtXCmWSWoI+npwiXuCeQ2FQQS
 J8Pl5ZX49lem9Fcj5NOSUkLRMQpZ4jczIr1Rdd107jOYOcpGqjETwm/14sP89T9SfFfy
 XjoU65aYnmquVLzOep02LFKy1W6hga2G8FhcbcdFD7Ud5if7oVxrA3CeHT7R9lHfiX3z
 UgFSYmpLQ38SeCoU0A9amQyjnJCZHQzj0o6mwpfAMJH7hzwBskQ1SA8/vA3qf9aBTGgM
 R0Vg==
X-Gm-Message-State: AOAM531iHr3gNCXOhIMClelQK6q8I+fBZKQrdPecOX8h2EWK4JAEh/jg
 8oOv1AxxSoRUawHFKLxNtrEvo0h0jwBR8OR1VnfEAg==
X-Google-Smtp-Source: ABdhPJxGHo6L6iouAbCf6roRPrHn9HTCIERTtLiL2eNSzMh06D8wj3RxbBbFh+YdHQ3u3awZn2dTQI+JIdaaER7XuKg=
X-Received: by 2002:ab0:768:: with SMTP id h95mr2544908uah.104.1611307621937; 
 Fri, 22 Jan 2021 01:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20210122032334.3663056-1-andrew@aj.id.au>
In-Reply-To: <20210122032334.3663056-1-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 22 Jan 2021 10:26:25 +0100
Message-ID: <CAPDyKFoFBoeA0aqnFTNh83QGvb9j6QRwnacXcYFYzKMa_Y9iBg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-aspeed: Fix kunit-related build error
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, brendanhiggins@google.com,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 22 Jan 2021 at 04:23, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Randy found that with the following Kconfig settings we have duplicate
> definitions (e.g. __inittest()) in sdhci-of-aspeed due to competing
> module_init()/module_exit() calls from kunit and driver the itself.
>
> ```
> CONFIG_MMC_SDHCI_OF_ASPEED=m
> CONFIG_MMC_SDHCI_OF_ASPEED_TEST=y
> ```
>
> Conditionally open-code the kunit initialisation to avoid the error.
>
> Fixes: 7efa02a981d6 ("mmc: sdhci-of-aspeed: Add KUnit tests for phase calculations")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/mmc/host/sdhci-of-aspeed-test.c |  9 ++++++++-
>  drivers/mmc/host/sdhci-of-aspeed.c      | 27 ++++++++++++++++++++-----
>  2 files changed, 30 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
> index 34070605b28b..e5edda6c6e60 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed-test.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
> @@ -95,4 +95,11 @@ static struct kunit_suite aspeed_sdhci_test_suite = {
>         .name = "sdhci-of-aspeed",
>         .test_cases = aspeed_sdhci_test_cases,
>  };
> -kunit_test_suite(aspeed_sdhci_test_suite);
> +
> +static struct kunit_suite *aspeed_sdhci_test_suite_array[] = {
> +       &aspeed_sdhci_test_suite,
> +       NULL,
> +};
> +
> +static struct kunit_suite **aspeed_sdhci_test_suites
> +       __used __section(".kunit_test_suites") = aspeed_sdhci_test_suite_array;
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 3b0d381e1215..1446f23a2bfb 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -556,6 +556,10 @@ static struct platform_driver aspeed_sdc_driver = {
>         .remove         = aspeed_sdc_remove,
>  };
>
> +#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
> +#include "sdhci-of-aspeed-test.c"
> +#endif
> +
>  static int __init aspeed_sdc_init(void)
>  {
>         int rc;
> @@ -566,7 +570,20 @@ static int __init aspeed_sdc_init(void)
>
>         rc = platform_driver_register(&aspeed_sdc_driver);
>         if (rc < 0)
> -               platform_driver_unregister(&aspeed_sdhci_driver);
> +               goto cleanup_sdhci;
> +
> +#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)

I would like us to avoid #if defined" in code like this.

Can you instead declare a function that you can stub in case
CONFIG_MMC_SDHCI_OF_ASPEED_TEST is unset?

> +       rc = __kunit_test_suites_init(aspeed_sdhci_test_suites);
> +       if (rc < 0) {
> +               platform_driver_unregister(&aspeed_sdc_driver);
> +               goto cleanup_sdhci;
> +       }
> +#endif
> +
> +       return 0;
> +
> +cleanup_sdhci:
> +       platform_driver_unregister(&aspeed_sdhci_driver);
>
>         return rc;
>  }
> @@ -574,15 +591,15 @@ module_init(aspeed_sdc_init);
>
>  static void __exit aspeed_sdc_exit(void)
>  {
> +#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
> +       __kunit_test_suites_exit(aspeed_sdhci_test_suites);
> +#endif
> +
>         platform_driver_unregister(&aspeed_sdc_driver);
>         platform_driver_unregister(&aspeed_sdhci_driver);
>  }
>  module_exit(aspeed_sdc_exit);
>
> -#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
> -#include "sdhci-of-aspeed-test.c"
> -#endif
> -
>  MODULE_DESCRIPTION("Driver for the ASPEED SD/SDIO/SDHCI Controllers");
>  MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
>  MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
> --
> 2.27.0
>

Kind regards
Uffe
