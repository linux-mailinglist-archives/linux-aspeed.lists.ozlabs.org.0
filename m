Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DDB57956F
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 10:42:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnC4s6Kq7z2yQg
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jul 2022 18:42:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=do2BHwMs;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=do2BHwMs;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnC4k3jX9z2xk6
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Jul 2022 18:42:11 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id o7so23560219lfq.9
        for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Jul 2022 01:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wnu/3vIy/EyKk8Ed8D6cTFH8iy5jebDSZ/AanZy9t/s=;
        b=do2BHwMsu7F2Z1rq1MpWG2gqnQ1DcjmoS4NUR8B6n3WDVOaTCFynyNxyt7SrK/HPcF
         eAb5C+TWX4ITxCWjvZyUEut0VRjv/liUxMP9/uqWFoPiH51O9kqVxqdyCF1SKGqwRRYN
         T75oPSUR8mkUZG6aiELNof7Cki7xb4PA43XK3eDIw/ZyPZQ6PdJtVOWsvNDuOFYcudfv
         wE3Yw9zDe2wjbyycIDp/TT4XdalYKTI4MVRyYiJB31jqelmjAXki91jHV2sW8AmSfxvS
         IPYv180w7UDXDdWD/sbn6oD/hRfzAk/2CdPpZMP2QLJcmB0Qc1KD24/VnM7zt68lgAuI
         Caig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wnu/3vIy/EyKk8Ed8D6cTFH8iy5jebDSZ/AanZy9t/s=;
        b=yCLGSGe0RVYkB3S0MGlHMIOrxIP/wJrFumyiozn7QonkBfkUNRbuLqz/JuKp0WR+1L
         62Muq4N/e2VHA+v6Z31oyvU7Rdm6xHL42MKDdVjxo0eqxXyGx9LfVd1fmnHiLDViw36h
         h+mayIbyScvs/+G98MrV3jIxxFc78povGmuNJYGN3E6s8CMwgDlQPepfHqcKQblpVywK
         mTwTiqlelfA4ZF/iL2a8wl+SA49yKmTiry/Pl0Q9YIgEESmpk6NFniowzj5P81jYVbQR
         07Su1kPxge5If9904oBnbmfED4WAy+z5WSUpqBdPA3/tGNZNxG+RG6urKUWWfRG2zQCF
         zWyg==
X-Gm-Message-State: AJIora8eRDgrrn3MtdA5zvWdz2WGRTOEhIOQqADQxkCBAzuVJM+4jPIM
	coy8+gx1kLcKeD/L/JiH7DtesnJKQRy7ltPbhy0vag==
X-Google-Smtp-Source: AGRyM1tIw/nL1JsDz+rLmh9KoRcKXbYbJHhm6a4Q9+Si0H00rIVXplg0s5C+t128uWGdB1HIEC93R143WyiOpvIzb54=
X-Received: by 2002:a05:6512:2522:b0:489:daa9:467 with SMTP id
 be34-20020a056512252200b00489daa90467mr17375016lfb.71.1658220126191; Tue, 19
 Jul 2022 01:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220715040354.2629856-1-davidgow@google.com>
In-Reply-To: <20220715040354.2629856-1-davidgow@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 19 Jul 2022 10:41:28 +0200
Message-ID: <CAPDyKFo0AcNayzJa3SZOS4HX3tSBPT57Z+h8cJ9i56uz5ympRw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-aspeed: test: Fix dependencies when KUNIT=m
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
Cc: linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-mmc@vger.kernel.org, Daniel Latypov <dlatypov@google.com>, Brendan Higgins <brendanhiggins@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Sadiya Kazi <sadiyakazi@google.com>, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 15 Jul 2022 at 06:04, David Gow <davidgow@google.com> wrote:
>
> While the sdhci-of-aspeed KUnit tests do work when builtin, and do work
> when KUnit itself is being built as a module, the two together break.
>
> This is because the KUnit tests (understandably) depend on KUnit, so a
> built-in test cannot build if KUnit is a module.
>
> Fix this by adding a dependency on (MMC_SDHCI_OF_ASPEED=m || KUNIT=y),
> which only excludes this one problematic configuration.
>
> This was reported on a nasty openrisc-randconfig run by the kernel test
> robot, though for some reason (compiler optimisations removing the test
> code?) I wasn't able to reproduce it locally on x86:
> https://lore.kernel.org/linux-mm/202207140122.fzhlf60k-lkp@intel.com/T/
>
> Fixes: 291cd54e5b05 ("mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: David Gow <davidgow@google.com>

I assume this should go together with the other recent kunit patches,
so please add:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 10c563999d3d..e63608834411 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -171,6 +171,7 @@ config MMC_SDHCI_OF_ASPEED
>  config MMC_SDHCI_OF_ASPEED_TEST
>         bool "Tests for the ASPEED SDHCI driver" if !KUNIT_ALL_TESTS
>         depends on MMC_SDHCI_OF_ASPEED && KUNIT
> +       depends on (MMC_SDHCI_OF_ASPEED=m || KUNIT=y)
>         default KUNIT_ALL_TESTS
>         help
>           Enable KUnit tests for the ASPEED SDHCI driver. Select this
> --
> 2.37.0.170.g444d1eabd0-goog
>
