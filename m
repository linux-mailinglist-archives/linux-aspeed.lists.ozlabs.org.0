Return-Path: <linux-aspeed+bounces-3428-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLivLlXOd2mxlQEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3428-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Jan 2026 21:28:05 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A088D108
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Jan 2026 21:28:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0Kq45RRJz305M;
	Tue, 27 Jan 2026 07:28:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769459280;
	cv=none; b=LIJBg4bfc66pC5ygeMewqZb9eEWsy1BvZM2yRmQFnBh5+mNekYZRgQCd/cyZnzORGONpfXMUG0Z9YTT+RLcU7e09kWCTlOZIU5CWebKSKJIl7T95SmGf//9BLM6bYci5QKDZ77EawTDxOFSf7rpU2+zs54rQuIyDOYyGqdt5Y4un7Z42WxXeVZaX9oeTaXVAOKn5hEfK5Qs9pBhvtDUxpQt9OXmO43FTnpOEUkwjW8YdecxhmTFxRzYMl8eqoOP610aZwIh+H/i9ZXNulS8vFKmJSW5ehlnBs7mBjdxnASxA2y02h2zACLL+icDJ6dDlaSKfOwswU29OU5ZgVRyLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769459280; c=relaxed/relaxed;
	bh=Hjv2Yw081h0FcjvO4Kz0wydsExKWm01KIMGvO/zJ5bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=be8cNlD9YuI4btgJQ5GhsPsGp5p+WhL9UTZEHxucGHajDWvMUNN3nCEPIX8mRdHXKfNS1VgXgSyotMmwsNnBOrINyiH3Tod2fCkBxwIZS6uDpOM6vv/cJriFrvXV+QJfIpJjrpoiZ+3IDOWh+CR9LfKJtESv+bObNlpdhh2KPJFeUSLvcGKZIc9rDo+MDyPqN0Ju6Rp0/0KBNTcjHavupVwuJpdf3sYr1xqDdFHoKsu8wNAplBl7ljTeDIo0PcInKWU7ErwvEQtDPQrnXLjj3lOnNvrLTB6oy4SyWZwp2qi4KjPQsvfacPttIjzMUz20K2PqgsF+m6fAMV7vni0UmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mo1sJUtm; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mo1sJUtm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0Kq375nbz2yGM
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Jan 2026 07:27:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49E9E60097;
	Mon, 26 Jan 2026 20:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67FDC116C6;
	Mon, 26 Jan 2026 20:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769459272;
	bh=Hjv2Yw081h0FcjvO4Kz0wydsExKWm01KIMGvO/zJ5bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mo1sJUtmjHplBsBqIDimM0EW/wY6WhOptg2ueMr+ntA9Q7hGkT5A1f+vnFrgI5XT6
	 wOkj+yInJBM0sQ7fJPRYRFyJR7yCmmqO8QEpaRu2WZiJQSI8q0oYTesOq8GyyxFDfi
	 TUB9ymWpvRDG14fkpUO3BpGJUddyOragqweVeheOUIPw32jf9jIAoc9UrFTzXkGO/2
	 pzXS76Djqqo97qz6Q88x98hRLomo96CbR8sfX3uyjiQ9E3ffC1d+je28/0gfNoFKlf
	 nghdJxzLb1qsIKZ5Z+c4+YcfjBaZH88/UiCIBsr2usH4exbiwVx95h32nDpJS2BnRN
	 T4PSLf81G6bAQ==
Date: Mon, 26 Jan 2026 20:27:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Asrock Paul IPMI card
Message-ID: <20260126-broadness-usual-bec523f5168d@spud>
References: <20260125-asrock-paul-v1-0-956085a4bd06@gmail.com>
 <20260125-asrock-paul-v1-1-956085a4bd06@gmail.com>
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
	protocol="application/pgp-signature"; boundary="KuxEHiadtSP7EwGa"
Content-Disposition: inline
In-Reply-To: <20260125-asrock-paul-v1-1-956085a4bd06@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:anirudhsriniv@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:zev@bewilderbeest.net,m:renze@rnplus.nl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2404:9400:21b9:f100::1:from];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3428-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.75.92.58:received];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email]
X-Rspamd-Queue-Id: 66A088D108
X-Rspamd-Action: no action


--KuxEHiadtSP7EwGa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KuxEHiadtSP7EwGa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXfOQwAKCRB4tDGHoIJi
0s5JAPoDcAVSN9xAbbUSLCIDny7M/EexK6qJHdf3IOAmst9B/gD/dULizOHoJ6Xj
fCB5mk29go1dluF1geo6mBCrUvOZoQo=
=33yJ
-----END PGP SIGNATURE-----

--KuxEHiadtSP7EwGa--

