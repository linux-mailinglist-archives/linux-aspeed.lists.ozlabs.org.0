Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE83A38283A
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 May 2021 11:23:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkDGP60tMz2yyt
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 May 2021 19:23:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wZE8pBAq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e34;
 helo=mail-vs1-xe34.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wZE8pBAq; dkim-atps=neutral
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkDFr5L3zz2xv4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 17 May 2021 19:23:27 +1000 (AEST)
Received: by mail-vs1-xe34.google.com with SMTP id c21so2751414vso.11
 for <linux-aspeed@lists.ozlabs.org>; Mon, 17 May 2021 02:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kzYVzmT+Y8ce2flyvbSSPdmquvI+WpoScVhmf9xFNfc=;
 b=wZE8pBAqeARtQbwh+YWftfz+pAOAl52rdskfYBROlX2BYGzyiP8jIhVMX2ZLlI/5TN
 2h55vokvcNd9L9wocrsTfFNSZ7mvGTPvyT6ydg0YrjKHLTUBuhbjdOqBt6BcYgzbTu4z
 CJC7/JcgyYbA8qJyYy52Qlnrl5Ks8rBSWSII4TJUN/iauAg9QqBcUXZ3Uc46G84x0Wqi
 7EJaqNos/h447r9ZfuhH/fMb87/SWTIRaTqJufYy20AjL2e6KGye9jf84Rmi4O/7MYAE
 1JPV3hD1j6WJmF5EQD0WwU2Wke0Zt5Bbr1TPruhZr+U9SyoLJj18Xh+kzPIbsZqQnpMc
 7cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kzYVzmT+Y8ce2flyvbSSPdmquvI+WpoScVhmf9xFNfc=;
 b=ENv8eJKLiCWuk6IQFMM7XOZSsI2UZBoEHvxBlns1wuBvVFwkYtaMFx9bZNwuUGyfhF
 20TNJ2Epz5Uujiue51HIOltNlqOfM3VtYQeY9NTyFElLkR8qqZmI2/mwGudA1jWbcxUD
 7vNmckoRqJpyVVBodlFUEnzeGk8/7xBnmtVxsowBvEGFfgQuDfj8asMTdN3THMF271Ur
 NbJC7srJe5QVyc2MAEK9ZibaPDImobkvkPoKgFsV8P/RbH6Ezz2nAqhzG70WG2VSkOmn
 svR+dI8S/ANCKa0NzR3LzdO8LhWR8Pd4qhWL7N9UCmdvW1ehmYOFhuKNG5/79ILOi9IL
 6zuA==
X-Gm-Message-State: AOAM5311H2Rd/NV7GBmJIkMSgXhk+vuM9GU7SbBrvJ0ORRBDE4pGpAqx
 mv52b/o8Q5DoapB7ycEIawW6OorPZ6/bN/dDLC/2ug==
X-Google-Smtp-Source: ABdhPJyXKhN5EScVDwjR162oOK33ajPAKsDnGAYw4sYWr1DOTQym8W+LchIR8j6ixX6JvWzsFngChaUy9M79BpaoBus=
X-Received: by 2002:a05:6102:7b4:: with SMTP id
 x20mr3923640vsg.48.1621243403858; 
 Mon, 17 May 2021 02:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210513193204.816681-1-davidgow@google.com>
 <20210513193204.816681-6-davidgow@google.com>
In-Reply-To: <20210513193204.816681-6-davidgow@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 May 2021 11:22:47 +0200
Message-ID: <CAPDyKFoEeRUjHLZ3iSvPT4_0X107G3Xw+ujxJ9zsDk06dTxo7w@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] mmc: sdhci-of-aspeed: Remove some unnecessary
 casts from KUnit tests
To: David Gow <davidgow@google.com>
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
 linux-mmc <linux-mmc@vger.kernel.org>, Daniel Latypov <dlatypov@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 13 May 2021 at 21:36, David Gow <davidgow@google.com> wrote:
>
> With KUnit's EXPECT macros no longer typechecking arguments as strictly,
> get rid of a number of now unnecessary casts.
>
> Signed-off-by: David Gow <davidgow@google.com>

I guess you will funnel this via another tree than the mmc?

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> This should be a no-op functionality wise, and while it depends on the
> first couple of patches in this series, it's otherwise independent from
> the others. I think this makes the test more readable, but if you
> particularly dislike it, I'm happy to drop it.
>
>  drivers/mmc/host/sdhci-of-aspeed-test.c | 34 ++++++++++++-------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
> index bb67d159b7d8..1ed4f86291f2 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed-test.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
> @@ -26,23 +26,23 @@ static void aspeed_sdhci_phase_ddr52(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 25));
>
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 180));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 181));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 182));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 183));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 2,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 2,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 184));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 3,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 3,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 185));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 203));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 204));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 205));
>  }
>
> @@ -67,21 +67,21 @@ static void aspeed_sdhci_phase_hs200(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 96));
>
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 180));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 185));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 186));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 187));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 269));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 270));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 271));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 276));
>  }
>
> --
> 2.31.1.751.gd2f1c929bd-goog
>
