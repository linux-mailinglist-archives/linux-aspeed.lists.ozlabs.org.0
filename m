Return-Path: <linux-aspeed+bounces-4005-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMwWEoFy+2m7bAMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4005-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 06 May 2026 18:55:29 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7C64DE694
	for <lists+linux-aspeed@lfdr.de>; Wed, 06 May 2026 18:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g9hMc00LNz2xnM;
	Thu, 07 May 2026 02:55:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778086523;
	cv=none; b=E/H2/haDVxKtSNk/lg5p1eYS6bH7jHA9vms8mof7/y7/foDLYMIrsS4wng8bjFULFa69DRg55rLwnCNe07m0W4FCPDMqDldmjyG7WJeJQW9SpXY4XAyZ9LIEjA6VZg/uuO0h7rZPHkB6LfDCRnQGo+2b3JIYlA6jJAY7wlvcJSP81DzFkeJfAl3qy5irnbbgDLCpZsJkZ2M35tIHdGVQW3uNoSO5HRPmY6AWxLTlca309bxZ4KfWJKSCs4RjfR70KKRt8y66BB4uiqss25e5Ek0ErM+QFOYmIT4fCgZ8eNHMkuSpy0Tz3u8haZy2iZrmEOty/9UmRbg3iyMKZLxiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778086523; c=relaxed/relaxed;
	bh=+q6eX8yap3aX95o5D736mBa/UQIp49KQ5RRhNt+INSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+/mHN9HjtOfAoqH2G80ANPrwACsaCMqV5iUX3oeocQdlbydbjZCN7G6jaanUZ1xYoQWwewZMdUNp7Z3ZV7MaCZ1fU3k6MeyShzli/wfIAUtTBWS6IdI5OkKRdt/c/MzlZX8poNZg8zVBKkDsLWdNc5ztDvbwn95i0Eu7CHHV84r11bBAPPnxZnkX4C7DfCYIC6W/txPjriDZ7vU3kgEejSwpkYlAdXdhBImW1u4hC+NUGTVhMY3ma49URc+OWmhHcY41pFqWhiP42nsVzB4xSSPRsB+jIz0/B5bHozfupGJ7TpidaHoJRC276Mk5iJ2rP0npgKhcenJ+6jKfwbUVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SI63Tth8; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SI63Tth8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g9hMZ6PZZz2xYw;
	Thu, 07 May 2026 02:55:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1209C40C30;
	Wed,  6 May 2026 16:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A299BC2BCB0;
	Wed,  6 May 2026 16:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778086519;
	bh=+q6eX8yap3aX95o5D736mBa/UQIp49KQ5RRhNt+INSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SI63Tth8CtQhXThTfaW+P+Icg3d7+aW7B1qKP8POWXAc5liWzky+u/nckHFsoqJXO
	 LuCosHuBpETK1hNzPDzXv8vAlLXhU5Xt6+rdTZBtUYA09MANu80TTtEiytwKl/0HJ1
	 WRIuDqYY5GYjiJgO/cwz99fBRIdM3N36VbBjKN+wp77DDwpOdICGRHwT78tgAEFwHI
	 215hESx2BlqJnswP+xphk0YlVxt/EabtkMIHgVNSy7HZzTzmjOLMd15KdoHSDOb6+N
	 3EzLYi8XBRAwa2w7jgp+f3nCjKsDx2ycb2u9o0DUHnW8/9wMgp+oOccVa4NtUaniDt
	 gEqMqh02qzeJQ==
Date: Wed, 6 May 2026 17:55:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Message-ID: <20260506-throwback-cheer-a4fe420281cb@spud>
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com>
 <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
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
	protocol="application/pgp-signature"; boundary="VTJgj70HPTOBEk8v"
Content-Disposition: inline
In-Reply-To: <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 3D7C64DE694
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4005-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,microchip.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]


--VTJgj70HPTOBEk8v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 04:06:18PM +0800, Billy Tsai wrote:
> Add a device tree binding for the pin controller found in the
> ASPEED AST2700 SoC0.
>=20
> The controller manages various peripheral functions such as eMMC, USB,
> VGA DDC, JTAG, and PCIe root complex signals.
>=20
> Describe the AST2700 SoC0 pin controller using standard pin multiplexing
> and configuration properties.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VTJgj70HPTOBEk8v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaftycgAKCRB4tDGHoIJi
0pvzAQDCNCKCmxnYX47+b38C6ft8fB0xKq3WT2RY8vc+AsD4lAEA+acP/gpGYmZT
W8BeLJDQjk2yIgetqkKZ1Cfz+UYsSQc=
=1DWF
-----END PGP SIGNATURE-----

--VTJgj70HPTOBEk8v--

