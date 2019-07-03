Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEF95E009
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Jul 2019 10:41:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dvjC0Jw7zDqPG
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Jul 2019 18:41:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="iLSnAFiM"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dvgl3wQVzDqP0
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Jul 2019 18:40:18 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id v18so1465695ljh.6
 for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Jul 2019 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9KQGKN1/JTwYz+i5tykBtO8/dfvkSTRXZ7mV96ulxlo=;
 b=iLSnAFiMtzOcyZkCnNoQdCnKRs/FrQMu9BQk1miyt08q/upQDSxsM5dd/sr+THA+cz
 Ma0puGzE/ZswYwh4FVWRnwkJAgjJiowH28UihrQ5Ew/UvWeQ1X3ci4rGe9jCtXrSXrhu
 VJcSzn2usHUy1hcueneTZAxbX0WIJ/GbSxZcQqCLs5riBu/oyqVMlrHbwbYdGATqrbN6
 XevkFpUuWujEosPpkR/Vjq9lnzSkFDPYZB9dCECqE0OpBr/Bgz2s7iUQBPkcrmFdU3Py
 +LZHudN2XD/KZduddVlkuwmpp3WdxkpwOUshIpl7p6/p7b3bfcWeCi9olwlgW6sw26ku
 wAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KQGKN1/JTwYz+i5tykBtO8/dfvkSTRXZ7mV96ulxlo=;
 b=VVYrvWdJah7UAcBdueRDgdiKsZoCy15ZgFYXB7feRqrLtAwXJ0u4gRbtEHTLmk6L0r
 NwvjZdtvzX/Yjl3/MQX1NnNPgMthuE6bSFOjvX8egDpKogepLYM3oiT1IOT/+vuOXSJw
 bDQFpYAphhNd7qrTm8LYJISThklK7Ufp244xImtqkiN8AyzShQcoC2Y6A6ZAOUydUUZE
 5kYN43eu7FtrSFQp1DYykh9nIo0proJDHC3q+ShOEUkTKinvkknk3uxt8D2/eHXFFdjo
 T0rNiTU5ycUEhK7cbAF4ubwKrp+y+f8HeXDIE3LhJXGp6y0/VeK3hg0cPnZAoUVAdGJL
 QNpA==
X-Gm-Message-State: APjAAAXslWK0ZPrVwK+smQyL4suoVE9jgB0+iT5SXFW9PcivpR5dBMPk
 o0xxOAFZVqQ8yghYtSQJkuK3rtzeGLivtmMB33hxeQ==
X-Google-Smtp-Source: APXvYqwjCAdp2pYFgLkejdEEDh9nRCMtaIIni+TVcrXpKnpbZ14+0z+JW8gDE5GUfqGr6bXIV3oih+tOTO8H8yN1rZI=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr20360931ljb.28.1562143213537; 
 Wed, 03 Jul 2019 01:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190628023838.15426-1-andrew@aj.id.au>
In-Reply-To: <20190628023838.15426-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2019 10:40:02 +0200
Message-ID: <CACRpkdaxiFR3ezt4FzhRxpqc4DYYjsbBeysPUaaQH+_QgYjudw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] pinctrl: aspeed: Preparation for AST2600
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
 <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Fri, Jun 28, 2019 at 4:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello!
>
> The ASPEED AST2600 is in the pipeline, and we have enough information to start
> preparing to upstream support for it. This series lays some ground work;
> splitting the bindings and dicing the implementation up a little further to
> facilitate differences between the 2600 and previous SoC generations.
>
> v2 addresses Rob's comments on the bindings conversion patches. v1 can be found
> here:

I have applied this series, I had to strip some changes of the header
because it was based on some SPDX cleanups upstream but no
big deal I think. Check the result please.

Yours,
Linus Walleij
