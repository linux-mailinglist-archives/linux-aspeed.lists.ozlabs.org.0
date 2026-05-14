Return-Path: <linux-aspeed+bounces-4029-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MC9TAlkSBmobegIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4029-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 May 2026 20:20:09 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F17BE545CF3
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 May 2026 20:20:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gGdsY0j4Wz2xtC;
	Fri, 15 May 2026 04:20:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778782801;
	cv=none; b=Db8DeVWvAjOLzuEnCzxdxKD+fBLFiU2/pxOoGuARRwBJ+k77XlLZvHEZz9oyaYzQ1dRvR3PiphXRFsT0enh5WXIAV+NvHzEAS3mQtzYWRa73T6PKW8merrAxsH8hq+mW77ginLHQ9/jo7nRegQ0uOkICDUfVFvfPN/FbdIj8NA1SIDNjF/LyvMZxpgTH78Hrl+pYsd8VZ9I9aWryo5OaSXWKJA+eJRyUjjXm1GFUPbUW6YY2Ah1PcFxfDaNtTXYlKgrI7YiwdA/POyN6luitPFOod8P4BP9jTBhtaGIXLdXfuK+KEWvC9bs0Q/OlqiabB0G2mmJkiQI2pPJZswYe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778782801; c=relaxed/relaxed;
	bh=gTjiv2/TKYKg8TdJlS1e8VNcO9aFXlqH7uu9TXo9p7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bct1e2hT+EpXdyKL4lbUQOJ8MsjkV1d5jqqSIcepn0lZJ8jv1uqktXAU+1/iC4i/3vkHWSAaOGzGIfh8llcm/zCbqqSZcup97EBAbzJlhCspRLIrF/chCl+T21/vNXN7/rWVg+YhODVpynd6v6pBpqM7kxmvk1ajku2H1hk/UG/yGyvueqvrCt10FXFhswzXor9ZjJy2o2yHYAvZfS3L/D5INlLNa5b+fKdhvCrfb4hVj7Ld2ftskM7Qp7uZfqaZoWrBYOobim/XBZTGtg6Stj7Lg5nTticrLbWVjNsOlXCdjc0VQNV5Bb2rISuU84OzzjmIAwI2GyfGTY/NaWKhTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rRXrZDVx; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rRXrZDVx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gGdsW5PYlz2xlV
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 May 2026 04:19:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EADD360008;
	Thu, 14 May 2026 18:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4CEC2BCB3;
	Thu, 14 May 2026 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782796;
	bh=gTjiv2/TKYKg8TdJlS1e8VNcO9aFXlqH7uu9TXo9p7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRXrZDVx7GTdXCnIwrHfDFQA0dGr35iuWoB4FubCL5S0/SggcV3ELk6ElUR9Bc7Xr
	 E9RlVLcF+sOuexxBssBK4IQcHoUpAXH5ZdNXZg+V9yPdRT16uPEin1MmUBzJj3EbjR
	 qS6dD++lzzSbVFhEkG2nioBmBS4WC8mOW2j2irA9Cp2m6ry5OkGgcDBhH23JU9LgEa
	 4V1C+ZqUZfxF858MrOZpCDuP3S9Iw2VisXNJ630nq+OV5288iS5K1bAnX+5W/HBxGy
	 dG8OXo8duFyfWRP/DzZKY6LHGoqUnv3oIL1MIYg5fTwJSAXRTbYYHfZxXwQytYuwHd
	 ZvsKB7cT12m4g==
Date: Thu, 14 May 2026 19:19:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Message-ID: <20260514-spiffy-freezable-e8c6d9042d57@spud>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
 <20260514031622.1416922-2-prasanth.padarthi10@gmail.com>
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
	protocol="application/pgp-signature"; boundary="URRyEgb7TO15cZW/"
Content-Disposition: inline
In-Reply-To: <20260514031622.1416922-2-prasanth.padarthi10@gmail.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: F17BE545CF3
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
	TAGGED_FROM(0.00)[bounces-4029-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:prasanth.padarthi10@gmail.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:prasanthpadarthi10@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email]
X-Rspamd-Action: no action


--URRyEgb7TO15cZW/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--URRyEgb7TO15cZW/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYSSAAKCRB4tDGHoIJi
0pscAQCKHketvGg954MMHYLTbNRveDFA9z87ehYbOYNaP/sQhAEAwtGdaTIOTrWP
3HYqEymg57NUGfTRu+sS10wbhb6qYAE=
=8NEg
-----END PGP SIGNATURE-----

--URRyEgb7TO15cZW/--

