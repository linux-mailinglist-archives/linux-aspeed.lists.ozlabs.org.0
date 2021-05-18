Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB8D3870AF
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 May 2021 06:29:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkjhT319gz2yhF
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 May 2021 14:29:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=b/QzFYlS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=davidgow@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=b/QzFYlS; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkjhQ3mzfz2yXL
 for <linux-aspeed@lists.ozlabs.org>; Tue, 18 May 2021 14:29:40 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id d11so8563081wrw.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 17 May 2021 21:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IYivGhbkgN/0kOX9moGua2NF+G4pIWkoseKbkugbZk8=;
 b=b/QzFYlSCIrp2x7Ol1KR9fZeYmrh9fuQnORQMISfz94c4LGcCztOQE+joRIa/yDCvm
 S6KZQhefd9EsRZUSyi9v9GDwzs4U/UMjeFz1Q0xM9W3W8q6UAbre3ZSENZKRgKY0qf/L
 OHE6Isb5ZXUK8zDPXLpLv/nQSMqznz4rsAmnfR+ilt9ju4kumWfbm2KIa1+ug3Jm04S1
 cSmQTjvsI35Hauy72QZNRZJ8ZDh+KihfuTUtWWGhY3j4NUkOkh2mGY8J+zj99l6Fm/mg
 EfOQ93cGSGKpLzytWUn5d7vN8Y7xZTxBoV7lO6XHMbA4+vEEeOHinXYmk2nhWOiSkmb1
 /fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IYivGhbkgN/0kOX9moGua2NF+G4pIWkoseKbkugbZk8=;
 b=Vip0o+cCSM8GyrWbZ4PU04+mgaB13fEgrzCZPFvmVPPAlmuLuZJEwta6KgbJDHsJRN
 zfR75xYPZRc0rDIDxNHRAvQLcHgZvxPXGwdvXMLZGebT+9wzHgGjLy9GANY9kFsxOUmh
 7Qay9EZiOAGFQ2xItouiFRQzNv2rFDCaywr/JmDS1pU7j4kg6+aBnxhIE6wraQwsSanK
 dn8Y+67qvaUeg+GG3RdQXgbzbO8BrAbyGO4/263tOvpkuUBW2WsNRYI0jNvEW83qLk5b
 zX4EFeGK/1hQdgmoqfNYeQqm/H3aE3sbkOyen1tYAtc72hTPDXV+JE3MFBt4Q/1vXnNi
 YSaw==
X-Gm-Message-State: AOAM532SO1ngnznYQsrelum561O0Rd+IZH2BOZ3FZJqakLhZBlwAzbiw
 4hVo0LO4ocsyJjjdvoRh85WJvuR/JAr4HQE7DtSWKQ==
X-Google-Smtp-Source: ABdhPJz73C/JeMEY7R3wJhYkQwIiUPW6qbsA6Exu7snYht6lCDkBlkpzGwS739hPzgZX0IvEs+sGHHVFeJ+yjoeM/7g=
X-Received: by 2002:a05:6000:1147:: with SMTP id
 d7mr4151974wrx.302.1621312173995; 
 Mon, 17 May 2021 21:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210513193204.816681-1-davidgow@google.com>
 <20210513193204.816681-6-davidgow@google.com>
 <CAPDyKFoEeRUjHLZ3iSvPT4_0X107G3Xw+ujxJ9zsDk06dTxo7w@mail.gmail.com>
In-Reply-To: <CAPDyKFoEeRUjHLZ3iSvPT4_0X107G3Xw+ujxJ9zsDk06dTxo7w@mail.gmail.com>
From: David Gow <davidgow@google.com>
Date: Tue, 18 May 2021 12:29:22 +0800
Message-ID: <CABVgOSmv6axdgXLPAwb=q0_RRL44Kbd73SLf=UogEM-k7WMNLw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] mmc: sdhci-of-aspeed: Remove some unnecessary
 casts from KUnit tests
To: Ulf Hansson <ulf.hansson@linaro.org>
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
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, May 17, 2021 at 5:23 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 13 May 2021 at 21:36, David Gow <davidgow@google.com> wrote:
> >
> > With KUnit's EXPECT macros no longer typechecking arguments as strictly,
> > get rid of a number of now unnecessary casts.
> >
> > Signed-off-by: David Gow <davidgow@google.com>
>
> I guess you will funnel this via another tree than the mmc?
>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Kind regards
> Uffe
>

Yeah: the plan is to have this whole series go through the
kselftest/kunit tree so we don't have to worry about potentially
temporarily introducing a bunch of compiler warnings.

Cheers,
-- David

> > ---
> > This should be a no-op functionality wise, and while it depends on the
> > first couple of patches in this series, it's otherwise independent from
> > the others. I think this makes the test more readable, but if you
> > particularly dislike it, I'm happy to drop it.
> >
> >  drivers/mmc/host/sdhci-of-aspeed-test.c | 34 ++++++++++++-------------
> >  1 file changed, 17 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
> > index bb67d159b7d8..1ed4f86291f2 100644
> > --- a/drivers/mmc/host/sdhci-of-aspeed-test.c
> > +++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
> > @@ -26,23 +26,23 @@ static void aspeed_sdhci_phase_ddr52(struct kunit *test)
> >         KUNIT_EXPECT_EQ(test, 15,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 25));
> >
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 180));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 181));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 182));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 183));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 2,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 2,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 184));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 3,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 3,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 185));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 203));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 204));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 205));
> >  }
> >
> > @@ -67,21 +67,21 @@ static void aspeed_sdhci_phase_hs200(struct kunit *test)
> >         KUNIT_EXPECT_EQ(test, 15,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 96));
> >
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 180));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 185));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 186));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 187));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 269));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 270));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 271));
> > -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> > +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> >                         aspeed_sdhci_phase_to_tap(NULL, rate, 276));
> >  }
> >
> > --
> > 2.31.1.751.gd2f1c929bd-goog
> >
