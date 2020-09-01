Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E831A2587E7
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 08:11:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgcCq4VxYzDqTN
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 16:11:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=kZnQ6m+J; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgcCh37cfzDqSd
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Sep 2020 16:11:44 +1000 (AEST)
Received: from localhost (p5486cc57.dip0.t-ipconnect.de [84.134.204.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9197D208DB;
 Tue,  1 Sep 2020 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598940702;
 bh=BHZMoFSFNu3DyLSpLY+JH8Sz4p7412tz3v9BMUhS3BI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kZnQ6m+Je8wGHdDBeGbBhIuQep+eKm6/I45edosXa2K7pibgqyzwvdOOvRT3YOdUT
 18HsirJD7LMOOFBcIsPgxHedxBGLITAINDlGvIFhftdlW5NjdO3luEx7pZ/rB0BbPx
 RIbKopTH4EG+cO6xSo2Sy1u8iXItmwfl86jVV0hg=
Date: Tue, 1 Sep 2020 08:11:39 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 4/5] ARM: dts: Aspeed: Tacoma: Add IBM Operation Panel
 I2C device
Message-ID: <20200901061139.GC1148@ninjato>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-5-eajames@linux.ibm.com>
 <CACPK8XfeKiee-LAQZXs6jygr1Bj7pqGTGLUnTV1mzO5FBZ-XZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline
In-Reply-To: <CACPK8XfeKiee-LAQZXs6jygr1Bj7pqGTGLUnTV1mzO5FBZ-XZQ@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, dmitry.torokhov@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +       ibm-panel@62 {
> > +               compatible =3D "ibm,op-panel";
> > +               reg =3D <0x40000062>; /* I2C_OWN_SLAVE_ADDRESS */
>=20
> Other users of SLAVE_ADDRESS have included <dt-bindings/i2c/i2c.h> and
> written the reg as follows:
>=20
> reg =3D <(I2C_OWN_SLAVE_ADDRESS | 0x62)>
>=20
> Which obviously has the same result. I'll leave it up to you.

The latter, please.


--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9N5hsACgkQFA3kzBSg
KbaeUg/+IPF4+oUGVypAsLvYprQ0+ZG1JBvtHljVB9iKBaHZqMvhVHeQtSLbdYaQ
jDARAKbg0MG2YDPbzycsWxuvfDvfADKLHmcfGHINUegeOOdL8ECDivbhwGbcp/9n
Lse+AEuEInVhGc/i3R/OL9juyOEa9r+V66GCa2EjzIeaUMQXtRmYC23Laax1h8JI
vwjlAGu46hfyn4/XYKldvn4T72jM4fKtsPoVXlWPjMIh31aj0hgxbJXz79lRELZp
veqwFPOC962XwV7K4pqXZR9lL9YxmxRANk6ycJML+sK/68kWV514MVBGp0Od3cut
5uxLHcYP/afMbn+JRvmfo2QtsPxBfLUqSAJ3e5oiePbQPGuC+T//wFiHzQNm+8J9
9CKHiQbrBK6VmTdEQMMtTVs02lvy/Kwp00yqnPzvZ/xiNtNoF0vLplWxo+uV4KPn
9/3raJctzCFXkWYRAsm52t47MZ6Wmk/IYqZ6kwWMrijA5lVToAJK6RmjtuLsMi+6
21vo7Er+0cDnj2UdSUdqr7MMQrRbs/qg81icmcq/qT/Y2Xmn0GAeMmGqzlPcP4to
PLuIbKSWGcpZIbq4kc7XWRc5xCQt9pMR9hBLr9Gz5uxwI/JnBhf/BoPkVLskiB7+
KwkYK6aacPe7A09JTgpYARDIO2I6p8Rt3JNLIrjhgCitBfjgtyc=
=YXCg
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
