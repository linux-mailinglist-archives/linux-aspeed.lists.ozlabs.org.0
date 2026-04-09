Return-Path: <linux-aspeed+bounces-3882-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A8lOI7H12n6SwgAu9opvQ
	(envelope-from <linux-aspeed+bounces-3882-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Apr 2026 17:36:46 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BEC3CCCF7
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Apr 2026 17:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fs3vD5llGz2yfS;
	Fri, 10 Apr 2026 01:36:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775749000;
	cv=none; b=dEck7wYCNMHDkGJ+2CW7PSd6TvgvgoYRq0KtBapGQNTAkQNkJNzV8OqXYxW4F1MZd/De6I0B92dMZhiF17DzOoCN9hGB77PzSpzK+b+Aww9wbBkGwDPZU1NL/u78L09ENGgw6KlX1XfmFOvKKQeeyY+vHNJgeZPGrafuviEwe4ccvlA7uxMQQCF6Ar/2Kdr/Ij8XuyGSHDlVdKr1tp9rY5E2yjkdDLGjND1av2wyi2ML4XZZyhdPJthVzE3IdFemRTW29bXPNdcXYVlbPqwsfohLX1wS3xwlSWxRfjObaXcSMUy79KFQFUIxhR0RVDTVaDw/NtK1n60UKDtfF2rwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775749000; c=relaxed/relaxed;
	bh=vgHNWQIVNQLVnmYjQa3phpy4f8LkLj4MRmL9b19wYtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flF27jAMr+V9n5/e6G/6TuHbVbGvzHUVBROA9jIjeuA/gJMMiWlhTe47lc6q4D3C+8vBWMiO7feLHt+IBI5VM1Jd4k0mm5i5q8rR7fOGp+sdBZ12mUvAmSusA1k1hPlQvBOC4IySyA0K4WsUlXk8EsVxOo9IxyoPjV/XG4GO82AD5YsZ0oxmBli3tMioYLYY61/N3r+NwiwlVyLoccJBsdkc/AqOBfLQ0HyzsJr9TA4/H/0/rZNPzXzd8JC8MDkh4sDxgjxK7H9edcFO0U6Z0mVbULdrq1GlUWJMM/hb4IztcRmbhd+pyUdtqtBaGF0luTjgCAgZg4Z6PBL/YVacZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bl3HTEr+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bl3HTEr+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fs3vC6BXcz2yT0
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Apr 2026 01:36:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7DA64028B;
	Thu,  9 Apr 2026 15:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66950C4CEF7;
	Thu,  9 Apr 2026 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775748997;
	bh=vgHNWQIVNQLVnmYjQa3phpy4f8LkLj4MRmL9b19wYtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bl3HTEr+tRTCJMBfshW+D0LvT7+dVBTWHSVRPqwJg4GWRC1ZuqXeKWilLsfJAMsVk
	 NUN6t6sZeE1thBJbl2Kginnj0r/IxSLfPBkGtNKz9xYtpkPnUmtg2PB/qAtbv65/+9
	 3f2gf4qZaxr+kAIAi9OMoZtmY57x2HwVvNaRq8P7WgjnvgxhCPB/kki6hiGBz6Ol6w
	 lNP7TugPcnxA3T/T8vVT4NgWa3QzQUbN7s/bQ60y5NIMktwnD75TYzHUcZP/V3rg9j
	 W0J2hPaCl2AS/366YMN9Rlt1mtLsbQMqM0pg242CnTRb2Rku/de2xP6IPIeCLF+tYL
	 cC7KtRAboBOJQ==
Date: Thu, 9 Apr 2026 16:36:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2
 board
Message-ID: <20260409-foster-stability-f77b38c6f7a0@spud>
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
 <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>
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
	protocol="application/pgp-signature"; boundary="94RiNPJk8aF+VXXp"
Content-Disposition: inline
In-Reply-To: <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3882-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 15BEC3CCCF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--94RiNPJk8aF+VXXp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2026 at 07:40:26PM +0800, Colin Huang wrote:
> Document Anacapa BMC EVT1 and EVT2 compatibles.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--94RiNPJk8aF+VXXp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadfHgAAKCRB4tDGHoIJi
0lTBAQD3cz6MzoGwGp8mKC6FkE8r1DyqVtkBVRvjGhBwfipPqAEA62JE9BQgRbH1
0Zd5rQtyVO3BwX5MMW3LwT1FMuJtPwI=
=AvG8
-----END PGP SIGNATURE-----

--94RiNPJk8aF+VXXp--

