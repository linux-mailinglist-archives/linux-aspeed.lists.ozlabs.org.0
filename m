Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F1C6A14ED
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Feb 2023 03:32:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNDSk66cYz3cjD
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Feb 2023 13:32:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PoWJlSNh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PoWJlSNh;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNDSd41TRz3cDG
	for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Feb 2023 13:32:33 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C8CBC20034;
	Fri, 24 Feb 2023 10:32:28 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677205950;
	bh=eMpJw3QDF0dgVLHij+Adj2SnTDtAt4fj854xNqPA5Ao=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PoWJlSNhzCv/RFHNLFjqZ+tBdfmzmnCmIQtppd+2Cm2gCRjm1utS51gDS6HfI7Yk/
	 L1Fik+EGxXc3wvG8m7qxg7bJ2BHANw0q05QCvJss1FR3B58irPGialmJnBl7p1PYCR
	 1lOpyYLKhKJT06k4xtYu+moSeeEFVB0tmPkzgciLU+UXVuXhMrZ7m3UxYge+bJrHO7
	 JAfpFDsdC7ZDe1XvdFE8Gfw3d7Q03qxRmFLzyrFyC7mT+fUfjG+5FKQnG1H0XTQc3u
	 WGcr1b4KYMMt6cnQga0e3RgfIK14CeI2xsaOM3TIbT8aWzLqVWPADa0HIwm7tjrahS
	 B2UKzfdbptLiQ==
Message-ID: <547646005ac9e5013350c8ed84136088b6be7bad.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: dw: Use configured rate and bus mode for clock
 configuration
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Vitor Soares <ivitro@gmail.com>, linux-i3c@lists.infradead.org
Date: Fri, 24 Feb 2023 10:32:28 +0800
In-Reply-To: <07f8ecaa-9a1a-dcf9-a7f2-fb67f9ddd51a@gmail.com>
References: <20230216062040.497815-1-jk@codeconstruct.com.au>
	 <07f8ecaa-9a1a-dcf9-a7f2-fb67f9ddd51a@gmail.com>
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

> Please find my comments bellow.

Thanks for taking a look, and for the review. Some replies inline:

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* 50% duty cycle */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hcnt =3D DIV_ROUND_UP(core_r=
ate, i3c_rate * 2);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D DIV_ROUND_UP(core_r=
ate, I3C_BUS_TYP_I3C_SCL_RATE) - hcnt;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (lcnt < SCL_I3C_TIMING_CN=
T_MIN)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0lcnt =3D SCL_I3C_TIMING_CNT_MIN;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* In shared mode, we limit =
t_high, so that i3c SCL signalling is
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * rejected by the i2c devic=
es' spike filter */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!pure)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0hcnt =3D min_t(u8, hcnt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 DIV_ROUND_UP(I3C_BUS_THIGH_MAX_NS, core_period)) - 1;
>=20
> You are assuming that t_high may be lower than 40ns, right?
> by the spec the max speed is 12.9MHz, don't think you need this min_t() h=
ere.

This is to handle the case where t_high is *longer* than 41ns - from the
50% duty cycle calculation above, when using a lower bus frequency
(lower than about 12.2MHz).

Then, for mixed-mode (where we need to be compatible with i2c devices
on the bus), we reduce this to the 41ns max (and then hcnt gets
increased to fit the intended frequency).

This is to match the definitions in Table 86 of the I3C spec: the 41ns
maximum is only specified for the mixed bus case.

> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hcnt =3D max_t(u8, hcnt, SCL=
_I3C_TIMING_CNT_MIN);
>=20
> I would branch this part into:
>=20
> if(pure)
>=20
> =C2=A0=C2=A0=C2=A0 hcnt=3D ;
>=20
> else
>=20
> =C2=A0=C2=A0=C2=A0 hcnt=3D ;
>=20
> think this way is more readable.

Yeah, I've been debating min_t()/max_t() vs. conditionals; the
conditionals are more verbose, but likely easier to interpret. I'll
re-do all of these limits as conditionals.

> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D DIV_ROUND_UP(core_r=
ate, i3c_rate) - hcnt;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D max_t(u8, lcnt, SCL=
_I3C_TIMING_CNT_MIN);
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0scl_timing =3D SCL_I3C_=
TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(scl_timing, mast=
er->regs + SCL_I3C_PP_TIMING);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!(readl(master->regs + D=
EVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (pure)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(BUS_I3C_MST_FREE(lcnt), master->regs + BU=
S_FREE_TIMING);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D DIV_ROUND_UP(I3C_BU=
S_TLOW_OD_MIN_NS, core_period);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* open drain mode requires =
a minimum of OD_MIN_NS */
>=20
> My comment here would say why we need a higher OD time rather the minimum=
.

OK, sounds good.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D max_t(u8, lcnt, DIV=
_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0scl_timing =3D SCL_I3C_=
TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(scl_timing, mast=
er->regs + SCL_I3C_OD_TIMING);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D DIV_ROUND_UP(core_r=
ate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Timings for lower SDRx ra=
tes where specified by device MXDS values;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we limit these to the glo=
bal max rate provided, which also prevents
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * weird duty cycles */
>=20
> I think checkpatch complains with this comment format. I would suggest
> to use like in the rest of kernel.

Yep, will change.

> Unfortunately, we need to address the cases in which SDRx frequency is
> higher than bus->scl_rate.i3c.

I'm not sure if I'm interpreting your comment correctly, but that's
essentially what this is doing: limiting the SDRx frequencies, so that
none is higher than bus->scl_rate.i3c.

For example, if scl_rate is set at 5MHz, we should end up with:

  * default: 5MHz
  * SDR1: 5MHz
  * SDR2: 5MHz
  * SDR3: 4MHz
  * SDR4: 2MHz

Or do you mean that we should be generating timing configurations that
allow SDRx to be greater than the specified scl_rate.i3c? That would
seem to defeat the purpose of the scl_rate override - a device trying to
limit the rate through GETMXDS would result in the rate
*increasing* from the default.

Or something else?

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D max_t(u8, lcnt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DIV_ROUND_UP(core_rate, I3C_B=
US_SDR1_SCL_RATE) - hcnt);
>=20
> The lcnt within max_t() function comes from SCL_I3C_OD_TIMING,
> correct? Have you checked this value for bus->scl_rate.i3c =3D 12.5MHz?

Good catch, I assume that this should be based on the PP value, will
update.

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0scl_timing =3D SCL_EXT_=
LCNT_1(lcnt);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D DIV_ROUND_UP(core_r=
ate, I3C_BUS_SDR2_SCL_RATE) - hcnt;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D max_t(u8, lcnt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DIV_ROUND_UP(core_rate, I3C_B=
US_SDR2_SCL_RATE) - hcnt);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0scl_timing |=3D SCL_EXT=
_LCNT_2(lcnt);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D DIV_ROUND_UP(core_r=
ate, I3C_BUS_SDR3_SCL_RATE) - hcnt;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D max_t(u8, lcnt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DIV_ROUND_UP(core_rate, I3C_B=
US_SDR3_SCL_RATE) - hcnt);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0scl_timing |=3D SCL_EXT=
_LCNT_3(lcnt);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D DIV_ROUND_UP(core_r=
ate, I3C_BUS_SDR4_SCL_RATE) - hcnt;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lcnt =3D max_t(u8, lcnt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DIV_ROUND_UP(core_rate, I3C_B=
US_SDR4_SCL_RATE) - hcnt);
>=20
> what about to use a for loop and only do lcnt calculation if
>=20
> bus->scl_rate.i3c > I3C_BUS_SDRx_SCL_RATE ?

I have intended for this to be the same as the existing calculations,
just applying the limit of the global scl_rate.

We could restructure as a for-loop (which I'd suggest splitting as a
separate change, so that the calculation changes are more obvious), but
it's going to get a bit weird with the macro usage there.

Cheers,


Jeremy
