Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 438C555400B
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 03:27:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSQjH16lLz30Bl
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 11:27:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=epbu3P3c;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=dlatypov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=epbu3P3c;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSHyg3znHz2ywc
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 06:23:23 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id g25so29821799ejh.9
        for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Jun 2022 13:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MhJQcMlSnFoacV2KwcdFXpjtba+IaB/sZyuFW7tBT+c=;
        b=epbu3P3cY++CvsJWFX9rqxwKCIZ1HaftiAiLiPKOBX/SuNxREsfwYANixXlw73aJoD
         YeSiKTf/2tQl+U/ndTBwzMKwyRcfRbfGJQYyCGQheC+iSe7QGhr+yOInJxXAPDdgxMwn
         8azIXpbuQbkO2keBtOuDV5cOiHCaZ2eHLPSofuGcChQDzjNB37jSujXaFs/efxWfjhPa
         5ccm25uoo7LlIhqoL2UDRepNfaqqo2EQqIU2Sc/EGRhbcViiNdLTtWAr9ggYGWqdv6OH
         nEr/og2fbKcTY/8Uj3GZ6+T6IxWfFROA8Z0i5HxCY9NvKeXQcb7A6FR6NarbeSee6hC2
         ahmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MhJQcMlSnFoacV2KwcdFXpjtba+IaB/sZyuFW7tBT+c=;
        b=Qg0kYKqxB4RbiuCClgdopejZdw1Aa0vGPpbKlKUo8Ic9Onsd1igaxX7kpdHzWh07hx
         sIvPukUhao+8irffDmDtbMY32BYxiQBlcIAS2eIyDNIZJ4FRdpSWpaz03vc4wWn/96Yb
         TFUR3J2WLYI7+UP53b3YvUlJH+6O3d02+2YGNslq9NEs/rJFEswLgoTK62yCz/YtfdLR
         vy8gTHNCx7pVmuG1J1YSUm71dZDrB+WkRnfqk2QQr8SBAaBQDkc0PH5SoLYTdcUlbKtA
         iSinyApEs+xgAtHItHtyGcfnPz99lc3afFhqkpXKqhaKGLyboTrkNkTxkg6i0JyFZyDl
         klIA==
X-Gm-Message-State: AJIora8Hl0NZUuYAsNMaYKKIZxnhwYHZtdbxLO6jkI2N2DhcKh56PU0P
	JnmqlcWDMvCUC2Y1advHAtx7ziZn3MIIQ0gaoIlRsg==
X-Google-Smtp-Source: AGRyM1syldNCsF4yTG1CqNeyR+d//+kPIDUAn8FkfXpI6Ib8/JA3UGUsecd0zG+9GJgtedGAH6mxDaNCH8juW6fW3Jg=
X-Received: by 2002:a17:906:c193:b0:718:d076:df7 with SMTP id
 g19-20020a170906c19300b00718d0760df7mr28212396ejz.358.1655842996119; Tue, 21
 Jun 2022 13:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220621085345.603820-1-davidgow@google.com> <20220621085345.603820-4-davidgow@google.com>
In-Reply-To: <20220621085345.603820-4-davidgow@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 21 Jun 2022 13:23:04 -0700
Message-ID: <CAGS_qxpXkTZiebd=zqJTY8wvSs1TuBvBuDdxYkPEjwnkQ+ir2g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] thunderbolt: test: Use kunit_test_suite() macro
To: David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 22 Jun 2022 11:24:23 +1000
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

On Tue, Jun 21, 2022 at 1:54 AM David Gow <davidgow@google.com> wrote:
>
> The new implementation of kunit_test_suite() for modules no longer
> conflicts with module_init, so can now be used by the thunderbolt tests.
>
> Also update the Kconfig entry to enable the test when KUNIT_ALL_TESTS is
> enabled.
>
> This means that kunit_tool can now successfully run and parse the test
> results with, for example:
>         ./tools/testing/kunit/kunit.py run --arch=x86_64 \
>         --kconfig_add CONFIG_PCI=y --kconfig_add CONFIG_USB4=y \
>         'thunderbolt'

With this, we can maybe revive
https://lore.kernel.org/lkml/20220214184104.1710107-1-dlatypov@google.com
by tacking it onto this series if a v3 goes out.
There is the open question of whether we should put UML-specific
config options in the file, though.

If we decide we don't want that, then we can defer it until I send out
the patches for "repeatable --kunitconfig" and we can add the
uml_pci.config file.

>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: David Gow <davidgow@google.com>

Acked-by: Daniel Latypov <dlatypov@google.com>

LGTM.
