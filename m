Return-Path: <linux-aspeed+bounces-3559-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCVOMXLVoWlcwgQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3559-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Feb 2026 18:33:38 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8397D1BB804
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Feb 2026 18:33:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMwR25RK5z2xMt;
	Sat, 28 Feb 2026 04:33:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772213614;
	cv=none; b=ihuaMMigY6cO3s1A4XJDXu2stMoW7iW4hEhZjFkYwubMi2UziKzZFhbw3F+qWlIH1nzLQKdPI5xhZUiIexzAp3DfHkaIM8zSXuv6cFCEe8JeWTb8bUDyLH3hgX5T/15Aoyf8wPCJSFFAt3y/+XESJzqCuy5NlD21eiIxmlDfPtWMil2zXC74lkoqwy6NvdIgGZXPujLPvvOKiBVTHjo9aqnQdkR5IoKt6hbTf0UPG6KhUqoQsecHWEbghW3VUmuG2E6uVmjduzPXdHlvZjcBMRC23kktHIuxrhHf1q41I8lSSdvk9U/+qCqoVSjYaB9upp9iUNRsuXji2NFLCffFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772213614; c=relaxed/relaxed;
	bh=SVALK9IQLVTpf3amlzfFhYUoPgsF517vjM8PMo68YoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPABJ23SVP0l6QYvUbmb9fHhZ3zJp8XHu6AcJJCGrGUiAuYWMebaFNETszQemIcjGu0IocNYs44T1eLYLnO7/OZski4n9GokGymQUmEnAT2MNUHXQFMLSDrOe7OSw7KDRksTowdt4t7J6A3GhGuirD3TQP3GcIpRo1bVl668Omxco5iecIqYfPfOnAAZ441O5tq7SGeTrXfnd3IT9jb7B6cujpnnrdXHwZj0OMfRMW1+Bn1Bt/SD+mMCRsS9pN375uMJK+a2Qflf5yJ81SawZZjhbb9HzopVESB/whztdbkmvGGgIkW2dtxvUIMCz0f9xuGCP4T5iTqElJzaUTUQ6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fWFy41pT; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fWFy41pT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMwR16l58z2xLv
	for <linux-aspeed@lists.ozlabs.org>; Sat, 28 Feb 2026 04:33:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB1A24087A;
	Fri, 27 Feb 2026 17:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C973C116C6;
	Fri, 27 Feb 2026 17:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772213611;
	bh=RWIw2XbMdqDRicGEL0YDWL0cD+Khc6u5UWrGRAKiQU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWFy41pTOMD/9pJ517nQN5PTE0puGxWrnW1MFm0j0g9Lss2dfK/1U8XdJCfMJBnmX
	 jCgWj0Msb3BLjiNHfnf1u9bjKPnBzYg3dgHnDjlMG7OPHizjPZAYVV77McRu9Morv0
	 i5K8UmA7AoN8x6AdMHIzi8wQqBAWaugmrFnwFmNKnoLCBAvCM7Dy36z1OJ/8tbkZHS
	 vZvvUSu1flSeLNMN8UJWZEzpa1ON3I0Tiwu2AIehj2eC0MnCKJ0dZLEqDvv0PjqF/c
	 coEMNWEvZdTL0uS46TibvhXU18GjUghGYiG6/5DUhWaQd5avReNJeMM9jI9skkBmby
	 Q9Nkc73XwOcHg==
Date: Fri, 27 Feb 2026 17:33:27 +0000
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
Message-ID: <20260227-smooth-carefully-f427e242ce58@spud>
References: <20260227151602.829-1-haiyuewa@163.com>
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
	protocol="application/pgp-signature"; boundary="/NuwEW3VcqbDOFRB"
Content-Disposition: inline
In-Reply-To: <20260227151602.829-1-haiyuewa@163.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3559-lists,linux-aspeed=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8397D1BB804
X-Rspamd-Action: no action


--/NuwEW3VcqbDOFRB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 11:13:14PM +0800, Haiyue Wang wrote:
> Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
> header. It is required for proper reset control of the video on the
> AST2600 SoC for aspeed-video driver.
>=20
> Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")

How can a binding change be a fix for a driver one?

> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> ---
> v2:
>   - Fix checkpatch.pl warning, and send dt-bindings as single patch as
>     the submitting-patches guide.
> v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.com/
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindi=
ngs/clock/ast2600-clock.h
> index f60fff261130..7b9b80c38a8b 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -124,6 +124,7 @@
>  #define ASPEED_RESET_PCIE_RC_OEN	18
>  #define ASPEED_RESET_MAC2		12
>  #define ASPEED_RESET_MAC1		11
> +#define ASPEED_RESET_VIDEO		6
>  #define ASPEED_RESET_PCI_DP		5
>  #define ASPEED_RESET_HACE		4
>  #define ASPEED_RESET_AHB		1
> --=20
> 2.53.0
>=20

--/NuwEW3VcqbDOFRB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHVZwAKCRB4tDGHoIJi
0v8lAQCW2Ed+aChACjPUAODW7TWzNWwDP3rAPWm+A2fLCUB3DgEAik6lKaZxDq1I
c8ghmP/y1HVCuZ5bT0LrcmzClD0egQw=
=o4Ct
-----END PGP SIGNATURE-----

--/NuwEW3VcqbDOFRB--

