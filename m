Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7386269A877
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Feb 2023 10:43:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ6Ls2HTnz3cjF
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Feb 2023 20:43:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OI3ZJ9JF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OI3ZJ9JF;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ6Ll1KPzz3bfs
	for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Feb 2023 20:43:10 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9066220037;
	Fri, 17 Feb 2023 17:43:04 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676626988;
	bh=3WtRqJGFMITvrlCUQgLrV4f+rApo5IuH2N6gPvlbS1M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OI3ZJ9JFE0R6pSl1bT+uP1aHPsV9Uzv8X3QnjKMXYzvKmQLqWnAms35FBztp6VVz7
	 fhBmHT5/+Wd+G6rFD3BXnW7lw8XKj8Yu75hb32/Gxs7Ky6Cyr5/BSMxPBCU1W3Tz5l
	 emMIeUPcX7MkYZJYTEIaUW3YaS3yRhDIEJXQ9VMX/w0OoOQD7P6cJg0zH+oRTC0rN7
	 fLGffTXr//EnMOHIEACD0wKubRnan/Nq7FXpfyu36QPRKPFmsg+/BfZF6IS2n5gwX1
	 hbSWvuNKzRQiQxUC55xCcKjUZ7E98mWyUk38isv0cworgkN/buAUkFOGNDROchcybB
	 DODh60tV85p8w==
Message-ID: <578ac18169e21c13445d29d3c99de04e9fc6888e.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/4] i3c: dw: Add platform operations
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ben Dooks <ben.dooks@sifive.com>, linux-i3c@lists.infradead.org
Date: Fri, 17 Feb 2023 17:43:04 +0800
In-Reply-To: <9b374250-3afc-6277-d1c6-0dac1c682bca@sifive.com>
References: <cover.1676532146.git.jk@codeconstruct.com.au>
	 <eb90bc9ee9f72efc2012abce3e4e50186552e194.1676532146.git.jk@codeconstruct.com.au>
	 <9b374250-3afc-6277-d1c6-0dac1c682bca@sifive.com>
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Ben,

Thanks for taking a look at the patch. My responses inline (just
re-ordered, simple stuff first)

> > =C2=A0 struct dw_i3c_i2c_dev_data {
> > @@ -612,6 +623,12 @@ static int dw_i3c_master_bus_init(struct i3c_maste=
r_controller *m)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 thld_ctrl;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > =C2=A0=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (master->platform_ops && =
master->platform_ops->init) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D master->platform_ops->init(master);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (ret)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return=
 ret;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> I'd rather have a "default" set of ops than have all this checking for
> NULL pointers all over the place.

Yep, that's a better structure, changed for v2.

> > @@ -1181,6 +1205,18 @@ static int dw_i3c_probe(struct platform_device *=
pdev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0master->maxdevs =3D ret=
 >> 16;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0master->free_pos =3D GE=
NMASK(master->maxdevs - 1, 0);
> > =C2=A0=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* match any platform-specif=
ic ops */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0match =3D of_match_node(dw_i=
3c_master_of_match, pdev->dev.of_node);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (match && match->data)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0master->platform_ops =3D match->data;
>=20
> I'm sure there's a of_device_get_match_data() which would have
> both removed hte need to move the match table around and the
> call to of_match_node().

That's the one I was looking for! Thanks for the pointer, I have updated
in v2.

> > @@ -241,6 +241,17 @@ struct dw_i3c_master {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char version[5];
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char type[5];
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 addrs[MAX_DEVS];
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* platform-specific data */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct dw_i3c_platform=
_ops *platform_ops;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0union {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} pdata;
> > +
> > +};
> > +
> > +struct dw_i3c_platform_ops {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int (*probe)(struct dw_i3c_m=
aster *i3c, struct platform_device *pdev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int (*init)(struct dw_i3c_ma=
ster *i3c);
> > =C2=A0 };
>=20
> Given the comment below having this and the main probe defined in a=20
> header so users can just call in and we don't have to change the
> main code here every time someone comes up with their own
> special way of handing this?

I'm not sure I 100% understand the intention here - is it that we'd
split the platform-specific code into entirely new drivers, and have
those call into dw_i3c_probe() (presumably doing a bit of custom init
either before or after that call)?

If so: I think the platform support should stay fairly minimal, so I'm
not sure that warrants a new driver for each instance. In the ast2600
case it's just a couple of extra reg writes in the i3c init path. I'd be
reluctant to split that out completely at this stage - but if this does
grow, we can certainly reconsider.

Also, I'd like to allow for the case where the platform-specific parts
may access the fields of struct dw_i3c_master; with this approach we
don't need to expose that struct outside of the single driver.

Cheers,


Jeremy
