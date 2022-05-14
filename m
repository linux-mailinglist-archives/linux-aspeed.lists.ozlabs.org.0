Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4360527202
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 May 2022 16:31:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0nyT4GJxz3c9K
	for <lists+linux-aspeed@lfdr.de>; Sun, 15 May 2022 00:31:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sbzioa5h;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sbzioa5h; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0nyK73RXz3byG;
 Sun, 15 May 2022 00:31:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A3338B808D0;
 Sat, 14 May 2022 14:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9849FC340EE;
 Sat, 14 May 2022 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652538692;
 bh=KLDGJ+XUhBPXixy1Zg7PlcK9TVzkkUVTXCexNedRPdw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sbzioa5hOPlt9gboLS22zB5omo907tZtRH6IInLQ1CrfnwkK2NfOpZOJ1gEhi6Fmz
 wJ889Mle+VD6igOIw2INvZpDAuHTEx9HKZdwk3ubcTh4BQLZq4OK+6Bv+FOUWtkAce
 OP2GafNWUcvJeVMModmVglfT7SsB1J/BwC2DR5vUxADkW4qDlDdXQseDx66NhqUybk
 sjRD7kqKoUxNbKI5Ll1jiuVmWjkX9OaAGWSdbfhlkOD5TYPKXSSJ6OzxdOP2VOjQvp
 q51Wk+roELj09l29LBs1MdWGOaWS9AHtfMKaEaj9GLEWTXV5dUnvfPmumqCI7qHjh4
 KpqruflA0jFgQ==
Date: Sat, 14 May 2022 16:31:28 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v7 3/3] i2c: aspeed: Assert NAK when slave is busy
Message-ID: <Yn+9QBoPdH8fMm/m@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/Jcb04ZVbWq3W2FY"
Content-Disposition: inline
In-Reply-To: <20220422040803.2524940-4-quan@os.amperecomputing.com>
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
 Corey Minyard <minyard@acm.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--/Jcb04ZVbWq3W2FY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 22, 2022 at 11:08:03AM +0700, Quan Nguyen wrote:
> When processing I2C_SLAVE_WRITE_REQUESTED event, if slave returns
> -EBUSY, i2c controller should issue RxCmdLast command to assert NAK
> on the bus.

That should be I2C_SLAVE_WRITE_RECEIVED and it should be NAKed on all
errnos. Have you tested it?


--/Jcb04ZVbWq3W2FY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/vT8ACgkQFA3kzBSg
KbYtRxAAnwySTv44cgVvd57fhPZJ4l4tcBSK97yFdMtZ2UNRFfyFclUiH9skwsuO
KOmHb1UatGOYAoMyxrPIkiOXkeIeL/vlIkgI0d4CjL0pWKNrNIqqSncRdnpsDO8u
4efBzlk9D2iNkA7y9OAuBxHwONT41qUX5fgOymGpF56b/X/4sHJjV20pcFewfb/0
3ykk9Y5QJDq+h5va+IXp0O2ED6u8nZxn+/RAy+JiJFX+ynFzf6MYMrsFEJ4uVB20
T8/0HKkL0I+TMOMwdu62Blkbo324e3mxvilD6D9buGzpclYxAQb5pw1TRKxkiBxu
hGrjg3J66VECV7Segwb9gO/JoV1u+jinAXD2xWmQoR29jfb4n9IW/WGy1/meEe43
GJ9tVo9DGxPUT+nwnpV14oZFQxmrRdZaHzwf4cFpnuVbZZspgSBMM2mjJzpHv3Qq
9pABXmjzY8LdzVQAAnCpk2062gS2r0hnVnCs7WdgAsAHqzZ/ioYBFyD7Qo5RChe5
ilimRgUz2brUuVf7K9VxR3JBCBMJ+C7O5Hc1Ii33pIw09mzI1395q6FbzfPz8oWJ
yXiOivGAf0xBdw8N3J2rQ6e/7lEBWH88KO/bttKAr1CJChuotX3enJH5gvDakGNb
7gPDMh7sDqcTC5a6vBSuhWF76dZlfgYFA6NYuCn2iNTL8LyBATs=
=xB1Q
-----END PGP SIGNATURE-----

--/Jcb04ZVbWq3W2FY--
