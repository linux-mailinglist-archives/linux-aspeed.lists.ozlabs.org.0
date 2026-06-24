Return-Path: <linux-aspeed+bounces-4296-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x0r+BqWEO2qFZAgAu9opvQ
	(envelope-from <linux-aspeed+bounces-4296-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 09:17:57 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2725E6BC161
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 09:17:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LtuAD2as;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4296-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4296-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glYDd5mkWz2yYq;
	Wed, 24 Jun 2026 17:17:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782285473;
	cv=none; b=JjBzTtevjmX/qNicsnu0tt+CaRe0V1gd0gk9iwbQl4FaRFAgJ+bSy4Wr4p/e50LyPBIk4aNr+cqizesF0wHQzOCKx5bhMV32OifHWH3ME6z2gaqdDaZZSuuRmwnYRT6vrIl9tE6fP1e0iPajs5IauNy0pMp58KX7D4Is0bYmg2KpUHGmsdTI/YiWxQ6RgZaR4sgyTliJaPc/1FXFMRXmzw/LycNxiPLBVYmjI6Jwn7o/s1Cl+ALr+BmAVbr8OFGIVyAAmtnOAjC8ZwmzYg9wS/++Iw6txL8Pv+TS9Q413AeTgu6S6LowPkGAosH1Z7TWtcPFMiFNzQp5lmoFgWrWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782285473; c=relaxed/relaxed;
	bh=dP2bxkYNQAeUz5jXWdGEqjkG4n1wBe44kDAAGlvauTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrcZhFNH8AcW5U8+rzemy+DJVGrxgYGJEKUrp5loCTAS8r1+Mqt9yHlKNp+ZPFd/XMWC4ILyA0nJddQj3sLOh/X97KKrekHW+3Hi64jGVCuZ+2/zsD1OQdMOrE8mYhxi9Zs+eaakN+hbZbssuDImMGvIsJ6xoDdmfat1HbX8XF1kAF2GqzR49xZUx39V+FjpuxYeoavMRqYydDfbgYDja6O6QtdZfwEmpPF9zOJp9sYrVIAeuWFdD0ehOwkRoLgS766H1nHb/EfeV1d5iYzs4/6nILvdusKHcZf1Mhv/Pfc5tm8Mb9AA82p8d2BhCBMHixkAD0cRo8DUuwoJAJ/wLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LtuAD2as; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4glYDd192Qz2yQn
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jun 2026 17:17:53 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8566460138;
	Wed, 24 Jun 2026 07:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B20D1F000E9;
	Wed, 24 Jun 2026 07:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782285470;
	bh=dP2bxkYNQAeUz5jXWdGEqjkG4n1wBe44kDAAGlvauTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LtuAD2asFoZDWxbMQVUtn9sTSbYKT59fb9iCV0goDWLpHd+yi/m7h/0gdHtW0eeDX
	 x4pZx/3/GwA9Q3xCVpNSB1QAEcqXvLK3JzACoc0Py0HZvjGupZq+7GRNGwsnGq3buW
	 hiyDbgF/jxMd0P9heVz3ZbV26O/y8VgN3KWIlyUSVpCXFTw7T0ML1vsUXWe7T799Is
	 T36sCSg0bsqR+d3e+2ipyN3NX+p1Mtx4P2HHEq3huzLy4KxoyXK5zYdWSz77P/nyK5
	 +hEFV3Ye5xpU3GzN0cLZkVIJS+3m6X+eYEO/9K1zgrcM8SdyVe5wsrVyYlCA6vlW2i
	 5a18kkJlgUqMQ==
Date: Wed, 24 Jun 2026 09:17:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?R3LDqWdvaXJl?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: serial: 8250: aspeed: add
 aspeed,vuart-over-pci bool prop
Message-ID: <20260624-original-vigorous-mayfly-dfceac@quoll>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <73b2bd81ce70814612e6d3cb689c3296de742aaf.1782224059.git.gregoire.layet@9elements.com>
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
In-Reply-To: <73b2bd81ce70814612e6d3cb689c3296de742aaf.1782224059.git.gregoire.layet@9elements.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4296-lists,linux-aspeed=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,quoll:mid,9elements.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2725E6BC161

On Tue, Jun 23, 2026 at 02:25:40PM +0000, Gr=C3=A9goire Layet wrote:
> The ASPEED AST2600 has 2 VUART accessible over PCI.

What does that mean? How UART can be accessible over PCI bus?


> This boolean can be set to specify if the VUART is used over PCI.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
>  .../devicetree/bindings/serial/8250.yaml          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index 3cbd0f532e15..b03797f4674d 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -26,6 +26,14 @@ allOf:
>            anyOf:
>              - const: aspeed,ast2500-vuart
>              - const: aspeed,ast2600-vuart
> +  - if:
> +      anyOf:
> +        - required:
> +            - aspeed,vuart-over-pci
> +    then:
> +      properties:
> +        compatible:
> +          const: aspeed,ast2600-vuart
>    - if:
>        properties:
>          compatible:
> @@ -312,6 +320,13 @@ properties:
>        polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
>        applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
> =20
> +  aspeed,vuart-over-pci:
> +    type: boolean
> +    default: false

There is no such syntax. Please do not introduce own style. Instead,
look at other files how this is done.

> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Enable the VUART over the BMC PCI device. Only applicable to
> +      aspeed,ast2600-vuart.

Best regards,
Krzysztof


