Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F016A17D9
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Feb 2023 09:23:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNNF96Glsz3f3K
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Feb 2023 19:23:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YN/GR3vT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YN/GR3vT;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNNF05y0Qz3cZp
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Feb 2023 19:23:00 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6A45120034;
	Fri, 24 Feb 2023 16:22:55 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677226976;
	bh=iLGvFiXdgMZcBCSM5IXWL521tc01t8fA0fqKWtmrepw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YN/GR3vTnz8w7IutGlBtCbr2oGhuIGJml4JtiunfPTB2HRE3+u4kLc6HfjVO/utO8
	 D9mYBPxm02wJS2T7tqKHjcCJuqoPh2YY0+c36mxFa3kqdyYqGOf4wQBuzxK3Xkev2G
	 LLy00gIlTqlg8ZIUkJQ2EsbXnoI6hfaEM7McSUXhb1y9/5hRUptKyLsY2VbEBhBI/X
	 85RhYwWVHKNbUzpMX04RfIuWktknOMgmL16xk2EiT9haHhueh8vYbTps3HG7x9rVJk
	 LgNdEpAoy82o4z8vmxUGla/HujgH7ievQmGP0dgLY2EaxFXWpOv2Imp72u0R+ZRiAK
	 VTGmcKgufNlsg==
Message-ID: <1cb6effca796c914a523d62a4dfff17ef7368ce7.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: dw: Use configured rate and bus mode for clock
 configuration
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Vitor Soares <ivitro@gmail.com>, linux-i3c@lists.infradead.org
Date: Fri, 24 Feb 2023 16:22:55 +0800
In-Reply-To: <547646005ac9e5013350c8ed84136088b6be7bad.camel@codeconstruct.com.au>
References: <20230216062040.497815-1-jk@codeconstruct.com.au>
	 <07f8ecaa-9a1a-dcf9-a7f2-fb67f9ddd51a@gmail.com>
	 <547646005ac9e5013350c8ed84136088b6be7bad.camel@codeconstruct.com.au>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Vitor,

> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0scl_timing =3D SCL_EX=
T_LCNT_1(lcnt);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D DIV_ROUND_UP(core=
_rate, I3C_BUS_SDR2_SCL_RATE) - hcnt;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D max_t(u8, lcnt,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DIV_ROUND_UP(core_rate, I3=
C_BUS_SDR2_SCL_RATE) - hcnt);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0scl_timing |=3D SCL_E=
XT_LCNT_2(lcnt);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D DIV_ROUND_UP(core=
_rate, I3C_BUS_SDR3_SCL_RATE) - hcnt;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D max_t(u8, lcnt,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DIV_ROUND_UP(core_rate, I3=
C_BUS_SDR3_SCL_RATE) - hcnt);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0scl_timing |=3D SCL_E=
XT_LCNT_3(lcnt);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D DIV_ROUND_UP(core=
_rate, I3C_BUS_SDR4_SCL_RATE) - hcnt;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D max_t(u8, lcnt,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DIV_ROUND_UP(core_rate, I3=
C_BUS_SDR4_SCL_RATE) - hcnt);
> >=20
> > what about to use a for loop and only do lcnt calculation if
> >=20
> > bus->scl_rate.i3c > I3C_BUS_SDRx_SCL_RATE ?
>=20
> I have intended for this to be the same as the existing calculations,
> just applying the limit of the global scl_rate.
>=20
> We could restructure as a for-loop (which I'd suggest splitting as a
> separate change, so that the calculation changes are more obvious),
> but it's going to get a bit weird with the macro usage there.

Actually, a for-loop isn't too bad:

  static const struct {
  	unsigned int freq;
  	unsigned int shift;
  } sdrs[] =3D {
  	{ I3C_BUS_SDR1_SCL_RATE, 0 },
  	{ I3C_BUS_SDR2_SCL_RATE, 8 },
  	{ I3C_BUS_SDR3_SCL_RATE, 16 },
  	{ I3C_BUS_SDR4_SCL_RATE, 24 },
  };
 =20
  static int dw_i3c_clk_cfg(struct dw_i3c_master *master, unsigned long i3c=
_rate,
  			  bool pure)
  {
  	/* ... */
 =20
  	/*
  	 * Timings for lower SDRx rates where specified by device MXDS values;
  	 * we limit these to the global max rate provided, which also prevents
  	 * weird duty cycles
  	 */
  	scl_timing =3D 0;
  	for (i =3D 0; i < ARRAY_SIZE(sdrs); i++) {
  		tmp =3D DIV_ROUND_UP(core_rate, sdrs[i].freq) & 0xff;
  		if (tmp < lcnt)
  			tmp =3D lcnt;
  		scl_timing |=3D tmp << sdrs[i].shift;
  	}
  	writel(scl_timing, master->regs + SCL_EXT_LCNT_TIMING);
 =20
  }

Is this what you were intending?

Cheers,


Jeremy

