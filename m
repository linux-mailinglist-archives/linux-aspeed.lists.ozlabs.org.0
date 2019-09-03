Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F76CA7380
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:16:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGrp25S7zDqDx
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:16:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::e41; helo=mail-vs1-xe41.google.com;
 envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ylEZdt5w"; 
 dkim-atps=neutral
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N9QL40QFzDqXs
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2019 01:11:21 +1000 (AEST)
Received: by mail-vs1-xe41.google.com with SMTP id m22so2971506vsl.9
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Sep 2019 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hFtwKcjhJAcLLvYRWcB0GjH8TlxQpGn6eTjYWs9Yv7Y=;
 b=ylEZdt5wX+4ng+59TTe8Z5AM0jrzsN3AaMEYIMADmVTg11r8Zg8hSdomYSWn5vAtNS
 WdPx+HvtbD0mbkYe04TqreDYO2AwhAlo8DcK5wMufHfP3jzW8OLpbSgh9m2ITtJ/93+C
 IuPbGmZNWPRv2XhykPmlWrr3YsWnKOtgf5nZ/c+/4P8yTxomsVGN95qF4sBUOuGdrlSa
 dUqglLFdIaNNuo1end7siNiC4igj3IxjO3ObKeO6Y+PaKLq7Omf2MD0V81QYibQTHBU3
 romyh0SkZgsXqvo8dIMYuUDydOZSEwQ1DoCBYCk4j5XUpRNtrOV9fAzRqNM5npPZQPj9
 JXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hFtwKcjhJAcLLvYRWcB0GjH8TlxQpGn6eTjYWs9Yv7Y=;
 b=CAD/bNn9xaCQHFHtFoDWXdQZ5q0fjgs/eh4WIJ1a8K8Ks0m6rGyXm86eWZOWvA8R9C
 EIs74fTdzNZjSr5oXhkTapAnWpZGQDnW7dlrqJnHYozcbv5RbEoy6aB1nFZ4k7mpOkuv
 P4zEb1Rd6p0y509rznKanM5GBYv3uCjVXJPr0+7tl2o++cClrjvPR+httfeDqUGCycG2
 Yp1WK1Lr/Xs7mz7bjBIZlpbcWbB5jDRTk7iphupOjZ/JU1pGdMUXHI8ozFOMPsOuc7ub
 8dOV2iEB4oCYXuV1CplxutTib0nvcX6URjJspvGWdf7Y6GGMArSCPt5LJu+dNtH/KIOY
 SOCw==
X-Gm-Message-State: APjAAAVzwXa2qqYvDUtLEff7PZ4bXNSQWOfGZMnf5I1C14/V4L4jCOkj
 uqbbuGmEwxFtWYRzvfQTk3iM5xeT0Wo88RdDydLLSQ==
X-Google-Smtp-Source: APXvYqxpIMYeuIve5wcn6H3G3LreaM9TjDByR/E25jlqIh9Wcl9ULuHLdLtj22DL88uDB10bfQJRFWazPxLWyNi4TXU=
X-Received: by 2002:a67:983:: with SMTP id 125mr13702796vsj.191.1567523478905; 
 Tue, 03 Sep 2019 08:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190902035842.2747-1-andrew@aj.id.au>
In-Reply-To: <20190902035842.2747-1-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Sep 2019 17:10:42 +0200
Message-ID: <CAPDyKFph4C7fCcGYzFp2PwwJsaFvw6a0Do4Vm0uF8mbwD7zUzQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] mmc: sdhci-of-aspeed: Fixes for AST2600 eMMC
 support
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 04 Sep 2019 05:12:12 +1000
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2 Sep 2019 at 05:58, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> I've added a couple of patches since v1 of this series. The horizon has
> broadened slightly with a fix for SPARC builds as well in patch 1/4. Ulf
> suggested a minor cleanup on v1 with respect to handling of the current clock
> value, so that's now patch 2/4. Patches 3/4 and 4/4 are as they were in v1.

Applied patch 2->4 for next, thanks!

Kind regards
Uffe


>
> The v1 series can be found here:
>
> https://patchwork.ozlabs.org/cover/1155757/
>
> Please review!
>
> Andrew
>
> Andrew Jeffery (4):
>   mmc: sdhci-of-aspeed: Fix link failure for SPARC
>   mmc: sdhci-of-aspeed: Drop redundant assignment to host->clock
>   mmc: sdhci-of-aspeed: Uphold clocks-on post-condition of set_clock()
>   mmc: sdhci-of-aspeed: Allow max-frequency limitation of SDCLK
>
>  drivers/mmc/host/sdhci-of-aspeed.c | 62 ++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 20 deletions(-)
>
> --
> 2.20.1
>
