Return-Path: <linux-aspeed+bounces-4156-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dk41Ic4CH2rgcwAAu9opvQ
	(envelope-from <linux-aspeed+bounces-4156-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 02 Jun 2026 18:20:30 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2BB63026D
	for <lists+linux-aspeed@lfdr.de>; Tue, 02 Jun 2026 18:20:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hJIT0ssx;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4156-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4156-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVGJp6Zjzz2yFK;
	Wed, 03 Jun 2026 02:20:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780417226;
	cv=none; b=nHJQpO26V4cTg8lJazxYgbC4ZxupkqU11XiAuFpDoPP8K/bPt4VXCI/YGAg+mH14piiTRD8RM4nHUPmXJngAp+DljikOYLmzhPmOe2aTM43XHP2qq7vJquCZdrwIYj1U4WlbrvPCWKTvbRhe+ciCeXpRGvyTykJQ/T1fwVTRZzaziupAve3CpWY1Solrc/JBxz0Usx1V/QOegeYfF6rL5aXRxHsmCMrKHkQGIeIN1ZcBNDZUm/xorpRlL5GkhimRzSBqynMyTifgzss9+jsScEHtWOgRTPp48D/LsNZcNzO3d3TDLDB/jRVIHp5C5fnRIu6ikc8FRFmVA4YnqenGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780417226; c=relaxed/relaxed;
	bh=0k5yjZl4vRmofziFWi9oG66Z9lvqiWvEA4ZQGqJDIvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeYe4kRfaL/b2loWnXd7ttJIBysVVy/Qe2lbk31arHF2TZCO/AfV4Wd+rxIrhXKJLrBUNNgFrLUXNB/URO6+OJq0GicFlTtyIJwuuj5MltNByZwDyV6tyThZw8eWf0a5xya8S2qocxMdJcRD5iEDyrkiCWANW5NJFqOaNGtVWb7qLG4yfk4sM00miMtxdyMZ0CZxoy6pcri3ehVY3XkLNbpR0ZihYdvVXlkrkiGVY7jJRkpzQIw/DOFaMCyYyfM1YiwcIATeUQ+Kk4A1CCu+3bIQ8NYOuge6q1TemRx2uQr4SBV7IgbAcnHNto9sxqauWm0PMhKz30PQb8g7Hur03w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJIT0ssx; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVGJn6XtLz2xy3
	for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Jun 2026 02:20:25 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D54A402CF;
	Tue,  2 Jun 2026 16:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661911F00893;
	Tue,  2 Jun 2026 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780417223;
	bh=0k5yjZl4vRmofziFWi9oG66Z9lvqiWvEA4ZQGqJDIvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJIT0ssx97ERW0yGHGdcAT7Onyw2jRu3dp6/o7krwbw88WSv6suDGkCjttC1oDfsY
	 aSQigl1oNaNO2XtrFypJjWpzeyx9yWJbPf4I0urwcRMwUlMHmB1furYutcp9B9RRtN
	 g1OVtUn2jaT7a2LH8r2jVudjwwGLbPKZuPN32RgADkEl418D6BpCv0CD3cuFvSjUY1
	 UN9cmu2E5srnx/Twd7c1B2ZWVHke/iyUkf5XxXYOO26yFtXI4spd8q+ROi4Iz7rz/x
	 3XCAbB12R3EfmL/z9wfv9YNlNyt5uYoSNMUajVXFpP6GoUfY5AaAAs28YkFXBRgpr8
	 RjWX5shckYo+Q==
Date: Tue, 2 Jun 2026 17:20:19 +0100
From: Conor Dooley <conor@kernel.org>
To: u8813345@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 1/9] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2
 DVT board
Message-ID: <20260602-cupping-cahoots-40da41ef0f67@spud>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
 <20260602-anacapa-devlop-phase-devicetree-v3-1-7c93c5df8d9b@gmail.com>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PLx3EfovJTpILGs4"
Content-Disposition: inline
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-1-7c93c5df8d9b@gmail.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4156-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:u8813345@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:colin.huang2@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B2BB63026D


--PLx3EfovJTpILGs4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--PLx3EfovJTpILGs4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8CwwAKCRB4tDGHoIJi
0s1kAP0VxPsI2ai9KcE8KjyAxQu6KSL/RYgc7cxhHgVC0P+rzQD2POXKO6YSEjEE
5WfTAe4ILcmjizB2Ac+SEFo7f85KAg==
=cSj8
-----END PGP SIGNATURE-----

--PLx3EfovJTpILGs4--

