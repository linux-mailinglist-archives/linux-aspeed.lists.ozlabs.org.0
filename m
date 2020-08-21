Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C8250F7E
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Aug 2020 04:39:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbCqx273lzDqMt
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Aug 2020 12:39:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=DT8Pm1vv; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXrM21NrBzDr2g
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Aug 2020 15:54:38 +1000 (AEST)
Received: from localhost (p54b332e1.dip0.t-ipconnect.de [84.179.50.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04F5220732;
 Fri, 21 Aug 2020 05:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597989275;
 bh=sfQwMzKqpVq/e+wz+HzlULH4g+NYZKj4aYW2m0QVbm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DT8Pm1vvhmzuwosIITPXhMoO7XW7E1djHGPgQYb7YZoDeXT+RKoUV9B8tDHL9GvmY
 KAohHpFwo6NBK/xqSLwlr+GqWz9UHoNVZb9gwvY7UvOZ7C9SfH+bWTi9vmCntvt+P3
 vxUnDXvH/WsfFCMSJeWH/4Tst67g1oqLJu22vmVI=
Date: Fri, 21 Aug 2020 07:54:29 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Message-ID: <20200821055429.GA995@ninjato>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-4-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <20200820161152.22751-4-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 25 Aug 2020 12:36:18 +1000
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


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	irq_received &= 0xf000ffff;

Can we have a define for this? Like ASPEED_I2CD_INTR_MASTER_IRQS or
something?


--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8/YZAACgkQFA3kzBSg
KbbHvA/+LimUqAb7M8S1x9RHr907IxGdPIa8H5nRyXeAN0PhiGmtKHMYwANpCAip
wyZ5LdiYTk3tNqNL3LljLxdoVVRSk3K15Jrqad9kizsVnl/nLTQvjmrJ4TeG1cVK
JjFpzG+x03OJLEMJnFlpi7NhMHdoIh+hq5EI6mDrLI1ZrwZUxQR+MwK3N45muVYJ
8BgObMV5NNBMISWWDVm7QvB7fQVxJCo18BoURhQzDXNqe1NuPBz/H5RPwLVjnnTd
cVewoBvY0+qd/kn+Rt1RUEYJbJwpnJp+XWOUkYJ0cC+ybaGVB8ggoMPWU4Qa6Ru8
vn5YSf/2Kn0L5Jqx7gwPcgEqzcUtsZBfZQZxMdMAezbgQx62IV80976o5m6aeMn4
svWGhKIH3cH6iuZnPJd3TDh3h6pAy7k4SHz+q/kVyb87j91E4RQZb4bf4a4GanC3
+CtynnK0bGpMiti0wnPT2huC3v0MrXwuNem8L/6/sM/rCr038+EWeb7LfgwKx8Oo
5qcjOK0kj7KVVoUNvzGu36v5onZm7PMxDap9xjZkgTulsL3z3xdD3rZFI3M6aEyH
U3tUQYMaE2NfTeSjqs2YWZdMzsGFe2xc1z7o8B2/kYC4S17wBHs10HHlJKXWmrRV
Ng9qE3y8rRyl/JiMztkyr4hshYWZ48cIOzH85FaSuAmXhphrOYk=
=q7yA
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
