Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C28254D0D20
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 01:57:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCH464gkrz30hh
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 11:57:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.182;
 helo=mail-oi1-f182.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCH425twqz2yZc
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Mar 2022 11:57:38 +1100 (AEDT)
Received: by mail-oi1-f182.google.com with SMTP id q189so1589054oia.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Mar 2022 16:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gq59UE3cTSs3qNXLzpjqXYkCpDSstIwAsqV4QUkUf5U=;
 b=nj6Ac0hW2ZwL6U6y23OYtUgIQK1dHWOvFBu/3PBOyRXIxKiy2/1CLYjc3JzI5JeWSm
 IAUZ7mObnLnZzi7UD/XIePS/zLo4GZ3EJ8R+5DYJD30Nw1or6D3Yabxx9Av6ESajZHzR
 U737bPGeFd6OBERipJorgxTA1g8bUSYgj6PBVUrMa/lSUFMq0M+KiqkeQxzWn+CTZuUz
 /gg5KTgIJrnx0YFWDm1WDG1Zv9a0UEH2xKdVP9V9rMO4xb/Jo80Ne0kdDuVP146TsdiJ
 K4lRf870G6tkR1KbbiqbBVzvpX+iPJ7vXgPmckwSAwUP8SUVWNBp3NVL27JZodqL1rAS
 HskQ==
X-Gm-Message-State: AOAM531h1aBjpRONcFJu030GNMZPXj3FNAK7xE8nsiJcZFWjJ4cnTMDp
 9XMVi/mnYign/V3v3dmD2Q==
X-Google-Smtp-Source: ABdhPJyNzfmC3eXDfqkGUdgxXQi9iFr9d6NGbT86dkIYFRYjW7BxPs5o55rCdVmWsq7DztwRgxOOLg==
X-Received: by 2002:a05:6808:169f:b0:2d7:9bbd:ae82 with SMTP id
 bb31-20020a056808169f00b002d79bbdae82mr1085492oib.136.1646701056249; 
 Mon, 07 Mar 2022 16:57:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05687072c200b000d9ae3e1fabsm6217940oak.12.2022.03.07.16.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 16:57:35 -0800 (PST)
Received: (nullmailer pid 3606977 invoked by uid 1000);
 Tue, 08 Mar 2022 00:57:33 -0000
Date: Mon, 7 Mar 2022 18:57:33 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: gpu: Convert aspeed-gfx bindings to
 yaml
Message-ID: <Yiap/f48pLUXzaQ0@robh.at.kernel.org>
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-3-joel@jms.id.au>
 <44308465-db4c-80e7-2beb-b0f676d16edf@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44308465-db4c-80e7-2beb-b0f676d16edf@canonical.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Mar 05, 2022 at 10:49:05PM +0100, Krzysztof Kozlowski wrote:
> On 04/03/2022 01:03, Joel Stanley wrote:
> > Convert the bindings to yaml and add the ast2600 compatible string.
> > 
> > The legacy mfd description was put in place before the gfx bindings
> > existed, to document the compatible that is used in the pinctrl
> > bindings.
> > 
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
> >  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
> >  .../devicetree/bindings/mfd/aspeed-gfx.txt    | 17 -----
> >  3 files changed, 69 insertions(+), 58 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml b/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> > new file mode 100644
> > index 000000000000..8ddc4fa6e8e4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpu/aspeed,gfx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED GFX display device
> > +
> > +maintainers:
> > +  - Joel Stanley <joel@jms.id.au>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - aspeed,ast2400-gfx
> > +          - aspeed,ast2500-gfx
> > +          - aspeed,ast2600-gfx
> 
> That's different than original bindings - new patch. It's not currently
> supported, so adding it is more than just updating bindings to current
> state.
> 
> > +      - const: syscon
> > +
> > +  reg:
> > +    minItems: 1
> 
> maxItems?
> 
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  memory-region: true

Also need to define how many (maxItems: 1).

> > +
> > +  syscon: true
> 
> You need at least description. I see old bindings did not mention it
> (except that it is required)... I think you also need a type, because it
> is not a standard property.
> 
> > +
> > +  reg-io-width: true
> 
> Some constraints? Can it be anything from syscon schema?
> 
> Best regards,
> Krzysztof
> 
