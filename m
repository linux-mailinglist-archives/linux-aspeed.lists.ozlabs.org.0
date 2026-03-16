Return-Path: <linux-aspeed+bounces-3691-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPWXJsXjt2mzWwEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3691-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 12:04:37 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5617298736
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 12:04:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZC0J4pW7z2y7r;
	Mon, 16 Mar 2026 22:04:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773659072;
	cv=none; b=CEff/rlwHf+kH+57s/t8Qt6dD6Xa1yPwKA1fOboWiqpqEYb0eRYUUZmVtDl81srwjJOewGOKxAtJ4gqU1quglbae9Lt3THVJru1QmceLAk1M+eD+cYRVJDtM+I/NlPrSqHQTHYy6OUF5ufjuc/T3oWWoglzTjotI089UCU59bpSVQJkXz+51GacTcKVLDiOZVjSV/08Wi2smCH7SE41vY+hFZYAyW76BaX5KDmVuTyCzP3PuKPzgZzmp8IvM4gVae28pqA/H0ORcik5VRbZQCISCOzBdqSKXxSAmVmJd1w98D/Le2pMbLut6sb9q6OG5WDJQDdOcy68LGq3i0YfKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773659072; c=relaxed/relaxed;
	bh=2DIone3jg6s/bvR9xvorp3oQLfBJ8sNQo4lvx+TrKzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYtdzUJLTM2+g/l8fEX4x2CWO/OHY8TML+4a/gfiJnGEfQlEa76Hi379M1gIfQLZYLL3zjebScJsT0yZR1a/UqlwboV5or2nTW0KUhyqG2rDqvhrDPjJiDRlxXAn2z84eBQXflPFHc48+ZR0BEEwjqVR9MrIVHZwmwibCLeQjOt/TfKTXq0UVrCCS6umehzUiMx4ASE0I0mj1uMLIXbEoj4dFZGUyxwy4S+wEdLW3zJC9wPWoSUca10Qr/eVQXsUBvp4pINjabecqpUyLsZlypne27MUBasEKiAx0p29UIKTIyDvv8Vozn0TcwIsALIQ0xAeI2Vdrx3XPt55/82O9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sKVsIZQw; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sKVsIZQw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZC0H5wCRz2xS3;
	Mon, 16 Mar 2026 22:04:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0295A60008;
	Mon, 16 Mar 2026 11:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D827CC19421;
	Mon, 16 Mar 2026 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773659068;
	bh=2DIone3jg6s/bvR9xvorp3oQLfBJ8sNQo4lvx+TrKzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKVsIZQwQUkISgece+I9dQn2bEqF6SxAOS8CimszXHO3ZXbp/wiOzSLPhYnsjg+7a
	 WXPU0ADwtHw8PqCLm92kwNE4q2rmWW46Rc80FWihrvECJDjVm+UCCQOV2TakQyDDfj
	 4c04rluUfBwrsDec+TRoirdcI8X45mfq49AnY7UICRJK95QROJSh4MCTdq2yDe3uCO
	 NiZtH1VigmmzkLkTICfG2Gee/Smgiwd+HSnxmlCIlG/1orpvNrKCUvcmXNGOzxRBa9
	 aeNZiTW1p44E9yM1hFoRsiK6TmX2O+PUQDcIOiMrII3CTN0hIB9UcUx+DNfzBPKmwZ
	 22HXK/JNG5rgw==
Date: Mon, 16 Mar 2026 11:04:23 +0000
From: Conor Dooley <conor@kernel.org>
To: YH Chung <yh_chung@aspeedtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"maciej.lawniczak@intel.com" <maciej.lawniczak@intel.com>
Subject: Re: [PATCH 1/7] dt-bindings: soc: aspeed: Add AST2600 eSPI controller
Message-ID: <20260316-moustache-sleep-0a355de2fc8e@spud>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-upstream_espi-v1-1-9504428e1f43@aspeedtech.com>
 <3f2d964a-4e82-414c-b373-af0d531b0fcd@kernel.org>
 <KL1PR0601MB4276A4B81C2E2DB02BE8F2059040A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="p0eyabYdCPkKrMr8"
Content-Disposition: inline
In-Reply-To: <KL1PR0601MB4276A4B81C2E2DB02BE8F2059040A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.31 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3691-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email]
X-Rspamd-Queue-Id: A5617298736
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--p0eyabYdCPkKrMr8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 08:17:48AM +0000, YH Chung wrote:
> Hi Krzysztof,
>=20
> > On 13/03/2026 11:07, aspeedyh wrote:
> > > Introduce the device-tree bindings for the Enhanced Serial
> > > Peripheral Interface (eSPI) controller found on AST2600
> > > BMC SoCs.
> > >
> > > The controller operates as the BMC-side eSPI slave and provides the
> > > peripheral, virtual wire, out-of-band, and flash channels used for
> > > host-BMC communication.
> > >
> > > Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> >=20
> > Please use your full name. Semi-anonymous contributions are not accepte=
d.
> >=20
> > Best regards,
> > Krzysztof
>=20
> Thanks for the reminder.
> Would you prefer that I resend this series with the corrected sign-off, o=
r would it be fine to update it in the next version?

Next version, when the discussion on the cover letter concludes, please.

--p0eyabYdCPkKrMr8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabfjtwAKCRB4tDGHoIJi
0sE8AP94P3za5WQ9N90Wd1Vz+WrRp0x1izasFrcHhDExJwDpTAEAt7w0yx0NVBph
WxM/X/bio4Z/JwcJG/5q7nB/qMRalgY=
=Oz5W
-----END PGP SIGNATURE-----

--p0eyabYdCPkKrMr8--

