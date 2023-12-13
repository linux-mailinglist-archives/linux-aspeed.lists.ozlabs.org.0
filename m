Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C87811C2E
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Dec 2023 19:18:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X2P92Cgd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr3dp52cYz3cC7
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Dec 2023 05:18:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X2P92Cgd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr3dh53TRz2xpx
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Dec 2023 05:18:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 593D861EF3;
	Wed, 13 Dec 2023 18:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670E5C433C7;
	Wed, 13 Dec 2023 18:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702491524;
	bh=VmD4PSEal/Oz36jy5f+5kaRai9u7pyp8fynzdDmI2do=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=X2P92CgdOxQRlOF6Y/p2g5JD1pkpHumiiu9p5GDFPCiLmujjHvpYytSN41+m+dFbM
	 LPf5Fcv5lFuMzDJb7YIYytx5y3jShptvJAUD3lox1shQM+eGRGvAK/IWDCNsbqpKCq
	 nF191Vv4/8qxf+i5UjcXUNEjGbZqMPoLzvXAQpnbV9BFN7vlzDMtZMVx4SMZ8fIuNs
	 Ffws+/iE/wjlT7ufm7QnqblkO7NomQZk22M6/MWNlp0dgUgn1EbrPkfoFgtuWTTx/2
	 oSb2w4EBkFOXrY4I/yfFIbRQ5KloinB/P3cxzOrlhbN+W5DKTgSPHVLlw1RzW6T92Q
	 +o/7nl5bbZt8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Dec 2023 20:18:35 +0200
Message-Id: <CXNEVH8BZUJT.1UHVUI66SZMTE@suppilovahvero>
Subject: Re: [PATCH v1 1/8] dt-bindings: arm: aspeed: add IBM system1-bmc
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Ninad Palsule" <ninad@linux.ibm.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <joel@jms.id.au>, <andrew@codeconstruct.com.au>, <peterhuewe@gmx.de>,
 <jgg@ziepe.ca>, <keescook@chromium.org>, <tony.luck@intel.com>,
 <gpiccoli@igalia.com>, <johannes.holland@infineon.com>,
 <linux@roeck-us.net>, <broonie@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-2-ninad@linux.ibm.com>
In-Reply-To: <20231212164004.1683589-2-ninad@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, festevam@denx.de, linux-aspeed@lists.ozlabs.org, peteryin.openbmc@gmail.com, alexander.stein@ew.tq-group.com, linux-kernel@vger.kernel.org, naresh.solanki@9elements.com, linux-arm-kernel@lists.infradead.org, lakshmiy@us.ibm.com, bhelgaas@google.com, vincent@vtremblay.dev, linux-integrity@vger.kernel.org, geissonator@yahoo.com, patrick.rudolph@9elements.com, linux-hardening@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue Dec 12, 2023 at 6:39 PM EET, Ninad Palsule wrote:
> Document the new compatibles used on IBM system1-bmc
>
> Tested:

this not very useful line :-) (nit)

>     This board is tested using the simics simulator.

Just leave this (w/o indentation)

>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  Documentation/devicetree/bindings/trivial-devices.yaml   | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 6f7543463d89..ebebe14c42aa 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -85,6 +85,7 @@ properties:
>                - facebook,yosemite4-bmc
>                - ibm,everest-bmc
>                - ibm,rainier-bmc
> +              - ibm,system1-bmc
>                - ibm,tacoma-bmc
>                - inventec,starscream-bmc
>                - inventec,transformer-bmc
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index 441b55723675..b12a60d2eb0f 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -135,6 +135,8 @@ properties:
>            - ibm,cffps1
>              # IBM Common Form Factor Power Supply Versions 2
>            - ibm,cffps2
> +            # Infineon barometric pressure and temperature sensor
> +          - infineon,dps310
>              # Infineon IR36021 digital POL buck controller
>            - infineon,ir36021
>              # Infineon IR38060 Voltage Regulator

BR, Jarkko
