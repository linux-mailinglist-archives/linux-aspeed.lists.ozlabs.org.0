Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 785E99579C0
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKS4Xm5z7C8T
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=it-klinger.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=it-klinger.de (client-ip=78.46.3.230; helo=www571.your-server.de; envelope-from=ak@it-klinger.de; receiver=lists.ozlabs.org)
Received: from www571.your-server.de (www571.your-server.de [78.46.3.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6yPG491Xz3cJl
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 16:15:14 +1000 (AEST)
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www571.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <ak@it-klinger.de>)
	id 1sLcny-000N1i-1N;
	Mon, 24 Jun 2024 08:03:54 +0200
Received: from [31.220.119.164] (helo=mail.your-server.de)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ak@it-klinger.de>)
	id 1sLcny-00038L-27;
	Mon, 24 Jun 2024 08:03:54 +0200
Date: Mon, 24 Jun 2024 08:03:52 +0200
From: Andreas Klinger <ak@it-klinger.de>
To: David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH 02/10] iio: adc: hx711: use
 devm_regulator_get_enable_read_voltage()
Message-ID: <ZnkMSO_dPWNY712F@mail.your-server.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N0AifF9IzWj2884v"
Content-Disposition: inline
In-Reply-To: <20240621-iio-regulator-refactor-round-2-v1-2-49e50cd0b99a@baylibre.com>
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


--N0AifF9IzWj2884v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-06-21 at 22:11 +0000, David Lechner wrote:
> Use the devm_regulator_get_enable_read_voltage() helper to simplify the
> code.
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Reviewed-by: Andreas Klinger <ak@it-klinger.de>

--=20

--N0AifF9IzWj2884v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEE7/NrAFtB/Pj7rTUyyHDM+xwPAVEFAmZ5DEgACgkQyHDM+xwP
AVE47Av7BUpI4xHaIMA7TiHs6JARgCK+wBtJWrS4/DxpJ8GsTmhhP5wZ6TC96nHL
FtJH828ECT8BBgmkpoFYqLwiSdncLwUBAkQ36MukVjzIBXDYlyJRHHRbZb33NRGK
v0xL0Fxhv6u5oh8uvwmJjfTFBvx98TQkLdcUbfkQ2R8P7oPHN1q9AVybLlQIGSe7
/YEuHN7eLODtfGwxqhnhXFDXaSdLyjgK0xXOfaCgE925fBZd8t/fnJnXWQWdH5k+
1+TzAFV7/kQiQpfnefQDhMaAFNmmpbDpIaiwXTWW5C7D94acGZBFYWibOfCU/MsY
LEGsB99G24vtqUAjTofGQO5c8f3RaU7Q8TSBcQ1gtuEDXDT9T7fOoqJ6xTfRDb2i
p8bJMTO28RdnAh32lKS1BdnRywk7i458mTQcT6ZSoumKaCr8qLrn9A27uzwmlnIo
NFfNC8bLiVdk5WuS90o2zGZ3/hVuNWw8RjQNb8boUnDrzkQeY1JbSFma0KfayEzs
NcnAWhsO
=U+8T
-----END PGP SIGNATURE-----

--N0AifF9IzWj2884v--
