Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D6827A41
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jan 2024 22:35:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oGw7zeYl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T86mF5M06z3bZN
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jan 2024 08:35:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oGw7zeYl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T86m55Ld0z2xQ7
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Jan 2024 08:35:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63AF2CE11E6;
	Mon,  8 Jan 2024 21:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B1DC433C7;
	Mon,  8 Jan 2024 21:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704749696;
	bh=TbKhcaDX991KzdmgWtOOMq+69pB52opa1WG/z42fjVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGw7zeYlNKuhfc3QbUjT9b3DZcn4DgXX75R4CKVqbjUrumGlB1OBnzGdSUABVGIDs
	 QHiDoWscn6mTQfo2BE2e9PNDIWT1SKuDGH+ter0CuPZMVFcl8rtaMykN4Km8xn1YLq
	 hUVSIzxMTEqjjeOGYprtLQFq3nRE6Z+tFVxCnjiKPgiSkA0LDZ4+YyJUUT6SvEeY/i
	 noKtgG1bg3V4t7xoJwQ76yzhFWHs8lnjxFMgyFS33hGdW5ai6tI0I0ySOMLsQZX40C
	 ZIT5lcRYrXC3C3GFl5OJbjXkcVs9BfBFpz9ttaD8Ua51wBwNVyMlBx0pUAlozbBX5D
	 cFRnk5Qm/wmVQ==
Date: Mon, 8 Jan 2024 21:34:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: System1: IBM system1 BMC board
Message-ID: <b09d6e54-66e9-482f-8f45-38381fa6b62e@sirena.org.uk>
References: <20240108204114.1041390-1-ninad@linux.ibm.com>
 <20240108204114.1041390-4-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rIaTAIoZgSKW9gCu"
Content-Disposition: inline
In-Reply-To: <20240108204114.1041390-4-ninad@linux.ibm.com>
X-Cookie: Best if used before date on carton.
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, andre.werner@systec-electronic.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, jgg@ziepe.ca, geert+renesas@glider.be, peteryin.openbmc@gmail.com, alexander.stein@ew.tq-group.com, andrew@codeconstruct.com.au, luca.ceresoli@bootlin.com, linux@roeck-us.net, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, robh+dt@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, Andrew Geissler <geissonator@yahoo.com>, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--rIaTAIoZgSKW9gCu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 08, 2024 at 02:41:14PM -0600, Ninad Palsule wrote:

> +	regulator@60 {
> +		compatible = "maxim,max8952";
> +		reg = <0x60>;
> +
> +		max8952,default-mode = <0>;
> +		max8952,dvs-mode-microvolt = <1250000>, <1200000>,
> +						<1050000>, <950000>;
> +		max8952,sync-freq = <0>;
> +		max8952,ramp-speed = <0>;
> +
> +		regulator-name = "VR_1.0V";
> +		regulator-min-microvolt = <770000>;
> +		regulator-max-microvolt = <1400000>;

A regulator labelled VR_1.0V can vary between 0.77V and 1.4V and has
exactly the same configuration as another regulator labelled VR_1.2V?
That seems...  odd?

--rIaTAIoZgSKW9gCu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWcanYACgkQJNaLcl1U
h9AQvAf/bBzl7TOXhykZugaGhrwTqbgUhCIJlcRYOC0WPtwpbxLratLbeJHqcSUj
29OZ0OuopB/FwVtUC2KBORlRBMEQRb/GUCZwNxjtqhrC3Bp9CYOTqJs/0jUD9ZCZ
IuvRBEKet3+4RpOyOgwplSHhCwwH1XmWfBb9xWNbCKd7r6NxrZ5z4+LiIrJT8Y/s
fopj53Dmk7MqpK1xl9yBW2CaHAPI2QiA3/Zbh5CJUNJu0zAfw7bASSjseh2pfre9
50Xg+lhn1TDW2Azid2S9Uzcmefsz1dScLfC4fCsblsSLomp1VJ6VNSJUDApod54N
xWK8ruqdyGOmlTQ5yd18SEwzEkM3WA==
=j/GH
-----END PGP SIGNATURE-----

--rIaTAIoZgSKW9gCu--
