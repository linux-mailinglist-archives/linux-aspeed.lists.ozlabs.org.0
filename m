Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC919579BE
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKS1mLnz7C70
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=it-klinger.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=it-klinger.de (client-ip=78.46.3.230; helo=www571.your-server.de; envelope-from=ak@it-klinger.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 67 seconds by postgrey-1.37 at boromir; Mon, 24 Jun 2024 16:05:14 AEST
Received: from www571.your-server.de (www571.your-server.de [78.46.3.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6y9k6g33z30Th
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 16:05:14 +1000 (AEST)
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www571.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <ak@it-klinger.de>)
	id 1sLcpC-000N8W-3D;
	Mon, 24 Jun 2024 08:05:11 +0200
Received: from [31.220.119.164] (helo=mail.your-server.de)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ak@it-klinger.de>)
	id 1sLcpD-000AOA-0m;
	Mon, 24 Jun 2024 08:05:10 +0200
Date: Mon, 24 Jun 2024 08:05:09 +0200
From: Andreas Klinger <ak@it-klinger.de>
To: David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH 04/10] iio: adc: hx711: use dev_err_probe()
Message-ID: <ZnkMlWIewq8s_XeS@mail.your-server.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NPQkkl0HGmmU9H1y"
Content-Disposition: inline
In-Reply-To: <20240621-iio-regulator-refactor-round-2-v1-4-49e50cd0b99a@baylibre.com>
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


--NPQkkl0HGmmU9H1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-06-21 at 22:11 +0000, David Lechner wrote:
> Use dev_err_probe() to simplify error returns in the probe function.
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Reviewed-by: Andreas Klinger <ak@it-klinger.de>

--=20

--NPQkkl0HGmmU9H1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEE7/NrAFtB/Pj7rTUyyHDM+xwPAVEFAmZ5DJQACgkQyHDM+xwP
AVHJ3gv+PRSmvwbaW2ps2R6YXJOC29aMqR0YVYDpdDqIf3xvOIhYnprCAA7bcXC+
OX/Rs0lUvs1HwTDFrrF2jXesHX88JYQoB591HXOje5Hi4quzkyZcow3kRdV9AyQo
3r4Y5X3M73ywkTrn4Xx+oFewOVo0TQflZdxl9YBzcOFkIZPh8d8p3B/eTII/n1Pr
BartrbGrHK8pBu5pOPzLxJKQoDXqbAkV8sAGbBGm33Ow/Y+X2TA10VylOmi1FGlZ
YmVcyA9zQlXy9zy4zZpOyX9awx7trBJAcaHCVu7pwNlaleGwbQZSiycBzrYOyOi2
VBH9GXchSoyECiz+1bmqdKuGebpJMCvHq1DPeT4oCBftE1MGRz035qU6o2+7RvQW
iEhzKLo8wXBrOwmCOjTrCOsX76Uycbp50vjhuqsqpDHlpA2oJKIMT6hoOVlCnL41
CM58is3YqqssMMaE7XaiwGsCqZ6annaoIrQY/PdtGtw8L4x4UNmTE1OV4szDejAO
FZwXdwBE
=Py/z
-----END PGP SIGNATURE-----

--NPQkkl0HGmmU9H1y--
