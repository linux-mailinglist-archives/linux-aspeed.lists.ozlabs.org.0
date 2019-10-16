Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A18D8F42
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2019 13:20:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tVFc4LmTzDqM6
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2019 22:20:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZE6OEgnZ"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tVDm6lYnzDqXG
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2019 22:19:20 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id r22so17163229lfm.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2019 04:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1AlVFzVNzLFhybDABbQIP7y9fwuWZqgdiTuBdrVDMgU=;
 b=ZE6OEgnZ8yrNuwOpjQUl1DrdrhOJcU/OfJQ+UWAJV5VSuBLt4kobSn90ZvkwKhz3/W
 DmWuNa8o4L6xpUpEA32J5Ft1QTqgjgdu1dbOpgk5naABVzkOtVTLGgWzYWNTzQ0WgTbb
 Y5niXn2s+/QyNMl5FrZPP125aQ4QKxA3TA4Lw+iuOCQIhfIOlJhBFdeOJIR1GZ+oDqDq
 hCnZiK17J2nBsS8Ybej2tVBY0I7+6EKSRi0R6PvzZFSb1ptl6XnMGK+lHRNew2QPY1xJ
 KNOCbpWsHgotFI3zRLMVcXg5iQytMnF3Gq7qsWWyjGRj8Jo3TTknxKUco7I816TsaM43
 NMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1AlVFzVNzLFhybDABbQIP7y9fwuWZqgdiTuBdrVDMgU=;
 b=r2qWLG2hqUi9ElFMd5Oo/qJ3SaG4OUiYF5J4IGpBbnMxr32lzMcniQSKkZcYaIaD7a
 Me4beL+7F/1FVKOP5ZCK7puy7qF4itKr+UBwKXUglMWBVNA22WeExLsQX+EMf+J6YvFi
 JfxlGDoCZD1HTq+88yG0UUo7aIM9jZ1ul9ugaa5Gr1ahKKFDAXQJGgd/UDycL1HpRMnV
 1mALdgsIDV0W6x3OTnakHR3ASHLUwoeKqy9aRkBIYjprUM7B8bPBEPoFpBM+6gMs1j8/
 X2ZGuIK6KClX363B7+01Wog6Js5eolMscSWUpvqFtqGNWF//C6xH1pQqUIJ2NoSoAgbn
 esbA==
X-Gm-Message-State: APjAAAUNoR4Ts/hcgmePDelDXxt2jpZI1D0rGo2y6jhrCcD7wqGj2yTw
 o6pdROk5Z1kPx+Xr6WIvS3ZBTl6jeE8kNlTwDHx9dQ==
X-Google-Smtp-Source: APXvYqzpMNbiy51j6vtkjPuuhusjbti4CJFbH8pcmfYvGpawltJmnzSIwtrjLRWD8kgfIxeJjRT4UBofz6S6sUNLEa8=
X-Received: by 2002:ac2:4345:: with SMTP id o5mr4806342lfl.60.1571224755662;
 Wed, 16 Oct 2019 04:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191008044153.12734-1-andrew@aj.id.au>
In-Reply-To: <20191008044153.12734-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2019 13:19:01 +0200
Message-ID: <CACRpkda5cWaA7R3XzyiERCCgwUrjnXd+wCBeKvt-wtjex7wNDg@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: Fixes for AST2600 support
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, johnny_huang@aspeedtech.com,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, ryanchen.aspeed@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 8, 2019 at 6:41 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> This series resolves several issues found in testing by Johnny Huang from
> ASPEED, who also contributed the patches to fix them. We'll have more patches
> from him in the near future (which I'm pretty happy about).
>
> The major issue resolved is the way I grouped the eMMC pins. What I had was
> ugly and I want to get rid of it before the binding is solidified with the 5.4
> release.

Should some of these go in with fixes? All of them? Or just some?
I applied them to devel right now (for v5.5).

> The remaining fixes are minor issues that stem from lack of documentation or
> understanding on my part, and at least one brain-fart.

Do they need to go in to v5.4 or not?

I need a shortlist of anything that should go into v5.4 if anything.

Yours,
Linus Walleij
