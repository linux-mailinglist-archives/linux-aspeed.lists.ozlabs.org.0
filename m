Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8D7824B
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 01:15:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xdvY55z1zDqRp
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 09:15:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="mecH4Vht"; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xdvS23xvzDqQf
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 09:14:57 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id y17so32127423ljk.10
 for <linux-aspeed@lists.ozlabs.org>; Sun, 28 Jul 2019 16:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uqbaLb+DoYfmkQkeju/D4dfpefzvGhqE/NA7IyXYHDs=;
 b=mecH4VhtykhjOehOVm7m8Pa5YP6LbhZHxuLFQA2XocGjWKuVwaUD5JKujEe9aVixYW
 cawoMpzpCuo6PsH/Y5+Y7tXwV3d7SoDRDfjjcoukQScCk9CzzHAMPo1pS4yrzvyXmqyJ
 2yMjXxSUUQvzemHru0Os3ufWRvyApCPQMYjePIqEYdIr8dqIpeHbncxd/W99X2KbFg2j
 jbwANzOROhAvP10F0iLcxqbviHMgDbZ6aAMO7bHOLzMbrE+YgCLY6qUQqtoboNujm0Gj
 U73hnvjkMlVYKlUDbpdLF67Z+MpbkHJo3vfCQ+e8YPRfhiYgmC3LZ5+TDpH4eiTfU3zX
 7Iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uqbaLb+DoYfmkQkeju/D4dfpefzvGhqE/NA7IyXYHDs=;
 b=Zdd2fUKpJYuejB+eTC7RDhe+Krc6GYVlUIqoXS4P+g+/9tnDE9CCduuR1/48+5F/UM
 MEH+KsYvXVNUbpJoWBkHbvpFGpC2KzyJnIzKDFCJbrBiX5AsjEqt8x7EU69S98WgKwKE
 IDFAXcdYLXbO3GheyEd+E+qfXwuuvXRTHO1kc2Y5JFb5MngUrmmw/Yz/3cKpgiC1fxqR
 6wRGYiaKY+34OK5p5v0uRkzadj9b9wBgeSCRo8yXxrw/S7p11eWCGi2iiv6+roQxS+q1
 PJVR4+pXa0y1ZlDD5kOWAx+UcckJ+r4OmCObxjIGvj2WhG+oqjZOYd9NWPZQCiWTCXOy
 XQxg==
X-Gm-Message-State: APjAAAWp1bAyEv0YNV2u5zy7KJMFyBAATJ6JmssRvsad2wQLUMc0zBLb
 ZEZn83zgmVKda3kk+BPV//W2a4lEnb2ixUX+W3ocIQ==
X-Google-Smtp-Source: APXvYqxZn/ye7KzmbCXTelv16sXPVMTT2jnKOOv6eVhlkoDzFB17aRJoEaL7U1kzdaeMP7q7K+fcGcM99btdobKE65w=
X-Received: by 2002:a2e:9593:: with SMTP id w19mr8822011ljh.69.1564355688739; 
 Sun, 28 Jul 2019 16:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190711041942.23202-1-andrew@aj.id.au>
In-Reply-To: <20190711041942.23202-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 Jul 2019 01:14:37 +0200
Message-ID: <CACRpkdb4pEdPHbo=3+fJXe9WG8K7A2_xVMtKWCJCfEawDO5wBw@mail.gmail.com>
Subject: Re: [PATCH 0/6] pinctrl: aspeed: Add AST2600 pinmux support
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
 linux-aspeed@lists.ozlabs.org, ryanchen.aspeed@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jul 11, 2019 at 6:19 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> This series adds pinmux support for the AST2600. Some more rework was required
> on top of the previous cleanup series, but this rework was focussed on
> supporting features of the AST2600 pinmux rather than fixing issues with the
> existing infrastructure for the ASPEED drivers. Due to the dependences it's
> based on top of pinctrl/devel, so should avoid any more SPDX issues.
>
> ASPEED have been testing the patches on hardware, so even for an initial pass
> there's some confidence in the implementation.

I'm unsure if I need to wait for the DT bindings to be fixed on this
series?

Yours,
Linus Walleij
