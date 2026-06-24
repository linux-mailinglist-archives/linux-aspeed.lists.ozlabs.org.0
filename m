Return-Path: <linux-aspeed+bounces-4300-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 75DJAAsGPGoViwgAu9opvQ
	(envelope-from <linux-aspeed+bounces-4300-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 18:30:03 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BAE6BFF97
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 18:30:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ClMhLgvG;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4300-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4300-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glnTY5V6cz2yRF;
	Thu, 25 Jun 2026 02:29:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782318593;
	cv=none; b=LedNpv8Ec5whMIYw+nXxhnOTOLBkbxbJafeWRsqklBCwJ8k5nSyT9E7kV6BfcDgg/fkpxowbeGGNADGxfH9igQqmF54JezqO6rarkLXLsk599NHdB/4xhuuuSDP9ij8EVKXzl0oJGgHJyWmvcxN+G6nkXJtTPdZqlmSRyqJrLW0Q6KIy6YiWh8mmUtLtIBJN1zdDYC+A0oDGM2cFgxkPbAgkpcqcG1jVfhMT8vMGb86ZsEo5kQT0UoZFJ4dxssNBEQvg1fo6LtMezuNhksT6PAviP/+Sql+p/8UlTlss1cH44XggatYsNzBRxsD24AJsxuW449rYrDoDO6PV8cteRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782318593; c=relaxed/relaxed;
	bh=nB/xcDstYUVPnTa87uG6SAP6OEUqB+fH/Eywg/NIyxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4OdYtdxpX1hnLZjfYTGduwe0MUKAqSez5cUHWhArBv5rZ9xrld08V1cIS47KNpCzRrDtc8rK8SfLJ7OnPiUqNwhc1ippgtl4PhF8WCCHQCqKUZqBGiBQZ7xBnCqKE8Cb8lf9zMlAIAWOmyT89CqVLfDEIkZmJNiGKo90QdEx2ZHywXypwJQoJWUAVZBFt1x2kWV7z3lyW/nJEnEIDA1+FY22im8HGuRYY97DysQHHYj/22Qh9UrGrqGJMBmaaYTKQLba4UtU9xesOaBiWC97pzk/LL8yriKi9dqRmA3k40uU6TtkXmtaQIvOQo43a7NagKJRw5VBdQJgJJ3wxO6kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClMhLgvG; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4glnTX1byjz2xy3
	for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Jun 2026 02:29:51 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 586E460018;
	Wed, 24 Jun 2026 16:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BCF1F000E9;
	Wed, 24 Jun 2026 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782318588;
	bh=nB/xcDstYUVPnTa87uG6SAP6OEUqB+fH/Eywg/NIyxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ClMhLgvGviUAT4lTmqBBg5rMovWEhMvRTKDlxuTVmxfsWg9kK4KOko4t1/hlcrHrq
	 Aoh/QxnzxJO/y5tOgkcgdjXKg0ellnq1CQ4B21wyjWk17VESPdXd8jATAN6PO3I8ld
	 rkKibTIA9J5BsbAFgXl8K/1ORDvAZBgQ51TvpfvQ1qLq6DWVlG3Usiuk1UGRXTXv8Z
	 Ypqa7iN5mM/LoAzOADt3lllBzBLrqgRpktn8cEAMnwn4tMlGh3YdZx+fJ9Mi10TNVH
	 2LjvmOi2XQaTjKsHsKUg9MTemdV27oGTFvQLzsypvPaTHw9H0MjIsmRdMsIFIh7XI0
	 EQeBRFhKmCZ/w==
Date: Wed, 24 Jun 2026 17:29:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: ast2700: add PECI clock
Message-ID: <20260624-disk-lingo-1d9fac0de659@spud>
References: <20260624-peci_clk-v1-0-ee28b92e22e9@aspeedtech.com>
 <20260624-peci_clk-v1-1-ee28b92e22e9@aspeedtech.com>
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
	protocol="application/pgp-signature"; boundary="Y2hWsGqtxlYAd0y4"
Content-Disposition: inline
In-Reply-To: <20260624-peci_clk-v1-1-ee28b92e22e9@aspeedtech.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4300-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ryan_chen@aspeedtech.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64BAE6BFF97


--Y2hWsGqtxlYAd0y4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Y2hWsGqtxlYAd0y4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwF9AAKCRB4tDGHoIJi
0ilsAP96KMQ9XSh+uOlgb/NYGm4S9RbQOnUkbS1MHqeOnixC7wEA9hgVf0iPIwO4
vNCYTElGLjB+Jf2SMaWGJxn1GP0RKgk=
=L3x/
-----END PGP SIGNATURE-----

--Y2hWsGqtxlYAd0y4--

