Return-Path: <linux-aspeed+bounces-3670-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJzmFryztGlrsAAAu9opvQ
	(envelope-from <linux-aspeed+bounces-3670-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Mar 2026 02:02:52 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5ED28B0F4
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Mar 2026 02:02:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXjkw0J7Jz30FD;
	Sat, 14 Mar 2026 12:02:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773450167;
	cv=none; b=QwzUITSM7wGPiiGCXPDb8x816hfIY2/CDGOcUE60w25jWBJvn7iGMBbqAtPxyZpZXcvJEbJe6m9E4SdX1ONRwGB165ht7GL/pctbMPPPdd4+/XLb/ullHDSsLW2aH/C2CLOMPnfZTO1eddbqVrgjLx48ue4QRmhLi9A+HpDtmu2r3RIiutJ4jP4xBcypdV5qmjNrxdHWLZy/TDxQ1DVbl2githspJ2So2sswsixb+WE0soIKVF3SdW03ksF7AXAstNaxx+oj6Tjo1wBehJgGSG8jefkivmm7UW03lACVixwCAmL0vjfZksA9P7NcJn+lNMztmLN0OUGlxghDtUhL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773450167; c=relaxed/relaxed;
	bh=tWYs9DvU+mZ9LOVAyOnflvF29x67OnKqYeQPgwvkhk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2uNjnLm/5K7iilW8gihZ7AK+7iIoZSCGv3VS/D/pkEcI/aVT8tWpzBu/3lHmmD/7cEY//mQy10cuLIc6xu1awILaQfb3D68NagXPcPRidxTj3b+TDN4lcKjh1ETgkbnwW9MMgDMVUGnR6dhiN2DYW7+JBMtHxOLne/LPxiqodnAInlumVRgzWDWZGV65PnZokjnkb7u17m5yEZbCaYWKwm5b2Pb+duXWk501OJGLmwppEWjGoRC8rmFywJtuiljAgRHSHXSSP8iRog4R85wRY2F792G1QObjf23dV+a44Ii23qGTP1azM14p9lkluG3fGNv+loBbbRrbZut1kp3yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HW3CN3RD; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HW3CN3RD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXjkv27Q7z2xqD;
	Sat, 14 Mar 2026 12:02:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0C7540377;
	Sat, 14 Mar 2026 01:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73374C19421;
	Sat, 14 Mar 2026 01:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773450164;
	bh=tWYs9DvU+mZ9LOVAyOnflvF29x67OnKqYeQPgwvkhk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HW3CN3RDbWA+xtGV5+q0X5flLSMIlP4UDcr0sHpw58UExgbzgaLZffft5PqZxZjoz
	 fdXAuS0ACArf5KBcnPgQrH27JvSnuro2JwKApqnp+R4PG3AkXpKt7K/cH+vY7Jp7Ee
	 B2t4WJUr6v5cML8RtKPTRw5pdElvD2OLBUE6VXNNoxtFNd49pL7qkvqNADoa3REIEA
	 9zyI2Gke6d/8TioKlqGFQoAf0J0eRXOBJ4nX/H1wYPHePY6n7l+h6I9lNIV5GuElMr
	 fGBXbj9BG5G0r8uIWbalHPkkBgKhuKBumA0WwgcPPRyRYFg2NrEXZv4p3VgQpISJMs
	 dPvzjrR6hPRpg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E13621AC52DC; Sat, 14 Mar 2026 01:02:39 +0000 (GMT)
Date: Sat, 14 Mar 2026 01:02:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor@kernel.org>, aspeedyh <yh_chung@aspeedtech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	maciej.lawniczak@intel.com
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Message-ID: <abSzrxJVcWi6VNTJ@sirena.co.uk>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
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
	protocol="application/pgp-signature"; boundary="As7T8iPELD/sjSqV"
Content-Disposition: inline
In-Reply-To: <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
X-Cookie: Identify your visitor.
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.81 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3670-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.co.uk:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: CD5ED28B0F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--As7T8iPELD/sjSqV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 10:36:02PM +0100, Arnd Bergmann wrote:
> On Fri, Mar 13, 2026, at 17:24, Conor Dooley wrote:

> > FSL's appears to be there.

> I think this is just a similarly named device: Freescale/NXP's eSPI
> device driver is unrelated to the Intel eSPI spec but rather implements
> a normal SPI driver the same way that eDMA and eSDHC are Freescale's
> implementation of dmaengine and SDHCI drivers.

Yeah, SPI with a random letter or string in front of it is usually just
someone made a new controller for some reason (often a new feature, like
all the QuadSPI devices) and wants to differentiate it from their old
ones or connect it to other branding.

--As7T8iPELD/sjSqV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0s6sACgkQJNaLcl1U
h9CIOAf/Rrg0d27a/vhMLtPcEjSZQoXrrlz9ZUG/qs9V8Fvp+um7hK8PgZScqRn0
zbQKVJrMc2M25hSr6WGx7z3DNp40n5vwepJLhtVA8IGa+3IPMQJ0LchIGlrTVl/X
cgpRptD7myafQdktC0w1Lz2OafkIWFKxCcVj5jj8TCsjzlfwmIFrrCH8NbPGklhH
o309ZPAzFdOJNxV+h19WsfgXgIawJyZ8Qer7m3Ub4xSL6QvOk05G1nEqFDW6o2RF
uybGs9uOe2wUH7yBDIVoVhE7nPsr4npiTNG7zkvZRc4jtvb+i4mAgUbNtvuTzpJk
wCsgdWoq1QUE3wwIDdZFol24nhVa5A==
=FOG0
-----END PGP SIGNATURE-----

--As7T8iPELD/sjSqV--

