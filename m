Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF436AB53
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Jul 2019 17:05:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45p3bm5vRczDqWZ
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jul 2019 01:05:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=robh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="oaUfITiv"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45p3bf4GxjzDqNt
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Jul 2019 01:05:01 +1000 (AEST)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E9032173C
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Jul 2019 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563289499;
 bh=qMHT4LhKbcv+81uzP1b96TgMB2OKJqjrClLOLrRU3oY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oaUfITiv0hgNcoMzLW5x0E3tl1bFDM+0lhBpP6AXrQwJVWslnjSba/YecYFcrrIHJ
 RAs7GpHEICPg/7+qPj5o9FC4PnFzSWAMw+CpiOTO4IQ1JqpquMsCTlhLGhy24nWOjQ
 HYDDRSSPyYlI+2cI5N6rp8YSJpJQNE0bf6WvVQJk=
Received: by mail-qk1-f182.google.com with SMTP id g18so14836690qkl.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Jul 2019 08:04:59 -0700 (PDT)
X-Gm-Message-State: APjAAAWfsj3CvYhJaG9bNKJo6/JtESiZjYzM82GjSXDJ8RshPxkyonpZ
 Mt143I8Y1+x83s9Cw3MQHJczLBe4HBFexDFoBA==
X-Google-Smtp-Source: APXvYqzc1lGEIRKUk6W2DI5gAbyEEw14Pfpx9QFeFOfiGi6kMZ0tKAfX5GbQ1wOWhsE111TtrPjFiaJgvs+cASy4LFY=
X-Received: by 2002:a37:a44a:: with SMTP id n71mr21002339qke.393.1563289498889; 
 Tue, 16 Jul 2019 08:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190715223725.12924-1-robh@kernel.org>
 <CACPK8Xdz98CQzgE2KCjz8eOhPtx=H8jTe1hVT7LvP77U_gGASQ@mail.gmail.com>
In-Reply-To: <CACPK8Xdz98CQzgE2KCjz8eOhPtx=H8jTe1hVT7LvP77U_gGASQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Jul 2019 09:04:47 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+AJDNZ-676iP=vv6G-pjWqBJyZ3bJ26o7i=c=KWbozSw@mail.gmail.com>
Message-ID: <CAL_Jsq+AJDNZ-676iP=vv6G-pjWqBJyZ3bJ26o7i=c=KWbozSw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Fix 'compatible' schema
 errors
To: Joel Stanley <joel@jms.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2019 at 5:17 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 15 Jul 2019 at 22:37, Rob Herring <robh@kernel.org> wrote:
> >
> > The Aspeed pinctl schema have errors in the 'compatible' schema:
> >
> > Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml: \
> > properties:compatible:enum: ['aspeed', 'ast2400-pinctrl', 'aspeed', 'g4-pinctrl'] has non-unique elements
> > Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml: \
> > properties:compatible:enum: ['aspeed', 'ast2500-pinctrl', 'aspeed', 'g5-pinctrl'] has non-unique elements
> >
> > Flow style sequences have to be quoted if the vales contain ','. Fix
> > this by using the more common one line per entry formatting.
>
> >
> >  properties:
> >    compatible:
> > -    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
> > +    enum:
> > +      - aspeed,ast2400-pinctrl
> > +      - aspeed,g4-pinctrl
>
> Thanks for the fix. However, we've standardised on the first form for
> all of our device trees, so we can drop the second compatible string
> from the bindings.

Doing that would introduce validation warnings until the dts file is
updated. So we still need this change until that happens.

Rob
