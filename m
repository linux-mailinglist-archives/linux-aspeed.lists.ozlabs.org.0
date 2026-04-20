Return-Path: <linux-aspeed+bounces-3934-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Iy9AxFI5mnSuAEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3934-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Apr 2026 17:36:49 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26F42E64B
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Apr 2026 17:36:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fzqNC45fbz2ypw;
	Tue, 21 Apr 2026 01:36:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776699403;
	cv=none; b=FA0FD8bK3SoNbbW7pnw9gscyOADX12KKojGVzVCkNet1S8lNlvmubKIO5QDdbnSx36J6QQ07pPbyoIiM+kBtYnt/5HMJSVWD5V8XKrE2gOMnHaDoh2BUeNcz9GrL5aDc1eVvRHyLNFjaiTDgXFQmnaNIDSqCwqFyC4yvevD3Z2WoqCQkDW0DSvx1XM9oMeGVWNA7VGCX8+6U3mjIMlu7LlhOHyTRsE2aF+2u7+fEY1zn5Fr8s9YHIgoVmcBiIxHfb/K4i/9nr46dIjzznGodUxJ1ZaO9/nRsInoP2v228kO/7KIVBXOp3UwFehL+C+F0ydMRDo3E1taltouSRSMhYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776699403; c=relaxed/relaxed;
	bh=RXTlata/cDCaSGkwzCEWmovi5WJsV4Y9htt8/UPRgxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGH8/qZq1gZ1XaKt9UyxyLPQUEQEbf29dzFg7noRUtYyVO6lpV4b18fEQUpeRM31QAtbUHD4kLnpembBKrcx6/tmpRMyvh0Z4RpVDu6rWhwI+JLggknkQE7g7l20InVc8+8W99JKmKgxCeUGlwcjjT3iGGT8QpPxuNt+Tj8JlZSzFvwsCdNmi/SS/8e5My6yjjEQMHVLlS/aPfM5ZqPvsm1Ho4YD+lR/Q0657No8k7vMyS7qY94yJS13vSN8/xvyK8GXKOe645gsWVTxmRkOtEXLf1IDoqpFPav2T+eqZ7s4XJK1S6nOZN1TvmH9fVW5reBXMZi0GjB7ZCKy3M8vbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aRrAXzKA; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aRrAXzKA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fzqNB4bB8z2xll
	for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Apr 2026 01:36:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6CD760018;
	Mon, 20 Apr 2026 15:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C507C19425;
	Mon, 20 Apr 2026 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776699399;
	bh=AzFmS5Tnu8sMhg8eDHy3LPsdHF0AOqqG0otqcA9EY1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRrAXzKAS0bBFun9CQKrTyofiR5UlWY17F+ckg075QcTe2r9+vjrfK++RzMggttkV
	 q1NTwF7XAvZjmFfZLPpUmtgMYHiDG2drOziCXgfLcWd0Y6nEvjujmTwVZmr5hMl1wU
	 CpaQ6uFIbL/EpyQ6i/wUmfEaRC4/BNEMMkieXlqICQmUyLAF5aakdEG77cGbUkLmqz
	 xjBh+OUX0oJ5Fa5DT38dIq0PLIc5seAMFXqe/ETiWMO5q9VvdUgynajX2MEWNsqgBM
	 AuMqXg2f+PdpqyrfovuxaJ/zCNSe3WpEcIJstH9jBILV0URQE+p5fot3kNejTRHC7U
	 FmdZfQNqOrUaQ==
Date: Mon, 20 Apr 2026 16:36:35 +0100
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
Message-ID: <20260420-garnet-goal-4a284a8818fc@spud>
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
 <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>
 <20260409-foster-stability-f77b38c6f7a0@spud>
 <CAPBH0A_K39218+=QHJuEY+SbFk-nCnM=Z8RQMdHBK7SkCj2QtQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="rT7U0ER3rzaPGzgy"
Content-Disposition: inline
In-Reply-To: <CAPBH0A_K39218+=QHJuEY+SbFk-nCnM=Z8RQMdHBK7SkCj2QtQ@mail.gmail.com>
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
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3934-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:u8813345@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:colin.huang2@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email]
X-Rspamd-Queue-Id: 8E26F42E64B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--rT7U0ER3rzaPGzgy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 01:41:30PM +0800, Colin Huang wrote:
> Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=889=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:36=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Thu, Apr 09, 2026 at 07:40:26PM +0800, Colin Huang wrote:
> > > Document Anacapa BMC EVT1 and EVT2 compatibles.
> > >
> > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
>=20
> Hi
>   Could anyone let me know, what is my next step which I need to do?
>   I can't find the changed in for-next branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git .
>   Thanks.

You wait for the merge window to end and the maintainer to apply your
patches.

--rT7U0ER3rzaPGzgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZIAgAKCRB4tDGHoIJi
0gyRAPih4zXoYopFmAszf/ozsfmpEp1cZspkWl07OnahV3yqAQCD9Sal/PjSSKtW
PGb84+0XAkYu+zzoDJlWPigE0ykYBw==
=g4DA
-----END PGP SIGNATURE-----

--rT7U0ER3rzaPGzgy--

