Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51842263D1B
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 08:18:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7xG2RJmzDqZX
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 16:18:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ypEc5ZDD; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7x74JT4zDqZX
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 16:18:19 +1000 (AEST)
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2E2F207DE;
 Thu, 10 Sep 2020 06:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599718696;
 bh=Yb+E0PRlu6XWp+SFCdFVy2QdpRJHcT0DRIae7I/j2nU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ypEc5ZDDVu4Jqu+/NmndRj9tWWySD60+6jffn47aHxMEJQ34N4cl3EAvUrfCpZvm/
 pSVMLC3N59ozyXKy2DtvxdSH5Tmk2sTbYbdpQI0DD2jLUmlvEBDXMMbyTPIjR2/lWU
 Ctun7fviFDUDrBFo8iukZrJb68jtd1tlkbpDYrvk=
Date: Thu, 10 Sep 2020 08:18:13 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v3 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Message-ID: <20200910061813.GB1031@ninjato>
References: <20200909203059.23427-1-eajames@linux.ibm.com>
 <20200909203059.23427-4-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
In-Reply-To: <20200909203059.23427-4-eajames@linux.ibm.com>
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


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 03:30:57PM -0500, Eddie James wrote:
> Mask the IRQ status to only the bits that the driver checks. This
> prevents excessive driver warnings when operating in slave mode
> when additional bits are set that the driver doesn't handle.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Tao Ren <rentao.bupt@gmail.com>

I reconsidered and applied it now because this helps whenever slave mode
is used. So, applied to for-current, thanks!


--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZxSUACgkQFA3kzBSg
KbY4lA/7BPR/KKPe3DlbFxWjisVzVubyppY3DMDQn/HM5WbyLRuMQN0Szncjq0TS
dQyx/bBDZSUtxRL7P+IXHPJW+4LdR/kkl9Cd5uruSnD5gy2wlgpUeNu7Ox7EoTJ4
GQU76iXiCKwwLr+LXO3FUinO7CV3Q6Id1oItp0i0GaYnkN1BEU612x674yoC0TLg
szWdRfum2fEFik2wH1OONrtQLiua7RxrOAQ8IrW9vuba0ArztdYiioupM/Sph2as
PFnvXEZNZ4Lqag9Yu7RTZ69umjjsvQ0PCMGmyW6gPdXWUt+9erKFlCUpo2APnjHQ
hLz+d1zY6VI57Xy7vM5eVaBXAADLf1p4EtviUHQK2YnBuKt7dvEQkkSzCowShcxS
ykWscCRrAw2cMl6uXZATUQwV71XI8QOotXr0Do76FEuzlLTUWIxtfPsdvj4qVfW4
HkgvnVnUgMINM2WPx910RAi5QxskMuzbqLEgSrSNapUa6xrev3y2cgEvkSe34+fE
6tkdMMtFbXV7opN7JW9xj8iG04p/OzBKvXEG2g4rdZyLnwPziIOc88IexLB/dbej
mAOQjBVwndmjroCqjeTB7G94KQe16y9nh0fHt24driD/txSzPjSAM2qWDhbJWbCE
1M7fIH5V55rFJVtP8BhVGzzcpVzEaF4ATg4KG78srwnwxe9K0ho=
=Eqed
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
