Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF598A7235
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Apr 2024 19:25:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R1MQ0yXd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJrXq6tV8z3h05
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Apr 2024 03:25:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R1MQ0yXd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJrXf5ZqGz30Np;
	Wed, 17 Apr 2024 03:25:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05C226125F;
	Tue, 16 Apr 2024 17:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B64C32783;
	Tue, 16 Apr 2024 17:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713288334;
	bh=SAa9s3VJpC0ue6WJQEp5gjjZX/3kAnQf4xSZ8MArlO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1MQ0yXdgMP7a9GSZTNHVYo8piid3ASYxDLSjEJUL/kOnd24CQB4qd81mSGI2c8fj
	 nDB2W3o8qjhdPEoCD3Ws9AUpXM+HgXpVe3vz1hpWFoi+U/mFEHuoANJ67xxGKklrr9
	 WgOx0Q1EERTaV79CMuj+RlVdq4fflk5jFmYsdkmpe/tFAQgNavNRsqxEgE0P3IY7Sg
	 JCqE2Cmiw/X6PGbNFleYVa9OWgCYb7+Lv4FAAlI1bIvpE5tqvjiZf71x/7ml9Z9ONa
	 3QGPSq1eYpS1U+WjWNKic2PjbIPb7nsJJgGF2EQ1p5w4Rp5m/JZedSN+MdiDuqjslq
	 TLoE3V95zThGQ==
Date: Tue, 16 Apr 2024 18:25:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: fsi: Document the IBM SBEFIFO engine
Message-ID: <20240416-askew-slapstick-994453ecbf73@spud>
References: <20240415153907.10051-1-eajames@linux.ibm.com>
 <20240415153907.10051-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MSKVpxQ0QimsDgBf"
Content-Disposition: inline
In-Reply-To: <20240415153907.10051-2-eajames@linux.ibm.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, alistair@popple.id.au, jk@ozlabs.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--MSKVpxQ0QimsDgBf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 10:39:05AM -0500, Eddie James wrote:
> The SBEFIFO engine provides an interface to the POWER processor
> Self Boot Engine (SBE).
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v1:
>  - Chance "ody" to "odyssey"
>  - Fix typo in commit message
>  - Reword description to describe the hardware only
>=20
>  .../devicetree/bindings/fsi/ibm,sbefifo.yaml  | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,sbefifo.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/fsi/ibm,sbefifo.yaml b/Doc=
umentation/devicetree/bindings/fsi/ibm,sbefifo.yaml
> new file mode 100644
> index 000000000000..69521b1cfb25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/ibm,sbefifo.yaml

Filename matching a compatible please.

> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/fsi/ibm,sbefifo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IBM FSI-attached SBEFIFO engine
> +
> +maintainers:
> +  - Eddie James <eajames@linux.ibm.com>
> +
> +description: |

This | should not be needed, there's no formatting to preserve.

> +  The SBEFIFO is an FSI CFAM engine that provides an interface to the
> +  POWER processor Self Boot Engine (SBE). This node will always be a chi=
ld
> +  of an FSI CFAM node; see fsi.txt for details on FSI slave and CFAM
> +  nodes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ibm,p9-sbefifo
> +      - ibm,odyssey-sbefifo
> +
> +  reg:
> +    items:
> +      - description: FSI slave address
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sbefifo@2400 {

Per fsi.txt, the generic node name looks like it should be
"fsi-slave-engine"?

Cheers,
Conor.

> +        compatible =3D "ibm,p9-sbefifo";
> +        reg =3D <0x2400 0x400>;
> +    };
> --=20
> 2.39.3
>=20

--MSKVpxQ0QimsDgBf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh60igAKCRB4tDGHoIJi
0riyAP9Y7YRTnsQXUck7bocG8d1Z6DOgkf6/GdAs2Q40yO93dQD/Ssb64e2hbTr4
L5rS5qThpe1oEpcgL5WCoik0TlQLeQ0=
=9qd6
-----END PGP SIGNATURE-----

--MSKVpxQ0QimsDgBf--
