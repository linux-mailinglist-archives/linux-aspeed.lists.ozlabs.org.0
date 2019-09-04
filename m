Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C21A7BBD
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 08:33:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NYsy1J0dzDqrT
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 16:33:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::944; helo=mail-ua1-x944.google.com;
 envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ehRWcBqW"; 
 dkim-atps=neutral
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NYsm0qyRzDqkG
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2019 16:32:59 +1000 (AEST)
Received: by mail-ua1-x944.google.com with SMTP id i17so3056192ual.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Sep 2019 23:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pX/GIsxIbo847f+9FXL/2KTOJZD24+9rFmb5WYj6XnM=;
 b=ehRWcBqW/GnnrlLMZcxZ1viX7IZQO1jEB4mYsM9rvT1aBiuak1bsc24ghhQdY1flE3
 vPA2jiJUTn1TxryfeBlRjQ3Zwbs1C3Dunqzz4HZkyEiMl97AvEVyCVEaWjU6YE7yaZKk
 QFgRRsxbYODVVkXzkzv884LEQiuC6CBl0EzykoH6XDI3YiF6P/FItLJb/RwWZ3WBjEm+
 xgLWF+y9fqqIfJu3KwOf92/Px/4TcUs8f/18B1U+7F+oX/+glyXDhD/ZyW6QeKN+5uAF
 8okc6Lt6HMfjAbzd6/HPu9e0mzp/NiTRYkXmdgRsh9M2sq8qaAnaSsbXJHXkYvE0oeO/
 u+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pX/GIsxIbo847f+9FXL/2KTOJZD24+9rFmb5WYj6XnM=;
 b=R3amD0FUHckIeL9acURT3Zmqavvrf/GI9PgjUSIOPUJp7Ne3PsriHbOSSLatCCJXJC
 JdMUnvKTYX+LPEgkH5Ra7BtVg3U7xrkpZ8HCf3fQ4aWr78rSTnhO4OibGUEVDXhmg3Lc
 hTwgoUe7Wtqo7L9LX4uFB+4FpXTPDNNgeDcZMNXvedsnoQGO2zzW5eG8imOWwIKvVv3l
 ch8SGoVqPLUA6Z8cp5UuLmKcOAB0TBN8JbgylnUo0llAQsL6t+GJrb/vzCnSCjJD6To/
 8BwufZ5HL+7oqm/GscH3fCp2gv0+aZuqsuTfNsJ+oV4Byl68qkfGoKqzfldht6H+uFmj
 ls9g==
X-Gm-Message-State: APjAAAVY5RA2vpbMc93LWioYsidPU76v0C7DEmBCY81Cx6NjkQAKrmPD
 anX3544oyJjWUqheRZxdFpQ09udxEz73S+AH4So2vQ==
X-Google-Smtp-Source: APXvYqxLkO4gsK7ntkEBpo/NFXtCvWaI2cOa5+E0oSaexWzXKH/CEQPs/hLtZQ5zTm1z1/mU8QRSrIfhVXyy42mFJDY=
X-Received: by 2002:ab0:6601:: with SMTP id r1mr5047079uam.100.1567578775596; 
 Tue, 03 Sep 2019 23:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190904022120.4174-1-andrew@aj.id.au>
In-Reply-To: <20190904022120.4174-1-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Sep 2019 08:32:18 +0200
Message-ID: <CAPDyKFqj84wm4hHTv4xWMOXpBBi5mkBB8BXJgNFb7-c_YtzpCg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sdhci-of-aspeed: Depend on CONFIG_OF_ADDRESS
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
Cc: kbuild test robot <lkp@intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 4 Sep 2019 at 04:20, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Resolves the following build error reported by the 0-day bot:
>
>     ERROR: "of_platform_device_create" [drivers/mmc/host/sdhci-of-aspeed.ko] undefined!
>
> SPARC does not set CONFIG_OF_ADDRESS so the symbol is missing. Depend on
> CONFIG_OF_ADDRESS to ensure the driver is only built for supported
> configurations.
>
> Fixes: 2d28dbe042f4 ("mmc: sdhci-of-aspeed: Add support for the ASPEED SD controller")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v2 was a series of 4 patches, three of which were applied leaving this build
> fix to be reworked. The v2 series can be found here:
>
> https://patchwork.ozlabs.org/cover/1156457/
>
>  drivers/mmc/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 0f8a230de2f3..3a52f5703286 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -157,7 +157,7 @@ config MMC_SDHCI_OF_ARASAN
>  config MMC_SDHCI_OF_ASPEED
>         tristate "SDHCI OF support for the ASPEED SDHCI controller"
>         depends on MMC_SDHCI_PLTFM
> -       depends on OF
> +       depends on OF && OF_ADDRESS
>         help
>           This selects the ASPEED Secure Digital Host Controller Interface.
>
> --
> 2.20.1
>
