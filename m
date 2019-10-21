Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF8DEC18
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 14:23:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xbQb325SzDqZL
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 23:23:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 46xbQG2WvPzDqZ9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Oct 2019 23:23:18 +1100 (AEDT)
Received: from localhost (p54B33572.dip0.t-ipconnect.de [84.179.53.114])
 by pokefinder.org (Postfix) with ESMTPSA id 9F05D2C040F;
 Mon, 21 Oct 2019 14:23:16 +0200 (CEST)
Date: Mon, 21 Oct 2019 14:23:16 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 2/2] dt-bindings: i2c: Aspeed: Add AST2600 compatible
Message-ID: <20191021122316.GI1145@ninjato>
References: <1568392510-866-1-git-send-email-eajames@linux.ibm.com>
 <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3eH4Qcq5fItR5cpy"
Content-Disposition: inline
In-Reply-To: <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--3eH4Qcq5fItR5cpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2019 at 11:35:10AM -0500, Eddie James wrote:
> Document the AST2600 I2C bus compatible string.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Applied to for-next, thanks!


--3eH4Qcq5fItR5cpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2tozQACgkQFA3kzBSg
KbYW4RAArdkdyER9/nDFPWwqsfMrIVd+zx2BH3gX1AN4YyZk6MrTvGUPAMOfYwbF
pfdZPEi/zwvgMrbdc6N7oKiNv0pTj83z8zFlku15rp+FaaKCljWRKlVDUMKA5LRK
T7yOYHCTKSUCgxuw2VvY7eEyPPzuNuodlFr7sz8QGY8JepN1ZyanlvuFPD9FY/3b
rKfbsmyl6EzlNHjIDCdJJMFjh5T6y8q21uipGq0FcZ/3WLA7sNMgSY7RF5otI820
nH9D33hHySsYeDe6R69HPoHz+chYGbJ9Ua4am2q9fBiNMZUrrIYQ+WgMbp5Pfxgl
scG9UT+pzzltQj2JY8i/k1RyR7gOYxJfIr4bvT43iy5G8dMbw72aRmxMg/E2qd0k
VlB0ZZK/w7gg+h5NTvFC81owsW1UxwtghP/YdH9HJs9D+XiFxnhwA74cdS28bNFq
fK1XZeYYSSWyCZ690GpOVN22UToHyj8xA7ml+8CU2ivdP39HuMblLIYIHm53bN7M
uoMI3XSIKLCMJeITDhQOeWdeq9Reu5v/IRUTg06AsWggpARdTYJLRjI/R3wVKhyi
aq7VIZx0nrbZO+xOE0Rf/l+Lt7/FoEB+Ejpfzj5RmWy8HJcSjE6hb1/DBlfLRvI4
j1kLtMRTkfguWpIFhhBwhiCRObfLHIiefx17cEgh3zMMWbM6Pio=
=t3sq
-----END PGP SIGNATURE-----

--3eH4Qcq5fItR5cpy--
