Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A765263D08
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 08:14:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7rT3NL5zDqbm
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 16:14:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Y0jH3hJV; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7rJ4bMqzDqZX
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 16:14:08 +1000 (AEST)
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 927E320795;
 Thu, 10 Sep 2020 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599718445;
 bh=aFC77LTk6EMTYaeAvM5v439HmVwSiuNIs3x+iO6HGkg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y0jH3hJVYg4vKviF52V5Za+Ia1rVnIOnmyRhsn5dJxaEagRwxBcbEDlq4/Jl4ZXy4
 plUoNrWz4+Sxq3pxzPg7F9YhPZAc6oZABgg3U7bYommZMQqKkIVyqL3HiETgxMKRxk
 rp/wdCn5n04kokyAHgAncOz/k5YsZ80gFmeGjR28=
Date: Thu, 10 Sep 2020 08:13:59 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v3 2/5] input: misc: Add IBM Operation Panel driver
Message-ID: <20200910061359.GA1031@ninjato>
References: <20200909203059.23427-1-eajames@linux.ibm.com>
 <20200909203059.23427-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <20200909203059.23427-3-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 dmitry.torokhov@gmail.com, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 03:30:56PM -0500, Eddie James wrote:
> Add a driver to get the button events from the panel and provide
> them to userspace with the input subsystem. The panel is
> connected with I2C and controls the bus, so the driver registers
> as an I2C slave device.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # I2C slave pa=
rts


--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZxCEACgkQFA3kzBSg
KbaItA/+KArp0AcYWSxj1IIj3GMN3RvqqFm3utx62fNdSHyQTyRI5yR/zPtsRWGg
KZQa3NZ+DtzaWNl8lReH9PC0EB6+/ouqOQQ9cqj+o4u0Uj4wCtZgap1Oiu8jYBC7
kGHLT43Nh/Cs7YLvcNP7cpDlW+pP3FCxDKahc5vUCoNlQAR97/6v4fHiWL3LvB+c
h2IBIiVXj8ObIe8HBeC0JJ2nT08nVrINSeQZGhP6pz/fjnRpn6q3m5rPngm+8gAV
KQpOU7DA1XsIQI+Dmgf4j68uduXHHCYTfU39RDPAWfZoW6dN1BaGMGH3R/CNRT0K
T04HFqrwyun5g3Ea7e5BjRY5THnLRiDXBn5UenfVCbiCThljV8Yc8a/Rq3Xu7zFr
DcKFfQu8TDcOV6GHWqjFn0O6FAlcbLOYUVlR9Akf2WzMBX5qycurcojsu9y48OVv
KtOyNd1LqvWiSzo7G/PNW/jNfouSp6o3n2UVbu9tbyHkp2HZN2m7x02IY7azLzNE
nB2CpjIpRhXuTixV9OyLBYx0kyBb/KzjgC478EAWMc5/HD3ZCSGg6nlLyjsmCONY
jDYqOKWC4XjG+rWgKXCm2Pa7hOwRuATtL3hgLKjAGMrxMBxG8auX0jcpBX1kddP7
M67KqTPmaoa5iRDXc6Hyr9ymBIzBz7cvEhTNcYy36rQtom2Vw24=
=bz+x
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
