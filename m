Return-Path: <linux-aspeed+bounces-3519-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ3wHANMkmkLswEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3519-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sun, 15 Feb 2026 23:43:15 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E836613FE96
	for <lists+linux-aspeed@lfdr.de>; Sun, 15 Feb 2026 23:43:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDgsl4Lb0z2xm5;
	Mon, 16 Feb 2026 09:43:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770990476;
	cv=none; b=iogDqbQ0cI9KwJCpHdeVNU2qr7lTeClvveNwTdoCOzaA1HSl7/t1S4D7BlQTqmJInWnT9GDuzEzEdsldbaombj68uoFET69xMA3XkR8e/R+O5e+1VnxuD61VheJt4u7CpLXrslbQ6wLWtp9ZirBV79dD7FRNy92n5F5FgZICVc6PIQ7zSiibVOaPPeOakESaLDY4pacRArpiMwtoISaphwFpXP/O944pne8o6GKVMLAVF3drLMVlyenoM6vOwWxA7CMi/3ODBDKIKAxcVTUDkJH/8zCXSXgn8kGuczgBiX5OSoXJfuO2raWPSnQikEOhJABgTPqQFo611fxiAoQ0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770990476; c=relaxed/relaxed;
	bh=dWNkmAzUQdtfHegRZTbmU8jwK5zq2mplznfusYDgepI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZE8SCIy3c1JCIcxnR5s+TtatMgE8K2WELjtesL1GtgUMZW71DGzE0q/Dc2iYM7ZsoUwt+VbWiKd8vk9nP+9FhMOvXJIMOl16y+A2Ig+8MAyx7GMbmkXtWMKOtbgjvw8VaNvp4yLHMYKglnNyfaPp8BQNHp5S7owckY8H7rHKXykt2q9TzRhos1vTk5GcWtLZPxt4pxLEVN+GDvXOgkYj4VzAafmmwWDii9p8B66jNCGyr/qiTE9RhN08WBCH4sOZgZ+0/9/HGU9M5A4ONhDdCHoks2CmV1wgHjaMoMxGnUzVYY94KlPUpsPk7VXubkLP3I65e8VL55VQFZk/ye6/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QINFr95D; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QINFr95D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fCD573rxhz2xN4
	for <linux-aspeed@lists.ozlabs.org>; Sat, 14 Feb 2026 00:47:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAC0A6132E
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Feb 2026 13:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D594C4AF09
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Feb 2026 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770990472;
	bh=DyzFY+7qXZ/I87ykE9tTTX/te+3kpL/x6B8NDHwgSQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QINFr95DCTmDGpJZL+syZ6w4OMbiyEaGahW44SzHXpgajJ2dD5vASaBSSOblTtzhJ
	 mEmISzqm/Rt05EPpL6OnY220wUlUKaw8KJPqyXaZUxb9RkyRQ3mrNGP/kBkyw5KDxZ
	 gD0qa7b8j6Rthu62yPbLUoVNaL5PKbjPYPkjBNBFcOVkrP5QUi2XFs4fa+pJXrw6+j
	 NgLRDKl6uyODeVCVJ2tEJRELPeN33fMl7ZyC5sfhiCV1Wo/OU9LFCwXtM3QGaJyfrG
	 l7/pNkeQchzKS1aNT7jZ0qwN5YdeeYoLYqKPQVMtZhNEy23R0m2gVXMgPAaSjHXDKD
	 T+ghE+E29rlvA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79627af6349so11052567b3.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Feb 2026 05:47:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVk84gg7JljYJhHWrrY8qE8IxMBraVzhg/iDKECcVKAp/R5n7/GYYhy6lhucXf4KjdH4foELT2Lyna3/EA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxOMQF3YYo8Z9tPk+za0i6aaYpJQgvjxBIxO139+8wM5H3Vicqw
	pcRJYARIch0lpQBo6MYQhhvxtckE6nW76sGmKHR1K9MsOO4Ygt7lsfQd9hS4Km2kwSnmzQ2D+s0
	5jDnJgQSlF0FZPob3GQUF/DmAWWdBE90=
X-Received: by 2002:a05:690c:18:b0:796:3f2f:a33b with SMTP id
 00721157ae682-797a0be9c0amr31425307b3.18.1770990471723; Fri, 13 Feb 2026
 05:47:51 -0800 (PST)
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com> <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
In-Reply-To: <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Feb 2026 14:47:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6=YLh1EER2_cQZAprWfgmy-_XawreM5YpcTG2XA=uqA@mail.gmail.com>
X-Gm-Features: AZwV_QhsixaqIxYeaVbNx--W7SxSEC1W_-pI5Tu0Vlx-qt-_T_CJ0Ra3jwQddw8
Message-ID: <CAD++jLn6=YLh1EER2_cQZAprWfgmy-_XawreM5YpcTG2XA=uqA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctrl: Add pinctrl-packed
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, patrickw3@meta.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[56];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3519-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:billy_tsai@aspeedtech.com,m:tony@atomide.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:brgl@kernel.org,m:patrickw3@meta.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:BMC-SW@aspeedtech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,aspeedtech.com:email]
X-Rspamd-Queue-Id: E836613FE96
X-Rspamd-Action: no action

Hi Billy,

thanks for your patch!

This approach is better than trying to extend pinctrl-single in my
opinion, but it has a bit of road to cover.

On Fri, Feb 13, 2026 at 9:18=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> Add a Devicetree binding for a generic pin controller where pinmux and/or
> pin configuration are represented as fixed-width fields packed
> sequentially within shared registers.
>
> The binding targets controllers that are typically exposed as subnodes of
> a syscon node and accessed via regmap-mmio through the parent.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
(...)
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - pinctrl-packed
> +          - pinconf-packed

Why do you need two? Can't you just use one, pinctrl-packed.

> +  pinctrl-packed,function-mask:
> +    description: Mask of the allowed register bits for a single pin.
> +    $ref: /schemas/types.yaml#/definitions/uint32

To me this could be static data in the driver but I guess the whole
point is to do what pinctrl-single is doing and store all of this
information in the device tree, because reasons.

I guess the DT binding maintainers need to decide on this and
also what to name it.

> +  pinctrl-packed,gpio-range:
> +    description: Optional list of pin base, nr pins & gpio function.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of a gpio-range node
> +        - description: pin base
> +        - description: number of pins
> +        - description: gpio function

Just use the standard gpio-range.

> +patternProperties:
> +  '-pins(-[0-9]+)?$|-pin$':
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      pinctrl-packed,pins:
> +        description: Array of pin index and function selector pairs.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

Just use pinmux =3D <...>; from pinmux-node.yaml
(make sure to use the ref include.)

> +      pinctrl-packed,bias-pullup:
> +      pinctrl-packed,bias-pulldown:
> +      pinctrl-packed,drive-strength:
> +      pinctrl-packed,input-schmitt:
> +      pinctrl-packed,input-schmitt-enable:
> +      pinctrl-packed,low-power-mode:
> +      pinctrl-packed,slew-rate:

Just use the existing configs from
pincfg-node.yaml and abstain from any new
inventions here.

Yours,
Linus Walleij

