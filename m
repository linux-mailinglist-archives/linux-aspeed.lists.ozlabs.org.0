Return-Path: <linux-aspeed+bounces-3476-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPX+JcSHg2niowMAu9opvQ
	(envelope-from <linux-aspeed+bounces-3476-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 04 Feb 2026 18:54:12 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B990CEB3FA
	for <lists+linux-aspeed@lfdr.de>; Wed, 04 Feb 2026 18:54:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5nzP3dNMz2xm3;
	Thu, 05 Feb 2026 04:54:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770227649;
	cv=none; b=mmpnw0S0rH0gDoHvuFadvWhCOgUfK+L+2Y4w0cdWMAwmMTj2IHv46TED6bhZRzgedLMf+JPzijRjI0K9pPx1MziUZkU7Hi7DexineyQ+9bzm515Zv3LgFfRoLeFLdjMrQhcrcPEB0sWg3Sue4FpMt7RYYVuGvE4jVrubCK0elVwhFpC+40AgPCNidHTCTSt/DrUzpb1MVamdflBdP2K7wwRH1eA5h9hBpDKXugGGIBlpkTGGFbUhPcFG0YzDXGlkN8/g9ewAp1dae1rKB5mvgjZN0cu+2RRhZ1/4L8buRkRicvTbVH/YSXYcR1gxmNBqF7zDvB4ZOd3UdW8w+a1Lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770227649; c=relaxed/relaxed;
	bh=sQogdaDUzetebzTwdzsS/Q7RYSuHAuztkU9A7BbLk+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYqCF7YtTagALyW/GyWBXz0+nFQIYtqGN5iAeVj5wjUfBJ2JHu7yfkoWF/75D9PKUGbtHvOOQf6NveTIFegUsTyh9LAMBBdocBTuyEuL2cyyYaQRGRnX1pw1DCwrVaP9ZzsIyNZSjNuPYYEaLNJhQ4q8RnybJPm+d8MRchdbZKdRAyL2nEfuHZ/twLeFhtlmEJ79AqtaUGt4+Vd1HVbH/c8Ue4lgQ9CLooXfS1Qmkp4MDfUPI9P6iyVZo7jNYR/w8p52Y8hyKHljSPUXDRU9r0l2l6vhtRRztqUowRpyryB/V9Uo+ViTgxgQRBNbr2d3k7RMx8sQvL7PsXs6UdFvcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GQ0k48vv; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GQ0k48vv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5nzN6SFhz2xJ5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Feb 2026 04:54:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19E64400CE;
	Wed,  4 Feb 2026 17:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CD3C4CEF7;
	Wed,  4 Feb 2026 17:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770227647;
	bh=sQogdaDUzetebzTwdzsS/Q7RYSuHAuztkU9A7BbLk+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQ0k48vv2IgFLxtuT65uX9ijW12Y2jXDmJFzcBSJB5hawAv9VigDH0uwYdMr/q0D+
	 Rxzpmm5oitF9JlA8XiuZ6sr7jHMRD/manMPvl7YvK0J3PXx6fgAZlC31inliBq4M6b
	 +p7puWl+DeJGXfQ+Y8eZtbBHfTHXUdV93PFKUrt+B+/eKE46S7L0jv7JLudPeZwyka
	 w4KRyAz6bITzqKq5iWXVcG8StZHuxraSf+j6n/sHY6+VEqK8fyj8z0+jY4AZ3ULA8j
	 Y4O0Wm3mB0ug+W8uZRMZOEC3baFQM6fBh8XCADWOvKELHpHwuvXQfuXR/H8TFZPGcx
	 mk+DUlW0V50Uw==
Date: Wed, 4 Feb 2026 17:54:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Oskar Senft <osk@google.com>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: aspeed: add
 aspeed,ast2700nx-uart-routing compatible
Message-ID: <20260204-phoney-crumpet-91d785f26c21@spud>
References: <20260203-upstream_uart_routing-v1-0-6bd5dd75ee3b@aspeedtech.com>
 <20260203-upstream_uart_routing-v1-1-6bd5dd75ee3b@aspeedtech.com>
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
	protocol="application/pgp-signature"; boundary="L66zuJgLCEhFZBMR"
Content-Disposition: inline
In-Reply-To: <20260203-upstream_uart_routing-v1-1-6bd5dd75ee3b@aspeedtech.com>
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
	TAGGED_FROM(0.00)[bounces-3476-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:jammy_huang@aspeedtech.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:osk@google.com,m:chiawei_wang@aspeedtech.com,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: B990CEB3FA
X-Rspamd-Action: no action


--L66zuJgLCEhFZBMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--L66zuJgLCEhFZBMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOHugAKCRB4tDGHoIJi
0itwAQDNp1MbH2s996w7U+f1cW0+YUARaHJuZVp/WSPyp3dhwgD+PPbN/qeb+n17
ih+JZMAMozojeZOcXtH1br8U27pCMw4=
=MGNm
-----END PGP SIGNATURE-----

--L66zuJgLCEhFZBMR--

