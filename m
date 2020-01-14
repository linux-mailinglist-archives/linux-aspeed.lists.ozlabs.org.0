Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A93113AF2B
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Jan 2020 17:21:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xwgq69pwzDqK3
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Jan 2020 03:21:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=sirena.org.uk
 (client-ip=172.104.155.198; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.a=rsa-sha256 header.s=20170815-heliosphere header.b=UpQ1Wewl; 
 dkim-atps=neutral
X-Greylist: delayed 1967 seconds by postgrey-1.36 at bilbo;
 Wed, 15 Jan 2020 03:16:11 AEDT
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xwYl5bJhzDqKK
 for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Jan 2020 03:16:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZCTSH+k6xThdH79h0I5oh1zVw+T2m5gqrWX7QMFhKd4=; b=UpQ1WewlV5QqhtFdaZ8w6ORpF
 8M9iXrAUdbtW9g5RYjBjRrjEDY4WYvrb7K/SZOdWF5OskeoDuNHqszDZeK8AHaoLAH7unGua0Uiuf
 Onsb4Voox3RhmYdBl7MgsARFkeAKvNV6JjYHwLu3CouBWfw4L+7XUAqTJXgQDH0Sexj5g=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOLa-0000KP-L6; Tue, 14 Jan 2020 15:43:14 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 2CE91D002CB; Tue, 14 Jan 2020 15:43:14 +0000 (GMT)
Date: Tue, 14 Jan 2020 15:43:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20200114154314.GZ3897@sirena.org.uk>
References: <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
 <20191216114454.GB4161@sirena.org.uk>
 <20191217073533.GC31182@pengutronix.de>
 <20191217125832.GF4755@sirena.org.uk>
 <20200107083654.atgbjhrnhyax2gqq@pengutronix.de>
 <20200107130911.GD4877@sirena.org.uk>
 <20200107133811.rua5i6lflzyzlh24@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yhqQ34TVR4fE8mPU"
Content-Disposition: inline
In-Reply-To: <20200107133811.rua5i6lflzyzlh24@pengutronix.de>
X-Cookie: Programming is an unnatural act.
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


--yhqQ34TVR4fE8mPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 07, 2020 at 02:38:11PM +0100, Marco Felsch wrote:
> On 20-01-07 13:09, Mark Brown wrote:
> > On Tue, Jan 07, 2020 at 09:36:54AM +0100, Marco Felsch wrote:

> > > The input signal is routed trough the da9062 gpio block to the
> > > regualtors. You can't set any voltage value using a gpio instead you
> > > decide which voltage setting is applied. The voltage values for
> > > runtime/suspend comes from the dt-data. No it's not just a fast
> > > switching option imagine the system suspend case where the cpu and soc
> > > voltage can be reduced to a very low value. Older soc's like the imx6
> > > signaling this state by a hard wired gpio line because the soc and
> > > cpu cores don't work properly on such low voltage values. This is
> > > my use case and I can't use the sequencer.

> > My point is that I can't tell any of this from the description.

> Therefore I want to discuss the dt-binding documentation with you and
> the others to get this done. Is the above description better to
> understand the dt-binding?

That text really doesn't feel like text that'd be idiomatic
directly in a binding document but some of those ideas probably
do need to be in the text I think.

--yhqQ34TVR4fE8mPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4d4ZEACgkQJNaLcl1U
h9CJjAf+Lyl6pKu3ywfkP8t2CeYxi0Fz9ndEKvYqp7nK6CZxn8OgX9Jjem3iwm4w
vhgB2B06edcnP8wIDEgk8YUMirzG0/Rc475SlTvVg/1BYOaGftqksTiEZfHJf0qt
4mcWgT+Agw3YzPMkM6kahAu243KxKHAwojM3iVV7gb9PX/rOVtInStggPxzdcxtk
jQQo2RvYBo2mEBArehWE+PGGT2/JElQGTLyhRVx3BrhuAXXoNKuwkS9fUrVAnyk5
m5kKBygRDyY4MdZ/a53/E8URMDJbctEtveN03mzI+QQ//PMDTufBPqSmURaODb5c
PAal49kxIE8ZAfvvCgimhdhS3yzmTg==
=m6uy
-----END PGP SIGNATURE-----

--yhqQ34TVR4fE8mPU--
