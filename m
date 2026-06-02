Return-Path: <linux-aspeed+bounces-4157-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zXjODhwMH2qneQAAu9opvQ
	(envelope-from <linux-aspeed+bounces-4157-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 02 Jun 2026 19:00:12 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A139763071E
	for <lists+linux-aspeed@lfdr.de>; Tue, 02 Jun 2026 19:00:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eqn5sFCk;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4157-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4157-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVHBZ2XCDz2yFK;
	Wed, 03 Jun 2026 03:00:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780419606;
	cv=none; b=k2N7lv4yku2g9NwML9HASGRTKksMPmRKY9Dbf5YWgUsp+v9K7v0B2ttllSwMThur6zoJgkPrKtwtuMa8rrrT2mvjh4roSP3LzSWa6OgjGnw3xFXPCvl66bS5ZXZYsTSSOxdQyTvohOMGCmdpvSQudiXVViE7JGhCVkMiMDldJI6GNGJZhtFz1IOmpFu/dI/i26amvxbHBadGf2nQzuu+kBfO4163/njwtyzRia05XehPhUaEAQKRf8GGB2jVYdeo9oe63oZp8WTL14TY0oAX90tQwNtge8SL59oV1jIGTWz1Ktd2wfFvOKYwW3DNw0RyNtY1QI6TMXGulLePVJG3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780419606; c=relaxed/relaxed;
	bh=aXEL4pwfPMVz7iJb43Gvy4V5PhxsUFD/gCBxQEtwy8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KByYdRVIUGn8c/tKRisv1pIJFZZWJ1KS75dHturE4gEJCrm4XI1OhvIDKtlySNw4nb+i9vDa5HU6MOXkENryMN2ef8DE+mzy5w7ZsA3/WJUJfR+XzGrbGvTvm9Ld7JrDSq2uYQud968AtO0w2pHDk+RTBleA9v3On+g3KOD7WSTv+1EJye+56SEaqIeT0SnfyXlVZXDeYK1hrHBm5GAh5+MGUxtM4zNBqS60au6teKyFtg92TpPRfcWwne0+G9+0r1/vREP1a7iS4O+rPsZD/4/R0b6svpFU0FaAEieeijBooiUTNzImoifbqv6pSgYtrfQJ4DOxw8JRt8hn5q8Dkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqn5sFCk; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVHBY32djz2xKh
	for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Jun 2026 03:00:05 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C24246001A;
	Tue,  2 Jun 2026 17:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A6B1F00893;
	Tue,  2 Jun 2026 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419602;
	bh=aXEL4pwfPMVz7iJb43Gvy4V5PhxsUFD/gCBxQEtwy8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eqn5sFCk9Gvk5MQ7a/oBBQ1+0KnpNVzVsNgERJHir3cW8slvMQ+h7DfI5X3owfXWD
	 yaoVqBHOnyep+/kld0J65qgMHBPo8MxXdXBzXcRPgP0f666v/1lXt2hemMLszNKK5o
	 bSOqyunDtFpKXL9T3vZwPHr3zV4+T7wiXsDr5DQeeubDFYlxh9zAr5ICEhwEMI5CGP
	 RstELcE6izDm6itOOogAcqL766P6clMh5X/O6NnSaUrnTKdGK3dYR20jtq5Zu4Pa44
	 eDr1YobTBhfQ/QCxqw4JxlpO0VvDONJv11f8L0FzBTdeeRGcF9zkckWecb/xveAOgz
	 tGNlOtjyzw7zw==
Date: Tue, 2 Jun 2026 17:59:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: rtc: add ASPEED AST2700 compatible
Message-ID: <20260602-refresh-crawling-e6852feb9dcb@spud>
References: <20260601-ast2700-rtc-v1-0-15d4ca46500a@aspeedtech.com>
 <20260601-ast2700-rtc-v1-1-15d4ca46500a@aspeedtech.com>
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
	protocol="application/pgp-signature"; boundary="sSlNZiJes0XynWvQ"
Content-Disposition: inline
In-Reply-To: <20260601-ast2700-rtc-v1-1-15d4ca46500a@aspeedtech.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4157-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:tommy_huang@aspeedtech.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,spud:mid,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A139763071E


--sSlNZiJes0XynWvQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--sSlNZiJes0XynWvQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8MDQAKCRB4tDGHoIJi
0srpAQC+gmj4JJGrXIWGVt27womZpP49QqQ/L1k3k5X9ws77DAEAt4Hn4w2ksqmf
SI39dQOHYZ0+bCvn00VuAoOoxWr/Bww=
=kyAk
-----END PGP SIGNATURE-----

--sSlNZiJes0XynWvQ--

