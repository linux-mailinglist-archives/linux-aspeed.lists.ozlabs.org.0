Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17511263D2B
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 08:21:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn80S4cMwzDqcl
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Sep 2020 16:21:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=fbiWPiLG; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn80K0WXgzDqZX
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 16:21:05 +1000 (AEST)
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BED97207DE;
 Thu, 10 Sep 2020 06:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599718862;
 bh=JWNUxWZbGJJ1fihwnRRpBTK9XQnFPsAPD0+ab1fseg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fbiWPiLGCvPfrqWWZo5JFgb0/Uw26pu9zVq68ZQqhDRwSWZe7agcZkOIx1SnYzMrh
 hnkhvpGayepHpld0KmFCoOuDnFXWPZ3SrV6glb+8+a81MN0AIqWOSVgFBX+/2a7T7+
 cFq8vyvDSlE68w43+QHICEgzMmKiGQGYDpZIWA38=
Date: Thu, 10 Sep 2020 08:20:58 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v3 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Message-ID: <20200910062058.GC1031@ninjato>
References: <20200909203059.23427-1-eajames@linux.ibm.com>
 <20200909203059.23427-4-eajames@linux.ibm.com>
 <20200910061813.GB1031@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline
In-Reply-To: <20200910061813.GB1031@ninjato>
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


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 08:18:13AM +0200, Wolfram Sang wrote:
> On Wed, Sep 09, 2020 at 03:30:57PM -0500, Eddie James wrote:
> > Mask the IRQ status to only the bits that the driver checks. This
> > prevents excessive driver warnings when operating in slave mode
> > when additional bits are set that the driver doesn't handle.
> >=20
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > Reviewed-by: Tao Ren <rentao.bupt@gmail.com>
>=20
> I reconsidered and applied it now because this helps whenever slave mode
> is used. So, applied to for-current, thanks!

If someone could provide a Fixes tag, that would be welcome. For me, not
knowing the HW it doesn't look trivial to determine.


--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZxckACgkQFA3kzBSg
KbZ3iA//cQfh41pbKdqYAo099C5IRm15SZnDi0WxKZpIYlYR22XokN01zfTYj/vX
AIy+9J85UNFbLBhrASWn/Zuu7/4VkAKQgBPZChEH6EJ4wRe9RGHg6+Em21n0gqR9
pyWNMkX4S/iSeLdhsi0HZ23Lg9KyN8tFUiw1Wj4DCcQGEDe8W1oOBkW1X1r2YLTk
p99q/blvdOcfPUqfSFRxBYCKFYwipTllZMAklQ52sHDKpabgIxdNtUsffSrZaabr
4UNtkX4cf+S5KZb87uXXb3zeVFRpr/tls4CQDAMyJHiqvrMT9gLGmpmKAX93RDy9
dln32Q1uJbhiTjQc/tTuxQiiCiexc0vpk0uf1yliEbToVzb7rLCXz/ms9sY+oPZM
tOzbG8/ERYdkUAbdkMIrgASNgDgrQvISH8pyLIIGfrGsiz2FcFBHUCBCONeyZgR8
kndwyqr0plUr0RsCibBkkyRRKT/D9SkJAAMDBaAg68j2Uj+PEr+ccagf/AH+Fdbb
gTLE64Mx1awSmGF6RpOHEgvEG+o62GDbZk/TmKD7GIWjeXqpZwoG1OySHc/gmFrJ
lB4SN2kjxbHhcOB+D0YatsuVmrwEbQFTMMTH01gWjwLRpjNQ9TOxrMgmOhtiMyh/
C7jkwvhOCiwtvd5zmD2JTn7r/0GhZXU6dg3DLlZQzMsh9NhV45s=
=24Fn
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
