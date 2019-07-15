Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E653769F6D
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Jul 2019 01:17:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nfZ31hdqzDqVn
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Jul 2019 09:17:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="NciHeA2W"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nfYx72f5zDqTZ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Jul 2019 09:17:08 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id n11so17524722qtl.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Jul 2019 16:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pTNuKPARTwySyUt6RIFwHeD+C8HBpvsST+SWVc23gcE=;
 b=NciHeA2We081hI3Qkgy7AsZ4nH44Dn6IxDoqldO6ifze6wPVXdFKbE8AM5STJCFvLJ
 zAzk1MW5K+j1l8Hw0gXSwU/9hPTUGMVRTKzA8V0temLm9qvAZdpESJ2GASDYsk/AcpMS
 ueOHQEI6JDttZMhdVRPWTHypHdvviexml1ykc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pTNuKPARTwySyUt6RIFwHeD+C8HBpvsST+SWVc23gcE=;
 b=SgOH31fjMSitfoyDRkbxyGEsRXDT7gbXtXbpQZsXGLTGQo+Ba5EpNEzYvDtkCVvj5L
 9L3Ey/HyBvDA5i9M6qarne/qkC8yKiC8UfzN7S1ET0/h6vWuRxR+iSiFYRBcnVyJBJgZ
 H90emBeE8mvFptXELOBHZCnVwNMCjHdrNAoIph18Ai/PtC+jAl/8u1wCbG/8jdabrxMD
 c+g5EAxOEFP6XZi/BWRQmAw1LFgMLDK4WwVj/GA97ui8kyI0HPQVB86WmX+SdzKuykJo
 X3nEkMb5XHAU9y+ggLeyuOXKxAg7P6alAP1XMM5cN0fPMYiFSrV8ctXhtKLeAlivDTgY
 KdKQ==
X-Gm-Message-State: APjAAAV5yhDkuqgqx+3gA4/Wd9M6ZQMuUxHjTh79+dtyoEjydhSbgRp/
 VWrfuWTN3lP7DuFrB8X3W0xwo/DPEyIRj8basdw=
X-Google-Smtp-Source: APXvYqxJc0v4ISkcLVlzLQuZxh/PhnbAl/t86nXT4ZSfAmxjOFMBAbcwYkAY/GLZVXs2nz+WYpc9JkkiXxXZDyNlGzw=
X-Received: by 2002:ac8:2d69:: with SMTP id o38mr20058126qta.169.1563232625324; 
 Mon, 15 Jul 2019 16:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190715223725.12924-1-robh@kernel.org>
In-Reply-To: <20190715223725.12924-1-robh@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 15 Jul 2019 23:16:54 +0000
Message-ID: <CACPK8Xdz98CQzgE2KCjz8eOhPtx=H8jTe1hVT7LvP77U_gGASQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Fix 'compatible' schema
 errors
To: Rob Herring <robh@kernel.org>
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
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 15 Jul 2019 at 22:37, Rob Herring <robh@kernel.org> wrote:
>
> The Aspeed pinctl schema have errors in the 'compatible' schema:
>
> Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml: \
> properties:compatible:enum: ['aspeed', 'ast2400-pinctrl', 'aspeed', 'g4-pinctrl'] has non-unique elements
> Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml: \
> properties:compatible:enum: ['aspeed', 'ast2500-pinctrl', 'aspeed', 'g5-pinctrl'] has non-unique elements
>
> Flow style sequences have to be quoted if the vales contain ','. Fix
> this by using the more common one line per entry formatting.

>
>  properties:
>    compatible:
> -    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
> +    enum:
> +      - aspeed,ast2400-pinctrl
> +      - aspeed,g4-pinctrl

Thanks for the fix. However, we've standardised on the first form for
all of our device trees, so we can drop the second compatible string
from the bindings.

I think Andrew already has a patch cooking to do this.

Cheers,

Joel
