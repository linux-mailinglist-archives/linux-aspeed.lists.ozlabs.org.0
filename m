Return-Path: <linux-aspeed+bounces-3560-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGwWMMLcoml06AQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3560-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sat, 28 Feb 2026 13:17:06 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 293551C2E7B
	for <lists+linux-aspeed@lfdr.de>; Sat, 28 Feb 2026 13:17:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fNPMJ4zYnz30Sv;
	Sat, 28 Feb 2026 23:17:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772281020;
	cv=none; b=ahFTcLkIi8Cvowb91y4SRJTyo7XiGnmI1gV5mgi4/kLto/eM/26JA6qTFhP7Ew5Ew5K9l7mYsR76EuODEo3Q4qxTu47nIsbFtxMkYvaBQeFCEnwnIfIa/lYZmjzAZt/y6CpU1j+r0NJK9dNCS4l2WIz5Z9RYrMSgM6JiSpxErSU/WhqfI2P4M1v7Ni3204/6vRMA/wzVz5eGKNppbLyA8QlFvgOqPw6AJ9FfLUxO1VvhTWqGw52JWCD3xPHHtI0ILlUm0pvQHWW7Mkq5o6hOy3jvUG0Lcs3QK54DiLiPmbTRM0tGrMbIFQjbHCZmlpwSblRR23J0hC5gIWNZpwHCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772281020; c=relaxed/relaxed;
	bh=J2ieGgRGiCf3dPWobWimNazbBrlqmUCwKlzybnaglR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDFTT9oiIQeQDFzhRS9Tpoxxr5PmVW8SrQbFWByYvQL7weZUhOplvc0ZlMnqINYZLyXqChmNz8chyXHoMQM9xpLakk//zB8X+ZQ2v9cjwE/awD+0SojHuMNroYZo+I+MUEl9C0RUfEGSthTJDLO8ssu2u5hZjW41WGJsZO6LYqZYi/+uvsL+X10aH5ivMc4s9+9KFqBb5k8wODD1LOjSEuJzxSC6lQQFg0kPeP8q2Gh5pQcDX+wsgtgYMcZGnWQoQNM1ahuGBUQAptlilf7WNvbKncF1nctjACfvHOQf7k+4BOlunpGiQzocQ0gGkHXe6+op/dFOf4+yBG+y2+H/CA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YtbXngux; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YtbXngux;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNPMG3y6Nz30BR
	for <linux-aspeed@lists.ozlabs.org>; Sat, 28 Feb 2026 23:16:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FC4561335;
	Sat, 28 Feb 2026 12:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C73C116D0;
	Sat, 28 Feb 2026 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772281015;
	bh=eKfWdtF1f8rgeMqH6Rg4gSPSLAuvp8Ejd2HbndMRVlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtbXnguxTm7DWEOff7Ou0m+dXJUWhKOCdT4kpXC5lXnCi4e6zYNcevBrWR5OWbkpg
	 CTonEHikHwJbQATZFzSiBqbOAd8+dmUjmGIf85504Fa6UXDp3r1fE0ISg7eG7ohL+C
	 YET5Ul0ktj1UwePxGoKmG0l3YO9rjp+FMX1bzUOlw7FVkrwJYSfmJRm+xCJ6UKW9UD
	 sgeoKqWIqJalg3THL7Nkd0t+Z2IIZwlYRueqHaNnyA0DdR13WjORPREO5oYgx1erk/
	 Bx1SXrdevQr9TdAA6pfg6rP34NH6jHbj6FptTgtX9AgtAIbAGl8rrnI9zO8ZrpULaI
	 vw3tK06BNfF/Q==
Date: Sat, 28 Feb 2026 12:16:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Haiyue Wang <haiyuewa@163.com>
Cc: linux-aspeed@lists.ozlabs.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jammy Huang <jammy_huang@aspeedtech.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: ast2600: Add reset definition
 for video
Message-ID: <20260228-entourage-awoke-92c61c5b1544@spud>
References: <20260227151602.829-1-haiyuewa@163.com>
 <20260227-smooth-carefully-f427e242ce58@spud>
 <16a430a2-fdc9-41eb-945c-0727feb7b9d6@163.com>
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
	protocol="application/pgp-signature"; boundary="snTcT9PcFEKvQmUU"
Content-Disposition: inline
In-Reply-To: <16a430a2-fdc9-41eb-945c-0727feb7b9d6@163.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3560-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:haiyuewa@163.com,m:linux-aspeed@lists.ozlabs.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:jammy_huang@aspeedtech.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 293551C2E7B
X-Rspamd-Action: no action


--snTcT9PcFEKvQmUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 09:20:56AM +0800, Haiyue Wang wrote:
>=20
>=20
> On 2/28/2026 1:33 AM, Conor Dooley wrote:
> > On Fri, Feb 27, 2026 at 11:13:14PM +0800, Haiyue Wang wrote:
> > > Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
> > > header. It is required for proper reset control of the video on the
> > > AST2600 SoC for aspeed-video driver.
> > >=20
> > > Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
> >=20
> > How can a binding change be a fix for a driver one?
> >=20
>=20
> https://git.kernel.org/torvalds/c/9897831de614
>=20
> If squashed into one patch as v1 does, it will have patch format warning:
> ./scripts/checkpatch.pl ...patch
> WARNING: DT binding docs and includes should be a separate patch. See:
> Documentation/devicetree/bindings/submitting-patches.rst

Adding a fixes tag implies that the change you have here should have
been done in the patch you're citing. If you had done it in that patch,
you would get a checkpatch warning there too. This is a separate change
that is needed for your dts changes, but is not a fix for the driver
change.

>=20
> > > Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> > > ---
> > > v2:
> > >    - Fix checkpatch.pl warning, and send dt-bindings as single patch =
as
> > >      the submitting-patches guide.
> > > v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.c=
om/
> > > ---
> > >   include/dt-bindings/clock/ast2600-clock.h | 1 +
> > >   1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-b=
indings/clock/ast2600-clock.h
> > > index f60fff261130..7b9b80c38a8b 100644
> > > --- a/include/dt-bindings/clock/ast2600-clock.h
> > > +++ b/include/dt-bindings/clock/ast2600-clock.h
> > > @@ -124,6 +124,7 @@
> > >   #define ASPEED_RESET_PCIE_RC_OEN	18
> > >   #define ASPEED_RESET_MAC2		12
> > >   #define ASPEED_RESET_MAC1		11
> > > +#define ASPEED_RESET_VIDEO		6
> > >   #define ASPEED_RESET_PCI_DP		5
> > >   #define ASPEED_RESET_HACE		4
> > >   #define ASPEED_RESET_AHB		1
> > > --=20
> > > 2.53.0
> > >=20
>=20

--snTcT9PcFEKvQmUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaLcrgAKCRB4tDGHoIJi
0qIzAP0fCpQvHKxzjpBO3i3FwHRprWGH7sA7u2Vc1d8vbM7pAAD9Gas2h7A6tW3J
h4bNYkprIt1F73c2ydusMJO0tnEhwg0=
=kgT7
-----END PGP SIGNATURE-----

--snTcT9PcFEKvQmUU--

