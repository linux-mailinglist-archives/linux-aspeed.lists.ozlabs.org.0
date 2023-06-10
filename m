Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936F572AB8B
	for <lists+linux-aspeed@lfdr.de>; Sat, 10 Jun 2023 14:52:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QddCD3MFYz3f84
	for <lists+linux-aspeed@lfdr.de>; Sat, 10 Jun 2023 22:52:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g45/G3xC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g45/G3xC;
	dkim-atps=neutral
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QddC242xwz3dw2
	for <linux-aspeed@lists.ozlabs.org>; Sat, 10 Jun 2023 22:52:29 +1000 (AEST)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-55af44f442dso1774420eaf.1
        for <linux-aspeed@lists.ozlabs.org>; Sat, 10 Jun 2023 05:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686401546; x=1688993546;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypunSIKUqzh75YIeQaRkHjhmNZ/hwFhCbdx6FqXAu9o=;
        b=g45/G3xC9sH2xNWZ6p7/51PCGM+7NosvtHN4VJoiDJxnTel/9M5KBWRJXTrbVFGxk8
         u5MXFHO/yBVREKnKTeZSFVBJnairzfK8l1912tF7jCrey4fPFI64Pjn5A4IXCo51t7un
         rlMZ3BK6wD3AMoJWg0v7rJaPx2kNXTrUOrvjya6R6McblHu89Sl/Hj1xbcOe6qhCHage
         2c72hl7T8Zq8yX5rzilD+b0AupIowbIqRpCuUTckO2QE+qpWcYWRo4zpPxtk52Cc/TXM
         Wdvjj+/rVzXDwDEXINf80szdTpuCkkzXTjacnVTfc3RUieDfTEpJ+RG928/jsC3D3q25
         2rAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686401546; x=1688993546;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ypunSIKUqzh75YIeQaRkHjhmNZ/hwFhCbdx6FqXAu9o=;
        b=dbdfUW6sRIeAheLaTorbXeZ0I9op6yu5WOKEpyax4cBSIAE/nMH3OKdInsUrJhNc3H
         QadOG636ZggtC4ODeZE5ybORSbkLD2dHoX+aW3BMJSEaATKZVlwzUehxTUbynBz7IMod
         rFoe70/ZT/mAVIliY/VBM5WBwsXZvZhHW4GRZIY95GivPPg4m8F14ruYgURZVozHWg46
         Wni6e9QZiBZNBEX54Ug5FPiUBjW3/FYZ83uk8hWyDQLXggYiDhj0tYpoyZj2N1erbq9P
         itE6P2fYW4MLVG3hQuPZaEb8Ts5CY6CNWAfOHxXqJNUUGEF0htGUB0WDCU/RCK8zsI7j
         YczA==
X-Gm-Message-State: AC+VfDxF1JXClu4vvN4eUQJFYyDbjDrfi805OPaB8+FgtNlPhGRYGBGH
	wQdQNGAzzEi26mQuEgNFKQ==
X-Google-Smtp-Source: ACHHUZ5tZl6zQi3tZ3ZIyb80b0WEZFIQ3IM8ZhCNGZxrKoZC2y3OSR1/MtXGpq4cjDjk0GM+k+2xPQ==
X-Received: by 2002:a4a:e7c1:0:b0:546:dd51:f74f with SMTP id y1-20020a4ae7c1000000b00546dd51f74fmr2296073oov.4.1686401546227;
        Sat, 10 Jun 2023 05:52:26 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id v4-20020a4aa504000000b00552acb7c89dsm1652130ook.21.2023.06.10.05.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 05:52:25 -0700 (PDT)
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:8f19:4a52:beef:59ed])
	by serve.minyard.net (Postfix) with ESMTPSA id 76BDB1800BA;
	Sat, 10 Jun 2023 12:52:24 +0000 (UTC)
Date: Sat, 10 Jun 2023 07:52:23 -0500
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] dt-bindings: ipmi: aspeed,ast2400-kcs-bmc: drop unneeded
 quotes
Message-ID: <ZIRyB531ttuE1SUI@mail.minyard.net>
References: <20230609140729.64799-1-krzysztof.kozlowski@linaro.org>
 <778e2930-1678-45bb-a01e-21bf321fb6d8@betaapp.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <778e2930-1678-45bb-a01e-21bf321fb6d8@betaapp.fastmail.com>
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
Reply-To: minyard@acm.org
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Jun 10, 2023 at 08:49:27AM +0930, Andrew Jeffery wrote:
> 
> 
> On Fri, 9 Jun 2023, at 23:37, Krzysztof Kozlowski wrote:
> > Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> > checking for this can be enabled in yamllint.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

This is in my next tree.  Thank you.

-corey

> 
> > ---
> >  .../devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml  | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git 
> > a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml 
> > b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > index 4ff6fabfcb30..129e32c4c774 100644
> > --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > @@ -41,7 +41,7 @@ properties:
> >        - description: STR register
> > 
> >    aspeed,lpc-io-reg:
> > -    $ref: '/schemas/types.yaml#/definitions/uint32-array'
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >      minItems: 1
> >      maxItems: 2
> >      description: |
> > @@ -50,7 +50,7 @@ properties:
> >        status address may be optionally provided.
> > 
> >    aspeed,lpc-interrupts:
> > -    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >      minItems: 2
> >      maxItems: 2
> >      description: |
> > @@ -63,12 +63,12 @@ properties:
> > 
> >    kcs_chan:
> >      deprecated: true
> > -    $ref: '/schemas/types.yaml#/definitions/uint32'
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> >      description: The LPC channel number in the controller
> > 
> >    kcs_addr:
> >      deprecated: true
> > -    $ref: '/schemas/types.yaml#/definitions/uint32'
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> >      description: The host CPU IO map address
> > 
> >  required:
> > -- 
> > 2.34.1
