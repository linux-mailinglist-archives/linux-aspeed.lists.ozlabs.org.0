Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA4557A42
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 14:25:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTKG53wnyz3c8M
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 22:25:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZGAwRzzE;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZGAwRzzE;
	dkim-atps=neutral
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTKFL6pcqz3bqk
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 22:24:36 +1000 (AEST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-101bb9275bcso21497205fac.8
        for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qcOFv+gUkOUIJJ72OOZ9NseYxv0LoGb9wAQ/jFJ2Dk8=;
        b=ZGAwRzzE8VL85qRDYfMIvCrIHJkVRiIYei98dO36+lgVyF3FWJUe7hqqUrsTwy639Y
         fc+W8/1hfo7JZohSBn0BmrXgCAuBJ5vCaJB2sAWPRSGsx6O74BR4aBhFhTsdrI8SVpw6
         yHYggGBjd/sq0CYiDjkFfZkeqRUmrn4J7Dg4e7iicPa2yWiHeuY+8e+bLsDAiI4i8pyr
         EV80OclS5ilc1yqKp6AG1B401ALvhV3exYBeb2IeV0OW8rpAFVov8Ge0ATahc3RcmxRF
         4FFQUAnzOwhEN6/m8cyLiVsmXun+S618Er5jfz5mSVTteervSKejh8lx4MtRyhHmQCtR
         ZssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qcOFv+gUkOUIJJ72OOZ9NseYxv0LoGb9wAQ/jFJ2Dk8=;
        b=aNYfEfrONUU5OT44/5RROJgPrMZyLk4mqaClbvtrBBF4KQKHQHmR5y3CJftqTCsDYj
         Yoo3X3ZiLYw9kzFazKD2JsliQrcs4pcDvZeS3ucWxIheV6bakV4oXc0V7ZcQPTzCLU2c
         Ogw1lHWv0IxPk5/E/nSMJYkzJfyu7H3RJlEC313SyDuWXNvDU8ugcZ5XxLB3yXoL0zbS
         XudwN6yxCe6B2iZCd1yP/hiDwPv9gDCf/hhm80kNEfa+4AKnQAB6hsXrbW3BOLhL0fuK
         DDjMyzOUYjdpYxOJDalVBaRhTOjT6w4vw+WydH/Qn8B+AMHKfAalTd3W0py66gmDiiaZ
         Khpw==
X-Gm-Message-State: AJIora9LhsHvt3K2UvKY71+V1Ih7cykqRSgztoJ6hMW1ZXVYHV92nEvn
	Qjj1QsrTQvt1T4Lzd1OCLC7SBXR8YFT03wGHv4HtDg==
X-Google-Smtp-Source: AGRyM1tolYit2qOF13LQll2M1apYzVAPtBssHfNXvX79yFs+qX/QdnWSuZSn9LvvuTfowIJzogE5Gto6i2wMUvkyN5I=
X-Received: by 2002:a05:6870:33a9:b0:f2:c44c:d054 with SMTP id
 w41-20020a05687033a900b000f2c44cd054mr2317236oae.70.1655987073368; Thu, 23
 Jun 2022 05:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220621085345.603820-1-davidgow@google.com> <20220621085345.603820-6-davidgow@google.com>
 <CAGS_qxp6ZK9K0Sy1JcuU-SGqChOyr6-+5HDxgesOpxjxvDkiXQ@mail.gmail.com>
In-Reply-To: <CAGS_qxp6ZK9K0Sy1JcuU-SGqChOyr6-+5HDxgesOpxjxvDkiXQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Jun 2022 14:23:57 +0200
Message-ID: <CAPDyKFq0cTX5pfTLxTa9SEUBiiEcMuiEeDi3OPfMjFuBWca_jw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro
To: David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>
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
Cc: Matt Johnston <matt@codeconstruct.com.au>, Andra Paraschiv <andraprs@amazon.com>, linux-aspeed@lists.ozlabs.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Luis Chamberlain <mcgrof@kernel.org>, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Longpeng <longpeng2@huawei.com>, kunit-dev@googlegroups.com, Mika Westerberg <mika.westerberg@linux.intel.com>, openbmc@lists.ozlabs.org, linux-modules@vger.kernel.org, Paraschiv@google.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 22 Jun 2022 at 00:19, Daniel Latypov <dlatypov@google.com> wrote:
>
>  On Tue, Jun 21, 2022 at 1:54 AM David Gow <davidgow@google.com> wrote:
> >
> > The kunit_test_suite() macro is no-longer incompatible with module_add,
> > so its use can be reinstated.
> >
> > Since this fixes parsing with builtins and kunit_tool, also enable the
> > test by default when KUNIT_ALL_TESTS is enabled.
> >
> > The test can now be run via kunit_tool with:
> >         ./tools/testing/kunit/kunit.py run --arch=x86_64 \
> >         --kconfig_add CONFIG_OF=y --kconfig_add CONFIG_OF_ADDRESS=y \
> >         --kconfig_add CONFIG_MMC=y --kconfig_add CONFIG_MMC_SDHCI=y \
> >         --kconfig_add CONFIG_MMC_SDHCI_PLTFM=y \
> >         --kconfig_add CONFIG_MMC_SDHCI_OF_ASPEED=y \
> >         'sdhci-of-aspeed'
> >
> > (It may be worth adding a .kunitconfig at some point, as there are
> > enough dependencies to make that command scarily long.)
> >
> > Signed-off-by: David Gow <davidgow@google.com>
>
> Acked-by: Daniel Latypov <dlatypov@google.com>
>
> Minor, optional suggestion below.
>
> >  static int __init aspeed_sdc_init(void)
> > @@ -639,12 +620,6 @@ static int __init aspeed_sdc_init(void)
> >         if (rc < 0)
> >                 goto cleanup_sdhci;
> >
> > -       rc = aspeed_sdc_tests_init();
> > -       if (rc < 0) {
> > -               platform_driver_unregister(&aspeed_sdc_driver);
> > -               goto cleanup_sdhci;
> > -       }
> > -
> >         return 0;
> >
> >  cleanup_sdhci:
>
> This goto was added in 4af307f57426 ("mmc: sdhci-of-aspeed: Fix
> kunit-related build error") to allow for this extra call to
> aspeed_sdc_tests_init().
>
> This could now be reverted back to what is
>         rc = platform_driver_register(&aspeed_sdc_driver);
>         if (rc < 0)
>                platform_driver_unregister(&aspeed_sdhci_driver);
>
>         return rc;
>
> but let's see what the maintainers think.

I don't have a strong opinion on this, feel free to pick any of the options.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
