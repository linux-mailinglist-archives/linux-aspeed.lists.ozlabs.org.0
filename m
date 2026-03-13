Return-Path: <linux-aspeed+bounces-3665-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEcSOCY8tGmDjQAAu9opvQ
	(envelope-from <linux-aspeed+bounces-3665-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Mar 2026 17:32:38 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 106A828710D
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Mar 2026 17:32:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXVQC22hwz3cK4;
	Sat, 14 Mar 2026 03:32:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773419555;
	cv=none; b=N/4/MrPH05DgrlioPS1AcKkZGUlMUV1B3OjE1EZEfaw1izwTigEzyi1YkR+6+NZvBmrFFaVWIfpx8pqx5hk3kqo7WKMaWMLUCSpZnjIYTXJTLOsKZr5lIEJrM6RxthCvK4oEdZAL99lGCIs6kPQR7XRJAyP8mEj1DNxD7N5INAF7mdhi8tBHOgB9SjMJxmFSmk5Ur24e+y2Gr7uaDrQ8ikCRhl1IEOEfI4CBNaeLZ2+BdbVmDEAPtRliSTTbBLDUGmmGhqCTFZNjCeZJ6nerP54M0HlpwEKyUG2ZC9XaIT14b5tyScq+15Q8/6nzmCgiLWClAPN51KXSXBnZiRZXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773419555; c=relaxed/relaxed;
	bh=DSb/WiNQkEyVuXqoR1/RIujXaR4Qcx4XeEfZ1bwORAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwRn9VUhTXS65PxZJ0IWzy58DHBL5jyPKj2GZJvZsgQ7iXFbJxRiMi7N+yYVCCMMYyHJ0NslHTIsvF4ePe0HDG2cs3++YmtYm5SEMXNwxDGInGT5BRl3aZcFmYIU8rdaF3OLbxFCqWEne5iguQBAW3UU5EWZqJZzizLRBq9uLds1aN6diBufaak+Ej4HkTzNSApYf+UNjZ+J/OyKucGikrkjRWiVgfXtfKwo/cIxnPaHyqZpI4iaYrSXASZcgPrkbj8aFND5Ot8go1mk/e878FYnPRLNMkL0gEU2PdVxe694ABTh5BNfF5WPUx/e2UFBEC3tlY8ZDKrYe4C6PoEBuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AiuPWHot; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AiuPWHot;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXVQB2dtYz30Sv;
	Sat, 14 Mar 2026 03:32:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8463D6013C;
	Fri, 13 Mar 2026 16:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C86C2BC87;
	Fri, 13 Mar 2026 16:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773419551;
	bh=CIellapUW1+YjJZ9d2SpELMqrNBmvRAjw1fsXMHuNYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiuPWHot8SbFapVb3TIecP0Kil02229FoPHuRNl4f+i42vizPrG8N0Mfot5rjsFW6
	 joRLyDy91I1ywpKOXol4RGHrjs5/t/yfQTPKoJnw7s7ZchkI+f6+4XR32wDSKt7jEK
	 UagzNGkvqEXlWRD9Bp/sNMShqP+LSW0Wtf2wR7hvWWTdEFueNWqTNdg+OatyQyEa73
	 l7ehFXvhipdXKNFXm2RcK50hsSnFE119k3/hXhJmt1prXl2Q+xP6KeVtMk1TI2hhgC
	 UVgNK0VInD6ukeFou9G6Ip0fcBINpcjJQkTWUY1G2uUh8Zq1bgobc+g23FiWSis1iS
	 f3QDPMsufA7Gg==
Date: Fri, 13 Mar 2026 16:32:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: aspeedyh <yh_chung@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	maciej.lawniczak@intel.com
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Message-ID: <903bcc13-5b50-462c-8fa8-051f07748127@sirena.org.uk>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
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
	protocol="application/pgp-signature"; boundary="F2hu5EuVOUo3uSja"
Content-Disposition: inline
In-Reply-To: <20260313-energy-casket-ca8adc1f1fd1@spud>
X-Cookie: Monitor not included.
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.81 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3665-lists,linux-aspeed=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 106A828710D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--F2hu5EuVOUo3uSja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 04:24:22PM +0000, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 06:07:35PM +0800, aspeedyh wrote:
> > This series adds initial support for the eSPI controller found on ASPEED
> > AST2600 BMC SoCs.
> >=20
> > The series introduces a eSPI controller framework for ASPEED SoCs under
> > drivers/soc/aspeed/, adds AST2600-specific controller support for
> > peripheral and flash channels, defines the corresponding devicetree=20
> > binding, and adds the AST2600 eSPI controller node to the SoC dtsi.
> >=20
> > The driver is intended to support host-BMC communication over the BMC-s=
ide
> > eSPI slave controller present on AST2600 systems.
>=20
> This all seems to be in the wrong places entirely, shouldn't an eSPI
> driver and bindings go in the spi subsystem? FSL's appears to be there.
> Mark?

As documented in submitting-patches.rst please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--F2hu5EuVOUo3uSja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0PBgACgkQJNaLcl1U
h9AAYAf+L1uxDFy0+AOhCEgiEggmR6FDeUbMGbqzgBvrCvnN+F2MpV8AWF7bFJfG
/bUEMAYMn1InW0Xj5aP6ITHk4X4CxIY1K62AEj5kjT/pMIfe7e+ggSATZNwR4kPK
6CHD8Gw40/UsogozFin1KplzPpCjzfXkScCFpT4g0lDWLp/FohmBLC+57+LrjpV+
PAtFlfcxBf+BgROn9ioH6FlSJHpcSxqwCLg0sIo/ZCcGyDlLuySN9zyBpIVwZ9SJ
YasQI1vLbWj+oI9WoxaDEibuKaMeBomWL2MLklbtumzbAB9fLrmwDnH4Q0ZL7swh
oGrz049gojg+z3JNaufDsOtPHZoLRg==
=0yd5
-----END PGP SIGNATURE-----

--F2hu5EuVOUo3uSja--

