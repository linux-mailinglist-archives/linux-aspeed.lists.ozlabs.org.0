Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF216A6483
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 01:58:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRG8F0vtZz3c7X
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Mar 2023 11:58:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IEMwFCw7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IEMwFCw7;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRG870swgz30Mn
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Mar 2023 11:58:47 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 78B1F20034;
	Wed,  1 Mar 2023 08:58:43 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677632325;
	bh=XqQEKej9m4ZxFPC0M8Q/uruz4T2jtJ1NZcWFPw4Wi08=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IEMwFCw7WBkdwyGPf0VY9Esdv5jarp+T1HLzaMRaJEivoSlBHO0mt8R5cvXuA9LVY
	 zth1lSOk2sXsaTufETKM3UGnjVUuBvkxb7eGC2aXw9lxSJi0monZ1NV9JU1LHzbOFD
	 LlPBB0CT5UQD8MEaCp/uQmXP60mY9tx1zZv2PWBvF1b9XExViOkX2a25lGkiQARcWF
	 dwHcUs/jSKWVvmINlM6/JbNoSPhOowRjGBzU4ftD6P3iF5IB28LpN30Jg42dMzmMDV
	 RbjQ2evatCnqhPc47830+Z0ZRver/Pr0K/L8+QpCEkjymDKLAcWKMofq2t3cHhpymx
	 fjbNm7934Z2YA==
Message-ID: <1024ddf2c4047e5a6cd516809d4d15ea5e0349b6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/5] clk: ast2600: Add full configs for I3C clocks
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Date: Wed, 01 Mar 2023 08:58:43 +0800
In-Reply-To: <CACPK8XfZCaLK+1kRkHa+wvGyt3YCwiZDR7CKRPKxdjuBFH+01Q@mail.gmail.com>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
	 <20230228091638.206569-4-jk@codeconstruct.com.au>
	 <CACPK8XfZCaLK+1kRkHa+wvGyt3YCwiZDR7CKRPKxdjuBFH+01Q@mail.gmail.com>
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

Thanks for the review. Some replies inline:

> > @@ -15,7 +16,7 @@
> >=20
> > =C2=A0#include "clk-aspeed.h"
> >=20
> > -#define ASPEED_G6_NUM_CLKS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 71
> > +#define ASPEED_G6_NUM_CLKS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72
>=20
> NUM_CLKS seems dangerous. Should we instead use
> ARRAY_SIZE(aspeed_g6_gates)?

Yep, that would have saved me some time debugging. That would suit as a
separate change though, would you like it in the same series?

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* USB 2.0 port1 phy 40MHz c=
lock */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw =3D clk_hw_register_fixed=
_rate(NULL, "usb-phy-40m", NULL,
> > 0, 40000000);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aspeed_g6_clk_data->hws[ASPE=
ED_CLK_USBPHY_40M] =3D hw;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* i3c clock: source from apll, d=
ivide by 8 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_read(map, ASPEED_G6_CLK_SE=
LECTION5, &val);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~(I3C_CLK_SELECTION | AP=
LL_DIV_SELECTION);
>=20
> Is there any value in registering a mux device here? See the emmc
> extclk device.

We won't be doing any mux configuration here, so I figure the static
setup is fine.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D FIELD_PREP(I3C_CLK_SELEC=
TION,
> > I3C_CLK_SELECT_APLL_DIV);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D FIELD_PREP(APLL_DIV_SELE=
CTION, APLL_DIV_8);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_write(map, ASPEED_G6_CLK_S=
ELECTION5, val);
>=20
> This is a departure in style from the existing code. The existing
> code did things like this:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_update_bits(map, ASPEED=
_G6_CLK_SELECTION1, GENMASK(10, 8), BIT(10));
>=20
> Which uses the regmap API instead of FIELD_PREP macros.

Yep, that's much nicer, I'll change. The FIELD_PREP parts are just from
the initial ASPEED implementation.

Cheers,


Jeremy
