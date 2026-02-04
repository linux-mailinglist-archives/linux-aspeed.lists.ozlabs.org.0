Return-Path: <linux-aspeed+bounces-3477-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBDtBD6Kg2lWpAMAu9opvQ
	(envelope-from <linux-aspeed+bounces-3477-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 04 Feb 2026 19:04:46 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB2BEB5BB
	for <lists+linux-aspeed@lfdr.de>; Wed, 04 Feb 2026 19:04:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5pCZ55Bnz2xm3;
	Thu, 05 Feb 2026 05:04:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770228282;
	cv=none; b=hhNx04kNjd0hFnwhLwETAQKFD9R4lMDN2TzqMqVKdpL8GEobW8oAl4KtrO8XeSBK4frB973IZ2bI0QMJ6MN0lcHHOSdYUfXVcWD0rHtRIWjgN4BoYBbnrsfXa7g/P/YY/oF6mk+uZROpT0PB3Ff0HN9FcishJu/16c0nujGpw3FjznnnumeIZ1LutfO9E+WAMvV+Qf4wx1fNTuqX8iubSKsalQkdZGcZoDAgudxrlPKLlcqtz5x1/+HCrjIzwvhwlYQpMfc2Fvv68wayonCdc0Z6f8UVAA+wG7Gb5IyZ3GCE3Ph+RPR6Xo59CwDWonNfkXTKyjVz5WSlzC4Gldo8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770228282; c=relaxed/relaxed;
	bh=jBQp3nLqWP8FzkdVHFvaNH+FKz7q+nqq4HbvzVC2Nu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3hyosYBY3xqOkA82D569NRy+se/3QZ/c6Ooji8YBJ6uwuOQAgMdCEHL8ddfVbmMgby4VHxq2m8sNZOI+aveFL75QM4xAshDd3pmH6TCu314cKtflBJ86iEF+mvPxytpeb4pLN0gcDvW0fy+pE3ihnlnMfOq22kgZ5OMJ+3Jo4Rc3sM97lCVYaxFMp2m8Ry4Nn30SNGy9JtdOidGl7gK4P/4hQP3W8hjUtWpvXp+NxzyANNmIV7I4ShK6AjRShJ36TjFRt5Yoqk6iQ6jj7VwlGEtQpBSCFodmSwkwTwosAWETyJO/pOHYBCfHm2GRdWU4TJuE2IZgylNt8bBWpS3aA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XiM/vKOW; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XiM/vKOW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5pCY6c9qz2xJ5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Feb 2026 05:04:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7ADCA60018;
	Wed,  4 Feb 2026 18:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49896C4CEF7;
	Wed,  4 Feb 2026 18:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228279;
	bh=jBQp3nLqWP8FzkdVHFvaNH+FKz7q+nqq4HbvzVC2Nu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XiM/vKOWNK91k16+wMf/KvrhwbJ6NFyvbtXkWOVwjmzZCPRxJN6PY8RXr5ziRjKB+
	 R9aSFT9o/FHbv4v2OOfiWatyfue9hrEHPxKvKa+H7m/HAyB4ras2wLyWGjl8ekpjLs
	 UYMn+/SJz/Qr3Rg6m0uBjNXQ6xhWODWJZJMHcgMFLiT44j36bkX5qC5l1EDmdo2P1h
	 DZmRnUNe80PVYJAHiRR2km7FokPulAzVgQeTRj0AMkA/rmrKbp9ZVs8slwEKZTMV+/
	 4HniVwhcTVEwwzOgeOlP+FVdFQtyZ1ohnRN/NggPAbWT3T7jOTWnz0yi4IqR7BE9X0
	 m7RCaFbzmbGlg==
Date: Wed, 4 Feb 2026 18:04:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Williams <patrick@stwcx.xyz>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Roger Kan <Roger.Kan@quantatw.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta SanMiguel BMC
Message-ID: <20260204-pentagram-undrilled-3c85ec087a2b@spud>
References: <20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com>
 <20260203-sanmiguel_init_dts-v2-1-6a5682c32b38@gmail.com>
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
	protocol="application/pgp-signature"; boundary="8hOsCkrKAc3Pq8Lt"
Content-Disposition: inline
In-Reply-To: <20260203-sanmiguel_init_dts-v2-1-6a5682c32b38@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:potin.lai.pt@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:patrick@stwcx.xyz,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:Mike_Hsieh@quantatw.com,m:potin.lai@quantatw.com,m:Roger.Kan@quantatw.com,m:potinlaipt@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3477-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2FB2BEB5BB
X-Rspamd-Action: no action


--8hOsCkrKAc3Pq8Lt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--8hOsCkrKAc3Pq8Lt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOKMQAKCRB4tDGHoIJi
0hsIAQDcWkSEb+P7WnSB/EHaS0NN88Ti/rykerSiGLt2jE9mYQEAzYAaHgX6rASe
Gfdsh6cxkDzBBA/abp5+aRh1+kIgCw4=
=PuSJ
-----END PGP SIGNATURE-----

--8hOsCkrKAc3Pq8Lt--

