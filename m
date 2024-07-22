Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE3939271
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Jul 2024 18:22:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gnTA9Xy0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSQXg6Czkz3cYZ
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 02:22:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gnTA9Xy0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSQXZ4dSCz3cSH
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 02:22:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF2B060B81;
	Mon, 22 Jul 2024 16:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE01EC116B1;
	Mon, 22 Jul 2024 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721665323;
	bh=1Ui12/JEdTNrgZsebMx278fp38w9xdj3GygdGgTyCcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gnTA9Xy0VJkI+k7ewj4rBrofbGDLfxK6Qwy7NLwHKOsEjGrcAtz0DHn3eOsWdJGD5
	 eCmRdH2nVAPJ53TZmTnfep0mDoRlkZmEDqZimyF++b2RQDCQ1TABg6GVmGx9JmMEm/
	 GniEBVINnZBMBKQ0FYvxmTJoAH9fvKNfYfrlWOQ4xTPK9YO9OXi3oToTxP42/Krl1S
	 G27OJ8L7JFbXkg//SzgJGU+ll40h7nkg5ETWIA/OGwrp4hq7ziNsEfgRjyjSXzTRvT
	 espWPhiWzNxk9CjbthwcFhEpUKAH7X5IB1FRr84QPBdkcSKeEYaYmJWtLtidJ4Swat
	 PxT0arU/eCvjA==
Date: Mon, 22 Jul 2024 17:21:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: add Meta Catalina board
Message-ID: <20240722-backing-scrooge-cec9336b8acf@spud>
References: <20240722145857.2131100-1-potin.lai.pt@gmail.com>
 <20240722145857.2131100-2-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+jW2CHhkgUeiYRk1"
Content-Disposition: inline
In-Reply-To: <20240722145857.2131100-2-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, Cosmo Chou <cosmo.chou@quantatw.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--+jW2CHhkgUeiYRk1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 10:58:56PM +0800, Potin Lai wrote:
> Document the new compatibles used on Meta Catalina.
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--+jW2CHhkgUeiYRk1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp6HJgAKCRB4tDGHoIJi
0mxeAP46GmhT1+vRHAhLF5mPJH7wnCs0YQ/3g20ecPmPbVLivQD/X7bg129rbJ/F
Qo3WLzdf1V43M2PlyO+DUd3hbl4xewg=
=fx9l
-----END PGP SIGNATURE-----

--+jW2CHhkgUeiYRk1--
