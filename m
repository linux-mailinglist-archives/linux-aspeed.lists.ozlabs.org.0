Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CAB0A34
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2019 10:24:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TWyc0cplzF48N
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2019 18:24:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="r+RtCQ+Q"; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TWyR14gBzF483
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2019 18:24:13 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id a4so22710498ljk.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2019 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w49o6bLlxe70T8dk8RcKOKQ6ege87Mzu24iLNFJSi6U=;
 b=r+RtCQ+QSzYgod49oCaqYCkPTh5kZ0t0Sd0c4Z0+s2eYFento9RBH+cJ6oV9udoLxV
 UAOH78eysBB4GLzpWHG+n3DdyMpTG7bjHG3OJeNy+YTbh7rBITWWJ8UHrdYbqbOvjhKU
 wBTdN/oCGKDqPSMGUinbCLXh34ir+lHen6smdbyfGfv6TgiY+CpSyJIftKzl59psWfws
 otcFJcFnELrgNmLbcSAaY3WNMrDE3O2jMbPXOMUIuJikgcaKm6OPJYCvJZrtz4War3NN
 ajFA0ei1LXIJFhOzIOd53cSYdpBzThBf/siT6WVcfCVmFGAVjjLSKvEWboTgzARw8sLQ
 cIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w49o6bLlxe70T8dk8RcKOKQ6ege87Mzu24iLNFJSi6U=;
 b=oo3Mn3+W62EdEes+h4AprLunkBEwL+CGFa7hGCHFRjpU0O6MV38A2T9cJ/0iRFlxZM
 9nrOFtng8Hd35Z0x/pfCKrq0DbML5/r7YmCtE9abAt13QL4pF1YYsYj0DS5TyRmTnknl
 xJQogymYA+gJgJAZW8HrDwXwXeEEUvzQGI1ifF5QYWCISka73a/PZ/xY+FB0P2c1sMyy
 X55Y8g6YmIT5+AYofICl7Qq+rWzZ+hwiCjXk+xR7BVb4NtOeVgHz+DX66ozLGOtXt/eR
 ig9zY4bDceY3UkLH5XVDury8ldxXZgovYz9qDg93wXopYAvkBznRH4blEFarP/pOds6t
 N4xQ==
X-Gm-Message-State: APjAAAWi0ncAH4Gm6nQAWy4gPt8OeOfhODwLGZnzALJynpCFyknd3ivD
 KHegqnKcXLsrSgKN68RkUZbtB/L9y1o7jNkbdv2Dcg==
X-Google-Smtp-Source: APXvYqxJDL4FyhE3BXAv2E4B/4JEGQGPdbnrnZxx+n3oo9L0E7CyQ/g/GKuusfARHUSvwKnun6uC2HwM7AK4drFXwyc=
X-Received: by 2002:a05:651c:1108:: with SMTP id
 d8mr17993431ljo.180.1568276647071; 
 Thu, 12 Sep 2019 01:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190829071738.2523-1-andrew@aj.id.au>
In-Reply-To: <20190829071738.2523-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Sep 2019 09:23:55 +0100
Message-ID: <CACRpkdYW_PX7npB+b1YJ4pfFQNLVOsMx2hpKtntBeHg=C1j-Cg@mail.gmail.com>
Subject: Re: [PATCH pinctrl/fixes] pinctrl: aspeed: Fix spurious mux failures
 on the AST2500
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 29, 2019 at 8:17 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> was determined to be a partial fix to the problem of acquiring the LPC
> Host Controller and GFX regmaps: The AST2500 pin controller may need to
> fetch syscon regmaps during expression evaluation as well as when
> setting mux state. For example, this case is hit by attempting to export
> pins exposing the LPC Host Controller as GPIOs.
>
> An optional eval() hook is added to the Aspeed pinmux operation struct
> and called from aspeed_sig_expr_eval() if the pointer is set by the
> SoC-specific driver. This enables the AST2500 to perform the custom
> action of acquiring its regmap dependencies as required.
>
> John Wang tested the fix on an Inspur FP5280G2 machine (AST2500-based)
> where the issue was found, and I've booted the fix on Witherspoon
> (AST2500) and Palmetto (AST2400) machines, and poked at relevant pins
> under QEMU by forcing mux configurations via devmem before exporting
> GPIOs to exercise the driver.
>
> Fixes: 7d29ed88acbb ("pinctrl: aspeed: Read and write bits in LPC and GFX controllers")
> Fixes: 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> Reported-by: John Wang <wangzqbj@inspur.com>
> Tested-by: John Wang <wangzqbj@inspur.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied for fixes already yesterday!

Yours,
Linus Walleij
