Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D020273018
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2019 15:40:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45txLq0S93zDqKl
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2019 23:40:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="CHap5r7d"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45txL81pTjzDq6q
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2019 23:40:15 +1000 (AEST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C21C622ADB
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2019 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563975612;
 bh=bhFiWmjAtAurAZfHqqApK5Lonkxgn8fire9Ml19llMA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CHap5r7dpNOxuCl6EvTqQ05n4KT/zogXFk2iFmrGi/sJ97PCi/c3T8RKQMarkAdcE
 2LXGc53Yg2DBDAZRbw0Ozej+4wt3Pc+QO0ArUObG8C4b15cECjDy0LP5QwA106kK+n
 fkXz5fZn4uCQM1SQQsIZ8KwrAluv4shYRwzRs3XA=
Received: by mail-qt1-f175.google.com with SMTP id 44so14466113qtg.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2019 06:40:12 -0700 (PDT)
X-Gm-Message-State: APjAAAXZ31Ivqt1iEDxXGZQVXKxWqGZ5CmSGfOCrCAEJRm5eP7zEGHB3
 JtdbYBRxllLJKt7/2bYOJwbPzagDMEjvyPxZmw==
X-Google-Smtp-Source: APXvYqz8sLIH6MUVejBtheayK4y6FI9z7gtA6QpNEl7sUb8Pwb3fG+kRlf3uBz6GM3u3CxWrCbXWR7M2XCCDu0l0MGk=
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr58656327qtc.300.1563975612019; 
 Wed, 24 Jul 2019 06:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au>
 <20190724081313.12934-4-andrew@aj.id.au>
In-Reply-To: <20190724081313.12934-4-andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 24 Jul 2019 07:40:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLEb3QSLAhm9BsFa+A_Jmgr4gDtV2nUCKkgwwQaMLBk9g@mail.gmail.com>
Message-ID: <CAL_JsqLEb3QSLAhm9BsFa+A_Jmgr4gDtV2nUCKkgwwQaMLBk9g@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed: Remove mention of deprecated
 compatibles
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 2:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Guide readers away from using the aspeed,g[45].* compatible patterns.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-scu.txt         | 2 --
>  Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt   | 2 --
>  .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml  | 5 +----
>  .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml  | 4 +---
>  4 files changed, 2 insertions(+), 11 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
