Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9695A3039AF
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Jan 2021 11:00:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ2KW5xc2zDq9H
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Jan 2021 21:00:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::931;
 helo=mail-ua1-x931.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PWynW+CX; dkim-atps=neutral
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ2HS0l5YzDqCC
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Jan 2021 20:58:26 +1100 (AEDT)
Received: by mail-ua1-x931.google.com with SMTP id u27so5396878uaa.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Jan 2021 01:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pE2rA9pdzYN1jBerf3WiNVIJAFytpn0jAo9ZFgxO1/M=;
 b=PWynW+CXh4hXQAiqu5QjPRxngJOpBWu8mFFfD1LOUterEjJP2JA3bcmpjyDxfsJj1v
 CxlZ80374cIpax4j4WcF1MhZYkttvyOzEW6oo8S7X9BwVgxxCfBSSUWjBMPZMJzs9PEA
 N660RJ5CFORLMi7jxTE7YVPH1CRRn3Ozv/qDV2pUR6s9MOQd0pOW3S9TH5r1R2kyoo1M
 vSGf3ptxoVDugLJnGO1LhyqQKJp7HxV6iRFqOfZNLAuA29sKSDrublGMOiflxafyVhZo
 lcg1wkryF89SBr5FKK0X+vPIOcjiIocWH1iqYizURpvpd5ZR61qnz63iYdQZVabFx1Db
 TdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pE2rA9pdzYN1jBerf3WiNVIJAFytpn0jAo9ZFgxO1/M=;
 b=dQ2CUNJuEbMXsBrrBtMGQg4ipeVFJ7tX0VaUPadKBL1NNOUW+oFu+P1k3xGW+IMbu1
 9YUhtB5Jhw2tcw8wvr7NP/G/mM2w6zGxomFoJ9zjWDQX+H4i8yq6UhdEvsfDUoki8y0o
 jktWrCY/brbxTwGbgt4LdxgYQFLz7rqkV0zbAoVG8Ze/3uJDRNxMkBbsjUtEzjoEJRne
 NOBCOzHJXCeChGfVFlF+b5D1MUz0Cg052HVb4FSokqduGuV9c56ftOPLTVCIRdNdgGQv
 jYkJB/njWXjd36qAXpln8C2QYTCXCyttVbGiXi03+BqzaRjUlEs3PT9RwUpO0G8p8bC+
 XQKw==
X-Gm-Message-State: AOAM530sX7dyaAMzLZDxQTW0MWRf7ieFuFonRklEyjqbRRjNf2raKTZQ
 pLK4lre6tRasqdvz/9d2d72vCbD5NntVYoa6ZfAKkA==
X-Google-Smtp-Source: ABdhPJyae6ot/tF1YthYUzztpa6Ynp/4MbV/UMtT5N93AAj1C0LLx6XcahAnytC2zAArK4hVwS1/v1d1JNI/LGAKv5k=
X-Received: by 2002:a9f:2271:: with SMTP id 104mr3460350uad.15.1611655103984; 
 Tue, 26 Jan 2021 01:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20210122114852.3790565-1-andrew@aj.id.au>
In-Reply-To: <20210122114852.3790565-1-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 26 Jan 2021 10:57:47 +0100
Message-ID: <CAPDyKFomiPX36kyK9mConSJTpRnbKYZaKiSz5pyKGaTJpNE0-Q@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-of-aspeed: Fix kunit-related build error
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
 Brendan Higgins <brendanhiggins@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 22 Jan 2021 at 12:49, Andrew Jeffery <andrew@aj.id.au> wrote:
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

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> v2:
> * Collapse the #ifdef-ery
>
>  drivers/mmc/host/sdhci-of-aspeed-test.c |  9 +++++-
>  drivers/mmc/host/sdhci-of-aspeed.c      | 42 ++++++++++++++++++++++---
>  2 files changed, 45 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
> index 34070605b28b..bb67d159b7d8 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed-test.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
> @@ -95,4 +95,11 @@ static struct kunit_suite aspeed_sdhci_test_suite = {
>         .name = "sdhci-of-aspeed",
>         .test_cases = aspeed_sdhci_test_cases,
>  };
> -kunit_test_suite(aspeed_sdhci_test_suite);
> +
> +static struct kunit_suite *aspeed_sdc_test_suite_array[] = {
> +       &aspeed_sdhci_test_suite,
> +       NULL,
> +};
> +
> +static struct kunit_suite **aspeed_sdc_test_suites
> +       __used __section(".kunit_test_suites") = aspeed_sdc_test_suite_array;
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 3b0d381e1215..7d8692e90996 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -556,6 +556,29 @@ static struct platform_driver aspeed_sdc_driver = {
>         .remove         = aspeed_sdc_remove,
>  };
>
> +#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
> +#include "sdhci-of-aspeed-test.c"
> +
> +static inline int aspeed_sdc_tests_init(void)
> +{
> +       return __kunit_test_suites_init(aspeed_sdc_test_suites);
> +}
> +
> +static inline void aspeed_sdc_tests_exit(void)
> +{
> +       __kunit_test_suites_exit(aspeed_sdc_test_suites);
> +}
> +#else
> +static inline int aspeed_sdc_tests_init(void)
> +{
> +       return 0;
> +}
> +
> +static inline void aspeed_sdc_tests_exit(void)
> +{
> +}
> +#endif
> +
>  static int __init aspeed_sdc_init(void)
>  {
>         int rc;
> @@ -566,7 +589,18 @@ static int __init aspeed_sdc_init(void)
>
>         rc = platform_driver_register(&aspeed_sdc_driver);
>         if (rc < 0)
> -               platform_driver_unregister(&aspeed_sdhci_driver);
> +               goto cleanup_sdhci;
> +
> +       rc = aspeed_sdc_tests_init();
> +       if (rc < 0) {
> +               platform_driver_unregister(&aspeed_sdc_driver);
> +               goto cleanup_sdhci;
> +       }
> +
> +       return 0;
> +
> +cleanup_sdhci:
> +       platform_driver_unregister(&aspeed_sdhci_driver);
>
>         return rc;
>  }
> @@ -574,15 +608,13 @@ module_init(aspeed_sdc_init);
>
>  static void __exit aspeed_sdc_exit(void)
>  {
> +       aspeed_sdc_tests_exit();
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
