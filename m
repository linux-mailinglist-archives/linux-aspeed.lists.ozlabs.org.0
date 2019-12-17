Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ADE122C86
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 Dec 2019 14:09:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cdlb6bSMzDqY5
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Dec 2019 00:09:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.brown@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47cdVn0yKCzDqGZ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Dec 2019 23:58:38 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B54A331B;
 Tue, 17 Dec 2019 04:58:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34EF33F719;
 Tue, 17 Dec 2019 04:58:33 -0800 (PST)
Date: Tue, 17 Dec 2019 12:58:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20191217125832.GF4755@sirena.org.uk>
References: <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
 <20191216114454.GB4161@sirena.org.uk>
 <20191217073533.GC31182@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0hHDr/TIsw4o3iPK"
Content-Disposition: inline
In-Reply-To: <20191217073533.GC31182@pengutronix.de>
X-Cookie: Thufir's a Harkonnen now.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--0hHDr/TIsw4o3iPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2019 at 08:35:33AM +0100, Marco Felsch wrote:
> On 19-12-16 11:44, Mark Brown wrote:

> > What I'm saying is that I think the binding needs to explicitly talk
> > about that since at the minute it's really confusing reading it as it
> > is, it sounds very much like it's trying to override that in a chip
> > specific fashion as using gpiolib and the GPIO bindings for pinmuxing is
> > really quite unusual.

> Hm.. I still think that we don't mux the pin to some special function.
> It is still a gpio input pin and if we don't request the pin we could
> read the input from user-space too and get a 'valid' value. Muxing would
> happen if we change the pad to so called _alternate_ function. Anyway,
> lets find a binding description:

I don't think any of this makes much difference from a user point of
view.

> IMHO this is very descriptive and needs no update.

> description:
>  - A GPIO reference to a local general purpose input, [1] calls it GPI.
>    The DA9062 regulators can select between voltage-a/-b settings.
>    Each regulator has a VBUCK*_GPI or VLDO*_GPI input to determine the
>    active setting. In front of the VBUCK*_GPI/VLDO*_GPI input is a mux
>    to select between different signal sources, valid sources are: the
>    internal sequencer, GPI1, GPI2 and GPI3. See [1] table 63 for more
>    information. Most the time the internal sequencer is fine but
>    sometimes it is necessary to use the signal from the DA9062 GPI
>    pads. This binding covers the second use case.
>    Attention: Sharing the same GPI for other purposes or across multiple
>    regulators is possible but the polarity setting must equal.

This doesn't say anything about how the GPIO input is expected to be
controlled, for voltage setting any runtime control would need to be
done by the driver and it sounds like that's all that can be controlled.
The way this reads I'd expect one use of this to be for fast voltage
setting for example (you could even combine that with suspend sequencing
using the internal sequencer if you mux back to the sequencer during
suspend).

--0hHDr/TIsw4o3iPK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl340PcACgkQJNaLcl1U
h9BQJwf/ZRW2Sc0sN6zR4aGO1ekytPGFqpZCQbZG5T5CX9CTgmD+QldwXmP9gB0A
fAa98/pWCJQHoEVQQxbrVMEpfoFKUTONO5xv+/jA8lq5MTxo9/s9U4mZcVulaCEk
uiWXoDvSF6LrgQvsJpkFooRbdrUDHxwF73qd+qfxGkDknsayb7XPPt1O2AWzLFCN
dezSJXFa8Xw+qa+y3H6r1W9+siNEIGYp2qjNlUWFtltrZav2ys2TxITxYXlQundv
9iX5+AIzFWeAMsMdoMp17Q49QWW5bYCQ4p3d3M8jtRvGN7LpZflN79S4sWYEuhQe
XYgXLKaDfjer7VeQkopSdft+oAo3Pg==
=iy8V
-----END PGP SIGNATURE-----

--0hHDr/TIsw4o3iPK--
