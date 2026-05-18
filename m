Return-Path: <linux-aspeed+bounces-4073-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOs+JyI+C2oJFAUAu9opvQ
	(envelope-from <linux-aspeed+bounces-4073-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 18:28:18 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4F0570E66
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 18:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gK3Bk0H7Rz2xrC;
	Tue, 19 May 2026 02:28:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779121693;
	cv=none; b=QXRXHDW0NTROQfLgYdakSFjoVnbrHIYrv42yAGafIlMV7GWGlZIefN/R0+YwFRmUwbP5+hX+NE8YxJA6Xpi2JfDuXb38mZQq9UfcRCq5X/XQLcYxA3rZ6dE8fERoxORoRvGIypxq6TrzPfFvZ+BtVJMtpuu6mqVNmg0+TSA6vnLKMIsTgBn/tdPAtIvXXig0NjjAaKTXn8alIHFYJOjOWcaM18tt97vQeWAnWkmlGdZN1nAF1KPr/FuI0ytxFXA0lYqkceE48Rhf07/chCoqg6Xh6LsW5LspbLOTvBA7pOI+zom31bGyGrBWIelukB1RAuPvPozuAB7UjSv0rE7naQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779121693; c=relaxed/relaxed;
	bh=3jGoaYLrIdfY8fxCt8RE2gFSjMDiP51+IVix3OYHhPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0qZdQCX5yIaO1OMV1o2hw9hZD83WMSTf3zklVw+UsArKc1H9TRh6cayatapIRW9QQAvYRo2PxOSBiUM3klZKVdELMO+6XdqbF5utQfJRRflF3iRmm9L+fM/rGxotIi1UplxZt+CD5V3FmtE/gn/yyTCIqDXjmYnsndQdCXJEI5IN7nqQEG+InUXOwnD6rKWXr70+PibsRqS0TBHZw5DHY734TcX1s5pJ0t+mLAxw+xkuSHTcIiu7p+c8bz6EgRzaRu28CzRHrHjF713ZODm4EtcUBLrzBI4RdsM4gW7FZA+XVsyCvuo8U7m9pEuC7BGVpbyY2d6EdyMokdsnWPg9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p7ExYI8T; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p7ExYI8T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gK3Bj2xK2z2xpn
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 May 2026 02:28:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 800B54343D;
	Mon, 18 May 2026 16:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FF6C2BCB7;
	Mon, 18 May 2026 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779121690;
	bh=3jGoaYLrIdfY8fxCt8RE2gFSjMDiP51+IVix3OYHhPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7ExYI8TItuqZz95XMRoZ60wsT3UBHH2czPLr5/hOQB77QY5jQITBge2xlNIE8AU5
	 Cd0yMJccZO37BZlp4CSoOlnL6pKqrLS9AB00DVqJEdwEElj1djSAdXCcCbPfLBYDIc
	 y0wr49RKJ5QoWDhKZCXz9PsOGJtOkdPnpO67XXfslPcJrojB6I2crWCJuJVyshJ5mp
	 /JAVg1+isUTuinLFcZ2Ttug/pj3bhbuIL2qERaPCyvdFsE7ur2Ak8laaFj31/A6+Dq
	 wBfAvnmllN92N02lhiySqatuyuNrOXtfqogL0yUJKMjI1Ji+FdUhSa7OSp76aK+0fQ
	 XOLggQ0TPB4OQ==
Date: Mon, 18 May 2026 17:28:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Cheng <neilcheng0417@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Meta Rainiera6 board
Message-ID: <20260518-contented-untimed-85b12903469f@spud>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
 <4f7aee0a2dfc44770347ccc82e54820e7b35317c.1779088499.git.neilcheng0417@gmail.com>
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
	protocol="application/pgp-signature"; boundary="D4Ni9Iy8zbLh/XVa"
Content-Disposition: inline
In-Reply-To: <4f7aee0a2dfc44770347ccc82e54820e7b35317c.1779088499.git.neilcheng0417@gmail.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.31 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neilcheng0417@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-4073-lists,linux-aspeed=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,jms.id.au,codeconstruct.com.au,glider.be,gmail.com,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linux-aspeed,dt,renesas];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 9F4F0570E66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--D4Ni9Iy8zbLh/XVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--D4Ni9Iy8zbLh/XVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCags+FQAKCRB4tDGHoIJi
0h/xAQD/GO09ESffxZeEWy0y0qDA2FYxyklacN0+YEI/W2UZ3wD9EAzOZtufjk4m
QRtp9ItGZJ9m+ezm/FyqrNQTH/CIlg4=
=dcZV
-----END PGP SIGNATURE-----

--D4Ni9Iy8zbLh/XVa--

