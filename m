Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF54589355
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Aug 2022 22:36:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LykCN5Pr0z304x
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Aug 2022 06:36:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ig8uG7D7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ig8uG7D7;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LykCF0JdDz2xGV
	for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Aug 2022 06:35:51 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id j8so8212161ejx.9
        for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Aug 2022 13:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Ut3pi8cayU++0GSGO54GljP1BR6nTHkf4mesrBKLYYA=;
        b=Ig8uG7D7SQeo3AQ8b8GvGsJyHUlyGNbXrjLnJsGssVXhbRpS9Uhnjw1fcV0EkPhRXO
         takrvQM5C1AuVQiSbWmBKV/dbWhOzBYicDIuZBssniivGUViQ5aAJk8/5g5+RLJoQ+4u
         ESp/lyA1Y0abiRNY6EyVarzn1Xw6U+CGh2cuUhvJfgrU1D9fhswRbarZ2jrGdUrVJf84
         gfEl4QKSLvRePRYhGb5YGqc10Ihrv0FShrARKau4lFvB1u0FUt42chEClh5Vh0L47j3R
         oDxH/Oibm2MTwlKqCLtbP/hC4/q5G6lWtrmZaafX9cDqJjkX1pzz8kOpdU3mCKJyEE0b
         +hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Ut3pi8cayU++0GSGO54GljP1BR6nTHkf4mesrBKLYYA=;
        b=rVpBSvfIfBv/GGXScCK8hcPLND7GAc1NKNZddCPvWRJnEAfRsN64vZyd0/iC3wSDUj
         HaORz15ZzWn9jRkkov7Hv63z9g36DJuGfSfLGqjYIYYONxdPhiasilmGqHG1MTC7K2jJ
         KLA9+LNjw0PIaqqdq+0EddpsgGT4NP2hnQ5+M6qb9mtwJrs6JKIStebcWXB+IHebyWaP
         EusmWnk/U/lKmv4zZACeq791Npqt/My+Hvr9dhhJm8m4QBmtLvz1pVP4bnNsigw47cXF
         NE/T1VhBrlObgxf/HG7OvDaBmBhKyAFSvd5ygceOx/JL0ohqlouDKHkygInrf38Hlh7M
         IJKA==
X-Gm-Message-State: ACgBeo2I6wAJJWJMNScYVngqhWElzMyIJ03wDvbQIWTlEX0nMpluXGxY
	KFy0KcKiptBnMU38qib7SmBi0STRa2EalLPNoqq0xg==
X-Google-Smtp-Source: AA6agR4rci+47W6uIwtnAZ4XTxeilLBmi8neIg2vdL5uiCYrUmfa+mIzMW+SHI5G4zdbCyQxdDEp36YqTxz6Ne0Xmo0=
X-Received: by 2002:a17:907:9726:b0:730:9e04:f738 with SMTP id
 jg38-20020a170907972600b007309e04f738mr8431225ejc.631.1659558944675; Wed, 03
 Aug 2022 13:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220715040354.2629856-1-davidgow@google.com>
In-Reply-To: <20220715040354.2629856-1-davidgow@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 3 Aug 2022 16:35:33 -0400
Message-ID: <CAFd5g44h5viRSA_CU=4A0bPyj8yxQ8KgEVHKb=-JZENQwaGEnA@mail.gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Daniel Latypov <dlatypov@google.com>, linux-mmc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Sadiya Kazi <sadiyakazi@google.com>, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jul 15, 2022 at 12:04 AM David Gow <davidgow@google.com> wrote:
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

Acked-by: Brendan Higgins <brendanhiggins@google.com>
