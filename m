Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7105611FBF6
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 01:05:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bhNX4zh2zDqZF
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Dec 2019 11:05:00 +1100 (AEDT)
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
 header.b="AbQgCinN"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SgBH072jzDqPf
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Dec 2019 00:46:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ViQdiD3wVU6FIgxwAalhRGBEIqZeLZwd4vUTlshOCAA=; b=AbQgCinNELw75ahLFYpi+SBwU
 1arhNDg/VeUhIcE+d3iCkTYNd2/5K8TdqXygTYQgB/M92x5n4a68SqCy29TSgPNr5Gqu6rrIxfG7y
 ZpdAGvJUmpyfqomy5ideB/u5ZvH+brfN7UxUqx2fSr9bkfQCsBDW2wgAhLGMyCY4CptC4=;
Received: from fw-tnat-cam6.arm.com ([217.140.106.54]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1icUzA-0000ar-DG; Wed, 04 Dec 2019 13:46:32 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 92FE3D003B4; Wed,  4 Dec 2019 13:46:31 +0000 (GMT)
Date: Wed, 4 Dec 2019 13:46:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20191204134631.GT1998@sirena.org.uk>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MOeiELSuYwpLEKvX"
Content-Disposition: inline
In-Reply-To: <20191129172537.31410-4-m.felsch@pengutronix.de>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 16 Dec 2019 11:04:53 +1100
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
Cc: devicetree@vger.kernel.org, support.opensource@diasemi.com,
 linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, kernel@pengutronix.de,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--MOeiELSuYwpLEKvX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 29, 2019 at 06:25:34PM +0100, Marco Felsch wrote:

> +  Optional regulator device-specific properties:
> +  - dlg,vsel-sense-gpios : A GPIO reference to a local general purpose input,
> +    the datasheet calls it GPI. The regulator sense the input signal and select
> +    the active or suspend voltage settings. If the signal is active the
> +    active-settings are applied else the suspend-settings are applied.
> +    Attention: Sharing the same GPI for other purposes or across multiple
> +    regulators is possible but the polarity setting must equal.

I'm really confused by this.  As far as I understand it it seems
to be doing pinmuxing on the chip using the GPIO bindings which
is itself a bit odd and I don't see anything here that configures
whatever sets the state of the pins.  Don't we need another GPIO
to set the vsel-sense inputs on the PMIC?

--MOeiELSuYwpLEKvX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3nuLYACgkQJNaLcl1U
h9B8RAf8DVq4ZX6Z0Svxmo1m2U0I4WvgeY9JnnhpeCAOUE6ILw5DFoy3RreO8x0X
7QsCRigQAT3V+NA79pg9/49e2Xpz6a8UnPu/E6OsdT/GJwgZn+2Qyt6PFwS/sRzN
7vnp0WKEQsClbGI1jBRMaI4SyZqtbET8XAoF24LHzdZFfamgsUqCgKVq53m9PjrW
d8BHHSEh6gv+aVBeKb7tTpG3gAnRPnUTZSPBGIH+gNmqnNx0zO6Dq+fGXyeZLTLc
2MPvW/hE/QUvSFshLtwgs1Te+vD7k2t1F3BmdwC1wnpNHs+XEsBtGu+IyZsB6TWL
j7TDrp/slISRAbezy30W/na8SJNr9w==
=gb7u
-----END PGP SIGNATURE-----

--MOeiELSuYwpLEKvX--
