Return-Path: <linux-aspeed+bounces-4295-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id taUrMSWEO2psZAgAu9opvQ
	(envelope-from <linux-aspeed+bounces-4295-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 09:15:49 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFF86BC133
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 09:15:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PTBFnWrT;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4295-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4295-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glYB80ZLYz2yYq;
	Wed, 24 Jun 2026 17:15:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782285343;
	cv=none; b=fKkCqzKCyYoPOOgOBoLvwKN109T9xbIOqsu3qUssM2ptchJwAH+88wuNMAXV77/jkHaLadU82+SCzuMDb4HP/qhJEDA+t4M1R4sUmal8GbX7jIn3H4O6Bgh0bRie0d/pUJ+lntIX0RT2hit6lHX/4AwNcVbiVt1xDMbg2AFHtCR7/h5FCS7VKbU3VA8OZ21dTeQhBL2YhVdgIslXVFnBoWw+RnUCbID5VEc378zy8R3v5fg2GV6/kyL122G7XbN+XG6oFs3rokN19GTJv9ZhkeTKgBTSlsufoBvCX5U4FDyPm8cgu5xncOK6PrzlOyc/NoPgaC0XGCAxE+951/1R8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782285343; c=relaxed/relaxed;
	bh=ONVxwC+Td25N43rGDzHnzsanpqUWTvIc0+6pDMU/MTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9c5GngyArs+i2shTiHgNNwlKK2zBu6Hx3FIjT1nhr+08urEzSAFyJeL7HSlVsY03gY3VCZ5XKgW1ss4SdL8OJFkEsFeFKYO7t5waKGXh8oXMpIjW6IX2lcA2RzS6LD1WyE7iGYQJ/mJwroM9T0ng914FQWwyPEC1/tjRsxljnTfFO8bDcxYW85jY1dGDHz8jbj7SqKFkCdWFCywhGWLm8BXRTdrWlHVRNl1m1oLZGzwRd5JLgWNSvPW1bHwe9zEX2vC8LbsbN7xCPcTyddoxSOBP/7BE6By1rJiBeOM2sc+ehzdBsGh3E8u24skgXXQTpEqPHb/rjWgA7lwMLUDQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTBFnWrT; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4glYB61xQjz2yQn
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jun 2026 17:15:42 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40203601F3;
	Wed, 24 Jun 2026 07:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24E31F000E9;
	Wed, 24 Jun 2026 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782285339;
	bh=ONVxwC+Td25N43rGDzHnzsanpqUWTvIc0+6pDMU/MTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PTBFnWrTnSlnRm7wA9VA1PKnERY9yuPOvIvAeqhs1Yt6aoGxjRIfYBkjLVOQMbeNz
	 kVBap/AwGkGSkpKtQ/39UY6tYC5h2Hxi7VKuzuAsEwE7Q8mVB/PU7I7Y4eJKS9ET6Q
	 zysZDCaCETP5NWRPz+SMh2iLvN3vwxYg3pK9Ax+i//noDUm+RX8Zntiq8Pd3FC1Ldt
	 PVyQL0gk9ZzMeM3ekhH4GVnrOpee7EB9Key3pzQBLLna0L0Ke76QM41Z4gJZ49GMV7
	 uKzysiCphyE2UP/cXefVGblMHKlA92DT3p3TmpOZ+BzGgY0nAwKsi+rplH5Naor63Q
	 2WpjSkr7z9qIw==
Date: Wed, 24 Jun 2026 09:15:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?R3LDqWdvaXJl?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: serial: 8250: aspeed: add compatible
 string for ast2600
Message-ID: <20260624-realistic-spiked-parrot-db1d9c@quoll>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <80d983887dfdfc7e70a6db95f8cb95b7312f3044.1782224059.git.gregoire.layet@9elements.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <80d983887dfdfc7e70a6db95f8cb95b7312f3044.1782224059.git.gregoire.layet@9elements.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4295-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:gregoire.layet@9elements.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:lkundrak@v3.sk,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew@lunn.ch,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:anirudhsriniv@gmail.com,m:linux-serial@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[jms.id.au,codeconstruct.com.au,v3.sk,vger.kernel.org,linuxfoundation.org,kernel.org,lunn.ch,aspeedtech.com,linux.ibm.com,gmail.com,lists.ozlabs.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCFF86BC133

On Tue, Jun 23, 2026 at 02:25:39PM +0000, Gr=C3=A9goire Layet wrote:
> The ast2600 was using the ast2500 vuart compatible string.
> This change makes it possible to have ast2600-specific properties.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/sub=
mitting-patches.rst#L830

> ---
>  .../devicetree/bindings/serial/8250.yaml      | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index bb7b9c87a807..3cbd0f532e15 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -23,7 +23,9 @@ allOf:
>      then:
>        properties:
>          compatible:
> -          const: aspeed,ast2500-vuart
> +          anyOf:

This should be oneOf (by convention and actually more accurate meaning).

> +            - const: aspeed,ast2500-vuart
> +            - const: aspeed,ast2600-vuart
>    - if:
>        properties:
>          compatible:
> @@ -287,17 +289,19 @@ properties:
>    aspeed,sirq-polarity-sense:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: |
> -      Phandle to aspeed,ast2500-scu compatible syscon alongside register
> -      offset and bit number to identify how the SIRQ polarity should be
> -      configured. One possible data source is the LPC/eSPI mode bit. Only
> -      applicable to aspeed,ast2500-vuart.
> +      Phandle to aspeed,ast2500-scu or aspeed,ast2600-scu compatible sys=
con
> +      alongside register offset and bit number to identify how the SIRQ
> +      polarity should be configured. One possible data source is the LPC=
/eSPI
> +      mode bit. Only applicable to aspeed,ast2500-vuart and
> +      aspeed,ast2600-vuart.
>      deprecated: true
> =20
>    aspeed,lpc-io-reg:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      maxItems: 1
>      description: |
> -      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
> +      The VUART LPC address. Only applicable to aspeed,ast2500-vuart and
> +      aspeed,ast2600-vuart.
> =20
>    aspeed,lpc-interrupts:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> @@ -305,8 +309,8 @@ properties:
>      maxItems: 2
>      description: |
>        A 2-cell property describing the VUART SIRQ number and SIRQ
> -      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
> -      applicable to aspeed,ast2500-vuart.
> +      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
> +      applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
> =20

More important, where is documenting of the actual compatible?


Best regards,
Krzysztof


