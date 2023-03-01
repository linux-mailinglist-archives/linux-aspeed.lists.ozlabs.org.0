Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6066A67CC
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 07:54:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRQ342cryz3c6P
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 17:54:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L9TRX5s3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L9TRX5s3;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRQ2z6CCxz2yNm
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Mar 2023 17:54:51 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CFAAA20034;
	Wed,  1 Mar 2023 14:54:50 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677653690;
	bh=7hd2rXTIjthijwypIiEY2EMElVsWDZ7kE82iOJb/pYM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L9TRX5s3EOuTW1uU3uwpVE9xF3X5jVGN9sq/EVoDDGx7Rq3j1OMrsXev+boozONzJ
	 CZIqtLhVWUiiAnRK0m2zLgObXi4h3XV1ubVSaLFBDIzsQi0DiKrM2OFtPfUJebWEHb
	 RiuFpaXVaQWxgi0ploAItX8xEa7u0ipWBBZdWFCkUxyiKURqTVPcsvfitgavyOwuvA
	 ScOtJ7wq1f43ybiHH2YEeVYrWf174OOHKSJzVGH9Rj9V/4XoGPF4an/ejxc9/xN/4O
	 iOmGUsO6ZmEprddiJ0XJALptziBaIXM8XKeR8kf7LylGg4DV+s8yx9kNb6SxHor1M4
	 fqv9pZnOgRc3Q==
Message-ID: <51803a244c28c53b5adb384effc09df1909dd1e8.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 5/5] dt-bindings: clock: ast2600: Add reset config
 for I3C
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Date: Wed, 01 Mar 2023 14:54:50 +0800
In-Reply-To: <CACPK8XfRg9vHYjC0rco4dr9pNY03vXTrmXaopOGBgdCq09LybQ@mail.gmail.com>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
	 <20230228091638.206569-6-jk@codeconstruct.com.au>
	 <CACPK8XcA_SES=Wo7vuWEJ4U5kTizM5brmb=6ELXD-taCFJQwgA@mail.gmail.com>
	 <cbbb99ce6125048667e4c41412710a61dc4d686f.camel@codeconstruct.com.au>
	 <CACPK8XfRg9vHYjC0rco4dr9pNY03vXTrmXaopOGBgdCq09LybQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel,

> > So I'm not sure what that comment is supposed to signify as to what
> > qualifies as a "gate" in the context of a reset...
>=20
> This is poor documentation from the author of the clock driver,

Hah, not that guy again!

> which is me.

oh.

> We only expose the reset lines in the device tree for resets that are
> not associated with a clock line.
>=20
> This is done because the aspeed docs specify we do a dance when
> enabling an IP:
>=20
> =C2=A01. Place IP in reset
> =C2=A02. Enable clock
> =C2=A03. Delay
> =C2=A04. Release reset
>=20
> So we do this with the aspeed_g6_gates array. The rule is: any gate
> with a number in the rst column doesn't have that reset line exposed.
> That's what this cryptic comment in the header is warning about.

That makes sense, and means I can drop the explicit reset control from
the DTS, and then we don't need these definitions.

> This was documented to some extent in the original commit message for
> the 2400/2500 driver:
>=20
> =C2=A0https://git.kernel.org/torvalds/c/15ed8ce5f84e2b
>=20
> We could hoist that out and put it in the source file(s).

Awesome, thanks for the explanation - I'll add a patch to do so.

Cheers,


Jeremy
