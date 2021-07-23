Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F283D3838
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 11:59:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWPtZ3mLPz30CJ
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Jul 2021 19:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J4vXy3Pk;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=J4vXy3Pk; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWPtX2pD5z2yR2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 19:59:32 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id r17so1200097lfe.2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Jul 2021 02:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SpdYc3xSgtWajYNjziQJhjZECPeeHzOqtqZRcb4yQqc=;
 b=J4vXy3PkMvHxHdXmu8xSRDtPSWRGZj4bvC9RE+NDkeFb/PTCBojquyjxYoZngKBukS
 StiIvPkV6z3a4W0B8hsOOpPd56wDC4/LyODf5o51sUjkXGS3ucbtUeYTkr94FeLsZI9I
 d/R2VLKwJQK3bJWZQLXJSN6SLC9IZL6xwfLqxpqKB27esWapnkfxI/ZewCl9USmE1DTo
 kZb5/7oUS8YBZG820r03EGq5+fhpw5hGyE/Qt+x4QpGZ5MjPKM/SHl6GNiSaYRBBDAWC
 bljyLdTixfD+4zsprywxA0yyv73D4hssAtXXAZHB7zNeFMXzeqagJqMleKxY2ih80i8M
 7oiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SpdYc3xSgtWajYNjziQJhjZECPeeHzOqtqZRcb4yQqc=;
 b=sxPPlfrCWKCv87CYV4DNDTWKpW+oGKLBFCJ6bZGn3JjMjjCbrSqTjHtHEeE9JpwWIe
 O2NohBLBRvZCLvHzhc0xz+HmIxYByhYEUJCE4vIuvC3pu+kKSVx48Fs3lcmjUpAKC3od
 Aa951Cnc3P8Mbs0GrUCltQ7vaKEGqV/tV0VRoDGSFXBa9kvEm623w050iWSU6FwQUpwa
 v3zKPcLsZdujAduSKx+DZ5zsJJOgWbZWUdsMby2SR3Ol5TgERarhpwrIC5CZ1NkwnG4j
 ZA85UZ+o/8IJBhatDMk7BWfGqPCp3ZgKWOBs2X59XswsNFLmzJ7DIfG1MfmycL98NO+i
 kmcQ==
X-Gm-Message-State: AOAM533Sg999pZ/j0u8PRL8+/AiBDVPRyRC+rMtBIAifx49FHgTioAuO
 SMKItRoWjlyxU6DX4hq7lf3IZKvj1hHZFTpk8yxu6w==
X-Google-Smtp-Source: ABdhPJx7muHNH1C+xeS6T8GmAgw9HYxGXW+SzTbL9t3ZL9EWXY9r5EfsyJ1gcQxXWpZrxgEPKQxHcPJfogHCjHnb5R4=
X-Received: by 2002:a05:6512:3f1f:: with SMTP id
 y31mr2589495lfa.29.1627034369078; 
 Fri, 23 Jul 2021 02:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <20210712100317.23298-8-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-8-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 11:59:18 +0200
Message-ID: <CACRpkdZh1TW32bqb91+g8OWkXBVDt0vsoObJ6GCX3LL+86_daQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] gpio: gpio-aspeed-sgpio: Move irq_chip to
 aspeed-sgpio struct
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jul 12, 2021 at 12:04 PM Steven Lee <steven_lee@aspeedtech.com> wrote:

> The current design initializes irq->chip from a global irqchip struct,
> which causes multiple sgpio devices use the same irq_chip.
> The patch moves irq_chip to aspeed_sgpio struct for initializing
> irq_chip from their private gpio struct.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
