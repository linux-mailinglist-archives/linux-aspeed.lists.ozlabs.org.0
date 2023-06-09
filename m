Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5272A6AE
	for <lists+linux-aspeed@lfdr.de>; Sat, 10 Jun 2023 01:26:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdHJV5Rmlz3fFP
	for <lists+linux-aspeed@lfdr.de>; Sat, 10 Jun 2023 09:26:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=X4PTZzoH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=d8uSvn6R;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=X4PTZzoH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=d8uSvn6R;
	dkim-atps=neutral
X-Greylist: delayed 354 seconds by postgrey-1.36 at boromir; Sat, 10 Jun 2023 09:25:51 AEST
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdHJH4b03z3cKW
	for <linux-aspeed@lists.ozlabs.org>; Sat, 10 Jun 2023 09:25:51 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id F38FD320090C;
	Fri,  9 Jun 2023 19:19:49 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 09 Jun 2023 19:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1686352789; x=1686439189; bh=tM
	mYHIDjBqJKDccW2yNNVtw4vNAo2LIKf8v53tnNtqU=; b=X4PTZzoH3iGrrVTNtV
	nhJ/GIyb/+bCPohzNetpXMJTh9hlF4mV9KAhOFyO8FGeH70usdmfmO3tCqSwl1b3
	GGBTnb806f0IWQAwo4/hSny+AOauDF/LyoBEDS739jKz4qcZMhrFzEljpKmh47Fc
	36MLiH8Zp2gdWOh9rWcN1lHKDUW2eCJvLyrACIENOeOqlwag1dVJ4qVcmeZm78EX
	HzEullvXa1bbJKCngw+AIpbRhQjl6FhIM1d5D797ZzaLRW5Jlyv0HmPAnB0hK7qe
	1Xw5fjIje4NviO5PdDf2DAVwg2a/nk+mi9idfGYPtdkagkwSmbqb2A8gniSAM/vk
	yEOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686352789; x=1686439189; bh=tMmYHIDjBqJKD
	ccW2yNNVtw4vNAo2LIKf8v53tnNtqU=; b=d8uSvn6R4ktoKCUQpQ/E5FRc/4ifB
	MIMxNdBNR/sLpTyDEmAxObUxukv2u0qQEWn4eJzw+sL+/K9dOdVp/oHwW2ZTpySI
	hDRa48/7ms/B+m6DD1Ac+JwYdooFvC5B7HeMj92f1jYjEJSRszAvDO6zEA2yFlaa
	fcxY8VSH0n/Yrs0AGH4WXmb8w6molmWqhy2dQ3nVEg+lV+FZch6pXmbBz1UgqQDK
	uQNF5ptIj6qhQ5NfeIE7O26zaD8vrMtoCSuDFmk4KsB85RwKFbtVZMS73dG6P2kt
	NZWen4Fa0rCT5UmOu67xhH3q4nLKhmyoBicbhMbxpYA7HKXUuYC0xu8hw==
X-ME-Sender: <xms:lLODZCa8Zf0KsY8GW8HHb1GMOLGhtOA6t6hVWIYWvOk5-iK3Ryp4XA>
    <xme:lLODZFZcWfoKa8I6c-LhlDikpwHcDXLrQJsFd-Ra3S6sRV4Za8WyrLvnJpI2lcZzb
    iM995um_XKFBbRaRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtledgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:lLODZM_sqYsK0L437TC1lo4edRi6Yxzcodj7PHrHsQzkWYwx3kiEUQ>
    <xmx:lLODZEo60zelKocOz8RXjUV7UFFdA_KkGXeNuy4IWDhaYvOBx40Ong>
    <xmx:lLODZNoRyq9j5WUBUEsn4oIm_vi_S2P_JLEhKym-fR-lQvEKQhndDQ>
    <xmx:lbODZBenee8DWDfphkM1MGgGHudjwWCdLBSrvc5ZGOn1m5sJDzijNw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 44ECA1700089; Fri,  9 Jun 2023 19:19:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <778e2930-1678-45bb-a01e-21bf321fb6d8@betaapp.fastmail.com>
In-Reply-To: <20230609140729.64799-1-krzysztof.kozlowski@linaro.org>
References: <20230609140729.64799-1-krzysztof.kozlowski@linaro.org>
Date: Sat, 10 Jun 2023 08:49:27 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Corey Minyard" <minyard@acm.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: ipmi: aspeed,ast2400-kcs-bmc: drop unneeded quotes
Content-Type: text/plain
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 9 Jun 2023, at 23:37, Krzysztof Kozlowski wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  .../devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml  | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git 
> a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml 
> b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> index 4ff6fabfcb30..129e32c4c774 100644
> --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> @@ -41,7 +41,7 @@ properties:
>        - description: STR register
> 
>    aspeed,lpc-io-reg:
> -    $ref: '/schemas/types.yaml#/definitions/uint32-array'
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>      minItems: 1
>      maxItems: 2
>      description: |
> @@ -50,7 +50,7 @@ properties:
>        status address may be optionally provided.
> 
>    aspeed,lpc-interrupts:
> -    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>      minItems: 2
>      maxItems: 2
>      description: |
> @@ -63,12 +63,12 @@ properties:
> 
>    kcs_chan:
>      deprecated: true
> -    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description: The LPC channel number in the controller
> 
>    kcs_addr:
>      deprecated: true
> -    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description: The host CPU IO map address
> 
>  required:
> -- 
> 2.34.1
