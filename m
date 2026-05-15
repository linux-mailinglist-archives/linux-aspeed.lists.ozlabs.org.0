Return-Path: <linux-aspeed+bounces-4037-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNWdJoFVB2oHzAIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4037-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 May 2026 19:18:57 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540C554CA2
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 May 2026 19:18:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gHDSY0PQ1z2xnZ;
	Sat, 16 May 2026 03:18:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778865532;
	cv=none; b=n4alYyDNcTOub7WJ/ukcpvv9dWxpOcjDvrUr+yDCWUKY30GUa/lFxaYMtyTwu7Uo9PRA9bjJ8f4OZz76y6w2uoRKqglOUPInnmdaH+Lpnbz/dN7Vw2atbxuUMp4BFO0WPSkmuuZYq+5csImzEihakeZb5rphEMZV4y5lBqMqnIJRhIxxwWymOdfv+9vwZXo8TKqxM/zpT41vvYCBmFRWSvSKE7iNcDthsKVJrzw+nHzCrJg0+/BBZLZzcrW1SCDTuh4sC9EyKv0dvPVCRta1bwobiC6nA50Pu2DHV6rZ8/OU4i8tGWI8WjDpwutHg0PQLrA26q9f7qENs0mqijqjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778865532; c=relaxed/relaxed;
	bh=pvUZG8OFOWYSFaFznbd7VEZqz4mfURKI3BrueEuTWzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azAE6F7nAuZla0v6+KBLgdopHOzXiNAZ41A+TKcn0+UvOzHfoA+df0WRziJvrx85oT6mvWbn3DNzdVA7OiiaBW1tQhaziTAFvvjqJVDEWflRhjfmaKARXI5HMiJ7ynm2u64+ivGKJLLLBgnF3Fd75zy1zOpbIrhiHqFWJHFEDrpaQqVZl3Pe7pqNww9IwX0NCbeP0ouM+BDDSkyYquDSzishlwD7+i/XJ1Av8sIsNTM4/4y4VEbGTdGFJKPbybI3CE/XAS6iVnKHMu9qlbh03SM3iJW97PNqNHzOg1t8tK+VAXuRH4N6Ux/r3V1DOQ25ZhLuIiI3FZY2GSqH9oVLTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=liRR5gCg; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=liRR5gCg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gHDSW5cXsz2xFl;
	Sat, 16 May 2026 03:18:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A5C044203;
	Fri, 15 May 2026 17:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F06C2BCB0;
	Fri, 15 May 2026 17:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778865528;
	bh=pvUZG8OFOWYSFaFznbd7VEZqz4mfURKI3BrueEuTWzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liRR5gCgrghUx/YxVJAfx1NL632CmfqaPCvMsKr+4HE1Ogqi+h6+Y7HHYWE5GBbeY
	 R/aK6POAoUiksle7mNRiplPPutReaHupZGTLgyT8Bpg/Eb3zjeK9O4XwmtFjCFhJkN
	 10w1pG7VaYMKaXJoPfwhBFqMN+KVGmlf6q80WnwW13WxV4YN7iEMPh+c0jLFlaS0cu
	 xF3j6Kg0mq1NfqHOBWzJ9jm3R74wJlgnCI7ZCzLC8Ss1t3g3Z50A/Z4kxkt0+lkwOU
	 aResWYb5xog1FSM0lguF5nxi9rIAMx00XvVruIBjy0xS6uixx3+NOtmZB7a9gulnR3
	 5iFEMVXgKRyAA==
Date: Fri, 15 May 2026 18:18:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>, patrickw3@meta.com,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
	openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 AST2700 SoC1 pinctrl
Message-ID: <20260515-schnapps-uncooked-177724828e23@spud>
References: <20260515-pinctrl-single-bit-v3-0-e97da4312104@aspeedtech.com>
 <20260515-pinctrl-single-bit-v3-1-e97da4312104@aspeedtech.com>
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
	protocol="application/pgp-signature"; boundary="l55Ya1GMCDxdgVnh"
Content-Disposition: inline
In-Reply-To: <20260515-pinctrl-single-bit-v3-1-e97da4312104@aspeedtech.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 7540C554CA2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4037-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email]
X-Rspamd-Action: no action


--l55Ya1GMCDxdgVnh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 05:37:37PM +0800, Billy Tsai wrote:
> The AST2700 SoC integrates two interconnected SoC instances, each
> managed by its own System Control Unit (SCU).
>=20
> Allow the AST2700 SoC1 pin controller to be described as a child
> node of the SCU by extending the compatible strings accepted by
> the SCU binding.
>=20
> There is no functional change to the SCU binding beyond permitting
> the aspeed,ast2700-soc1-pinctrl compatible string.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--l55Ya1GMCDxdgVnh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdVcgAKCRB4tDGHoIJi
0o0eAQCfCKP4u1gucOjpM6unsuNYH1ObZr6/u9PFfMNjTIUy3QD/cc0ejlq8efRu
gg9kIhJOjzD5xQQu5JLiBVcerSsaPwU=
=JJiP
-----END PGP SIGNATURE-----

--l55Ya1GMCDxdgVnh--

