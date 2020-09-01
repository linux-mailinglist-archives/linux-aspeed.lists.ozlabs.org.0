Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E462587E1
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 08:11:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgcCP36vbzDqTT
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Sep 2020 16:11:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=CLKRRC3F; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgcC65JXkzDqSd
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Sep 2020 16:11:14 +1000 (AEST)
Received: from localhost (p5486cc57.dip0.t-ipconnect.de [84.134.204.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D61DC208DB;
 Tue,  1 Sep 2020 06:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598940671;
 bh=YsDbACSX8CnRhHRZGrmXUc3sEBWwyLNxZmT5l9Rde84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CLKRRC3FAZcPv5wieBFaYC4/EIyrAe7n9Rwvf9RaPKLFuCsEguaLgth/kwWICOt/T
 uZDzm0qqCGT00++bb/x44FoBogEmMASrHh7/S875Er/fji8IUqH5XAED8hN1jB9n7L
 PjuXCq+nuZ9cL7SbFAShV8+1oA55Jn55fCJb3zrA=
Date: Tue, 1 Sep 2020 08:11:08 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 2/5] input: misc: Add IBM Operation Panel driver
Message-ID: <20200901061108.GB1148@ninjato>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline
In-Reply-To: <20200820161152.22751-3-eajames@linux.ibm.com>
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


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	switch (event) {
> +	case I2C_SLAVE_STOP:
> +		command_size = panel->idx;
> +		fallthrough;
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		panel->idx = 0;
> +		break;
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		if (panel->idx < sizeof(panel->command))
> +			panel->command[panel->idx++] = *val;
> +		else
> +			dev_dbg(&panel->input->dev, "command truncated\n");

Just double checking: Do you really want to process truncated commands?
Since you detect the state here, you could also choose to reject such
commands?


--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9N5fwACgkQFA3kzBSg
KbblGxAAqtep5GwduBK2FEY7BHP1N8rC4iVTZ7zJcUIwulC+F5Yp1xRPKz1qSQ/S
7FiKoSb+PCIbaxb4y6XninMvEp1wd0Tg+3LJTiKf2GLbYP+SbAOEHIAPMONFudmL
d252Sfh+8arrvDfU7xgRVwnMQZEd86y7qQv3l6iAWHUps4Xq1xrJ4cWE9P5FoUOW
ZBVW+4snG0Df1FE8FI0K1IR6ubQzFTa01ihq1ua2VRA1Jxt2X2eSKNp0CP0hfOjY
yAFXmqxMU7mG+t2TgzVJawdDqSJSm+rXDDF6VOTudT4FQh6R34HEC5b7T5Z6x090
vJfXV3sYTtdnb7Pa2v3TnnF7dR/K0we7GZlXtI1ssgx/+7MioXqX2/2zgPTJtrnl
0lAN8B0tWz2bucSxb0e2DK3MYnO6GmK1QHMI+Q/aDHjOXjHx2qsfpy3DHxZdmV0h
DwEZxGR+RZ9/gsPMot2ahQhC/cR9EKHPnhu5+t2dQvyeRYo95Y3gfTm52U+/qbg1
aPTLqJHZXcLE8hLh2wzmjoaRl/lULyizU3IGvI/aFIA+dzRdQHe00QVe6b13LmrK
ABQW2hBfV2XYo7l8H11evDVJ9PNDK32Lj/askz7F4+xC4yq7B02X+zb8r2mNpN7e
FOY1/3ShXPSrQAEiTeu0oKjWY+mzjqPngc8xRhasn4nrM/5RKj8=
=Mnzn
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
