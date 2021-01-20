Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C2F2FD211
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Jan 2021 14:57:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLRtV45V5zDr30
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Jan 2021 00:57:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::933;
 helo=mail-ua1-x933.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YmKwnOpe; dkim-atps=neutral
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLRtG5rrKzDqft
 for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Jan 2021 00:57:35 +1100 (AEDT)
Received: by mail-ua1-x933.google.com with SMTP id t43so7873487uad.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 20 Jan 2021 05:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NQRUNaC5+h0p4y2UVASnStt5pCZ++1OHwy904QFlDOU=;
 b=YmKwnOpeJW4eDGtKIslo97cWH9y3TeYb8DX/Vbu89eB8jz3hfa0yhw37AKWLEUhNWd
 mt3IwgaDym8aJRq9Uz7lV6K8iNHAMwk2fJ+r+8K0olNYvHJzDEyDG4vkPw9y7mkBaGnk
 lH8ym/UWGq5LphZM0VqjKC49dRyr42PaAz8+VR/Uxysqyr68nVD1SSnriakNF2W/xEmk
 8GOjJLQeOgHpw+jxwsd3OmuYxjZrCzbWBa1L/gKkrUlOj7tCITYhgfzlrYTc05H5W2Xp
 LkliuoROmVlBiW6V4n9iDOJEzqerJVNCnmfz/3uGpfFKAgHPHvVD6E2LlwAlmAIWpjN+
 HITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NQRUNaC5+h0p4y2UVASnStt5pCZ++1OHwy904QFlDOU=;
 b=mIrSQ4iq7gcfk2teunBiqTbDbfA0167EIUWRm3jRfwgwIZ7KZnD2VHfpW37ftidhJh
 eDhjuUYtQz4JNBsqEqGmD60s4mcvwxl1DnvqM14F82MVgxFyHcA/yTK3JrQjEioWQTqh
 Be5GgzHW08F7tbGlyTiyH25tArQ6ocTCG1hvpGpFWNP3u+KsmoQn9njt05UFVX2mzHCp
 6iNBld+L7M3uLh8iWunLgwZ2yFvjAHGvzKTURuO/a3hhMM0LC+YruC6oYTHHl58YzXCu
 BgalAxtCtEn3+r0lyHvOi4yiWjMUTSlCMEvKwE/7/64mXqbJkTHRcSzfQ1X86mer++B3
 18ZQ==
X-Gm-Message-State: AOAM531lZV/nYDe0w4wGRNKZRhleSISlus+BXZBJKWkBHOEiVhJfai6X
 iBXprupdYSeO/qO8SHKaKBEToQqcnak+5gx4fUCNlw==
X-Google-Smtp-Source: ABdhPJwMO/0D8TqJK6Fkbz71C7eV0brQdczzonmnmAX0at6juF1yaKbw/I3Yc90cQE95Mkb1cMyQpmukFxP54jUO160=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr5752752uam.19.1611151051471;
 Wed, 20 Jan 2021 05:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20210114031433.2388532-1-andrew@aj.id.au>
In-Reply-To: <20210114031433.2388532-1-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 20 Jan 2021 14:56:55 +0100
Message-ID: <CAPDyKFqBOWLBbAxZNhN5r=qjXTG9+3tX4nT8+Gz+Xbppsxh5_g@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] mmc: sdhci-of-aspeed: Expose phase delay tuning
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
Cc: DTML <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 14 Jan 2021 at 04:14, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This series implements support for the MMC core clk-phase-* devicetree bindings
> in the Aspeed SD/eMMC driver. The relevant register was exposed on the AST2600
> and is present for both the SD/MMC controller and the dedicated eMMC
> controller.
>
> v7 is just a small change to the the kunit testing in response to Adrian's
> feedback.
>
> I've just done a quick build test of v7 given the small change and more
> extensive testing done with v5.
>
> v6 can be found here:
>
> https://lore.kernel.org/linux-mmc/20201218035338.1130849-1-andrew@aj.id.au/
>
> Please review!
>
> Cheers,
>
> Andrew
>
> Andrew Jeffery (6):
>   mmc: core: Add helper for parsing clock phase properties
>   mmc: sdhci-of-aspeed: Expose clock phase controls
>   mmc: sdhci-of-aspeed: Add AST2600 bus clock support
>   mmc: sdhci-of-aspeed: Add KUnit tests for phase calculations
>   MAINTAINERS: Add entry for the ASPEED SD/MMC driver
>   ARM: dts: rainier: Add eMMC clock phase compensation
>
>  MAINTAINERS                                  |   9 +
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |   1 +
>  drivers/mmc/core/host.c                      |  44 ++++
>  drivers/mmc/host/Kconfig                     |  14 +
>  drivers/mmc/host/sdhci-of-aspeed-test.c      |  98 +++++++
>  drivers/mmc/host/sdhci-of-aspeed.c           | 255 ++++++++++++++++++-
>  include/linux/mmc/host.h                     |  13 +
>  7 files changed, 423 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/mmc/host/sdhci-of-aspeed-test.c
>

Applied patch 1 to patch 5 applied for next (patch 6 should go via arm
soc), thanks!

Thanks for stepping and helping with maintenance as well!

Kind regards
Uffe
