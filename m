Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F14EEDEC17
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 14:23:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xbQR525zzDqZP
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 23:23:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 46xbQB6BlkzDqZ9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Oct 2019 23:23:14 +1100 (AEDT)
Received: from localhost (p54B33572.dip0.t-ipconnect.de [84.179.53.114])
 by pokefinder.org (Postfix) with ESMTPSA id B54F62C0076;
 Mon, 21 Oct 2019 14:23:12 +0200 (CEST)
Date: Mon, 21 Oct 2019 14:23:12 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 1/2] i2c: Aspeed: Add AST2600 compatible
Message-ID: <20191021122312.GH1145@ninjato>
References: <1568392510-866-1-git-send-email-eajames@linux.ibm.com>
 <1568392510-866-2-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MGu/vTNewDGZ7tmp"
Content-Disposition: inline
In-Reply-To: <1568392510-866-2-git-send-email-eajames@linux.ibm.com>
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


--MGu/vTNewDGZ7tmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2019 at 11:35:09AM -0500, Eddie James wrote:
> The driver default behavior works with the AST2600. We need a new
> compatible though to make sure the driver doesn't enable AST2400 or
> AST2500 behavior.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Applied to for-next, thanks!


--MGu/vTNewDGZ7tmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2tozAACgkQFA3kzBSg
KbYdpBAAnGFjPjHU1RjWdIIjcluWngIiPZ4G1nJ1990ogSV1Q2RKuhVRRP/w2D4B
3iUiqcFxj86bwQdXxTo+Jesvj9OJw7oHgG8x8aP7cUdSDU2PyB+hhl1kOFj3qKd4
oLsEDK9yftYvg7VGs56wq7IOM4VkVTEprq7x/2Hf7eIt6t8XEk+YI+op9mjmendq
6yGM9zspyjGyOwyuTpS6zzcGtJ+pHIOkiV9sju5nvaO0UuhzoMFC35kpLYZbm+rX
go8RSN/CAgOkeeEBYpeUvKnZLk1Ml/nZ/FdR/YCUDkrvAJjkKqBF3LEuLS6+8iE4
Un/QFG6OEKLCEQu9KVU4dVovTXGjILK7zpvwPW/gr3U5jeJH4c5xto+agWLA8G3F
q1UWh6GUq3FV4fEqo0InpazTuEdUcBnIcbPZR/QMWSIoE4CWD2SCQoAHyzk3Jrma
Seyn0WZEMe2zJfhVQXHidgCbc0gO0NYjPqMQeHYhCnWfhk3pJVfzqKJSLCNsJbBX
xubXKQu3hgZRGv6vqvPZpRp0ItOYL0lv0TCdTu/f5Maxv0cZ3xzCrU7ZndRcaKtE
QfhMiXOMjhk5H0VRujNpLN5bHH2RDnGOqW4xeJukteVDidyFLJCQMUkEsVAK1y3p
FUC3TuW6Oypz7/zx74MgTGZFagWixLFBXz6qzEt0rp+6ANibX/4=
=a1zx
-----END PGP SIGNATURE-----

--MGu/vTNewDGZ7tmp--
