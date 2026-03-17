Return-Path: <linux-aspeed+bounces-3698-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIK/HduxuGlLiAEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3698-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Mar 2026 02:43:55 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5608D2A29A2
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Mar 2026 02:43:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZZVv4Sljz2ySB;
	Tue, 17 Mar 2026 12:43:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773711831;
	cv=none; b=bjVeXAlvsz3y2B0OfA6dVbYwQ4NcWxZcBRCekYTOUDeDz59Of1QxTq0yXWibzK+0uaZJ0/jwMka1f+bA2YMt8UFy8vkMzKFg5wKiBMa3D11958L80FW9cN1PZTTtvqzHrLhLOMiCt5Od+LRsxdqjDDcmmZBwY4bLgjo+7cE9qEYyCogVD395G4dUinSYYTRJK2jIQh0+kQmLp2dDXH/UmpdeqcBCkEE9Qq5yJbHWGaWGurBJVBY+/RTSj2CIjmyaQtg0ZbRUek2GbSeOxZUHMB7HiUfnd0RW9GzFUC62GaevT3S3yVOz3BIp1bK8rrCG8d6s9YnleYb/dQgve/jiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773711831; c=relaxed/relaxed;
	bh=9SmP2+4heY2mqxSh+2kpDHacvKUssfAIu1YMw99U9Uc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jh7tm4sB3bx/aO9CQyt9Vc+GxllD7z9FwNXF0Kk2Y3Ykq9JnXwGFjwoiRtnG0ui9QJdvabpynJj0mWh0iNgYmeAvFEW05ZnGrmlvKeonOA2BCULMHWG9YKv3fUtgNi0cEWgZp+AdeXTB2yDRXaxlzWob72qPpubOvBybcJx4TJ2CeRAosboNbgtKGzmhvR7eK+v0Gnta4xtKkTy2n8g4riYQ2RDCqBP7MkToo+elokZyReiuc/HSihPiwyTQZW7Vcy4K/+pOX3SDY19vtjxeV5+AEgGtJpU3J9ti67WsE1Uo+tGDtgAso458W+w6shprVa1ZWp8qyMhaKlrbyRvGRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BgZqPQgl; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BgZqPQgl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZZVt5Rgtz2xS2;
	Tue, 17 Mar 2026 12:43:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1773711830;
	bh=9SmP2+4heY2mqxSh+2kpDHacvKUssfAIu1YMw99U9Uc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BgZqPQglYjGenbMZ0Xry4Vi0J1fUs7CVX0RMnYCDdEszoZdhji6xgedEDz+ah9kVW
	 Etk0ivyOAztnVJEysv7ZT9sFMW0Y8pv76leRIKsT3953qGb97mA+Q18A/AdmHw0lXp
	 Ey1/3IIKZCQFyjKj5v3zGbkfeNZ/BbblQa15T/hey98kRyWRFh1Te8r5pgMrUCeteD
	 w0omaMe3yiDJXxGrErJ5gJOaSL+2p5AKbEjB9Kcj8FzQ4FU8Iyws/jKEwklYPA2kHR
	 88XiwfeQr1IXCQJnuu1AYjYpIxlV3U65Dt3TCPkzsKQIUBDnLz7/V0xkb4UU6lWxsI
	 fk0uIShtMwILQ==
Received: from [192.168.72.167] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AF97D6009B;
	Tue, 17 Mar 2026 09:43:49 +0800 (AWST)
Message-ID: <9dec962eb510d947a458fd2318a3812d58b3553a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v26 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
  Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>,  "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Tue, 17 Mar 2026 09:43:49 +0800
In-Reply-To: <TY2PPF5CB9A1BE6EAA73D3AD6F75F1ABD53F241A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
	 <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com>
	 <20260313232125.GA3618633-robh@kernel.org>
	 <TY2PPF5CB9A1BE6A19D439C675AF5028C13F242A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
	 <7ae8222bf6abd83a3c2ac976f54a2edbe4e9727a.camel@codeconstruct.com.au>
	 <CAL_JsqKQp=HyA90rQ2Hzu148k63k5-qrGLH6sEHXNcjAu3QSwg@mail.gmail.com>
	 <eeac1db0a5692ae45b5528a85ed1510b8b1cf771.camel@codeconstruct.com.au>
	 <TY2PPF5CB9A1BE6EAA73D3AD6F75F1ABD53F241A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2+deb12u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3698-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[jk@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5608D2A29A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ryan,

> Your understanding is correct; the byte and buffer mode is mostly the
> same. And also mode should be decided before xfer, due to the
> controller/target both use the same xfer mode, not decide by transfer
> time. The original my submit is only buffer mode and dma mode, and use
> only one Boolean property, aspeed,i2c-dma-enabled, but someone suggest
> add byte mode select, so I start to add at v17. I can drop the byte
> mode, if this is confused.
>=20
> byte mode request:
> https://lore.kernel.org/all/010e55e9-d58b-444c-ab57-
> ddf8c75f2390@gmail.com/

OK, that sounds like more driver configuration than hardware description
though.

> > Ryan: I think this gives us a much cleaner approach to the binding.
> Thanks the feedback, do you mean, just one boolean property for mode
> selection,
> Am I right?

It's less about "mode selection" (which is a driver implementation
consideration) and more about "hardware capability", which I think the
boolean property better represents.

The driver implementation could do whatever it likes with the
information about whether a DMA channel is allocated (and select a
suitable mode depending on that, and/or other runtime data).

This property only seems to be applicable to 2600 though, as there is no
need for it on 2700, if all controllers are DMA-capable.

Cheers,


Jeremy

