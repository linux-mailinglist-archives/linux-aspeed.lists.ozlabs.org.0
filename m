Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 607B77F1880
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Nov 2023 17:21:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYt6z2GtRz3cSd
	for <lists+linux-aspeed@lfdr.de>; Tue, 21 Nov 2023 03:21:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (unknown [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYt6r3FgWz303d
	for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Nov 2023 03:21:22 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r571A-0004hc-4H; Mon, 20 Nov 2023 17:21:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5715-00AOMM-7d; Mon, 20 Nov 2023 17:20:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5714-004V52-S7; Mon, 20 Nov 2023 17:20:54 +0100
Date: Mon, 20 Nov 2023 17:20:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH 00/21] EDAC: Convert to platform remove callback
 returning void
Message-ID: <20231120162054.haryuye4qedlfd7j@pengutronix.de>
References: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdo7vk2aw267ud5x"
Content-Disposition: inline
In-Reply-To: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, linux-aspeed@lists.ozlabs.org, Tali Perry <tali.perry1@gmail.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Khuong Dinh <khuong@os.amperecomputing.com>, openbmc@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>, Andy Gross <agross@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Stanley Chu <yschu@nuvoton.com>, Robert Richter <rric@kernel.org>, Jan Luebbe <jlu@pengutronix.de>, Shravan Kumar Ramani <shravankr@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, Johannes Thumshirn <morbidrsa@gmail.com>, Tero Kristo <kristo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.o
 rg>, Konrad Dybcio <konrad.dybcio@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, James Morse <james.morse@arm.com>, kernel@pengutronix.de, Lei Wang <lewan@microsoft.com>, Stefan Schaeckeler <sschaeck@cisco.com>, Marvin Lin <kflin@nuvoton.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--bdo7vk2aw267ud5x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Boris, hello Tony,

On Wed, Oct 04, 2023 at 03:12:33PM +0200, Uwe Kleine-K=F6nig wrote:
> this series converts all platform drivers below drivers/edac to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side. However none of the edac drivers suffered from the easy
> to make bug, so all drivers are converted in a trivial way.
>=20
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
>=20
> The patch for npcm was already sent back in June
> (https://lore.kernel.org/linux-edac/20230628071354.665300-1-u.kleine-koen=
ig@pengutronix.de)
> but didn't result in enthusiastic review comments and it wasn't picked
> up.
>=20
> There are no interdependencies between the patches. As there are still
> quite a few drivers to convert, I'm happy about every patch that makes
> it in. So even if there is a merge conflict with one patch until you
> apply, please apply the remainder of this series anyhow. I'll come back
> to the part that you (maybe) skipped at a later point.

Any news on this series? Would a resend help?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bdo7vk2aw267ud5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVbh2UACgkQj4D7WH0S
/k6t1gf+IirGoYLuqK5VC0fzJxyTYO4mc7qBgbuVM3P88Pu7qVConC4mkUSNPgCW
a7DFKrJNIsbwS61Eghc30hxINTLVzt+m50w6+m2eY4Crm6LkSu18fuweiDte3B8B
ECiAFB0EvPbNR8tv4Javms5+AKRVP5bAdREtoIeRWgFglceoVXOx/6NB//OwwPDp
1owt4JZbVUJH0axsnyKBzt5PMXyo3thq6Y7eTqQIjikbEvBA9tvA3PN51btMbJsO
6ttXmOnx7UO99+rXeL6VaKUzyRPTVvJxR3O70xJA36pnmSwm4oJ/LCcN/vX2kZpb
TeEQgFrvHjNBLraJcD3rqO+wNIxdXQ==
=WE4E
-----END PGP SIGNATURE-----

--bdo7vk2aw267ud5x--
