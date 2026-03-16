Return-Path: <linux-aspeed+bounces-3685-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D0EDmykt2lTTwEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3685-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 07:34:20 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D602952D6
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2026 07:34:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZ50R4cynz2xpn;
	Mon, 16 Mar 2026 17:34:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773642855;
	cv=none; b=B9uPyQ1zS9UO+ENZ95jANhnmbQ1EsNxTps89M7xRT1JvPnWW1yOnWdJT6bzIU05mXqvcTi+8ZXCDBtaN1K13X5pDTCQX7wIL5Hz/RnJdW9p80Y/oAh8AF5rEfej4NIoWB4g3Fa2jDXOZRklbEZha9ua7/FaddVn0ofbHhkyluW7UCPeXr5MhZtd3jNYpTIO/+7gAg/HCyQsuUEQ9u98WEbwEoZjErIhhx7mrBEoAo8LlCWL5O/2gxjbtHouPYE/0CX4yubq5KF8w/6giH29+S7uht5gEyAsbiagEbgfr7+jdQPUq3PfXc24lbQQfvOhBrLej7C7cKAauI3GGyLjGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773642855; c=relaxed/relaxed;
	bh=Qi/hMEQwJEADQPSwkWCysi/W3ni7SPe9RdFJbblJhi8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eMPrnTzjyrMD/Z9tmfsGgQaBYfL5vqpfyLj+ZgrqHXztluOSW+UvioQwN5Cf3aOxogxbHqp/8222+6m3Wo2K6NQkH11MP+ITmoLGeS493Vd/x5bt6p9LqMQrLMCsNojGiaTgMoli9A5Aya3m0H0zcBiBsskdrfkxJCEA9v3ljsEP9SxgLLeSjAVLKMoZiXpoY0fbLDfWhngIA+wdEB0zQMGANUaG7OI0TH8ud3YmcZB6a+L5R1432Gd/7tLZvIR3IKZXcaq2fL+6AR8HGgzb06/Qmw/GPg1kChV24+vbb60Z0pAMwHyPcX7HWjTe81RJy5NwMhuWeDarzGbmcrgeNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Eu8zQqTZ; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Eu8zQqTZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZ50Q1t6Jz2xS5;
	Mon, 16 Mar 2026 17:34:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1773642852;
	bh=Qi/hMEQwJEADQPSwkWCysi/W3ni7SPe9RdFJbblJhi8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Eu8zQqTZrgdd5zingl1ok2g8/jiEzlf8ZASl/Y7r5RNVblLY9kIdD2nLCNpvwDmcO
	 2R+V7UYJaW1NCVNtt6yMySmC972GZ9rcH8XMxEiHvXwT46LSMiFO/8XpaZ7KY/kvEl
	 eZRTEEpVQRAKrpCUZProsW38IwWa6ep9F2YfYCmfaV9AUR2mtpOlsXpEDJV8W4jA0s
	 zGnZGrekR8vtP56Wdy+1JOGeqrtaW5BO0hnNhqNHhgCdPIb45ASmA0wbl1ojb7Bbiw
	 hUrjxY331P+CmSiwQE/CVmawgI30Fm7mQhnknwFxDBbjaiYp12g3seOkaBJ9G6PA4V
	 8/yvBiSP8adSA==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1430A6009B;
	Mon, 16 Mar 2026 14:34:10 +0800 (AWST)
Message-ID: <c3b28ee92fa46700887d0c68b23045b2418358a7.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>, aspeedyh
	 <yh_chung@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Ryan
 Chen <ryan_chen@aspeedtech.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, maciej.lawniczak@intel.com, Mark Brown	
 <broonie@kernel.org>
Date: Mon, 16 Mar 2026 17:04:10 +1030
In-Reply-To: <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
	 <20260313-energy-casket-ca8adc1f1fd1@spud>
	 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3685-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D5D602952D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 2026-03-13 at 22:36 +0100, Arnd Bergmann wrote:
> On Fri, Mar 13, 2026, at 17:24, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 06:07:35PM +0800, aspeedyh wrote:
> > > This series adds initial support for the eSPI controller found on ASP=
EED
> > > AST2600 BMC SoCs.
> > >=20
> > > The series introduces a eSPI controller framework for ASPEED SoCs und=
er
> > > drivers/soc/aspeed/, adds AST2600-specific controller support for
> > > peripheral and flash channels, defines the corresponding devicetree=
=20
> > > binding, and adds the AST2600 eSPI controller node to the SoC dtsi.
> > >=20
> > > The driver is intended to support host-BMC communication over the BMC=
-side
> > > eSPI slave controller present on AST2600 systems.
> >=20
> > This all seems to be in the wrong places entirely, shouldn't an eSPI
> > driver and bindings go in the spi subsystem?
>=20
> From an initial reading, my impression is that patches 1, 2, 3 and 7
> should be modified to use the normal SPI interfaces to implement
> an spi target driver, possibly a combined host/target driver.
> Reworking this should be fairly straightforward because the interfaces
> to the SPI core are well documented.
>=20
> It is possible that the hardware can only be used to provide espi
> device emulation. From what I could see in the code, there is
> not much special in there, but I'm not that familiar with SPI
>=20
> Patches 4, 5 and 6 in consequently would need to be reworked so
> these can implement the TAFS spec independent of the SPI controller,
> and can be shared e.g. with other OpenBMC targets using the same
> module and the same user interface. None of this should be aspeed
> specific.=20
>=20
> There is a good chance that both the user interface and the placing
> of the code will need a more debate, but I would suggest first trying
> to move everything over to use the SPI subsystem but leave other
> parts untouched for the moment.

To extend Arnd's points here, some previous attempts were made to
support Intel's eSPI protocol on Aspeed's SoCs which aren't discussed
in this cover letter. I think it would be helpful to cover the history
and why we now have a third approach:

- https://lore.kernel.org/linux-aspeed/20240319093405.39833-1-manojkiran.ed=
a@gmail.com/
- https://lore.kernel.org/openbmc/20220516005412.4844-1-chiawei_wang@aspeed=
tech.com/

Previously, Jeremy had some suggestions covering the various channels:

https://lore.kernel.org/linux-aspeed/20c13b9bb023091758cac3a07fb4037b7d7965=
78.camel@codeconstruct.com.au/

Andrew

