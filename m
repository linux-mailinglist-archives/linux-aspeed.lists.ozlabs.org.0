Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6269579BF
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKS39Myz7C7j
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=it-klinger.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=it-klinger.de (client-ip=78.46.3.230; helo=www571.your-server.de; envelope-from=ak@it-klinger.de; receiver=lists.ozlabs.org)
Received: from www571.your-server.de (www571.your-server.de [78.46.3.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6yPC1kdcz3cXD
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 16:15:10 +1000 (AEST)
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www571.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <ak@it-klinger.de>)
	id 1sLcoQ-000N3v-1z;
	Mon, 24 Jun 2024 08:04:22 +0200
Received: from [31.220.119.164] (helo=mail.your-server.de)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ak@it-klinger.de>)
	id 1sLcoQ-0005xR-2g;
	Mon, 24 Jun 2024 08:04:22 +0200
Date: Mon, 24 Jun 2024 08:04:20 +0200
From: Andreas Klinger <ak@it-klinger.de>
To: David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH 03/10] iio: adc: hx711: remove hx711_remove()
Message-ID: <ZnkMZIKpmn8HOKN8@mail.your-server.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="REpzHSWIu3PPM3Ri"
Content-Disposition: inline
In-Reply-To: <20240621-iio-regulator-refactor-round-2-v1-3-49e50cd0b99a@baylibre.com>
X-Authenticated-Sender: ak@it-klinger.de
X-Virus-Scanned: Clear (ClamAV 1.0.3/27315/Sun Jun 23 10:23:58 2024)
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Nuno Sa <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>, Andreas Klinger <ak@it-klinger.de>, Jonathan Cameron <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--REpzHSWIu3PPM3Ri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-06-21 at 22:11 +0000, David Lechner wrote:
> By using a few more devm_ functions, we can remove the hx711_remove()
> function in the hx711 driver.
>=20
> platform_set_drvdata() is also removed since there are no more
> callers of platform_get_drvdata().
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Reviewed-by: Andreas Klinger <ak@it-klinger.de>

--=20

--REpzHSWIu3PPM3Ri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEE7/NrAFtB/Pj7rTUyyHDM+xwPAVEFAmZ5DGQACgkQyHDM+xwP
AVGUzAv/R+Kp1tZQvHmNgF6j1nIL6ZcD2WW4RaDqTbEY9EllGV7UJ4bLmF4ZbPvX
dpsNoyNdv9RPd8vOArWgwy8u6nU+LksOKqUB+flj0mkIR92SOgcOSr/KfzqsleaM
zrPw0h8Ez14MYi/DAkw53oiAjekA7dFiUlyaaHCjAenRYXbyR2HJhfAMHCnn9/q8
5C/hafg5YF3DgvgBcp5P4UoVaeqJX7SCa3RCUfpjFhicuxljjqFEamhfA72OeIT8
20XJL0e/VDWKU+xXU8lr8k8sQb07G4jY1c7brLbQxDj2Svy9Mts2FE5k2QgaVNTo
yegqb8E0KvSwOO2vBT+Sp4axHfKwReD+ZJuZtlWY9DMptYh0if7Rnuc8Xu0QlJkI
Q8UrrW9t4fxtiXZprKzExSt0alge1KjZT9TswcM4xNMiJ71nYh0vuyJkF3L0rzFZ
NSZHw7VRTK1dFRFoAJXfElaWIP5fnv9hcWHdRo2CuEoj2dm6IYH0lvKlRjWanUzz
fEC7SshG
=d+/F
-----END PGP SIGNATURE-----

--REpzHSWIu3PPM3Ri--
